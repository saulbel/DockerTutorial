FROM nginx
RUN mkdir -p /scripts
COPY .custom/setup.sh /scripts
WORKDIR /scripts
RUN chmod +x setup.sh
RUN mkdir -p /nginx-config
COPY .custom/nginx.conf /nginx-config/ 
COPY .custom/index.html /nginx-config 
WORKDIR /nginx-config
RUN mv nginx.conf /etc/nginx/conf.d/
RUN mv index.html /usr/share/nginx/html/
WORKDIR /
RUN /bin/bash -c '/scripts/setup.sh'