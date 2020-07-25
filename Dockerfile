FROM alpine:3.12.0 as builder

RUN apk add --no-cache --virtual build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    git \
    build-base \
    cmake \
    curl-dev \
    cairo-dev \
    boost-dev \
    pango-dev \
    lua5.3-dev \
    lua5.3-libs \
    eigen-dev \
    gtest \
    qt5-qtbase-dev

RUN git clone --depth 1 https://github.com/LibreCAD/LibreCAD_3.git /librecad

RUN mkdir -p /librecad/build
WORKDIR /librecad/build

RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make
RUN make install

