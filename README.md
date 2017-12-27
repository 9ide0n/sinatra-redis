
 docker build -t gide0n/sinatra:latest .

cd redis

docker build -t gide0n/redis:latest .



docker docker network create app

docker run -d  --net app --name redis gide0n/redis

docker run -d -p 4567 --net app --name webapp -v /datastore/docker/sinatra/webapp:/opt/webapp gide0n/sinatra


port=$(docker port webapp | awk -F":" '{print $2}')


sudo apt install redis-cli

redis-cli -h $(docker inspect -f '{{ .NetworkSettings.Networks.app.IPAddress }}' redis)

curl -i -H 'Accept: application/json' -d 'name=Foo&status=Bar' http://localhost:$port/json

curl -i -H 'Accept: application/json' http://localhost:$port/json
