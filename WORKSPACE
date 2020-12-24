workspace(
    name = "angular_on_java",
    managed_directories = {"@npm": ["node_modules"]},
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

#
# Enable global maven dependency.
#
RULES_JVM_EXTERNAL_TAG = "3.1"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" %
          RULES_JVM_EXTERNAL_TAG,
)

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

# Support for Remote Execution #
BAZEL_TOOLCHAINS_VERSION = "3.2.0"

http_archive(
    name = "bazel_toolchains",
    sha256 = "db48eed61552e25d36fe051a65d2a329cc0fb08442627e8f13960c5ab087a44e",
    strip_prefix = "bazel-toolchains-%s" % BAZEL_TOOLCHAINS_VERSION,
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/releases" +
        "/download/%s/bazel-toolchains-%s.tar.gz" %
        (BAZEL_TOOLCHAINS_VERSION, BAZEL_TOOLCHAINS_VERSION),
        "https://github.com/bazelbuild/bazel-toolchains/releases" +
        "/download/%s/bazel-toolchains-%s.tar.gz" %
        (BAZEL_TOOLCHAINS_VERSION, BAZEL_TOOLCHAINS_VERSION),
    ],
)

git_repository(
    name = "bazville",
    remote = "https://github.com/jiaqi/bazville.git",
    tag = "v_0_0_2",
)
