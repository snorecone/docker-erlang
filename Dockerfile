FROM ubuntu:12.04
MAINTAINER Mark Martin <mark@uservoice.com>

RUN apt-get update
# Erlang HiPE build requires M4
RUN apt-get install -y git build-essential libncurses5-dev openssl libssl-dev curl m4

RUN mkdir -p /opt/erlang/ && \
    curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl && chmod a+x kerl && \
    mv kerl /opt/erlang/ && \
    ln -s /opt/erlang/kerl /usr/local/bin/kerl

RUN kerl update releases
RUN KERL_CONFIGURE_OPTIONS=--enable-hipe kerl build R15B03 r15b03 && kerl install r15b03 /opt/erlang/r15b03
