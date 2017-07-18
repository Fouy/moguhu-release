#!/bin/bash

ps -fe | grep nginx | grep -v grep
if [ $? -ne 0 ] 
then
  sudo /Users/xuefeihu/software/openresty/nginx/sbin/nginx -t -q -c /Users/xuefeihu/hugege/code-sublime/moguhu/config/nginx.conf 
  sudo /Users/xuefeihu/software/openresty/nginx/sbin/nginx -c /Users/xuefeihu/hugege/code-sublime/moguhu/config/nginx.conf -p /Users/xuefeihu/hugege/code-sublime/moguhu/
  echo "nginx start"
else
  sudo /Users/xuefeihu/software/openresty/nginx/sbin/nginx -t -q -c /Users/xuefeihu/hugege/code-sublime/moguhu/config/nginx.conf
  sudo /Users/xuefeihu/software/openresty/nginx/sbin/nginx -c /Users/xuefeihu/hugege/code-sublime/moguhu/config/nginx.conf -p /Users/xuefeihu/hugege/code-sublime/moguhu/ -s reload
  echo "nginx reload"
fi
echo -e "#####################################################\n\n"
tail -f /Users/xuefeihu/hugege/code-sublime/moguhu/logs/error.log
