#!/bin/bash

sudo /Users/xuefeihu/software/openresty/nginx/sbin/nginx  -t -q -c /Users/xuefeihu/hugege/code-sublime/01-moguhu-release/moguhu/config/nginx.conf
sudo /Users/xuefeihu/software/openresty/nginx/sbin/nginx  -s stop -c /Users/xuefeihu/hugege/code-sublime/01-moguhu-release/moguhu/config/nginx.conf -p /Users/xuefeihu/hugege/code-sublime/01-moguhu-release/moguhu/

echo "nginx stop"
echo -e "#####################################################\n\n"
tail -f /Users/xuefeihu/software/openresty/nginx/logs/error.log
