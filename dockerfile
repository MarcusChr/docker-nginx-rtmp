#Source: https://www.nginx.com/blog/video-streaming-for-remote-learning-with-nginx/

FROM ubuntu:latest
LABEL version="0.0.1"
LABEL maintainer="Marcus Christensen"

RUN ["apt", "update"]
RUN ["apt", "upgrade", "-y"]

RUN ["apt", "install", "-y", "build-essential", "git"]