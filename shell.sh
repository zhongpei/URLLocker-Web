#!/bin/bash
docker run --rm -it  \
    -v $PWD:/go/src/github.com/urlooker/web \
    -e GOPROXY=https://goproxy.cn \
    -w  /go/src/github.com/urlooker/web \
    golang:1.12 \
    bash
