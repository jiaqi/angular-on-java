load("@io_bazel_rules_sass//:defs.bzl", "sass_binary")
load("//buildtools:ng_module.bzl", "ng_module")
load("@npm//@bazel/rollup:index.bzl", "rollup_bundle")
load("@npm//@babel/cli:index.bzl", "babel")

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
        "main.ts",
    ],
    tsconfig = ":tsconfig.json",
    deps = [
        "//webapp/aoj/app",
        "@npm//@angular/platform-browser",
    ],
)

rollup_bundle(
    name = "js_bundle",
    config_file = "rollup.config.js",
    entry_points = {":main.ts": "index"},
    link_workspace_root = True,
    output_dir = True,
    deps = [
        ":js_module",
        "@npm//@angular/animations",
        "@npm//@rollup/plugin-commonjs",
        "@npm//@rollup/plugin-node-resolve",
        "@npm//google-protobuf",
    ],
)

babel(
    name = "js_bundle_es5",
    args = [
        "$(execpath :js_bundle)",
        "--no-babelrc",
        "--source-maps",
        "--presets=@babel/preset-env",
        "--out-dir",
        "$(@D)",
    ],
    data = [
        ":js_bundle",
        "@npm//@babel/preset-env",
    ],
    output_dir = True,
)

filegroup(
    name = "aoj",
    srcs = [
        ":js_bundle",
        ":js_bundle_es5",
        ":styles",
        "@npm//:node_modules/@angular/material/prebuilt-themes/deeppurple-amber.css",
        "@npm//:node_modules/core-js/client/core.min.js",
        "@npm//:node_modules/systemjs/dist/system.js",
        "@npm//:node_modules/zone.js/dist/zone.min.js",
    ],
)
