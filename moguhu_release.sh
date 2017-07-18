#!/bin/bash

oldMoguhuPath="/Users/xuefeihu/hugege/code-sublime/01-moguhu"
newMoguhuPath="/Users/xuefeihu/hugege/code-sublime/01-moguhu-release"
openrestyPath="/Users/xuefeihu/software/openresty"
projectUrl="https://codeload.github.com/Fouy/openresty-blog/zip/master"

sudo ${oldMoguhuPath}/bin/stop.sh

sudo wget ${projectUrl} -O ${newMoguhuPath}/openresty-blog-master.zip
sudo tar -zxvf ${newMoguhuPath}/openresty-blog-master.zip -C ${newMoguhuPath}
sudo mv ${newMoguhuPath}/openresty-blog-master ${newMoguhuPath}/moguhu
sudo rm -rf ${newMoguhuPath}/openresty-blog-master.zip

sudo sed -in-place -e 's///Users//xuefeihu//hugege//code-sublime//01-moguhu'/'${oldMoguhuPath}'/g' ${newMoguhuPath}/bin/*

