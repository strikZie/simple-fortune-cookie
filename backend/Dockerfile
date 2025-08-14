FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN go build -o .

FROM debian:bookworm-slim
COPY --from=builder /app/backend .
WORKDIR /app
EXPOSE 9000
CMD ["./backend"]
