FROM quay.io/keycloak/keycloak-x as builder

EXPOSE 80
EXPOSE 443

FROM alpine:3.17.2

WORKDIR /app

RUN \
	apk --no-cache add ca-certificates su-exec tzdata

COPY authelia-linux-amd64-musl ./authelia

EXPOSE 9091

VOLUME /config

ENTRYPOINT ["/app/entrypoint.sh"] 
