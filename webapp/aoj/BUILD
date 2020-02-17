load("@io_bazel_rules_sass//:defs.bzl", "sass_binary")
load("@npm_angular_bazel//:index.bzl", "ng_module")
load("@build_bazel_rules_nodejs//:defs.bzl", "rollup_bundle")
load("@npm_bazel_typescript//:defs.bzl", "ts_devserver")

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

ts_devserver(
    name = "devserver",
    data = [],
    # Start from the development version of the main
    entry_module = "angular_on_java/webapp/aoj/main-dev",
    # <script> and <link> tags will be automatically injected into this index file
    index_html = ":index.html",
    # These scripts will be included in the JS bundle after require.js
    # They should have only named UMD modules, or require.js will throw.
    scripts = [
        "@npm//:node_modules/@ngrx/store/bundles/store.umd.min.js",
        "@npm//:node_modules/tslib/tslib.js",
        "@npm//date-fns:date-fns.umd.js",
    ],
    static_files = [
        ":styles.css",
        "@npm//:node_modules/@angular/material/prebuilt-themes/deeppurple-amber.css",
        "@npm//:node_modules/zone.js/dist/zone.min.js",
    ],
    # Tell Bazel to build the sources first
    deps = [":js_module"],
)
