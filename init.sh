#!/bin/sh

# 自动创建目录
mkdir -p /opt/mysql/data
mkdir -p /opt/mysql/conf
mkdir -p /opt/emqx/data
mkdir -p /opt/emqx/data/configs
mkdir -p /opt/emqx/log
mkdir -p /opt/nginx/html
mkdir -p /opt/nginx/log
mkdir -p /opt/nginx/conf.d

touch /opt/nginx/nginx.conf
touch /opt/nginx/conf.d/default.conf

# 自动写入 nginx.conf
cat > /opt/nginx/nginx.conf <<EOF
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    keepalive_timeout  65;

    include /etc/nginx/conf.d/*.conf;
}
EOF

chmod -R 777 /opt/emqx/

echo "初始化完成"