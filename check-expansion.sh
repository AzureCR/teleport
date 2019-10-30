#!/bin/bash
#usage: check-expansion.sh repo tag
#usage: eg: check-expansion.sh hello-world 2.1
# Assumes ACR_USER and ACR_PWD are set to valid ACRPULL role
# ACR_PWD="$(az acr credential show -n demo42t --query passwords[0].value -o tsv)"
ACR_NAME=$1
ACR_REPO=$2
ACR_TAG=$3
#echo "ACR_USER: ${ACR_USER}"
#echo "ACR_PWD: ${ACR_PWD}"
echo "ACR_REPO: ${ACR_REPO}"
echo "ACR_TAG: ${ACR_TAG}"
echo "Checking https://$ACR_NAME.azurecr.io/mount/v1/$ACR_REPO/_manifests/$ACR_TAG"
while true
do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -u "$ACR_USER:$ACR_PWD" "https://$ACR_NAME.azurecr.io/mount/v1/$ACR_REPO/_manifests/$ACR_TAG")
    echo "Status: ${STATUS}"
    if [ $STATUS -eq 200 ]; then
        echo "Teleport: layers ready"
        break
    elif [ $STATUS -eq 409 ]; then
        echo "Teleport: expanding layers"
    elif  [ $STATUS -eq 404 ]; then
        echo "Teleport: ${ACR_NAME}-${ACR_REPO}:${ACR_TAG} not enabled"
        break
    else
        echo "Unknown status $STATUS"
    fi
    sleep 2
done