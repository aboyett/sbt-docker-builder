FROM openjdk:8-jdk

RUN apt-get update \
    && apt-get install --no-install-recommends -y git \
    && apt-get clean

# install sbt
RUN wget https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt -O /usr/local/bin/sbt && chmod +x /usr/local/bin/sbt

ENTRYPOINT ["sh"]
