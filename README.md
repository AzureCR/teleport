# Project Teleport Demos

Welcome to Project Teleport

Here you will find some samples for teleporting your container images

## Preview 1 Constraints

Preview 1 has the following constraints. Your feedback will help us prioritize this list.

- Limited to running images [ACR Tasks](https://aka.ms/acr/tasks)
  - ACR Task image building is not yet supported
- Registries must exist in the **South Central US** or **East US** regions
  - Additional regions, including other continents will come online as we get more feedback.
- [Geo-replicated](https://aka.ms/acr/geo-replication) registries require Translocation. For preview 1, only the master region of a geo-replicated registry will support teleportation.
  - Replica regions will function as normal, pulling compressed blobs
- Linux images are currently supported with Windows images coming in a future release.

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
        -n demo42t \
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
