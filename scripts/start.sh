#!/bin/bash
pa="/home/work/open-falcon/"
source /home/work/open-falcon/portal/env/bin/activate
sh /home/work/scripts/init.sh
svcs=("redis" "alarm" "dashboard" "fe" "gateway" "graph" "hbs" "judge" "nodata" "portal" "query" "sender" "task" "transfer" "mailsender")

for i in ${svcs[*]}
do
    supervisorctl start ${i}
    sleep 1
done

