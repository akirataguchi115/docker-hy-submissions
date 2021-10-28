FROM golang:alpine as build-stage
WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 go build && \
    adduser -S appuser

FROM scratch
WORKDIR /usr/src/app
COPY --from=build-stage /usr/src/app/server /usr/src/app/server
COPY --from=build-stage /etc/passwd /etc/passwd
USER appuser
EXPOSE 8080
ENV REQUEST_ORIGIN="http://localhost:5000"
CMD ["/usr/src/app/server"]
