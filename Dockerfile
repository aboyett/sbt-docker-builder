FROM openjdk:8-jdk-alpine

RUN apk add --no-cache bash ca-certificates git wget

# install sbt
RUN wget https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt -O /usr/local/bin/sbt-paulp && chmod +x /usr/local/bin/sbt-paulp

COPY bin/ /usr/local/bin/

ENTRYPOINT ["bash"]
