#!/bin/bash

export ACRUSERNAME="demo42westus"
export ACRPASSWORD="ao8meUb+lNj3IwjyITlU=sFxeHBgU7lh"
#export ACRREPO="2/azure-cli"
#export ACRTAG="scopemaps"


export ACRREPO="dotnet/core/sdk"
export ACRTAG="2.1"

while true
do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -u "$ACRUSERNAME:$ACRPASSWORD" "https://$ACRUSERNAME.azurecr-test.io/mount/v1/$ACRREPO/_manifests/$ACRTAG")
    if [ $STATUS -eq 200 ]; then
        echo "Teleport: layers ready"
        break
    elif [ $STATUS -eq 409 ]; then
        echo "Teleport: expanding layers"
    elif  [ $STATUS -eq 404 ]; then
        echo "Teleport: "$ACRREPO:$ACRTAG" not enabled"
        break
    else
        echo "Unknown status $STATUS"
    fi
    sleep 2
done