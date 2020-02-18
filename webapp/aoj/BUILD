load("@io_bazel_rules_sass//:defs.bzl", "sass_binary")
load("@npm_angular_bazel//:index.bzl", "ng_module")
load("@npm_bazel_rollup//:index.bzl", "rollup_bundle")

package_group(
    name = "packages",
    packages = [
        "//java/org/cyclopsgroup/aoj/...",
        "//javatests/org/cyclopsgroup/aoj/...",
        "//webapp/aoj/...",
    ],
)

package(default_visibility = ["//webapp/aoj:packages"])

sass_binary(
    name = "styles",
    src = "styles.scss",
)

ng_module(
    name = "js_module",
    srcs = [
        "main-dev.ts",
    ],
    tsconfig = ":tsconfig.json",
    deps = [
        "//webapp/aoj/app",
        "@npm//@angular/animations",
        "@npm//@angular/cdk",
        "@npm//@angular/core",
        "@npm//@angular/forms",
        "@npm//@angular/material",
        "@npm//@angular/platform-browser",
        "@npm//@angular/router",
        "@npm//@ngrx/store",
    ],
)

rollup_bundle(
    name = "js_bundle",
    entry_point = ":main-dev.ts",
    deps = [
        ":js_module",
        "@npm//@angular/common",
        "@npm//@ngrx/store",
        "@npm//rxjs",
    ],
)

filegroup(
    name = "aoj",
    srcs = [
        ":js_bundle",
        ":styles",
    ],
)
