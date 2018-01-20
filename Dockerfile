FROM yandex/clickhouse-server

USER root

RUN   apt-get update && \
      apt-get install -y unixodbc odbcinst odbc-postgresql && \
      rm -rf /var/lib/apt/lists/* /var/cache/debconf && \
      apt-get clean

COPY  odbc.ini /etc/odbc.ini

USER clickhouse
