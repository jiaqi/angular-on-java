load("@build_bazel_rules_nodejs//:index.bzl", "pkg_web")
load("@io_bazel_rules_sass//:defs.bzl", "sass_binary")
load("@npm_angular_bazel//:index.bzl", "ng_module")
load("@npm_bazel_rollup//:index.bzl", "rollup_bundle")
load("@npm//@babel/cli:index.bzl", "babel")
load("@npm_bazel_terser//:index.bzl", "terser_minified")
load("@npm//history-server:index.bzl", "history_server")

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
        "@npm//@angular/core",
        "@npm//@angular/platform-browser",
        #"@npm//@angular/router",
        #"@npm//@ngrx/store",
    ],
)

rollup_bundle(
    name = "js_bundle",
    config_file = "rollup.config.js",
    entry_points = {":main.ts": "index"},
    output_dir = True,
    deps = [
        ":js_module",
        "@npm//rollup-plugin-commonjs",
        "@npm//rollup-plugin-node-resolve",
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

terser_minified(
    name = "js_bundle_min",
    src = ":js_bundle",
)

terser_minified(
    name = "js_bundle_es5_min",
    src = ":js_bundle_es5",
)

pkg_web(
    name = "web",
    srcs = [
        ":js_bundle_es5_min",
        ":js_bundle_min",
        ":styles",
        "@npm//:node_modules/@angular/material/prebuilt-themes/deeppurple-amber.css",
        "@npm//:node_modules/core-js/client/core.min.js",
        "@npm//:node_modules/systemjs/dist/system.js",
        "@npm//:node_modules/zone.js/dist/zone.min.js",
    ],
    # In production mode we serve some polyfills with script tags that have hard-coded paths in the index.html
    # so we must serve them at that path, by stripping a prefix
    additional_root_paths = [
        "npm/node_modules/core-js/client",
        "npm/node_modules/systemjs/dist",
    ],
)

history_server(
    name = "server",
    data = [":web"],
    templated_args = [
        "-a",
        "webapp/aoj/web",
    ],
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
