# Sample Java Web application

This repository will help you set up a development environment using Java and 
Gradle, to build a Java Web application and bundle it to a WAR package.

---

The contents of this sample project was created based on the following article 
on the [Gradle Guides](https://guides.gradle.org/building-java-web-applications/) website.

## Build the image

The following commands use `podman`, but with Docker you will obtain the same 
results:

```bash
podman build -t sample-java-war .
```

You can provide the following build variables to customize the JDK and Gradle 
versions:

- `java_sdk` (defaults to 8.312.07.1)
- `gradle_version` (defaults to 6.9.1)

## Run the environment

With the following command, a new container will be launched and attached to the 
*project* folder:

```bash
podman run -it --rm -v ./project:/workdir:z sample-java-war bash
```

## Compile the WAR

To obtain the WAR for this sample project, issue the following commands inside 
the container:

```bash
gradle wrapper --gradle-version=6.9.1
./gradlew war
```

The product of the task `war` is located under *project/build/libs/hello-servlet.war*
