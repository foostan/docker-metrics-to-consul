FROM ubuntu:trusty

MAINTAINER foostan ks@fstn.jp

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install curl

RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh
RUN td-agent-gem install fluent-plugin-docker-metrics -v 0.0.2
RUN td-agent-gem install fluent-plugin-consul -v 0.0.3

ADD td-agent.conf.rb /etc/td-agent/
ADD out_convert.rb /etc/td-agent/plugin/

CMD td-agent -c /etc/td-agent/td-agent.conf.rb
