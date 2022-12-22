#!/usr/bin/bash

URL="https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh"
#curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | sudo bash

#default destination is /usr/local/bin
curl -fLSs "$URL" | sudo bash

#curl -fLSs "$URL" | DESTDIR=/opt/bin bash

#For later update
# circleci update check
# circleci update

#we need API token and setup before using CLI
#circleci setup

#LOGS
# voclabs:~/environment/DevOps_Microservices/xam (master) $ ./install_local_circleci.sh 
# Starting installation.
# Installing CircleCI CLI v0.1.22875
# Installing to /usr/local/bin
# An error occured installing the tool.
# The contents of the directory /tmp/tmp.Vyn35w2MOK have been left in place to help to debug the issue.

# voclabs:~/environment/DevOps_Microservices/xam (master) $ sudo ls /tmp/tmp.Vyn35w2MOK/
# api  circleci  md_docs

# voclabs:~/environment $ sudo ls /tmp/tmp.Vyn35w2MOK/
# api  circleci  md_docs
# voclabs:~/environment $ sudo ls /tmp/tmp.Vyn35w2MOK/api
# graphql
# voclabs:~/environment $ sudo ls /tmp/tmp.Vyn35w2MOK/md_docs
# LICENSE
# voclabs:~/environment $ 


# voclabs:~/environment/DevOps_Microservices/xam (master) $ ls /usr/local/bin/c*                                                                   
# /usr/local/bin/circleci
# voclabs:~/environment/DevOps_Microservices/xam (master) $ circleci
# 2022/12/22 14:59:43 
# ...
