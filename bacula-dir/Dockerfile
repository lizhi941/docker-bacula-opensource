FROM centos:7
ENV scripts=/scripts
ADD $scripts   $scripts 
RUN chmod -R +x $scripts \
    && rpm -iv $scripts/mysql-community-release-el7-5.noarch.rpm \
    && $scripts/./install_dependency_for_bacula-dir.sh \
    && cd $scripts \
    && tar -zxvf $scripts/bacula-9.2.1.tar.gz \
    && cd  $scripts/bacula-9.2.1 \
    && mkdir /usr/local/bacula-9.2.1 \
    && ./configure  --prefix="/usr/local/bacula-9.2.1" \
          --enable-smartalloc \
          --with-mysql \
          --with-db-user=bacula \
          --with-db-password=bacula \
          --with-db-port=3306 \
          --with-openssl \
          --with-readline=/usr/include/readline \
          --sysconfdir=/etc/bacula \
          --bindir=/usr/bin \
          --sbindir=/usr/sbin \
          --with-scriptdir=/etc/bacula/scripts \
          --with-plugindir=/etc/bacula/plugins \
          --with-pid-dir=/var/run \
          --with-subsys-dir=/etc/bacula/working \
          --with-working-dir=/etc/bacula/working \
          --with-bsrdir=/etc/bacula/bootstrap \
          --with-systemd \
          --disable-conio \
          --disable-nls \
          --with-logdir=/var/log/bacula \
          --with-dump-email=hello-168@163.com \
          --with-job-email=hello-168@163.com  \
    && make -j 8 \
    && make install \
    && mv $scripts/run.sh /run.sh \
    && chmod +x /run.sh
ENTRYPOINT ["/run.sh"]

EXPOSE 9101
