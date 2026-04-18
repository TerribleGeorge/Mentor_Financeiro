package com.example.mentor_financeiro

import android.app.Notification
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    companion object {
        lateinit var instance: MainActivity
    }
    
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        instance = this
        NotificationChannels.register(flutterEngine.dartExecutor.binaryMessenger)
    }
}

object NotificationChannels {
    private const val METHOD_CHANNEL = "mentor_financeiro/notifications"
    private const val EVENT_CHANNEL = "mentor_financeiro/notifications/stream"

    private var eventSink: EventChannel.EventSink? = null

    fun register(messenger: io.flutter.plugin.common.BinaryMessenger) {
        MethodChannel(messenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkPermission" -> {
                    result.success(CustomNotificationListener.isServiceEnabled())
                }
                "requestPermission" -> {
                    result.success(true)
                }
                "getEnabledListeners" -> {
                    result.success(CustomNotificationListener.getEnabledListeners())
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

    fun sendNotification(packageName: String, title: String, text: String, timestamp: Long) {
        if (!isBankingNotification(packageName, title, text)) return

        val data = mapOf(
            "package" to packageName,
            "title" to title,
            "text" to text,
            "timestamp" to timestamp
        )
        eventSink?.success(data)
    }

    private fun isBankingNotification(packageName: String, title: String, text: String): Boolean {
        val apps = listOf("nubank", "caixa", "bancointer", "bradesco", "itau", "santander", 
                         "bancodobrasil", "sicredi", "sicoob", "c6bank", "neon", 
                         "pagseguro", "mercadopago", "picpay")
        val combined = "$packageName $title $text".lowercase()
        return apps.any { combined.contains(it) }
    }
}

class CustomNotificationListener : NotificationListenerService() {
    companion object {
        private var isRunning = false

        private val authorizedPackages = setOf(
            "com.nu.production",
            "br.com.inter.banking",
            "br.com.caixa.mobi",
            "com.itau",
            "br.com.bradesco.nativov2"
        )

        fun isServiceEnabled(): Boolean = isRunning

        fun isAuthorizedPackage(packageName: String): Boolean {
            return authorizedPackages.any { packageName.equals(it, ignoreCase = true) }
        }

        fun getEnabledListeners(): String {
            return try {
                val context = MainActivity.instance
                android.provider.Settings.Secure.getString(
                    context.contentResolver,
                    "enabled_notification_listeners"
                ) ?: ""
            } catch (e: Exception) { "" }
        }
    }

    override fun onCreate() {
        super.onCreate()
        isRunning = true
    }

    override fun onDestroy() {
        super.onDestroy()
        isRunning = false
    }

    override fun onNotificationPosted(sbn: StatusBarNotification?) {
        sbn ?: return
        
        val packageName = sbn.packageName ?: return
        
        if (!isAuthorizedPackage(packageName)) {
            return
        }

        val notification = sbn.notification ?: return
        val extras = notification.extras ?: return

        val title = extras.getCharSequence(Notification.EXTRA_TITLE)?.toString() ?: ""
        val text = extras.getCharSequence(Notification.EXTRA_TEXT)?.toString() ?: ""
        val timestamp = sbn.postTime

        NotificationChannels.sendNotification(packageName, title, text, timestamp)
    }

    override fun onNotificationRemoved(sbn: StatusBarNotification?) {}
}