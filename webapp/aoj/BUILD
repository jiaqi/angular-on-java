load("@io_bazel_rules_sass//:defs.bzl", "sass_binary")
load("@npm_angular_bazel//:index.bzl", "ng_module")
load("@npm_bazel_rollup//:index.bzl", "rollup_bundle")
load("@npm_bazel_terser//:index.bzl", "terser_minified")

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
    config_file = "rollup.config.js",
    entry_point = ":main-dev.ts",
    output_dir = False,
    deps = [
        ":js_module",
        "@npm//rollup-plugin-commonjs",
        "@npm//rollup-plugin-node-resolve",
    ],
)

terser_minified(
    name = "js_bundle_min",
    src = ":js_bundle",
)

filegroup(
    name="aoj",
    srcs=[
        ":js_bundle_min",
        ":styles",
        "@npm//:node_modules/@angular/material/prebuilt-themes/deeppurple-amber.css",
        "@npm//:node_modules/core-js/client/core.min.js",
        "@npm//:node_modules/systemjs/dist/system.js",
        "@npm//:node_modules/zone.js/dist/zone.min.js",
    ],
)
