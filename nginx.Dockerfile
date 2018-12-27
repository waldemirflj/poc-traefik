FROM nginx:1.15.7

ENV geoCity=http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
ENV geoIP=http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz

RUN mkdir /etc/nginx/geoip/

RUN apt-get update \ 
    && apt-get install -y geoip-database wget

RUN wget ${geoCity} \
    && wget ${geoIP} \
    && gunzip GeoIP.dat.gz \
    && gunzip GeoLiteCity.dat.gz \
    && mv GeoIP.dat /etc/nginx/geoip/ \
    && mv GeoLiteCity.dat /etc/nginx/geoip/
