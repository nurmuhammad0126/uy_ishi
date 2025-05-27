allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

gradle.projectsEvaluated {
    val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
    rootProject.layout.buildDirectory.set(newBuildDir)

    subprojects {
        val newSubprojectBuildDir = newBuildDir.dir(project.name)
        layout.buildDirectory.set(newSubprojectBuildDir)
    }
}

subprojects {
    evaluationDependsOn(":app") // faqat kerak bo‘lsa
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
