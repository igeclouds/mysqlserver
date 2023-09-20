# Dockerfile for MS Sql Server 2019
# Prepared based on instructions https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup?view=sql-server-ver15
#
# Maintained by Antoine Besnier <nouanda@laposte.net>
# https://github.com/abesnier/docker-mssql
#
# Built on Debian Slim as to minimize image size
#
# 2022-01-13 : first issue

FROM debian:bullseye-slim

LABEL maintainer=Moses Fabiyi @igeclouds

ENV ACCEPT_EULA=Y

EXPOSE 1433

STOPSIGNAL SIGQUIT

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget gnupg2 ca-certificates --no-install-recommends

RUN wget -O microsoft.asc https://packages.microsoft.com/keys/microsoft.asc --no-check-certificate && apt-key add microsoft.asc

COPY ./mssql-server.list /etc/apt/sources.list.d/mssql-server.list

RUN apt-get update && apt-get install -y mssql-server mssql-tools18 unixodbc-dev --no-install-recommends

RUN apt-get purge -y wget ca-certificates && rm -rf /var/lib/apt/lists/*

ENV PATH="/opt/mssql-tools18/bin:${PATH}"

CMD ["/opt/mssql/bin/sqlservr"]
