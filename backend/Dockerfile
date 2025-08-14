FROM golang:1.22 AS builder
WORKDIR /app
RUN apt-get update
COPY . .
RUN go build -o .

FROM debian:bookworm-slim

COPY --from=builder . .

WORKDIR /app

EXPOSE 9000

CMD ["./backend"]
