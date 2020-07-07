load("@rules_java//java:defs.bzl", "java_library")
load("@bazville//tools/java:webapp.bzl", "webapp")
load("@bazville//tools/java:jar.bzl", "jar")
load("@bazville//tools/tomcat:tomcat.bzl", "tomcat_binary")

java_library(
    name = "serverlib",
    srcs = glob(["*.java"]),
    deps = [
        "//third_party/java/flogger",
        "//third_party/java/guava",
        "//third_party/java/servlet-api",
        "//third_party/java/springframework:spring-web",
    ],
)

# Web application directory.
webapp(
    name = "webapp",
    srcs = glob(["WEB-INF/**"]) + [
        ":favicon.png",
        "//webapp/aoj",
    ],
    deps = [":serverlib"],
)

# War bundle file.
jar(
    name = "war",
    src = ":webapp",
    file_name = "aoj.war",
)

# Executable build target that runs the web application with a tomcat.
tomcat_binary(
    name = "server",
    app_dir = ":webapp",
    tomcat_bundle = "@bazville//tools/tomcat:tomcat_9",
)
