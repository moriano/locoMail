# See https://confluence.viator.com/pages/viewpage.action?pageId=14169226
# Build as
# 	docker build -t viatorinc/locomail .
# Run as
#	docker run --rm --name loco-mail -it -p -p 15000:10000 -p 5000:5000 loco-mail
#
# Push as
#    docker push viatorinc/locomail


FROM alpine:3.8
RUN apk add --no-cache build-base python3 python3-dev

RUN pip3 install requests flask gevent
RUN rm -rf /root/.cache && rm -rf /var/cache
RUN mkdir -p /opt/locomail
COPY src/ /opt/locomail

#RUN apk del build-dependencies
EXPOSE 5000
EXPOSE 25

COPY externalFiles/entryPoint.sh /tmp
ENTRYPOINT "/tmp/entryPoint.sh"
