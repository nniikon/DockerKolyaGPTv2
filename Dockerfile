FROM ubuntu:24.04

ARG GTEST_SHA=6910c9d9165801d8827d628cb72eb7ea9dd538c5

RUN apt update && \
    apt install -y \
        build-essential \
        unzip \
        wget \
        cmake && \
    rm -rf /var/lib/apt/lists/*

COPY ./ ./

RUN chmod +x *.sh

RUN ./build_googletest.sh "${GTEST_SHA}"

WORKDIR /apt
