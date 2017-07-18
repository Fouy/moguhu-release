#!/bin/bash
# author: xuefeihu

moguhuPath="/root/project"
projectPath=${moguhuPath}"/moguhu"
gitMoguhuPath="/Users/xuefeihu/hugege/code-sublime"
gitProjectPath=${gitMoguhuPath}"/moguhu"

openrestyPath="/root/software/openresty"
projectUrl="https://codeload.github.com/Fouy/moguhu-release/zip/master"

# stop server
sudo ${openrestyPath}/nginx/sbin/nginx -c ${projectPath}/config/nginx.conf -p ${projectPath} -s stop
echo "OpenResty stoped"
echo -e "########################################################################\n\n"

# remove old project path
if [ -d "$projectPath" ]; then
	sudo rm -rf ${projectPath}
fi

# get source code and publish
sudo wget ${projectUrl} -O ${moguhuPath}/moguhu-release-master.zip
sudo unzip ${moguhuPath}/moguhu-release-master.zip -d ${moguhuPath}
sudo mv ${moguhuPath}/moguhu-release-master ${projectPath}
sudo rm -rf ${moguhuPath}/moguhu-release-master.zip

# replace /bin/* files
convertProjectPath=${projectPath//\//\\\/} #将${projectPath}变为转义串
convertGitProjectPath=${gitProjectPath//\//\\\/}
sudo sed -i 's/'${convertGitProjectPath}'/'${convertProjectPath}'/g' ${projectPath}/bin/*

# replace config/* files
sudo sed -i 's/'${convertGitProjectPath}'/'${convertProjectPath}'/g' ${projectPath}/config/*
convertMoguhuPath=${moguhuPath//\//\\\/} #将${moguhuPath}变为转义串
convertGitMoguhuPath=${gitMoguhuPath//\//\\\/}
sudo sed -i 's/'${convertGitMoguhuPath}'/'${convertMoguhuPath}'/g' ${projectPath}/config/*

# replace lua/* files
sudo sed -i 's/'${convertGitProjectPath}'/'${convertProjectPath}'/g' ${projectPath}/lua/init.lua

sudo chmod a+x ${projectPath}/*

# start server
sudo ${openrestyPath}/nginx/sbin/nginx -c ${projectPath}/config/nginx.conf -p ${projectPath}
echo "OpenResty start"
echo -e "########################################################################\n\n"
tail -f ${projectPath}/logs/error.log

