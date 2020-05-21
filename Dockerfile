FROM maven:3.6.3-jdk-8 as maven_builder

WORKDIR /app

ADD pom.xml .

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

ADD . $HOME

RUN ["mvn","clean","install","-T","2C","-DskipTests=true"]

FROM tomcat:9.0.35-jdk8

COPY --from=maven_builder /app/target/gweedore.war /usr/local/tomcat/webapps