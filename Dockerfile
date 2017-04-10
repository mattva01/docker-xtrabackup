FROM debian:jessie

RUN apt-get update \
    && apt-get install -y ca-certificates wget lsb-release --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb \
    && dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb \
    && apt-get purge -y --auto-remove lsb-release wget \
    && apt-get update && apt-get install -y percona-xtrabackup-24 \
    && apt-get purge -y --auto-remove ca-certificates \
    && rm -rf /var/lib/apt/lists/*
