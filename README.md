# Project Teleport Demos

Instancing a custom environment within seconds is one of the many wonders of running containers. Having to wait for the image and its layers to download & decompress the first time is the current price of admission.

***Project Teleport removes the cost of download and decompression by mounting pre-expanded layers from the Azure Container Registry to Teleport enabled Azure container hosts.***

[![](./media\AzureFridayTeleportPreviewThumb.png)](https://channel9.msdn.com/Shows/Azure-Friday/How-to-expedite-container-startup-with-Project-Teleport-and-Azure-Container-Registry/player#time=21s:paused)

> For more background, please see [Azure Container Registry Adds Teleportation][teleport-blog-post]

## Content

This repo is a staging ground as we develop Project Teleport to support all Azure Container Services.

- [Sign Up for the Teleport Preview](#sign-up-for-the-teleport-preview)
- [Getting Started with Teleportation](#getting-started)
- [Supported Services](#supported-services)
- [Preview Constraints](#preview-constraints)
- [Getting Support](#getting-support)

Here you will find some samples for teleporting your container images

## Sign Up for the Teleport Preview

In these early stages, we're looking for direct feedback. To request access, please sign up here: [aka.ms/teleport/signup][signup]

## Getting Started

> To gain access to the Azure Teleporters, please [signup here][signup]

The easiest way to see the advantages of Teleport, is running a command with the az-cli image.

- Setup environment vars for your registry

    ```sh
    export ACR_NAME=demo42t #[registryName]
    export LOCATION=southcentralus
    export RESOURCE_GROUP=$ACR_NAME-teleport
    export ACR_USER=${ACR_NAME}
    export ACR_PWD="$(az acr credential show -n ${ACR_NAME} --query passwords[0].value -o tsv)"
    ```

- Build the az cli

    ```sh
    az acr build \
        --registry ${ACR_NAME} \
        -t azure-cli:teleport \
        https://github.com/Azure/azure-cli.git
    ```

- Run a comparison with ACI

  ```sh
  az group create -n ${RESOURCE_GROUP} -l ${LOCATION}
  time az container create \
    --resource-group ${RESOURCE_GROUP} \
    --name az-cli \
    --image ${ACR_NAME}.azurecr.io/azure-cli:teleport \
    --command-line "az" \
    --registry-login-server ${ACR_NAME}.azurecr.io \
    --registry-username $ACR_USER \
    --registry-password $ACR_PWD \
    --restart-policy Never

  az container delete \
    --resource-group ${RESOURCE_GROUP} \
    --name az-cli \
    -y
  ```

  Note the execution time:

  ```sh
  real    2m9.726s # <-- execution time
  user    0m0.844s
  sys     0m0.500s
  ```
- Teleport with ACR Tasks

  ```sh
  az acr run \
    -r ${ACR_NAME} \
    --cmd "orca run {{.Run.Registry}}/azure-cli:teleport az" /dev/null
  ```

  Note the execution time:

  ```sh
  2019/11/04 02:53:17 Step ID: acb_step_0 marked as successful (elapsed time in seconds: 9.68) # <-- execution time
  ```

## Supported Services

Preview 1 focuses on running containers within [ACR Tasks][acr-tasks]. Additional services and scenarios will come online as we incorporate more feedback.

While ACR Tasks doesn't yet support teleporting base layers, you can still integrate Teleport to a build scenario for steps pre & post the container build.

ACR Task Teleportation scenarios include:

- Running a batch job, such as cleaning up older images within acr
- A custom deployment script, requiring a new, beta or custom version of Helm, Kubectl or some other runtime that's not on a hosted release server
- Custom transforms to your code, prior to using ACR Tasks for container building.

## Preview Constraints

Preview 1 has the following constraints. Your feedback will help us prioritize this list.

- Limited to running images [ACR Tasks][acr-tasks]]
  - ACR Task image building is not yet supported. However, you can use teleport for pre/post build steps.
- Registries must exist in the **South Central US** or **East US** regions
  - Additional regions, including other continents will come online as we get more feedback.
- [ACR Import][acr-import] does not yet trigger layer expansion. Images must be pushed with `docker push`, built with `az acr build`, or built with [acr task triggers](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-tasks-overview#trigger-task-on-source-code-update).
- [Geo-replicated](https://aka.ms/acr/geo-replication) registries require Translocation. For preview 1, only the master region of a geo-replicated registry will support teleportation.
  - Replica regions will function as normal, pulling compressed blobs
- Linux images are currently supported with Windows images coming in a future release.
- [ACR Webhook Push notifications][webhooks] occur when the image manifest and compressed blobs are completed. We are considering various options when layer expansion has completed within each region. 

## Getting Support

- [Logging Teleport related issues](https://github.com/AzureCR/teleport/issues)
- [Feature Requests via User Voice](https://aka.ms/acr/uservoice)
- [Contact the ACR Product Team](https://github.com/Azure/acr/blob/master/README.md#providing-feedback)

## How Do I...

- **Q:** run some baseline teleport examples
  - **A:** [Teleport Samples](./teleport-samples.md)
- **Q:** know when an image is expanded, and ready for teleportation?
  - **A:** ACR will support a new notification event, as well as CLI support. For Preview 1, you can run the following script, passing in 3 arguments for each image you'd like to check, with credentials saved to environment variables.

  ```sh
  ./check-expansion.sh [registryName] [repoName] [tag]
  ./check-expansion.sh demo42 hello-world 1.0
  ```
- **Q:** know if a repository is enabled for teleportation?
  - **A:** Teleport must be enabled by the ACR Product team. To verify a repository is enabled, use `az acr repository show`, looking for the `teleportEnabled` attribute.

    ```sh
    az acr repository show \
        --repository base-images/dotnet/core/sdk \
        -o jsonc
    {
    "changeableAttributes": {
        "deleteEnabled": true,
        "listEnabled": true,
        "readEnabled": true,
        "teleportEnabled": true,
        "writeEnabled": true
    ```
[acr-import]:           https://aka.ms/acr/import
[signup]:               https://aka.ms/teleport/signup
[teleport-blog-post]:   https://stevelasker.blog/2019/10/29/azure-container-registry-teleportation/
[acr-tasks]:                https://aka.ms/acr/tasks
[webhooks]:             https://docs.microsoft.com/en-us/azure/container-registry/container-registry-webhook