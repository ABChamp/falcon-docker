FROM phusion/baseimage

RUN apt-get -y update
RUN apt-get -y install software-properties-common build-essential curl cmake make unzip yasm git vim
RUN apt-get -y install python3-dev python-pip 
RUN pip install --upgrade pip
RUN pip install cython
RUN pip install --no-binary :all: falcon

RUN rm -rf /var/lib/apt/lists/*

RUN pip install gunicorn

USER root
WORKDIR /root
ADD ./start.sh start.sh
RUN chmod +x start.sh
ADD ./main.py main.py

ENTRYPOINT ["/root/start.sh"]
# CMD ["/bin/bash"]




