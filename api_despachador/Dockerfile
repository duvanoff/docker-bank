FROM ubuntu:16.04
MAINTAINER omadaco@gmail.com
RUN apt-get update -y
RUN apt-get install git -y
RUN git config --global user.name "Omar Cotes"
RUN git config --global user.email omadaco@gmail.com
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-get install apache2 -y
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update -y
RUN apt-cache pkgnames | grep php7.1
RUN apt install -y php7.1 php7.1-cli php7.1-common php7.1-mbstring php7.1-intl php7.1-xml php7.1-mysql php7.1-mcrypt
RUN apt-get install curl -y &&  apt-get install nano -y
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN git clone https://github.com/duvanoff/docker-bank.git
RUN mv api_despachador /var/www/html
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf
RUN echo 'Alias /api_despachador  /var/www/html/api_despachador' >> /etc/apache2/apache2.conf
RUN a2enmod rewrite
RUN /usr/sbin/a2ensite default-ssl
RUN /usr/sbin/a2enmod ssl
RUN service apache2 restart
EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
