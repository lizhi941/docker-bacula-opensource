FROM lizhi/debian-bacula-dir-second:1

ENV bacula_version=9.2.2

#install bacula


RUN cd /usr/src \
    && wget --no-check-certificate "https://sourceforge.net/projects/bacula/files/bacula/"$bacula_version"/bacula-"$bacula_version".tar.gz" \
    && tar xvzf "bacula-"$bacula_version".tar.gz" -C /usr/local/ \
    && cd "/usr/local/bacula-"$bacula_version \
    && ./configure \
         --enable-smartalloc \
         --with-mysql \
         --with-db-user=bacula \
         --with-db-password=bacula \
         --with-db-port=3306 \
         --without-openssl \
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
         --with-dump-email=lizhi941@sohu.com \
         --with-job-email=lizhi941@sohu.com  \
    && make -j 8 \
    && make install 

CMD ["bash"]
