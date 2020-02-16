load("@io_bazel_rules_appengine//appengine:java_appengine.bzl", "appengine_war")

java_library(
    name = "server",
    srcs = glob(["*.java"]),
    runtime_deps = [
        "@maven//:com_google_flogger_flogger_system_backend",
    ],
    deps = [
        "@maven//:com_google_flogger_flogger",
        "@maven//:com_google_guava_guava",
        "@maven//:javax_servlet_javax_servlet_api",
        "@maven//:org_springframework_spring_context",
        "@maven//:org_springframework_spring_web",
        "@maven//:org_springframework_spring_webmvc",
    ],
)

# Run it with --jvm_flag="-Duse_jetty9_runtime=true" argument for now.
appengine_war(
    name = "war",
    data = glob(["WEB-INF/**"]),
    data_path = "",
    jars = [":server"],
)
