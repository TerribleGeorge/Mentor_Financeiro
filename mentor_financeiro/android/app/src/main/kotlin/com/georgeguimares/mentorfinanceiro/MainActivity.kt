package com.georgeguimares.mentorfinanceiro

/**
 * Ponte entre o Flutter e o [CustomNotificationListener].
 *
 * - [NotificationChannels]: MethodChannel + EventChannel + fila em SharedPreferences
 *   (notificações chegam ao Kotlin mesmo com o Dart em pausa; o Dart drena e confirma por id).
 * - [CustomNotificationListener]: serviço Android que o utilizador tem de ativar em
 *   Definições > Acesso a notificações (não confundir com POST_NOTIFICATIONS).
 */
import android.Manifest
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import org.json.JSONArray
import org.json.JSONObject

class MainActivity : FlutterFragmentActivity() {
    companion object {
        lateinit var instance: MainActivity
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        instance = this
        NotificationChannels.register(
            applicationContext,
            flutterEngine.dartExecutor.binaryMessenger,
        )
    }
}

object NotificationChannels {
    private const val METHOD_CHANNEL = "mentor_financeiro/notifications"
    private const val EVENT_CHANNEL = "mentor_financeiro/notifications/stream"
    /** Preferências onde a fila nativa persiste eventos até o Dart processar e fazer ack. */
    private const val PENDING_PREFS = "mentor_notification_listener"
    private const val PENDING_EVENTS_KEY = "pending_events"
    /** Limite da fila: notificações mais antigas são descartadas quando cheia (FIFO). */
    private const val MAX_PENDING_EVENTS = 300
    private const val ALERT_CHANNEL_ID = "mentor_financeiro_market_alerts"
    private const val DAILY_BUDGET_CHANNEL_ID = "mentor_financeiro_daily_budget"
    private const val ALERT_NOTIFICATION_ID = 4207

    private var eventSink: EventChannel.EventSink? = null
    private val mainHandler = Handler(Looper.getMainLooper())
    private lateinit var appContext: Context

