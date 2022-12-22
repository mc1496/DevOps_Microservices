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


