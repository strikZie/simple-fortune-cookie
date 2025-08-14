FROM goland:1.22 AS builder
WORKDIR /app
RUN apt-get update
COPY . .
RUN cd backend
RUN go build -o .
RUN cd ..
RUN cd frontend
RUN go build -o .

FROM debian:bookworm-slim

WORKDIR /app
COPY --from=builder /app/myapp .

EXPOSE 8080
