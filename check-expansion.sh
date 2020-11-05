#!/bin/bash
#usage: check-expansion.sh acr-name repo tag
#usage: eg: check-expansion.sh demo42 /demo42/hello-world 2.1
#usage: eg: check-expansion.sh demo42 /demo42/hello-world 2.1 --debug
# Assumes ACR_USER and ACR_PWD are set to valid ACRPULL role
# Retrieve the ACR_PWD with the following command, if the Admin account is enabled
# ACR_PWD="$(az acr credential show -n demo42t --query passwords[0].value -o tsv)"
# NOTE: Repo scoped tokens will be coming online in November
ACR_NAME=$1
ACR_REPO=$2
ACR_DIGEST=$3
DEBUG=$4
# Troubleshooting 
if [ $DEBUG = '--debug' ]; then
    echo "Parameter Validation:"
    echo "  ACR_USER: ${ACR_USER}"
    echo "  ACR_PWD : ${ACR_PWD}"
    echo "  ACR_NAME: ${ACR_NAME}"
    echo "  ACR_REPO: ${ACR_REPO}"
    echo "  ACR_DIGEST : ${ACR_DIGEST}"
fi

echo "Checking https://$ACR_NAME.azurecr.io/mount/v1/$ACR_REPO/_manifests/$ACR_DIGEST"
while true
do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -u "$ACR_USER:$ACR_PWD" "https://$ACR_NAME.azurecr.io/mount/v1/$ACR_REPO/_manifests/$ACR_DIGEST")
    echo "Status: ${STATUS}"
    if [ $STATUS -eq 200 ]; then
        echo "Teleport: layers ready"
        break
    elif [ $STATUS -eq 409 ]; then
        echo "Teleport: expanding layers"
    elif  [ $STATUS -eq 404 ]; then
        echo "Teleport: ${ACR_NAME}-${ACR_REPO}:${ACR_DIGEST} not enabled"
        break
    else
        echo "Unknown status $STATUS"
    fi
    sleep 2
done
