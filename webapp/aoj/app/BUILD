load("//buildtools:ng_module.bzl", "ng_module")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@npm//@bazel/labs:index.bzl", "ts_proto_library")

package(default_visibility = ["//webapp/aoj:packages"])

proto_library(
    name = "thing_type",
    srcs = ["thing.proto"],
)

ts_proto_library(
    name = "thing_type_ts",
    proto = ":thing_type",
)

ng_module(
    name = "app",
    srcs = glob(["*.ts"]),
    assets = ["app.html"],
    tsconfig = "//webapp/aoj:tsconfig.json",
    deps = [
        ":thing_type_ts",
        "@npm//@angular/core",
        "@npm//@angular/platform-browser",
    ],
)
