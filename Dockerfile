FROM ubuntu:xenial

RUN apt-get update && apt-get install -qq \
    build-essential \
    cmake \
    curl \
    pkg-config \
 && rm -rf /var/lib/apt/lists/*
