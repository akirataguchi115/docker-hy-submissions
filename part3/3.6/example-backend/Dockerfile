FROM golang:alpine

WORKDIR /usr/src/app
COPY . .

RUN go build

EXPOSE 8080
ENV REQUEST_ORIGIN="http://localhost:5000"

RUN adduser -S appuser
USER appuser

CMD ["./server"]
