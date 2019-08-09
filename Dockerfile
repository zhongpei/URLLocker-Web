FROM golang:1.12-alpine AS go-build

WORKDIR /go/src/github.com/urlooker/web
COPY . .
RUN go build

FROM alpine:3.9 AS prod
WORKDIR /app
COPY --from=go-build  /go/src/github.com/urlooker/web/web  /app/web
COPY --from=go-build  /go/src/github.com/urlooker/web/cfg.example.json /app/cfg.json
COPY --from=go-build /go/src/github.com/urlooker/web/static /app/static
COPY --from=go-build /go/src/github.com/urlooker/web/views /app/views
RUN chmod +x /app/web
EXPOSE 1984/tcp
EXPOSE 1985/tcp
CMD ["/app/web"]
