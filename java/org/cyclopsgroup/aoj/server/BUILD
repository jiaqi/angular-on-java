load("@io_bazel_rules_appengine//appengine:java_appengine.bzl", "java_war")
load("@rules_java//java:defs.bzl", "java_library")

java_library(
    name = "server_app",
    srcs = glob(["*.java"]),
    resources = [
        ":favicon.png",
        "//webapp/aoj",
    ],
    deps = [
        "//third_party/java/flogger",
        "//third_party/java/guava",
        "//third_party/java/springframework:spring-web",
    ],
)

# Run it with --jvm_flag="-Duse_jetty9_runtime=true" argument for now, otherwise the page fails with
# "No permissions needed for this runtime" error.
java_war(
    name = "server",
    data = glob(["WEB-INF/**"]),
    data_path = "",
    runtime_deps = [
        ":server_app",
    ],
)
