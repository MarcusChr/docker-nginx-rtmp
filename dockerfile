#Source: https://www.nginx.com/blog/video-streaming-for-remote-learning-with-nginx/
FROM ubuntu:latest
LABEL version="0.0.1"
LABEL maintainer="Marcus Christensen"
EXPOSE 80
EXPOSE 1935

RUN ["apt", "update"]
RUN ["apt", "upgrade", "-y"]

RUN ["apt", "install", "-y", "build-essential", "git"]

RUN ["apt", "install", "-y", "libpcre3-dev", "libssl-dev", "zlib1g-dev"]

WORKDIR /build
RUN ["git", "clone", "https://github.com/arut/nginx-rtmp-module.git"]
RUN ["git", "clone", "https://github.com/nginx/nginx.git"]
WORKDIR /build/nginx
COPY "nginx.conf" "conf/nginx.conf"

RUN ["./auto/configure", "--add-module=../nginx-rtmp-module"]
RUN ["make"]
RUN ["make", "install"]

RUN ["/usr/local/nginx/sbin/nginx", "-t"]
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]