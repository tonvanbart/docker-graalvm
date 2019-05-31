# GraalVM docker image

Docker image containing the Community Edition of GraalVM with the extra languages enabled. 
Maven 3.6.1 is also added for easy use in projects

The images is based on the official image but makes it more polyglot and developer ready :-)

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
  ivonet/graalvm:1.0.0-rc16   \
  mvn compile quarkus:dev
```


---
# License

    Copyright 2019 (c) Ivo Woltring

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

