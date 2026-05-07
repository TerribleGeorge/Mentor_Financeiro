pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    // Este é o plugin que resolve o erro de "Cannot find a Java installation"
    // Ele permite que o Gradle baixe o JDK 17 automaticamente.
    id("org.gradle.toolchains.foojay-resolver-convention") version "0.8.0"

    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    // AGP ≥ 8.0 com Gradle 8.14; Java 17 no :app (compileOptions + toolchain Kotlin).
    id("com.android.application") version "8.11.1" apply false
    // Kotlin 2.x com JVM 17 no módulo app.
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
    id("com.google.gms.google-services") version "4.4.2" apply false
    id("com.google.firebase.crashlytics") version "3.0.3" apply false
}

include(":app")