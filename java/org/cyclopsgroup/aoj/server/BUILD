load("@io_bazel_rules_appengine//appengine:java_appengine.bzl", "appengine_war")

java_library(
    name = "server",
    srcs = glob(["*.java"]),
    runtime_deps = [
        "@maven//:com_google_flogger_flogger_system_backend",
    ],
    deps = [
        "//third_party/java/flogger",
        "//third_party/java/guava",
        "//third_party/java/springframework:spring-web",
    ],
)

# Run it with --jvm_flag="-Duse_jetty9_runtime=true" argument for now.
appengine_war(
    name = "war",
    data = glob(["WEB-INF/**"]),
    data_path = "",
    jars = [":server"],
)
