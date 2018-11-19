FROM lizhi/debian-bacula-dir-first:1

# if not set ENV.it will be show error "unable to initialize frontend: Dialog"
ENV DEBIAN_FRONTEND noninteractive

RUN wget -O /tmp/RPM-GPG-KEY-mysql https://repo.mysql.com/RPM-GPG-KEY-mysql --no-check-certificate \
    && apt-key add /tmp/RPM-GPG-KEY-mysql \
    && echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-apt-config \
    && deb http://repo.mysql.com/apt/debian/ stretch mysql-5.7  \
    && deb http://repo.mysql.com/apt/debian/ stretch mysql-tools \
    && deb http://repo.mysql.com/apt/debian/ stretch mysql-tools-preview \
    && deb-src http://repo.mysql.com/apt/debian/ stretch mysql-5.7" > /etc/apt/sources.list.d/mysql.list \
    && apt-get update \  
    && apt-get install -y debconf-utils mysql-community-server libmysqlclient-dev \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld 

CMD ["bash"]