    fun register(appContext: Context, messenger: io.flutter.plugin.common.BinaryMessenger) {
        this.appContext = appContext.applicationContext
        // Garante contexto para [isNotificationListenerEnabled] antes do serviço ligar.
        CustomNotificationListener.ensurePermissionCheckContext(this.appContext)
        MethodChannel(messenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkPermission" -> {
                    result.success(CustomNotificationListener.isNotificationListenerEnabled())
                }
                "requestPermission" -> {
                    try {
                        val context = try {
                            MainActivity.instance
                        } catch (_: Exception) {
                            appContext
                        }
                        val intent = Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        context.startActivity(intent)
                        result.success(true)
                    } catch (e: Exception) {
                        result.success(false)
                    }
                }
                "getEnabledListeners" -> {
                    result.success(CustomNotificationListener.getEnabledListeners())
                }
                "requestRebind" -> {
                    result.success(CustomNotificationListener.requestListenerRebind())
                }
                "isListenerConnected" -> {
                    result.success(CustomNotificationListener.isListenerConnected())
                }
                "forceReconnectListener" -> {
                    result.success(CustomNotificationListener.forceListenerReconnect())
                }
                "drainPendingNotifications" -> {
                    try {
                        result.success(drainPendingNotifications(appContext))
                    } catch (e: Exception) {
                        result.success(emptyList<Map<String, Any>>())
                    }
                }
                "ackPendingNotifications" -> {
                    try {
                        val ids = call.argument<List<String>>("ids") ?: emptyList()
                        result.success(ackPendingNotifications(appContext, ids))
                    } catch (e: Exception) {
                        result.success(0)
                    }
                }
                "clearPendingNotifications" -> {
                    try {
                        clearPendingNotifications(appContext)
                        result.success(true)
                    } catch (e: Exception) {
                        result.success(false)
                    }
                }
                "scanActiveNotifications" -> {
                    try {
                        val hours = (call.argument<Int>("hours") ?: 6).coerceIn(1, 24)
                        result.success(CustomNotificationListener.scanActiveNotifications(hours))
                    } catch (e: Exception) {
                        result.success(emptyList<Map<String, Any>>())
                    }
                }
                "openAppBatterySettings" -> {
                    try {
                        val ctx = try {
                            MainActivity.instance
                        } catch (_: Exception) {
                            appContext
                        }
                        val intent = Intent(
                            Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                            Uri.parse("package:${ctx.packageName}"),
                        )
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        ctx.startActivity(intent)
                        result.success(true)
                    } catch (e: Exception) {
                        result.success(false)
                    }
                }
                "showMentorNotification" -> {
                    try {
                        val title = call.argument<String>("title") ?: "Mentor Financeiro"
                        val body = call.argument<String>("body") ?: ""
                        val nid = call.argument<Int>("notificationId") ?: ALERT_NOTIFICATION_ID
                        result.success(showMentorNotification(appContext, title, body, nid))
                    } catch (e: Exception) {
                        result.success(false)
                    }
                }
                "showDailyBudgetNotification" -> {
                    try {
                        val title = call.argument<String>("title") ?: "Limite diário"
                        val body = call.argument<String>("body") ?: ""
                        val nid = call.argument<Int>("notificationId") ?: 4210
                        result.success(showDailyBudgetNotification(appContext, title, body, nid))
                    } catch (e: Exception) {
                        result.success(false)
                    }
                }
                else -> result.notImplemented()
            }
        }

        EventChannel(messenger, EVENT_CHANNEL).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
            }
        })
    }

    fun sendNotification(
        context: Context,
        packageName: String,
        title: String,
        text: String,
        timestamp: Long
    ) {
        val nativeKey = pendingKey(packageName, title, text, timestamp)
        val data = mapOf(
            "package" to packageName,
            "title" to title,
            "text" to text,
            "timestamp" to timestamp,
            "nativeKey" to nativeKey,
            "receivedAt" to System.currentTimeMillis()
        )
        // Sempre persiste: se o EventChannel tiver listener, o Dart recebe ao vivo *e*
        // fica cópia na fila até ack. Sem listener (app fechada / engine morto), só a fila.
        persistPendingNotification(context, data)
        val sink = eventSink
        if (sink != null) {
            mainHandler.post { sink.success(data) }
        }
    }

    private fun persistPendingNotification(context: Context, data: Map<String, Any>) {
        val prefs = context.applicationContext.getSharedPreferences(PENDING_PREFS, Context.MODE_PRIVATE)
        val current = JSONArray(prefs.getString(PENDING_EVENTS_KEY, "[]") ?: "[]")
        val nativeKey = data["nativeKey"]?.toString() ?: pendingKey(
            data["package"]?.toString() ?: "",
            data["title"]?.toString() ?: "",
            data["text"]?.toString() ?: "",
            (data["timestamp"] as? Number)?.toLong() ?: 0L,
        )

        for (i in 0 until current.length()) {
            val item = current.optJSONObject(i) ?: continue
            val itemKey = item.optString("nativeKey").ifEmpty { pendingKey(item) }
            if (itemKey == nativeKey) return
        }

        val json = JSONObject(data)
        json.put("nativeKey", nativeKey)
        if (!json.has("receivedAt")) {
            json.put("receivedAt", System.currentTimeMillis())
        }
        current.put(json)
        while (current.length() > MAX_PENDING_EVENTS) {
            current.remove(0)
        }
        prefs.edit().putString(PENDING_EVENTS_KEY, current.toString()).apply()
    }

    private fun pendingKey(
        packageName: String,
        title: String,
        text: String,
        timestamp: Long
    ): String {
        return "$timestamp|$packageName|${title.hashCode()}|${text.hashCode()}"
    }

    private fun pendingKey(item: JSONObject): String {
        return pendingKey(
            item.optString("package"),
            item.optString("title"),
            item.optString("text"),
            item.optLong("timestamp")
        )
    }

    private fun drainPendingNotifications(context: Context): List<Map<String, Any>> {
        val prefs = context.applicationContext.getSharedPreferences(PENDING_PREFS, Context.MODE_PRIVATE)
        val current = JSONArray(prefs.getString(PENDING_EVENTS_KEY, "[]") ?: "[]")
        val out = mutableListOf<Map<String, Any>>()

        for (i in 0 until current.length()) {
            val item = current.optJSONObject(i) ?: continue
            out.add(
                mapOf(
                    "package" to item.optString("package"),
                    "title" to item.optString("title"),
                    "text" to item.optString("text"),
                    "timestamp" to item.optLong("timestamp"),
                    "nativeKey" to item.optString("nativeKey").ifEmpty { pendingKey(item) },
                    "receivedAt" to item.optLong("receivedAt")
                )
            )
        }

        return out
    }

    /**
     * Remove da fila nativa apenas os [nativeKey] confirmados pelo Dart.
     * Evita apagar tudo ao processar: notificações novas que chegaram a meio mantêm-se.
     */
    private fun ackPendingNotifications(context: Context, ids: List<String>): Int {
        if (ids.isEmpty()) return 0
        val idSet = ids.toSet()
        val prefs = context.applicationContext.getSharedPreferences(PENDING_PREFS, Context.MODE_PRIVATE)
        val current = JSONArray(prefs.getString(PENDING_EVENTS_KEY, "[]") ?: "[]")
        val kept = JSONArray()
        var removed = 0

        for (i in 0 until current.length()) {
            val item = current.optJSONObject(i) ?: continue
            val itemKey = item.optString("nativeKey").ifEmpty { pendingKey(item) }
            if (idSet.contains(itemKey)) {
                removed++
            } else {
                kept.put(item)
            }
        }

        prefs.edit().putString(PENDING_EVENTS_KEY, kept.toString()).apply()
        return removed
    }

    private fun clearPendingNotifications(context: Context) {
        val prefs = context.applicationContext.getSharedPreferences(PENDING_PREFS, Context.MODE_PRIVATE)
        prefs.edit().remove(PENDING_EVENTS_KEY).apply()
    }

    private fun showMentorNotification(
        context: Context,
        title: String,
        body: String,
        notificationId: Int = ALERT_NOTIFICATION_ID,
    ): Boolean {
        if (body.trim().isEmpty()) return false
        val appContext = context.applicationContext
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU &&
            appContext.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED
        ) {
            return false
        }

        val manager = appContext.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                ALERT_CHANNEL_ID,
                "Alertas do Mentor",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            channel.description = "Alertas sobre mercado, investimentos e moedas."
            manager.createNotificationChannel(channel)
        }

        val intent = Intent(appContext, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val pendingIntent = PendingIntent.getActivity(
            appContext,
            notificationId,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        val smallIcon = appContext.applicationInfo.icon
        val builder = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Notification.Builder(appContext, ALERT_CHANNEL_ID)
        } else {
            @Suppress("DEPRECATION")
            Notification.Builder(appContext)
        }

        val notification = builder
            .setSmallIcon(smallIcon)
            .setContentTitle(title)
            .setContentText(body)
            .setStyle(Notification.BigTextStyle().bigText(body))
            .setContentIntent(pendingIntent)
            .setAutoCancel(true)
            .setShowWhen(true)
            .build()

        manager.notify(notificationId, notification)
        return true
    }

    /** Avisos de proximidade / estouro do guia “limite hoje” (canal à parte dos alertas de mercado). */
    private fun showDailyBudgetNotification(
        context: Context,
        title: String,
        body: String,
        notificationId: Int,
    ): Boolean {
        if (body.trim().isEmpty()) return false
        val appContext = context.applicationContext
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU &&
            appContext.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED
        ) {
            return false
        }

        val manager = appContext.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                DAILY_BUDGET_CHANNEL_ID,
                "Limite de gastos do dia",
                NotificationManager.IMPORTANCE_HIGH
            )
            channel.description =
                "Avisos quando estiver perto ou acima do teto de gastos diário que configuraste."
            manager.createNotificationChannel(channel)
        }

        val intent = Intent(appContext, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val pendingIntent = PendingIntent.getActivity(
            appContext,
            notificationId + 10000,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        val smallIcon = appContext.applicationInfo.icon
        val builder = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Notification.Builder(appContext, DAILY_BUDGET_CHANNEL_ID)
        } else {
            @Suppress("DEPRECATION")
            Notification.Builder(appContext)
        }

        val notification = builder
            .setSmallIcon(smallIcon)
            .setContentTitle(title)
            .setContentText(body)
            .setStyle(Notification.BigTextStyle().bigText(body))
            .setContentIntent(pendingIntent)
            .setAutoCancel(true)
            .setShowWhen(true)
            .build()

        manager.notify(notificationId, notification)
        return true
    }
}

