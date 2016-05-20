FROM node
MAINTAINER Kacey Cole <kcole@izeni.com>
RUN adduser --disabled-password --gecos "" sinopia
RUN mkdir -p /opt/sinopia/storage
WORKDIR /opt/sinopia
RUN npm install js-yaml git+https://github.com/izeni-team/sinopia
ADD /config.yaml /tmp/config.yaml
ADD /start.sh /opt/sinopia/start.sh
RUN chown -R sinopia:sinopia /opt/sinopia
#USER sinopis
CMD ["/opt/sinopia/start.sh"]
EXPOSE 4873
