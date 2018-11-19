FROM php:7.2-apache

#add aliyun debian sources for fast

ENV  scripts=/scripts

ADD  ./scripts   /scripts

RUN mv $scripts/sources.list /etc/apt   \
    && apt-get update \
    && apt-get install -y  vim make gcc build-essential perl unp mc mtx libreadline7 \
       libreadline7-dbg libreadline-gplv2-dev zlib1g-dev lzop liblzo2-dev python-lzo sudo \
       gawk gdb libacl1 libacl1-dev libssl-dev lsscsi apt-transport-https wget \
    && apt-get install -y qt4-dev-tools qt4-qtconfig  libqt4-dev libqwt5-qt4 \
       libqwt5-qt4-dev pkg-config gnupg

CMD ["bash"]
