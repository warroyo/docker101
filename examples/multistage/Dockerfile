FROM gradle:4.10-jdk8 AS build  
COPY --chown=gradle:gradle spring-music /spring-music
RUN cd /spring-music && \
    ./gradlew clean assemble

FROM openjdk:8-jre-alpine  
COPY --from=build /spring-music/build/libs/spring-music-1.0.jar /app/spring-music.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/spring-music.jar"]  