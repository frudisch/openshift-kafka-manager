FROM solsson/kafka-manager

ENV KAFKA_MANAGER_DIR="/opt/kafka-manager"

COPY fix-permissions.sh ./

RUN chmod +x fix-permissions.sh

RUN ./fix-permissions.sh $KAFKA_MANAGER_DIR

EXPOSE 8080

RUN ls -la /opt/kafka-manager/bin/

WORKDIR $KAFKA_MANAGER_DIR

ENTRYPOINT [ "bin/kafka-manager", "-Dhttp.port=8080" ]
