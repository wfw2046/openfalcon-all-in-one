# openfalcon-all-in-one
openfalcon all-in-one on Docker , not contain mysql and agent
## build docker image
  cd openfalcon-all-in-one
  docker build --rm=true  -t openfalcon-docker .
## init your mysql server with openfalcon mysql script;
## start docker 
docker run -d --name of-docker  --env MYSQL_DB_HOST="192.168.244.100"  --env MYSQL_DB_PORT="3306"  --env MYSQL_DB_USER="root"  --env MYSQL_DB_PASSWD="test1213"  --env ROUTER_PORTAL="192.168.244.100"  --env ROUTER_DASH="192.168.244.100"  --env ROUTER_ALARM="192.168.244.100"  --env ROUTER_LOGIN="192.168.244.100"  --env LDAP_PASSWD="admin"  --env FROM_USER="adminuser"  --env MAIL_SERVER_HOST="163.com"  --env MAIL_SERVER_ACCOUNT="test123"  --env MAIL_SERVER_PASSWD="test123" -p 5050:5050 -p 6030:6030 -p 8433:8433 -p 1234:1234 -p 8081:8081 -p 9912:9912 of-docker
## attention：
  default config： user registry is closed，
  you can modify the config ：
### step 1：login to the process of-docker
  docker exec -ti of-docker bash
### step 2：modify fe config
  vi /home/work/open-falcon/fe/cfg.json
### step 3: restart fe service 
  supervisorctl restart fe
  


