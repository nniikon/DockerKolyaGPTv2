FROM ubuntu:24.04

ARG GTEST_SHA=03597a01ee50ed33e9dfd640b249b4be3799d395

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
