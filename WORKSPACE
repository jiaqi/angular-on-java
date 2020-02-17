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

# Java appengine support.
git_repository(
    name = "io_bazel_rules_appengine",
    remote = "https://github.com/bazelbuild/rules_appengine.git",
    # Check https://github.com/bazelbuild/rules_appengine/releases for the
    # latest version.
    tag = "0.0.9",
)

load(
    "@io_bazel_rules_appengine//appengine:java_appengine.bzl",
    "java_appengine_repositories",
)

java_appengine_repositories()

# NPM and Angular, copied from https://github.com/angular/angular-bazel-example.
NODEJS_RULES_VERSION = "0.37.0"

http_archive(
    name = "build_bazel_rules_nodejs",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/" +
            "%s/rules_nodejs-%s.tar.gz" %
            (NODEJS_RULES_VERSION, NODEJS_RULES_VERSION)],
)

# Fetch sass rules for compiling sass files"
SASS_RULES_VERSION = "86ca977cf2a8ed481859f83a286e164d07335116"

http_archive(
    name = "io_bazel_rules_sass",
    strip_prefix = "rules_sass-%s" % SASS_RULES_VERSION,
    url = "https://github.com/bazelbuild/rules_sass/archive/%s.zip" %
          SASS_RULES_VERSION,
)

# Check the bazel version and download npm dependencies
load(
    "@build_bazel_rules_nodejs//:defs.bzl",
    "check_bazel_version",
    "yarn_install",
)

# Bazel version must be at least the following version because:
#   - 0.27.0 Adds managed directories support
check_bazel_version(
    message = """
You no longer need to install Bazel on your machine.
Angular has a dependency on the @bazel/bazel package which supplies it.
Try running `yarn bazel` instead.
    (If you did run that, check that you've got a fresh `yarn install`)

""",
    minimum_bazel_version = "0.27.0",
)

# Setup the Node.js toolchain & install our npm dependencies into @npm
yarn_install(
    name = "npm",
    package_json = "//:package.json",
    yarn_lock = "//:yarn.lock",
)

# Install all bazel dependencies of our npm packages
load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")

install_bazel_dependencies()

# Load npm_bazel_protractor dependencies
load("@npm_bazel_protractor//:package.bzl", "npm_bazel_protractor_dependencies")

npm_bazel_protractor_dependencies()

# Load npm_bazel_karma dependencies
load("@npm_bazel_karma//:package.bzl", "rules_karma_dependencies")

rules_karma_dependencies()

# Setup the rules_webtesting toolchain
load("@io_bazel_rules_webtesting//web:repositories.bzl", "web_test_repositories")

web_test_repositories()

# Temporary work-around for https://github.com/angular/angular/issues/28681
# TODO(gregmagolan): go back to @io_bazel_rules_webtesting browser_repositories
load("@npm_bazel_karma//:browser_repositories.bzl", "browser_repositories")

browser_repositories()

# Setup the rules_typescript tooolchain
load("@npm_bazel_typescript//:defs.bzl", "ts_setup_workspace")

ts_setup_workspace()

# Setup the rules_sass toolchain
load("@io_bazel_rules_sass//sass:sass_repositories.bzl", "sass_repositories")

sass_repositories()
