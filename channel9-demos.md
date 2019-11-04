  ```sh
  ```

- ACR Login

  ```sh
  ACR_NAME=demo42t
  az login
  az acr login -n $ACR_NAME
  ACR_USER=${ACR_NAME}
  ACR_PWD="$(az acr credential show -n ${ACR_NAME} --query passwords[0].value -o tsv)"
  ```

## Clear any images

  ```sh
  docker rm -f $(docker ps -a -q)
  docker rmi $(docker images -a -q)
  docker ps -a
  docker images -a
  clear
  ```
## Demo Time

## VM Comparison

- Baseline Azure CLI

```sh
docker images

# 931 MB - 11 layers
time docker run --rm demo42t.azurecr.io/azure-cli:2.0.75 echo 'hello'
```

## ACI Comparison

```sh
time az container create \
  --resource-group aci \
  --name az-cli \
  --image ${ACR_NAME}.azurecr.io/azure-cli:2.0.75  \
  --registry-login-server ${ACR_NAME}.azurecr.io \
  --registry-username $ACR_NAME \
  --registry-password $ACR_PWD \
  --restart-policy Never

az container delete --resource-group aci --name az-cli -y
```

## ACR Tasks, w/Teleport

```sh
az acr run -r demo42t \
  --cmd "orca run demo42t.azurecr.io/azure-cli:2.0.75 echo hello" /dev/null
```
