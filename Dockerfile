FROM heroku/cedar

RUN cd /tmp && git clone https://github.com/heroku/heroku-buildpack-ruby

ENV CURL_CONNECT_TIMEOUT=0 CURL_TIMEOUT=0 STACK=cedar-14 

ENV HOME=/app
WORKDIR /app

COPY . /app
RUN chmod +x /app/entrypoint.sh

RUN /tmp/heroku-buildpack-ruby/bin/compile /app /tmp/cache

ENTRYPOINT ["/app/entrypoint.sh"]
