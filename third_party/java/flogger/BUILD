load("@rules_java//java:defs.bzl", "java_library")

package(default_visibility = ["//visibility:public"])

java_library(
    name = "flogger",
    exports = ["@maven//:com_google_flogger_flogger"],
    runtime_deps = [
        "@maven//:com_google_flogger_flogger_system_backend",
    ],
)
