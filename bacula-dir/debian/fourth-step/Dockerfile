FROM lizhi/debian-bacula-dir-third:1

ENV bacula_gui_version=9.2.2  

ENV scripts=/scripts

# Because the slowly download speed,I use the sourcecode package that have download.
ADD  ./scripts/bacula-gui-9.2.2.tar.gz  $scripts"/" 

RUN apt-get -y install  libfreetype6-dev libjpeg62-turbo-dev libpng-dev postgresql-server-dev-all \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pgsql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install gettext  \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    #&& wget --no-check-certificate "https://excellmedia.dl.sourceforge.net/project/bacula/bacula/"$bacula_gui_version"/bacula-gui-"$bacula_gui_version".tar.gz" \
    #another download link
    #&& wget   --no-check-certificate  http://blog.bacula.org/download/5673/ -O /usr/src/bacula-gui-"$bacula_gui_version".tar.gz  \
    && cp -r  /scripts/bacula-gui-9.2.2/*  /var/www/html \
    && apt-get install -y  apache2-utils --allow-unauthenticated \
    && apt-get install -y sudo --allow-unauthenticated \ 
    && rm -rf /var/lib/apt/lists/* \
    && echo ">>> Create Baculum users (default user: admin | default password: admin ..." \
    && sudo  htpasswd -cb /var/www/html/baculum/protected/Web/baculum.users admin admin \
    && \cp -f /var/www/html/baculum/protected/Web/baculum.users /var/www/html/baculum/protected/Web/Config \
    && \cp -f /var/www/html/baculum/protected/Web/baculum.users /var/www/html/baculum/protected/API/Config \
    && echo ">>> Grant permission to folder /var/www/baculum ..." \
    && chown -R www-data /var/www/html/baculum \
    && echo ">>> Enabling site in apache ..." \
    && \cp -f /var/www/html/baculum/examples/deb/baculum-web-apache.conf /etc/apache2/sites-available/baculum-web.conf \
    && sed -i 's/\/usr\/share\/baculum\/htdocs/\/var\/www\/html\/baculum/g' /etc/apache2/sites-available/baculum-web.conf \ 
    && \cp -f /var/www/html/baculum/examples/deb/baculum-api-apache.conf /etc/apache2/sites-available/baculum-api.conf \
    && sed -i 's/\/usr\/share\/baculum\/htdocs/\/var\/www\/html\/baculum/g' /etc/apache2/sites-available/baculum-api.conf \ 
    && a2ensite baculum-web.conf \
    && a2ensite baculum-api.conf  \
    && echo ">>> Grant permissions in sudoers ..." \
    && echo -e "apache2 ALL=NOPASSWD: /usr/sbin/bconsole \ 
    && www-data ALL=NOPASSWD: /etc/bacula/    \
    && www-data ALL=NOPASSWD: /usr/sbin/bdirjson \ 
    && www-data ALL=NOPASSWD: /usr/sbin/bbconsjson \ 
    && www-data ALL=NOPASSWD: /usr/sbin/bfdjson   \
    && www-data ALL=NOPASSWD: /usr/sbin/bsdjson" > /etc/sudoers.d/baculum  \
    && echo ">>> Enable apache rewrite mode ..." \
    && a2enmod rewrite    \
    && echo ">>> Restarting apache ..." 
CMD apache2-foreground
