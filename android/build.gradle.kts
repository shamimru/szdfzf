allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

plugins {
    id("com.android.library")
    kotlin("android")
}

android {
    namespace = "com.crazecoder.imagegallerysaver"  // Kotlin DSL syntax with = and quotes
    compileSdk = 33  // Note: compileSdk, not compileSdkVersion

    defaultConfig {
        minSdk = 21  // Note: minSdk, not minSdkVersion
    }
    // ... rest of the configuration
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

