#!/bin/bash

oldMoguhuPath="/Users/xuefeihu/hugege/code-sublime/01-moguhu"
newMoguhuPath="/Users/xuefeihu/hugege/code-sublime/01-moguhu-release"
openrestyPath="/Users/xuefeihu/software/openresty"
projectUrl="https://codeload.github.com/Fouy/moguhu-release/zip/master"

# stop server
sudo /Users/xuefeihu/software/openresty/nginx/sbin/nginx  -s stop -c /Users/xuefeihu/hugege/code-sublime/01-moguhu/config/nginx.conf -p /Users/xuefeihu/hugege/code-sublime/01-moguhu/
echo "OpenResty stop"
echo -e "#####################################################\n\n"

# get source code and publish
sudo wget ${projectUrl} -O ${newMoguhuPath}/moguhu-release-master.zip
sudo tar -zxvf ${newMoguhuPath}/moguhu-release-master.zip -C ${newMoguhuPath}
sudo mv ${newMoguhuPath}/moguhu-release-master ${newMoguhuPath}/moguhu
sudo rm -rf ${newMoguhuPath}/moguhu-release-master.zip

# replace /bin/* files
sudo sed -i -huge 's/\/Users\/xuefeihu\/hugege\/code-sublime\/01-moguhu/\/Users\/xuefeihu\/hugege\/code-sublime\/01-moguhu-release\/moguhu/g' ${newMoguhuPath}/moguhu/bin/*
rm -rf ${newMoguhuPath}/moguhu/bin/*-huge
# replace config/* files
sudo sed -i -huge 's/\/Users\/xuefeihu\/hugege\/code-sublime\/01-moguhu/\/Users\/xuefeihu\/hugege\/code-sublime\/01-moguhu-release\/moguhu/g' ${newMoguhuPath}/moguhu/config/*
rm -rf ${newMoguhuPath}/moguhu/config/*-huge

# start server




