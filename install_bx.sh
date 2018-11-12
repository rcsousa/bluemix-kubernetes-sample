#!/bin/bash

echo "Download Bluemix CLI"
#wget --quiet --output-document=/tmp/Bluemix_CLI_amd64.tar.gz  http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/latest/Bluemix_CLI_amd64.tar.gz
wget --quiet --output-document=/tmp/idt-installer  https://raw.githubusercontent.com/IBM-Bluemix/developer-tools-installer/master/linux-installer/idt-installer
#tar -xf /tmp/Bluemix_CLI_amd64.tar.gz --directory=/tmp

# Create bx alias
#echo "#!/bin/sh" >/tmp/Bluemix_CLI/bin/bx
#echo "/tmp/Bluemix_CLI/bin/bluemix \"\$@\" " >>/tmp/Bluemix_CLI/bin/bx
#chmod +x /tmp/Bluemix_CLI/bin/*
chmod +x /tmp/idt-installer

export PATH="/tmp/:$PATH"

# Install Armada CS plugin
#echo "Install the Bluemix container-service plugin"
#bx plugin install container-service -r Bluemix

#echo "Install kubectl"
#wget --quiet --output-document=/tmp/Bluemix_CLI/bin/kubectl  https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
#chmod +x /tmp/Bluemix_CLI/bin/kubectl

/bin/bash /tmp/idt-installer

if [ -n "$DEBUG" ]; then
  bx --version
  bx plugin list
fi
