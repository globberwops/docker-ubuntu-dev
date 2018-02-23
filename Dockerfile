FROM ubuntu:xenial

RUN apt-get update && apt-get install -qq \
    build-essential \
    clang-5.0 \
    clang-format-5.0 \
    clang-tidy-5.0 \
    cmake \
    cmake-curses-gui \
    curl \
    gcovr \
    google-mock \
    lcov \
    ninja-build \
    pkg-config \
 && rm -rf /var/lib/apt/lists/*

RUN set -ex \
 && update-alternatives --install \
    /usr/bin/clang clang /usr/bin/clang-5.0 500 \
 && update-alternatives --install \
    /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 500 \
 && update-alternatives --install \
    /usr/bin/clang-format clang-format /usr/bin/clang-format-5.0 500 \
 && update-alternatives --install \
    /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-5.0 500 \
 && mkdir -p /tmp/gtest-build \
 && cd /tmp/gtest-build \
 && cmake -GNinja -DBUILD_SHARED_LIBS:BOOL=ON /usr/src/gtest \
 && ninja \
 && cp libgtest.so libgtest_main.so /usr/lib \
 && rm -rf /tmp/gtest-build
