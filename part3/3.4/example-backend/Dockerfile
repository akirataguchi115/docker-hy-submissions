FROM golang:alpine AS build

WORKDIR /usr/src/build

COPY . .

RUN go build

FROM alpine:latest

EXPOSE 8080
WORKDIR /usr/src/app
COPY --from=build /usr/src/build .
ENV REQUEST_ORIGIN="http://localhost:5000"

RUN adduser -S appuser
USER appuser

CMD ["./server"]
