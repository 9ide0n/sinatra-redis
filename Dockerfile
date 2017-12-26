FROM ubuntu:14.04
MAINTAINER James Turnbull "james@example.com"
ENV REFRESHED_AT 2015-12-26:3
RUN apt-get update -yqq \
  && apt-get install -y curl
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "/etc/profile.d/rvm.sh"
RUN /bin/bash -l -c "rvm install ruby --latest"
RUN /bin/bash -l -c "gem install --no-rdoc --no-ri sinatra json redis"
RUN apt-get purge -y --auto-remove curl patch gawk g++ gcc make libc6-dev patch zlib1g-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgmp-dev \
 libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev libgmp-dev libreadline6-dev libssl-dev \
 && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt/webapp
EXPOSE 4567
CMD [ "/opt/webapp/bin/webapp" ]
