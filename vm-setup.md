# VM Samples

A set of comparison commands, when comparing Teleported images with a dedicated VM.

## Pre Demo

The following is needed to start the demo:

- SSH into the Docker VM

  ```sh
  ssh stevelas@stevelasteleportvm.southcentralus.cloudapp.azure.com
  ```

- ACR Login

  ```sh
  az login
  az acr login -n $ACR_NAME
  ```

- Docker Login

  ```sh







  ## Create A Comparison VM

To compare your images to a dedicated VM, use the following, or a similar VM with Docker installed.

- Install a VM from this template

  https://github.com/Azure/azure-quickstart-templates/tree/master/docker-simple-on-ubuntu

- Install the AZ CLI

  ```sh
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
  ```

- Login and Configure the AZ CLI

```sh
az login
az configure
```

## Pre Demo

The following is needed to start the demo:

- SSH into the Docker VM

  ```sh
  ssh stevelas@stevelasteleportvm.southcentralus.cloudapp.azure.com
  ```

- ACR Login

  ```sh
  az login
  az acr login -n $ACR_NAME
  ```

- Docker Login

  ```sh
  ACR_NAME=${ACR_NAME}
  ACR_USER=${ACR_NAME}
  ACR_PWD="$(az acr credential show -n ${ACR_NAME} --query passwords[0].value -o tsv)"
  ```

- Clear any images

  ```sh
  docker rm -f $(docker ps -a -q)
  docker rmi $(docker images -a -q)
  docker ps -a
  docker images -a
  ```