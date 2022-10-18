FROM  centos:latest
LABEL org.opencontainers.image.authors=" tchocothepierre@gmail.com"
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
   zip\
   unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page284/marker.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip marker.zip
RUN cp -rvf shine/* .
RUN rm -rf shine shine.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80  
