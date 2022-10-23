FROM maven:3.8.6-eclipse-temurin-19-focal

WORKDIR /src

RUN git clone --recurse-submodules https://github.com/onthegomap/planetiler.git

WORKDIR /src/planetiler

RUN git submodule update --init

RUN unset MAVEN_CONFIG && ./mvnw -DskipTests=true --projects planetiler-dist -am package

ADD planetiler-openmaptiles/src/main/java/org/openmaptiles/layers/*.java planetiler-openmaptiles/src/main/java/org/openmaptiles/layers/

RUN unset MAVEN_CONFIG && ./mvnw -DskipTests=true --projects planetiler-dist -am package

RUN cp /src/planetiler/planetiler-dist/target/planetiler-dist-*-with-deps.jar /opt/planetiler.jar

USER 1000

WORKDIR /
ENTRYPOINT ["java", "-jar", "/opt/planetiler.jar"]

