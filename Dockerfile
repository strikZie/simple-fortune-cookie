FROM golang:1.22 AS builder
WORKDIR /app
RUN apt-get update
COPY . .
RUN cd backend && go build -o .
RUN cd frontend && go build -o .

FROM debian:bookworm-slim

WORKDIR /app
COPY --from=builder . .

EXPOSE 8080

CMD ["./frontend.exe"]