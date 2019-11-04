# Teleport Demos

Here you will find samples and scenarios for teleporting *your* container images.

## Table of Contents

- [Setting Your Environment Variables](#setting-your-environment-variables)
- [Enabling Teleportation](#enabling-teleportation)
- [Import Images](#import-images)
- [Comparing with a Dedicated VM](#comparing-with-a-dedicated-vm)
- [Comparing with ACI](#comparing-with-aci)
- [Multi-step Task Samples](#multi-step-task-samples)

## Setting Your Environment Variables

- Set the following variables for easy copy/paste of the samples.

  ```sh
  export ACR_NAME=[yourRegistryName] #eg: demo42
  export LOCATION=soutchcentralus
  export RESOURCE_GROUP=${ACR_NAME}
  ```

- Login to the AZ CLI
  >If your using the Azure [cloud shell][cloud-shell], you are already logged in.

  ```sh
  az login
  az configure --defaults acr=${ACR_NAME}
  ```

- Create an ACR.

  > For preview, teleportation requires a premium registry.

  ```sh
  az group create \
    -n ${ACR_NAME} \
    -l ${LOCATION}

  az acr create \
    -n ${ACR_NAME} \
    -l ${LOCATION} \
    -g ${RESOURCE_GROUP} \
    --sku premium
  ```

## Enabling Teleportation

- Request Access at https://aka.ms/teleport/signup

- Verify Teleport is Enabled

  To verify if your registry, and specific repository is enabled for Teleport and layer expansion, run the following cli command.

  ```sh
  az acr repository show \
    -n ${ACR_NAME} \
    --repository azure-cli \
    -o jsonc
  ```

  Look for `"teleportEnabled": true,` in the output.

  If the `"teleportEnabled"` name/value pair does not exist, the registry and repository are not yet Teleport enabled see [support][support] options.

  ```sh
  {
    "changeableAttributes": {
      "deleteEnabled": true,
      "listEnabled": true,
      "readEnabled": true,
      "teleportEnabled": true,
      "writeEnabled": true
    },
    ...
  ```

## Import Images

Import some images to get started.

> Note: [acr import][acr-import] is not yet supported. For Preview 1, please either pull/push or use ACR Tasks to build the images into the target registry.

- Pull-Pull images

  ```sh
  #az acr import \
  #  -n ${ACR_NAME} \
  #  --source mcr.microsoft.com/azure-cli:2.0.75 \
  #  --image azure-cli:2.0.75
  docker pull mcr.microsoft.com/azure-cli:2.0.75
  docker tag mcr.microsoft.com/azure-cli:2.0.75 \
    ${ACR_NAME}.azurecr.io/azure-cli:2.0.75
  docker push ${ACR_NAME}.azurecr.io/azure-cli:2.0.75
  ```

- Build/Push Images

  ```sh
  az acr build \
    --registry ${ACR_NAME} \
    -t azure-cli:2.0.75 \
    https://github.com/Azure/azure-cli.git
  ```

## First Teleportation

  ```sh
  az acr run \
    -r ${ACR_NAME} \
    --cmd "orca run {{.Run.Registry}}/azure-cli:2.0.75 az" /dev/null
  ```

## Comparing with a Dedicated VM

When Teleporting images, it helps to have a comparison.

> NOTE: Teleport is intended to speed performance, when comparing to a standard docker pull, within the Azure data center. Comparing a Teleportation with a docker run, initialed from a developer machine, outside of Azure isn't a fair comparison as you're pulling images across the internet.

See [vm-setup.md](./vm-setup.md) for configuring a VM within Azure.

- Baseline Azure CLI

```sh
time \
  docker run --rm ${ACR_NAME}.azurecr.io/azure-cli:2.0.75 echo 'hello'
```

## Comparing with ACI

- Create credentials to pass to `az container create`
  > Note: this sample will change to [using acr tokens][acr-tokens].
  ```sh
    export ACR_USER=${ACR_NAME}
    ACR_PWD="$(az acr credential show \
      -n ${ACR_NAME} \
      --query passwords[0].value -o tsv)"
  ```

- Create an ACI

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

## Multi-step Task Samples

> coming soon


[acr-import]:           https://aka.ms/acr/import
[acr-tokens]:           https://aka.ms/acr/repo-permissions
[cloud-shell]:          https://shell.azure.com
[signup]:               https://aka.ms/teleport/signup
[support]:              https://github.com/azurecr/teleport/blob/master/README.md#getting-support
[teleport-blog-post]:   https://stevelasker.blog/2019/10/29/azure-container-registry-teleportation/
[acr-tasks]:            https://aka.ms/acr/tasks
[webhooks]:             https://docs.microsoft.com/en-us/azure/container-registry/container-registry-webhook
