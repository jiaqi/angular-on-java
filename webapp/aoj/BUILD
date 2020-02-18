load("@io_bazel_rules_sass//:defs.bzl", "sass_binary")
load("@npm_angular_bazel//:index.bzl", "ng_module")
load("@npm_bazel_rollup//:index.bzl", "rollup_bundle")
load("@npm//@babel/cli:index.bzl", "babel")
load("@npm_bazel_terser//:index.bzl", "terser_minified")
load("@build_bazel_rules_nodejs//:index.bzl", "pkg_web")

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
    name = "bundle-es2015",
    config_file = "rollup.config.js",
    entry_points = {
        ":main-dev.ts": "index",
    },
    output_dir = True,
    deps = [
        ":js_module",
        "@npm//rollup-plugin-commonjs",
        "@npm//rollup-plugin-node-resolve",
    ],
)

babel(
    name = "bundle-es5",
    args = [
        "$(execpath :bundle-es2015)",
        "--no-babelrc",
        "--source-maps",
        "--presets=@babel/preset-env",
        "--out-dir",
        "$(@D)",
    ],
    data = [
        ":bundle-es2015",
        "@npm//@babel/preset-env",
    ],
    output_dir = True,
)

terser_minified(
    name = "bundle-es2015.min",
    src = ":bundle-es2015",
)

terser_minified(
    name = "bundle-es5.min",
    src = ":bundle-es5",
)

pkg_web(
    name = "aoj",
    srcs = [
        ":bundle-es2015.min",
        ":bundle-es5.min",
        ":styles.css",
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
