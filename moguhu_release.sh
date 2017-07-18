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

sudo sed -i huge 's/'${convertGitProjectPath}'/'${convertProjectPath}'/g' ${projectPath}/bin/*
sudo rm -rf ${projectPath}/bin/*huge

# replace config/* files
sudo sed -i huge 's/'${convertGitProjectPath}'/'${convertProjectPath}'/g' ${projectPath}/config/*
sudo rm -rf ${projectPath}/config/*huge

convertMoguhuPath=${moguhuPath//\//\\\/} #将${moguhuPath}变为转义串
convertGitMoguhuPath=${gitMoguhuPath//\//\\\/}

sudo sed -i huge 's/'${convertGitMoguhuPath}'/'${convertMoguhuPath}'/g' ${projectPath}/config/*
sudo rm -rf ${projectPath}/config/*huge

sudo chmod a+x ${projectPath}/*

# start server
sudo ${openrestyPath}/nginx/sbin/nginx -c ${projectPath}/config/nginx.conf -p ${projectPath}
echo "OpenResty start"
echo -e "########################################################################\n\n"
tail -f ${projectPath}/logs/error.log

