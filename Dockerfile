FROM nginxdemos/hello
RUN apk --no-cache add curl
WORKDIR /
COPY pod-readiness.sh /
RUN chmod +x /pod-readiness.sh