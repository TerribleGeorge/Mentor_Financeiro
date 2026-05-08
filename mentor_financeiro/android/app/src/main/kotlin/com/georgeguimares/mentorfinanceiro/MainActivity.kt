package com.georgeguimares.mentorfinanceiro

import android.app.Notification
import android.content.ComponentName
import android.content.Intent
import android.provider.Settings
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
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
    private val pendingEvents = mutableListOf<Map<String, Any>>()

    fun register(messenger: io.flutter.plugin.common.BinaryMessenger) {
        MethodChannel(messenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkPermission" -> {
                    result.success(CustomNotificationListener.isNotificationListenerEnabled())
                }
                "requestPermission" -> {
                    try {
                        val context = MainActivity.instance
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
                else -> result.notImplemented()
            }
        }

        EventChannel(messenger, EVENT_CHANNEL).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
                if (events != null && pendingEvents.isNotEmpty()) {
                    pendingEvents.forEach { events.success(it) }
                    pendingEvents.clear()
                }
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
            }
        })
    }

    fun sendNotification(packageName: String, title: String, text: String, timestamp: Long) {
        val data = mapOf(
            "package" to packageName,
            "title" to title,
            "text" to text,
            "timestamp" to timestamp
        )
        val sink = eventSink
        if (sink != null) {
            sink.success(data)
        } else {
            pendingEvents.add(data)
            if (pendingEvents.size > 30) {
                pendingEvents.removeAt(0)
            }
        }
    }
}

class CustomNotificationListener : NotificationListenerService() {
    companion object {
        private var isRunning = false

        fun isServiceRunning(): Boolean = isRunning

        fun isNotificationListenerEnabled(): Boolean {
            return try {
                val context = MainActivity.instance
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
                val context = MainActivity.instance
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
            extras.getCharSequenceArray(Notification.EXTRA_TEXT_LINES)
                ?.joinToString(" ") { it.toString() } ?: ""
        )
            .map { it.trim() }
            .filter { it.isNotEmpty() }
            .distinct()
            .joinToString(" ")
        val timestamp = sbn.postTime

        NotificationChannels.sendNotification(packageName, title, text, timestamp)
    }

    override fun onNotificationRemoved(sbn: StatusBarNotification?) {}
}

