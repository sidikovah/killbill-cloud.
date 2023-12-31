#!/bin/bash

# Run both the main playbook and the one enabling structured logging
$KPM_INSTALL_CMD $KILLBILL_CLOUD_ANSIBLE_ROLES/killbill_json_logging.yml

originalfile=$KILLBILL_INSTALL_DIR/config/shiro.ini.template
cat $originalfile | envsubst '${KB_ADMIN_PASSWORD}' > $KILLBILL_INSTALL_DIR/config/shiro.ini

exec /usr/share/tomcat/bin/catalina.sh run