class CustomNotificationListener : NotificationListenerService() {
    companion object {
        private var isRunning = false
        @Volatile
        private var activeInstance: CustomNotificationListener? = null

        /** Contexto da app para [Settings.Secure] sem depender da MainActivity estar viva. */
        @Volatile
        private var permissionCheckContext: Context? = null

        /** Chamado ao registar o canal Flutter; evita null antes de [onCreate] do serviço. */
        fun ensurePermissionCheckContext(context: Context) {
            permissionCheckContext = context.applicationContext
        }

        fun isServiceRunning(): Boolean = isRunning

        /** `true` quando o sistema ligou esta instância (bandeja ativa). */
        fun isListenerConnected(): Boolean = isRunning && activeInstance != null

        private fun contextForPermissionCheck(): Context? {
            permissionCheckContext?.let {
                return it
            }
            return try {
                MainActivity.instance
            } catch (_: Exception) {
                null
            }
        }

        fun isNotificationListenerEnabled(): Boolean {
            return try {
                val context = contextForPermissionCheck() ?: return false
                val enabled = Settings.Secure.getString(
                    context.contentResolver,
                    "enabled_notification_listeners"
                ) ?: return false

                val component = ComponentName(context, CustomNotificationListener::class.java)
                val flat = component.flattenToString()
                // Android usa ':'; alguns OEMs usam ';' ou misturam — comparar por segmentos limpos.
                Regex("[:;]+").split(enabled).map { it.trim() }.filter { it.isNotEmpty() }
                    .any { seg -> seg.equals(flat, ignoreCase = true) }
            } catch (e: Exception) {
                false
            }
        }

        fun getEnabledListeners(): String {
            return try {
                val context = contextForPermissionCheck() ?: return ""
                Settings.Secure.getString(
                    context.contentResolver,
                    "enabled_notification_listeners"
                ) ?: ""
            } catch (e: Exception) {
                ""
            }
        }

        fun requestListenerRebind(): Boolean {
            return try {
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) return false
                val context = contextForPermissionCheck() ?: return false
                val component = ComponentName(context, CustomNotificationListener::class.java)
                requestRebind(component)
                true
            } catch (e: Exception) {
                false
            }
        }

