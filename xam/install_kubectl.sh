#!/usr/bin/bash
URL="https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

rm -rf /tmp/kubectl_
mkdir -p /tmp/kubectl_
cd /tmp/kubectl_
curl -LO "${URL}"
curl -LO "${URL}.sha256"
CT="kubectl"
#sha256sum --check --status --ignore-missing "$HL.sha256"
#sha256sum --check --ignore-missing "$HL.sha256"
#RSP=$(sha256sum --check "$CT.sha256")
RSP=$(echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check)
echo "$RSP"

#if [[ "$STR" =~ .*"OK".* ]]; then
if [[ "$RSP" == "kubectl: OK" ]]; then
    echo "OK"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    kubectl version --client --output=yaml
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
else
    echo "Sha256 (File Integrity) is Failed"
    exit 1
fi


