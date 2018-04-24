FROM improving/java

USER root
ARG user=app

COPY spring.sh /opt/app/spring.sh
VOLUME "/opt/app/run"
RUN chown -R ${user}:${user} /opt/app/

USER ${user}

WORKDIR /opt/app

#Java
ENV JAVA_OPTS ""
#Spring
ENV SPRING_PROFILE ""

ENV SERVER_PORT=8080
EXPOSE ${SERVER_PORT}

HEALTHCHECK --start-period=1m --interval=2m --timeout=3s \
    CMD curl --user-agent Docker-HealthChecker -f http://localhost:${SERVER_PORT} || exit 1

CMD ["/opt/app/spring.sh"]
