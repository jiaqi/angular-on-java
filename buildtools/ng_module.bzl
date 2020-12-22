load("@npm//@bazel/typescript:index.bzl", "ts_library")

def ng_module(assets = [], **kwargs):
    ts_library(
        compiler = "//buildtools:tsc_wrapped_with_angular",
        supports_workers = True,
        use_angular_plugin = True,
        angular_assets = assets,
        **kwargs
    )
