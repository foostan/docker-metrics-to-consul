FROM ubuntu:trusty

MAINTAINER foostan ks@fstn.jp

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install curl

RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh
RUN td-agent-gem install fluent-plugin-docker-metrics -v 0.0.2
RUN td-agent-gem install fluent-plugin-consul -v 0.0.2

ADD config.rb /config.rb

CMD td-agent -c config.rb
