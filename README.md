# GraalVM docker image

Docker image containing the Community Edition of GraalVM with the extra languages enabled.
Maven 3.6 is also added for easy use in projects

## Build

```bash
docker build -t ivonet/graalvm .
docker push ivonet/graalvm
```

## Example(s)

The command below will run `mvn compile quarkus:dev` from
the current folder mapping the local maven repository as a volume
and exposing two ports for easy usage outside the container.

The compiling and running will happen against the GraalVM in the container.

```bash
docker run                    \
  -it                         \
  --rm                        \
  --name graalvm              \
  -v $(pwd):/project          \
  -p 8080:8080                \
  -p 5005:5005                \
  -v "${HOME}/.m2:/root/.m2"  \
  ivonet/graalvm              \
  mvn compile quarkus:dev
```
