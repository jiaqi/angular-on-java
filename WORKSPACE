workspace(
    name = "angular_on_java",
    managed_directories = {"@npm": ["node_modules"]},
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

#
# Enable global maven dependency.
#
RULES_JVM_EXTERNAL_TAG = "3.1"

http_archive(
    name = "rules_jvm_external",
    sha256 = "e246373de2353f3d34d35814947aa8b7d0dd1a58c2f7a6c41cfeaff3007c2d14",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" %
          RULES_JVM_EXTERNAL_TAG,
)

SKYLIB_RULE_VERSION = "1.0.3"

SKYLIB_RULE_SHA265 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c"

http_archive(
    name = "bazel_skylib",
    sha256 = SKYLIB_RULE_SHA265,
    urls = [
        "https://github.com/bazelbuild/bazel-skylib/releases/download/%s/bazel-skylib-%s.tar.gz" %
        (SKYLIB_RULE_VERSION, SKYLIB_RULE_VERSION),
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/%s/bazel-skylib-%s.tar.gz" %
        (SKYLIB_RULE_VERSION, SKYLIB_RULE_VERSION),
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@rules_jvm_external//:defs.bzl", "maven_install")

GOOGLE_AUTO_VALUE_VERSION = "1.7"

SPRING_VERSION = "5.2.3.RELEASE"

maven_install(
    artifacts = [
        "com.google.auto.value:auto-value:" + GOOGLE_AUTO_VALUE_VERSION,
        "com.google.auto.value:auto-value-annotations:" +
        GOOGLE_AUTO_VALUE_VERSION,
        "com.google.errorprone:error_prone_annotations:2.0.21",
        "com.google.flogger:flogger:0.4",
        "com.google.flogger:flogger-system-backend:0.4",
        "com.google.guava:guava:28.1-jre",
        "com.google.truth:truth:0.35",
        "javax.inject:javax.inject:1",
        "javax.servlet:javax.servlet-api:4.0.1",
        "javax.servlet:jstl:1.2",
        "junit:junit:4.12",
        "org.hamcrest:hamcrest-library:1.3",
        "org.mockito:mockito-core:2.9.0",
        "org.springframework:spring-aop:" + SPRING_VERSION,
        "org.springframework:spring-beans:" + SPRING_VERSION,
        "org.springframework:spring-context:" + SPRING_VERSION,
        "org.springframework:spring-web:" + SPRING_VERSION,
        "org.springframework:spring-webmvc:" + SPRING_VERSION,
        "org.springframework:spring-test:" + SPRING_VERSION,
    ],
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

# NPM and Angular, copied from https://github.com/angular/angular-bazel-example.
NODEJS_RULES_VERSION = "2.3.2"

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "b3521b29c7cb0c47a1a735cce7e7e811a4f80d8e3720cf3a1b624533e4bb7cb6",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/" +
            "%s/rules_nodejs-%s.tar.gz" %
            (NODEJS_RULES_VERSION, NODEJS_RULES_VERSION)],
)

# Fetch sass rules for compiling sass files"
SASS_RULES_VERSION = "1.29.0"

http_archive(
    name = "io_bazel_rules_sass",
    strip_prefix = "rules_sass-%s" % SASS_RULES_VERSION,
    urls = [
        "https://github.com/bazelbuild/rules_sass/archive/%s.zip" %
        SASS_RULES_VERSION,
        "https://mirror.bazel.build/github.com/bazelbuild/rules_sass/archive/%s.zip" %
        SASS_RULES_VERSION,
    ],
)

# Check the bazel version and download npm dependencies
load("@build_bazel_rules_nodejs//:index.bzl", "yarn_install")

# Setup the Node.js toolchain & install our npm dependencies into @npm
yarn_install(
    name = "npm",
    package_json = "//:package.json",
    yarn_lock = "//:yarn.lock",
)

# Load @bazel/protractor dependencies
load("@npm//@bazel/protractor:package.bzl", "npm_bazel_protractor_dependencies")

npm_bazel_protractor_dependencies()

# Setup the rules_webtesting toolchain
load("@io_bazel_rules_webtesting//web:repositories.bzl", "web_test_repositories")

web_test_repositories()

load("@io_bazel_rules_webtesting//web/versioned:browsers-0.3.2.bzl", "browser_repositories")

browser_repositories(
    chromium = True,
    firefox = True,
)

# Setup the rules_sass toolchain
load("@io_bazel_rules_sass//sass:sass_repositories.bzl", "sass_repositories")

sass_repositories()

http_archive(
    name = "bazville",
    sha256 = "902e1fee3d2cf2b1df479b486545c859d9ad3edecc0895559ca49bc58b10c9ad",
    strip_prefix = "bazville-v_0_0_2",
    urls = ["https://github.com/jiaqi/bazville/archive/v_0_0_2.zip"],
)

load("@npm//@bazel/labs:package.bzl", "npm_bazel_labs_dependencies")

npm_bazel_labs_dependencies()

http_archive(
    name = "com_google_protobuf",
    sha256 = "d0f5f605d0d656007ce6c8b5a82df3037e1d8fe8b121ed42e536f569dec16113",
    strip_prefix = "protobuf-3.14.0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.14.0.tar.gz"],
)

http_archive(
    name = "rules_proto",
    sha256 = "3bce0e2fcf502619119c7cac03613fb52ce3034b2159dd3ae9d35f7339558aa3",
    strip_prefix = "rules_proto-84ba6ec814eebbf5312b2cc029256097ae0042c3",
    urls = [
        "https://github.com/bazelbuild/rules_proto/archive/84ba6ec814eebbf5312b2cc029256097ae0042c3.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()
