currentDir=$(
  cd $(dirname "$0")
  pwd
)

docker stop myhost-nginx;
docker rm myhost-nginx;

docker run \
  --name myhost-nginx \
  -v $currentDir/nginx.conf:/etc/nginx/nginx.conf:ro \
  -d nginx
