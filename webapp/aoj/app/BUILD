load("@npm_angular_bazel//:index.bzl", "ng_module")

package(default_visibility = ["//webapp/aoj:packages"])

ng_module(
    name = "app",
    srcs = glob(["*.ts"]),
    assets = ["app.html"],
    tsconfig = "//webapp/aoj:tsconfig.json",
    deps = [
        "@npm//@angular/core",
        "@npm//@angular/platform-browser",
    ],
)
