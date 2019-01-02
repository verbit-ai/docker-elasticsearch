#!/bin/bash

chmod +x /elasticsearch/plugins/search-guard-6/tools/sgadmin.sh
chmod +x /elasticsearch/plugins/search-guard-6/tools/hash.sh
/elasticsearch/plugins/search-guard-6/tools/sgadmin.sh \
-cd /elasticsearch/config/ \
-ks /elasticsearch/config/ssl/elastic-keystore.jks \
-ts /elasticsearch/config/ssl/truststore.jks \
-cn $CLUSTER_NAME \
-kspass $KS_PWD \
-tspass $TS_PWD \
-h $HOSTNAME \
-nhnv
