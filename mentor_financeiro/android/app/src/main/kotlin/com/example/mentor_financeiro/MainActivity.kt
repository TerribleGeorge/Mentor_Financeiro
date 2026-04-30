package com.example.mentor_financeiro

import android.app.Notification
import android.content.ComponentName
import android.content.Intent
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import android.provider.Settings
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
        // Heurística: keywords comuns em apps/notificações de bancos e cartões.
        val apps = listOf(
            "nubank",
            "nu",
            "caixa",
            "bancointer",
            "inter",
            "bradesco",
            "itau",
            "itaú",
            "santander",
            "bancodobrasil",
            "banco do brasil",
            "bb",
            "sicredi",
            "sicoob",
            "c6",
            "c6bank",
            "neon",
            "pagbank",
            "pagseguro",
            "mercadopago",
            "mercado pago",
            "picpay",
            "cartão",
            "cartao",
            "crédito",
            "credito",
            "compra aprovada",
            "compra aprovada no",
            "pagamento aprovado",
            "pagamento realizado",
            "pix",
        )
        val combined = "$packageName $title $text".lowercase()
        return apps.any { combined.contains(it) }
    }
}

class CustomNotificationListener : NotificationListenerService() {
    companion object {
        private var isRunning = false

        // Lista curta de apps mais comuns (heurística); o filtro final é feito por keywords.
        // Importante: manter permissivo para não quebrar bancos que mudam pacote.
        private val knownBankPackages = setOf(
            "com.nu.production",              // Nubank
            "br.com.inter.banking",           // Inter
            "br.com.caixa.mobi",              // Caixa
            "br.com.bradesco.nativov2",       // Bradesco
            "com.itau",                       // Itaú (varia por app)
            "br.com.bb.android",              // Banco do Brasil (comum)
            "br.com.santander.app",           // Santander (varia)
            "com.c6bank.app",                 // C6 (varia)
            "com.neon",                       // Neon (varia)
            "com.pagseguro",                  // PagBank (varia)
            "com.mercadopago.wallet",         // Mercado Pago
            "com.picpay",                     // PicPay
        )

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

        fun isAuthorizedPackage(packageName: String): Boolean {
            // Se for conhecido, passa; se não for, ainda pode passar (o filtro final é por keyword).
            return knownBankPackages.any { packageName.equals(it, ignoreCase = true) } || packageName.isNotBlank()
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