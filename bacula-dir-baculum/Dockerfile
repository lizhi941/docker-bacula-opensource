FROM php:7.2-apache   

ENV scripts=/scripts

#add some sourcecode 

ADD $scripts   $scripts

#ADD bacula-gui-9.2.1.tar.gz /var/

ADD $scripts/sources.list /etc/apt/ 

RUN chmod -R +x $scripts \
    && apt-get update \
    && $scripts/./install_dependency_for_bacula-dir.sh \
    && wget -O /tmp/RPM-GPG-KEY-mysql https://repo.mysql.com/RPM-GPG-KEY-mysql --no-check-certificate \
    && apt-key add /tmp/RPM-GPG-KEY-mysql \
    && echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-apt-config \
    && deb http://repo.mysql.com/apt/debian/ stretch mysql-5.7 \
    && deb http://repo.mysql.com/apt/debian/ stretch mysql-tools \
    && deb http://repo.mysql.com/apt/debian/ stretch mysql-tools-preview \
    && deb-src http://repo.mysql.com/apt/debian/ stretch mysql-5.7" > /etc/apt/sources.list.d/mysql.list \
    && apt-get install mysql-community-server libmysqlclient-dev   
#RUN requirements="libfreetype6-dev libjpeg62-turbo-dev libpng-dev postgresql-server-dev-all apt-utils" \
#    && apt-get update  \
#    && apt-get install -y $requirements \
#    && docker-php-ext-install bcmath \
#    && docker-php-ext-install pdo_mysql \
#    && docker-php-ext-install pgsql \
#    && docker-php-ext-install pdo_pgsql \
#    && docker-php-ext-install gettext  \
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install gd \
#    && cp -r  /var/bacula-gui-9.2.1/*  /var/www/html \
#    && apt-get install -y  apache2-utils --allow-unauthenticated \
#    && apt-get install -y sudo --allow-unauthenticated \ 
#    && rm -rf /var/lib/apt/lists/* \
#    && echo ">>> Create Baculum users (default user: admin | default password: admin ..." \
#    && sudo  htpasswd -cb /var/www/html/baculum/protected/Web/baculum.users admin admin \
#    && \cp -f /var/www/html/baculum/protected/Web/baculum.users /var/www/html/baculum/protected/Web/Config \
#    && \cp -f /var/www/html/baculum/protected/Web/baculum.users /var/www/html/baculum/protected/API/Config \
#    && echo ">>> Grant permission to folder /var/www/baculum ..." \
#    && chown -R www-data /var/www/html/baculum \
#    && echo ">>> Enabling site in apache ..." \
#    && \cp -f /var/www/html/baculum/examples/deb/baculum-web-apache.conf /etc/apache2/sites-available/baculum-web.conf \
#    && sed -i 's/\/usr\/share\/baculum\/htdocs/\/var\/www\/html\/baculum/g' /etc/apache2/sites-available/baculum-web.conf \ 
#    && \cp -f /var/www/html/baculum/examples/deb/baculum-api-apache.conf /etc/apache2/sites-available/baculum-api.conf \
#    && sed -i 's/\/usr\/share\/baculum\/htdocs/\/var\/www\/html\/baculum/g' /etc/apache2/sites-available/baculum-api.conf \ 
#    && a2ensite baculum-web.conf \
#    && a2ensite baculum-api.conf  \
#    && echo ">>> Grant permissions in sudoers ..." \
#    && echo -e "www-data ALL=NOPASSWD: /usr/sbin/bconsole\n \ 
#       www-data ALL=NOPASSWD: /etc/bacula/confapi\n    \
#       www-data ALL=NOPASSWD: /usr/sbin/bdirjson\n  \ 
#       www-data ALL=NOPASSWD: /usr/sbin/bbconsjson\n \ 
#       www-data ALL=NOPASSWD: /usr/sbin/bfdjson\n   \
#       www-data ALL=NOPASSWD: /usr/sbin/bsdjson" > /etc/sudoers.d/baculum  \
#    && echo ">>> Enable apache rewrite mode ..." \
#    && a2enmod rewrite    \
#    && echo ">>> Restarting apache ..." 
#CMD apache2-foreground
