FROM golang:1.16-alpine

WORKDIR /usr/src/app

ENV REQUEST_ORIGIN="http://localhost:5000"

EXPOSE 8080

COPY . .

RUN go build

RUN adduser -S appuser
USER appuser

CMD ["./server"]
