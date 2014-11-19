FROM phusion/passenger-ruby21

MAINTAINER Robert Vidar Bjarnason <robert@citizens.is>

RUN echo 'version 0.4'

ENV HOME /root
ENV MC_1 127.0.0.1
ENV MC_2 127.0.0.1

CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install libyaml-dev

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/nginx/sites-enabled/oav_website.conf
# Add the rails-env configuration file
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

RUN mkdir -p /etc/my_init.d
ADD setup_app.sh /etc/my_init.d/setup_app.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
