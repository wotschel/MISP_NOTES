#!/bin/bash

err=0
correct=10
cnt=$(ps -ef |grep php |grep -v grep |wc -l)

if [ $correct -eq $cnt ];
then
        logger MISP Workers $cnt/$correct OK
        exit $err
else
        err=1
fi

msg="MISP Workers $cnt/$correct found. Restarting MISP Worker processes."
echo $msg
logger $msg
sudo -u www-data /var/www/MISP/app/Console/worker/start.sh
exit $err
