FROM ubuntu:22.04
RUN apt-get update
COPY backend /usr/src/app
COPY frontend /usr/src/app
