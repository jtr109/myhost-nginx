docker run \
  --name myhost-nginx \
  -v nginx.conf:/etc/nginx/nginx.conf:ro \
  -d nginx
