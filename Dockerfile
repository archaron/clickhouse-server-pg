FROM yandex/clickhouse-server

USER root

RUN   apt-get update && \
      apt-get install -y unixodbc odbcinst odbc-postgresql && \
      rm -rf /var/lib/apt/lists/* /var/cache/debconf && \
      apt-get clean

COPY  odbc.ini /etc/odbc.ini

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER clickhouse

ENTRYPOINT exec TZ='$TZ' /usr/bin/clickhouse-server --config=${CLICKHOUSE_CONFIG}
