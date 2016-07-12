[![Docker Stars](https://img.shields.io/docker/stars/cignoir/play-scala-alpine.svg?style=flat-square)](https://hub.docker.com/r/cignoir/play-scala-alpine/)
[![Docker Pulls](https://img.shields.io/docker/pulls/cignoir/play-scala-alpine.svg?style=flat-square)](https://hub.docker.com/r/cignoir/play-scala-alpine/)

play-scala for Alpine Linux
---

## Tags (Click versions to Dockerfile)
* [latest](https://github.com/cignoir/docker-play-scala-alpine/blob/master/Dockerfile): Activator 1.3.10, Scala 2.12, JDK8
* [2.2.6](https://github.com/cignoir/docker-play-scala-alpine/blob/2.2.6/Dockerfile): play 2.2.6, sbt 0.13.0, Scala 2.10.4, JDK7

## Usage
### 1. Run a container from the latest image
```bash
$ docker pull cignoir/play-scala-alpine:latest
$ docker run -it -p 9000:9000 cignoir/play-scala-alpine ash
```

### 2. In the container, create a sample app & run it
```bash
$ cd ~
$ activator new sampleapp play-scala
$ cd sampleapp
$ activator run
```

### 3. See a welcome page in browser
Open http://localhost:9000/

## Dependencies
* frolvlad/alpine-scala:2.12
* anapsix/alpine-java:jdk7
