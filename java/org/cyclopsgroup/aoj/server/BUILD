load("@io_bazel_rules_appengine//appengine:java_appengine.bzl", "appengine_war")
load("@rules_java//java:defs.bzl", "java_library")

java_library(
    name = "server_jar",
    srcs = glob(["*.java"]),
    deps = [
        "//third_party/java/flogger",
        "//third_party/java/guava",
        "//third_party/java/springframework:spring-web",
    ],
)

java_library(
    name = "bundle_jar",
    resources = ["//webapp/aoj"],
)

# Run it with --jvm_flag="-Duse_jetty9_runtime=true" argument for now, otherwise the page fails with
# "No permissions needed for this runtime" error.
appengine_war(
    name = "server",
    data = glob([
        "WEB-INF/**",
        "*.png",
    ]),
    data_path = "",
    jars = [
        ":server_jar",
        ":bundle_jar",
    ],
)
