# 第一步：使用官方 caddy builder 镜像构建带阿里云 DNS 插件的 caddy
FROM caddy:builder AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/aliyun

# 第二步：用官方 caddy 镜像作为最终镜像
FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
