FROM gide0n/ruby:v2.4.1
MAINTAINER 9ide0n "denis.fomichev2017@yandex.ru"
ENV REFRESHED_AT 2015-12-27
RUN /bin/bash -l -c 'gem install --no-rdoc --no-ri sinatra json redis'
RUN mkdir -p /opt/webapp
EXPOSE 4567
CMD [ "/opt/webapp/bin/webapp.sh" ]
