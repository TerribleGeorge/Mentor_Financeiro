package com.georgeguimares.mentorfinanceiro

import android.app.Notification
import android.content.ComponentName
import android.content.Context
import android.content.Intent
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
    private const val PENDING_PREFS = "mentor_notification_listener"
    private const val PENDING_EVENTS_KEY = "pending_events"
    private const val MAX_PENDING_EVENTS = 50

    private var eventSink: EventChannel.EventSink? = null
    private val mainHandler = Handler(Looper.getMainLooper())
    private lateinit var appContext: Context

    fun register(appContext: Context, messenger: io.flutter.plugin.common.BinaryMessenger) {
        this.appContext = appContext.applicationContext
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
                "drainPendingNotifications" -> {
                    try {
                        result.success(drainPendingNotifications(appContext))
                    } catch (e: Exception) {
                        result.success(emptyList<Map<String, Any>>())
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
        val data = mapOf(
            "package" to packageName,
            "title" to title,
            "text" to text,
            "timestamp" to timestamp
        )
        val sink = eventSink
        if (sink != null) {
            mainHandler.post { sink.success(data) }
        } else {
            persistPendingNotification(context, data)
        }
    }

    private fun persistPendingNotification(context: Context, data: Map<String, Any>) {
        val prefs = context.applicationContext.getSharedPreferences(PENDING_PREFS, Context.MODE_PRIVATE)
        val current = JSONArray(prefs.getString(PENDING_EVENTS_KEY, "[]") ?: "[]")
        current.put(JSONObject(data))
        while (current.length() > MAX_PENDING_EVENTS) {
            current.remove(0)
        }
        prefs.edit().putString(PENDING_EVENTS_KEY, current.toString()).apply()
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
                    "timestamp" to item.optLong("timestamp")
                )
            )
        }

        prefs.edit().remove(PENDING_EVENTS_KEY).apply()
        return out
    }
}

class CustomNotificationListener : NotificationListenerService() {
    companion object {
        private var isRunning = false

        /** Contexto da app para [Settings.Secure] sem depender da MainActivity estar viva. */
        @Volatile
        private var permissionCheckContext: Context? = null

        fun isServiceRunning(): Boolean = isRunning

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
                enabled.split(":").any { it.equals(component.flattenToString(), ignoreCase = true) }
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
    }

    override fun onCreate() {
        super.onCreate()
        isRunning = true
        permissionCheckContext = applicationContext
    }

    override fun onDestroy() {
        super.onDestroy()
        isRunning = false
    }

    override fun onNotificationPosted(sbn: StatusBarNotification?) {
        sbn ?: return

        val packageName = sbn.packageName ?: return

        val notification = sbn.notification ?: return
        val extras = notification.extras ?: return

        val title = extras.getCharSequence(Notification.EXTRA_TITLE)?.toString() ?: ""
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

        NotificationChannels.sendNotification(this, packageName, title, text, timestamp)
    }

    override fun onNotificationRemoved(sbn: StatusBarNotification?) {}
}

