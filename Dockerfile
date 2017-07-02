FROM phusion/baseimage
MAINTAINER ABChamp

USER root
WORKDIR /root

CMD ["/sbin/my_init"] 

RUN apt-get -y update
RUN apt-get -y install software-properties-common build-essential curl cmake make unzip yasm git vim
RUN apt-get -y install python3-dev python-pip 
RUN apt-get -y install nginx-full
RUN pip install --upgrade pip
RUN pip install cython
RUN pip install --no-binary :all: falcon

RUN rm -rf /var/lib/apt/lists/*

RUN pip install gunicorn

USER root
WORKDIR /root

# nginx 
ADD nginx/nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run
RUN update-rc.d -f nginx remove

ADD nginx/falcon.conf /etc/nginx/sites-available/falcon.conf
RUN ln -s /etc/nginx/sites-available/falcon.conf /etc/nginx/sites-enabled/falcon.conf
RUN rm /etc/nginx/sites-enabled/default

ADD ./main.py main.py

EXPOSE 80 8000