        fun forceListenerReconnect(): Boolean {
            return try {
                val context = contextForPermissionCheck() ?: return false
                val component = ComponentName(context, CustomNotificationListener::class.java)
                val packageManager = context.packageManager
                packageManager.setComponentEnabledSetting(
                    component,
                    PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                    PackageManager.DONT_KILL_APP
                )
                packageManager.setComponentEnabledSetting(
                    component,
                    PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                    PackageManager.DONT_KILL_APP
                )
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                    requestRebind(component)
                }
                true
            } catch (e: Exception) {
                false
            }
        }

        fun scanActiveNotifications(hours: Int): List<Map<String, Any>> {
            return try {
                val listener = activeInstance ?: run {
                    requestListenerRebind()
                    return emptyList()
                }
                val minTime = System.currentTimeMillis() - (hours * 60L * 60L * 1000L)
                listener.activeNotifications
                    ?.filter { it.postTime >= minTime }
                    ?.mapNotNull { listener.toNotificationData(it) }
                    ?: emptyList()
            } catch (e: Exception) {
                emptyList()
            }
        }
    }

    override fun onCreate() {
        super.onCreate()
        isRunning = true
        activeInstance = this
        permissionCheckContext = applicationContext
    }

    override fun onDestroy() {
        super.onDestroy()
        isRunning = false
        if (activeInstance === this) {
            activeInstance = null
        }
        if (isNotificationListenerEnabled()) {
            requestListenerRebind()
        }
    }

    override fun onListenerConnected() {
        super.onListenerConnected()
        isRunning = true
        activeInstance = this
        permissionCheckContext = applicationContext
        // Reprocessa o que ainda está na barra (ex.: após reboot ou reconexão do serviço).
        activeNotifications?.forEach { sbn ->
            val data = toNotificationData(sbn) ?: return@forEach
            NotificationChannels.sendNotification(
                this,
                data["package"] as String,
                data["title"] as String,
                data["text"] as String,
                data["timestamp"] as Long,
            )
        }
    }

    override fun onListenerDisconnected() {
        super.onListenerDisconnected()
        isRunning = false
        permissionCheckContext = applicationContext
        requestListenerRebind()
    }

    override fun onNotificationPosted(sbn: StatusBarNotification?) {
        val data = toNotificationData(sbn) ?: return
        NotificationChannels.sendNotification(
            this,
            data["package"] as String,
            data["title"] as String,
            data["text"] as String,
            data["timestamp"] as Long,
        )
    }

    private fun toNotificationData(sbn: StatusBarNotification?): Map<String, Any>? {
        sbn ?: return null

        val packageName = sbn.packageName ?: return null

        val notification = sbn.notification ?: return null
        val extras = notification.extras ?: return null

        val title = extras.getCharSequence(Notification.EXTRA_TITLE)?.toString() ?: ""
        // Junta vários extras: alguns bancos só preenchem BIG_TEXT ou linhas empilhadas.
        val text = listOf(
            extras.getCharSequence(Notification.EXTRA_TEXT)?.toString() ?: "",
            extras.getCharSequence(Notification.EXTRA_BIG_TEXT)?.toString() ?: "",
            extras.getCharSequence(Notification.EXTRA_SUB_TEXT)?.toString() ?: "",
            extras.getCharSequence(Notification.EXTRA_SUMMARY_TEXT)?.toString() ?: "",
            notification.tickerText?.toString() ?: "",
            extras.getCharSequenceArray(Notification.EXTRA_TEXT_LINES)
                ?.joinToString(" ") { it.toString() } ?: ""
        )
            .map { it.trim() }
            .filter { it.isNotEmpty() }
            .distinct()
            .joinToString(" ")
        val timestamp = sbn.postTime

        return mapOf(
            "package" to packageName,
            "title" to title,
            "text" to text,
            "timestamp" to timestamp
        )
    }

    override fun onNotificationRemoved(sbn: StatusBarNotification?) {}
}

