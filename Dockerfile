FROM ubuntu:kinetic
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install nginx -y
RUN echo "Hello Sysadmins" > /var/www/html/index.nginx-debian.html
CMD /etc/init.d/nginx start && tail -f /var/log/nginx/access.log

