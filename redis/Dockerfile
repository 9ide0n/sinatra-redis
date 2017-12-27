FROM ubuntu:14.04
MAINTAINER James Turnbull "james@example.com"
ENV REFRESHED_AT 2017-12-26
RUN apt-get -yqq update && apt-get -yqq install redis-server redis-tools
EXPOSE 6379
ENTRYPOINT [ "/usr/bin/redis-server" ]
CMD []

#Test
#docker build -t gide0n/redis:latest .
#docker docker network create app
#docker run -d  --net app --name redis gide0n/redis
#проверяем на хосте
#sudo apt install redis-cli
#redis-cli -h `docker inspect -f '{{ .NetworkSettings.Networks.app.IPAddress }}' redis`
#docker run -d -p 4567 --net app --name webapp -v /datastore/docker/sinatra/webapp:/opt/webapp gide0n/sinatra
