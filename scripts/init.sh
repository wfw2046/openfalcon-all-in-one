#!/bin/bash
pa="/home/work/open-falcon/"
svcs=("alarm" "dashboard" "fe" "graph" "hbs" "judge" "nodata" "portal" "query" "sender" "task" "transfer" "mailsender")
ports=("9912" "8081" "1234" "6070" "6030" "6080" "6090" "5050" "9966" "6066" "8002" "8433" "1986")
conf="dashboard/rrd/config.py"
sed -i "s/DASHBOARD_DB_HOST =.*/DASHBOARD_DB_HOST = \"$MYSQL_DB_HOST\"/g"  $pa$conf
sed -i "s/DASHBOARD_DB_PORT =.*/DASHBOARD_DB_PORT = $MYSQL_DB_PORT/g"  $pa$conf
sed -i "s/DASHBOARD_DB_USER =.*/DASHBOARD_DB_USER = \"$MYSQL_DB_USER\"/g"  $pa$conf
sed -i "s/DASHBOARD_DB_PASSWD =.*/DASHBOARD_DB_PASSWD = \"$MYSQL_DB_PASSWD\"/g"  $pa$conf
sed -i "s/GRAPH_DB_HOST =.*/GRAPH_DB_HOST = \"$MYSQL_DB_HOST\"/g"  $pa$conf
sed -i "s/GRAPH_DB_PORT =.*/GRAPH_DB_PORT = $MYSQL_DB_PORT/g"  $pa$conf
sed -i "s/GRAPH_DB_USER =.*/GRAPH_DB_USER = \"$MYSQL_DB_USER\"/g"  $pa$conf
sed -i "s/GRAPH_DB_PASSWD =.*/GRAPH_DB_PASSWD = \"$MYSQL_DB_PASSWD\"/g"  $pa$conf

conf="fe/cfg.json"
sed -i "31s/\"addr.*/\"addr\": \"$MYSQL_DB_USER:$MYSQL_DB_PASSWD@tcp($MYSQL_DB_HOST:$MYSQL_DB_PORT)\/uic\?charset=utf8\&loc=Asia%2FChongqing\",/g" $pa$conf
sed -i "s/\"bindPasswd\":.*/\"bindPasswd\": \"$LDAP_PASSWD\",/g"  $pa$conf
sed -i "s/\"falconPortal.*/\"falconPortal\": \"http:\/\/${ROUTER_PORTAL}:5050\/\",/g"  $pa$conf
sed -i "s/\"falconDashboard.*/\"falconDashboard\": \"http:\/\/${ROUTER_DASH}:8081\/\",/g"  $pa$conf
sed -i "s/\"falconAlarm.*/\"falconAlarm\": \"http:\/\/${ROUTER_ALARM}:9912\/\"/g"  $pa$conf

conf="graph/cfg.json"
sed -i "s/\"dsn.*/\"dsn\": \"$MYSQL_DB_USER:$MYSQL_DB_PASSWD@tcp($MYSQL_DB_HOST:$MYSQL_DB_PORT)\/graph\?loc=Local\&parseTime=true\",/g" $pa$conf

conf="hbs/cfg.json"
sed -i "s/\"database.*/\"database\": \"$MYSQL_DB_USER:$MYSQL_DB_PASSWD@tcp($MYSQL_DB_HOST:$MYSQL_DB_PORT)\/falcon_portal\?loc=Local\&parseTime=true\",/g" $pa$conf

conf="nodata/cfg.json"
sed -i "s/\"dsn.*/\"dsn\": \"$MYSQL_DB_USER:$MYSQL_DB_PASSWD@tcp($MYSQL_DB_HOST:$MYSQL_DB_PORT)\/falcon_portal\?loc=Local\&parseTime=true\&wait_timeout=604800\",/g" $pa$conf

conf="links/frame/config.py"
sed -i "s/DB_HOST =.*/DB_HOST = \"$MYSQL_DB_HOST\"/g"  $pa$conf
sed -i "s/DB_PORT =.*/DB_PORT = $MYSQL_DB_PORT/g"  $pa$conf
sed -i "s/DB_USER =.*/DB_USER = \"$MYSQL_DB_USER\"/g"  $pa$conf
sed -i "s/DB_PASS =.*/DB_PASS = \"$MYSQL_DB_PASSWD\"/g"  $pa$conf

conf="portal/frame/config.py"
sed -i "s/DB_HOST =.*/DB_HOST = \"$MYSQL_DB_HOST\"/g"  $pa$conf
sed -i "s/DB_PORT =.*/DB_PORT = $MYSQL_DB_PORT/g"  $pa$conf
sed -i "s/DB_USER =.*/DB_USER = \"$MYSQL_DB_USER\"/g"  $pa$conf
sed -i "s/DB_PASS =.*/DB_PASS = \"$MYSQL_DB_PASSWD\"/g"  $pa$conf
sed -i "s/'internal.*/'internal': 'http:\/\/${ROUTER_LOGIN}:1234',/g" $pa$conf
sed -i "s/'external.*/'external': 'http:\/\/${ROUTER_LOGIN}:1234',/g" $pa$conf

conf="task/cfg.json"
sed -i "s/\"dsn.*/\"dsn\": \"$MYSQL_DB_USER:$MYSQL_DB_PASSWD@tcp($MYSQL_DB_HOST:$MYSQL_DB_PORT)\/graph\?loc=Local\&parseTime=true\",/g" $pa$conf


conf="mailsender/cfg.json"
sed -i "s/\"fromUser.*/\"fromUser\" : \"$FROM_USER\",/g" $pa$conf
sed -i "s/\"mailServerHost.*/\"mailServerHost\" : \"$MAIL_SERVER_HOST\",/g" $pa$conf
sed -i "s/\"mailServerAccount.*/\"mailServerAccount\" : \"$MAIL_SERVER_ACCOUNT\",/g" $pa$conf
sed -i "s/\"mailServerPasswd.*/\"mailServerPasswd\" : \"$MAIL_SERVER_PASSWD\"/g" $pa$conf

