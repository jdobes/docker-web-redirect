FROM nginx:alpine

RUN mkdir -p /var/run/nginx /var/log/nginx /var/cache/nginx && \
	chown -R nginx:0 /var/run/nginx /var/log/nginx /var/cache/nginx /etc/nginx/conf.d && \
	chmod -R g=u /var/run/nginx /var/log/nginx /var/cache/nginx /etc/nginx/conf.d

COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /usr/local/bin/

RUN apk add --update bash \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /usr/local/bin/start.sh

USER nginx:nginx
EXPOSE 8000

CMD ["start.sh"]
