#!/bin/bash

sudo /Users/xuefeihu/software/openresty/nginx/sbin/nginx -t -q -c /Users/xuefeihu/hugege/code-sublime/moguhu/config/nginx.conf
sudo /Users/xuefeihu/software/openresty/nginx/sbin/nginx -c /Users/xuefeihu/hugege/code-sublime/moguhu/config/nginx.conf -p /Users/xuefeihu/hugege/code-sublime/moguhu/ -s stop

echo "openresty stop"
echo -e "#####################################################\n\n"
tail -f /Users/xuefeihu/hugege/code-sublime/moguhu/logs/error.log
