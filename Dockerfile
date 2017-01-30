FROM elasticsearch:2.4

MAINTAINER Guillaume Simonneau <simonneaug@gmail.com>
LABEL Description="elasticsearch searchguard search-guard"

# env
ENV CLUSTER_NAME="elasticsearch" \
    MINIMUM_MASTER_NODES=1 \
    ELASTIC_PWD="changeme" \
    KIBANA_PWD="changeme" \
    LOGSTASH_PWD="changeme" \
    BEATS_PWD="changeme" \
    HEAP_SIZE="1g" \
    CA_PWD="changeme" \
    TS_PWD="changeme" \
    KS_PWD="changeme"

## install modules
 RUN bin/plugin install -b com.floragunn/search-guard-ssl/2.4.4.19 \
 &&  bin/plugin install -b com.floragunn/search-guard-2/2.4.4.10

# retrieve conf
COPY config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY config/searchguard/ /usr/share/elasticsearch/config/searchguard/

# backup conf
RUN mkdir -p /.backup/elasticsearch/ \
&&  mv /usr/share/elasticsearch/config /.backup/elasticsearch/config

ADD ./src/ /run/
RUN chmod +x -R /run/

VOLUME /usr/hare/elasticsearch/config
VOLUME /usr/hare/elasticsearch/dara

ENTRYPOINT ["/run/entrypoint.sh"]
CMD ["elasticsearch"]
