# Dockerfile
ARG CADDY_VERSION=2.8.4
FROM caddy:${CADDY_VERSION}-builder AS builder

# 国内网络优化
ENV GOPROXY=https://goproxy.cn,direct
ENV GOSUMDB=off
ENV CGO_ENABLED=0

# 构建带 Aliyun DNS 插件的 Caddy
RUN xcaddy build \
    --with github.com/caddy-dns/aliyun \
    --verbose

# 最终镜像
FROM caddy:${CADDY_VERSION}
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
