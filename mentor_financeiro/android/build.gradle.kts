/**
 * Compatibilidade JVM/Java bytecode do **app** (ver `android/app/build.gradle.kts`):
 * - Gradle wrapper **8.14**; JDK **17** no daemon (exigência típica do AGP 8.x).
 * - **AGP 8.11.1** em `settings.gradle.kts` (≥ **8.0**, compatível com Gradle 8.14).
 * - Kotlin **2.2.20** no mesmo `plugins { }`.
 * - Bytecode **Java 17** no `:app`: `compileOptions`, `kotlin.jvmToolchain(17)`, `JvmTarget.JVM_17`.
 *
 * Os módulos dos plugins Flutter seguem as suas próprias definições (muitas vezes JDK 17) —
 * não forçar `JavaCompile`/`KotlinCompile` in todos os `subprojects`, sob pena de
 * “Inconsistent JVM-target compatibility” entre tarefas Java e Kotlin.
 *
 * Avisos "unchecked or unsafe operations" no código gerado dos plugins (ex.: Firestore)
 * são internos — não há correção necessária neste repositório.
 */

allprojects {
    repositories {
        google()
        mavenCentral()
    }

    // SILENCIADOR DE AVISOS: Isso impede que os avisos de Java 8 obsoleto 
    // dos plugins externos poluam o seu terminal.
    tasks.withType<JavaCompile>().configureEach {
        options.compilerArgs.addAll(listOf("-Xlint:-options", "-Xlint:-deprecation"))
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}