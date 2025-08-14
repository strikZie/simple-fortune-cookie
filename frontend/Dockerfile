FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN go build -o .

FROM debian:bookworm-slim

COPY --from=builder /app/frontend .

WORKDIR /app

EXPOSE 8080

CMD ["./frontend"]
