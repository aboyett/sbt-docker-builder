FROM openjdk:8-jdk-alpine

RUN apk add --no-cache bash git

# install sbt
RUN wget https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt -O /usr/local/bin/sbt && chmod +x /usr/local/bin/sbt

ENTRYPOINT ["bash"]
