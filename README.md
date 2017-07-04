Dockerfile with nginx proxy to falcon API framework starter

- base on phusion/baseimage lasted (Ubuntu 16.04 LTS)
- python 2.7, gunicorn, falcon

Install 
1. Install docker on your computer.
2. clone the repo, build image by the following command:
<pre>
$ docker build -t imageNameAsYouWant . 
</pre>
3. run container
<pre>
$ docker run -d -it -p 8000:80 imageNameAsYouWant
</pre>
and it's ready to go.

start gunicorn on docker container example
<pre>
$ gunicorn -b localhost:8000 main:api --reload
</pre>
than try this localhost:8000/quote
