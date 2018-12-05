currentDir=$(
  cd $(dirname "$0")
  pwd
)

docker stop myhost-nginx;
docker rm myhost-nginx;

docker run \
  --name myhost-nginx \
  -v $currentDir/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v $currentDir/log/crawler.access.log:logs/crawler.access.log
  -p 80:80 \
  nginx
