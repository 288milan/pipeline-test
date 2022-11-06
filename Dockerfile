FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && apt-get upgrade -y

RUN apt-get install apache2 -y

RUN apt-get install git -y

RUN apt-get install mysql-server -y

RUN service mysql start

RUN apt-get install phpmyadmin -y

RUN  ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf

RUN  a2enconf phpmyadmin

RUN echo "Hi Welcome to k8s & TaTa ByE ByE" > /var/www/html/index.html

EXPOSE 8080

CMD /usr/sbin/apache2ctl -D FOREGROUND


