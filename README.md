# Angular on Java

The intention of this project is to create a minimal example of an Angular application running on a
Java/Spring serving backend in a Bazel mono-repo.

To run the application

```shell script
bazel run java/org/cyclopsgroup/aoj/server -- --jvm_flag="-Duse_jetty9_runtime=true"
```