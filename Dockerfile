FROM ubuntu:14.04
MAINTAINER 9ide0n "denis.fomichev2017@yandex.ru"
ENV REFRESHED_AT 2015-12-26:7
ENV RUBY_VERSION ruby-2.4.1
RUN apt-get update -yqq
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN  apt-get install -yqq curl \
 && /bin/bash -l -c 'curl -sSL https://get.rvm.io | bash -s stable \
 && source /etc/profile.d/rvm.sh \
 && echo "source /etc/profile.d/rvm.sh " >> ~/.bashrc \
 && rvm install $RUBY_VERSION && gem install --no-rdoc --no-ri sinatra json redis' \
 && apt-get purge -yqq --auto-remove curl patch gawk g++ gcc make libc6-dev patch zlib1g-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgmp-dev \
 libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev libgmp-dev libreadline6-dev libssl-dev \
 && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt/webapp
EXPOSE 4567
CMD [ "/opt/webapp/bin/webapp.sh" ]



# TEST
# docker build -t gide0n/sinatra:latest .
# docker run -d -p 4567 --name webapp -v /datastore/docker/sinatra/webapp:/opt/webapp gide0n/sinatra
# curl -i -H 'Accept: application/json' -d 'name=Foo&status=Bar' http://localhost:49160/json

# FROM vallard/nginx
# MAINTAINER Vallard Benincosa "vallard@benincosa.com"
# RUN apt-get update
# # install the prerequisite patches here so that rvm will install under non-root account.
# RUN apt-get install -y curl patch gawk g++ gcc make libc6-dev patch libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev
# RUN useradd -ms /bin/bash app
# USER app
# RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
# RUN /bin/bash -l -c "curl -L get.rvm.io | bash -s stable --rails"
# RUN /bin/bash -l -c "rvm install 2.1"
# RUN /bin/bash -l -c "echo 'gem: --no-ri --no-rdoc' > ~/.gemrc"
# RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
