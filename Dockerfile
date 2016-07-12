FROM anapsix/alpine-java:jdk7

MAINTAINER cignoir <cignoir@gmail.com>

ENV SCALA_VERSION 2.10.4
ENV SCALA_HOME /usr/share/scala

ENV SBT_VERSION 0.13.0
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

ENV PLAY_VERSION 2.2.6

RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
  apk add --no-cache bash curl unzip

# Install Scala
RUN cd "/tmp" && wget "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
  tar xzf "scala-${SCALA_VERSION}.tgz" && \
  mkdir "${SCALA_HOME}" && \
  rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
  mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
  ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
  rm -rf "/tmp/"*

# Install sbt
RUN apk add --no-cache curl bash && \
  curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
  rm -rf /var/cache/apk/* && \
  echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built

# Install Play Framework
RUN wget "http://downloads.typesafe.com/play/$PLAY_VERSION/play-$PLAY_VERSION.zip" && \
  unzip play-$PLAY_VERSION.zip -d /usr/local && \
  ln -s /usr/local/play-$PLAY_VERSION/play /usr/local/bin/play && \
  rm -f *.zip

EXPOSE 9000 9999

# Clean up
RUN apk del .build-dependencies curl unzip

# Print versions
RUN java -version && \
  scala -version || echo '' > /dev/null && \
  sbt --version
