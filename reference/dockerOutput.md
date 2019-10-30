```sh
 az acr run -r demo42westus --cmd "{{.Run.Registry}}/dotnet/core/sdk:2.1  echo 'hello'" /dev/null
Queued a run with ID: yd1p
Waiting for an agent...
# 2019/10/18 00:45:41 Creating Docker network: acb_default_network, driver: 'bridge'
# 2019/10/18 00:45:42 Successfully set up Docker network: acb_default_network
# 2019/10/18 00:45:42 Setting up Docker configuration...
# 2019/10/18 00:45:43 Successfully set up Docker configuration
# 2019/10/18 00:45:43 Logging in to registry: demo42westus.azurecr-test.io
# 2019/10/18 00:45:44 Successfully logged into demo42westus.azurecr-test.io
#2019/10/18 00:45:44 Executing step ID: acb_step_0. Timeout(sec): 600, Working directory: '', Network: 'acb_default_network'
2019/10/18 00:45:44 Executing task: Timeout(sec): 600, Working directory: ''
# 2019/10/18 00:45:44 Launching container with name: acb_step_0
Unable to find image 'demo42westus.azurecr-test.io/dotnet/core/sdk:2.1' locally
2.1: Pulling from dotnet/core/sdk
9a0b0ce99936: Pulling fs layer
db3b6004c61a: Pulling fs layer
f8f075920295: Pulling fs layer
6ef14aff1139: Pulling fs layer
c0b734b089e6: Pulling fs layer
448be77c31ad: Pulling fs layer
36147795feb5: Pulling fs layer
6ef14aff1139: Waiting
c0b734b089e6: Waiting
448be77c31ad: Waiting
36147795feb5: Waiting
f8f075920295: Verifying Checksum
f8f075920295: Download complete
db3b6004c61a: Verifying Checksum
db3b6004c61a: Download complete
c0b734b089e6: Verifying Checksum
c0b734b089e6: Download complete
9a0b0ce99936: Verifying Checksum
9a0b0ce99936: Download complete
6ef14aff1139: Verifying Checksum
6ef14aff1139: Download complete
448be77c31ad: Verifying Checksum
448be77c31ad: Download complete
36147795feb5: Verifying Checksum
36147795feb5: Download complete
9a0b0ce99936: Pull complete
db3b6004c61a: Pull complete
f8f075920295: Pull complete
6ef14aff1139: Pull complete
c0b734b089e6: Pull complete
448be77c31ad: Pull complete
36147795feb5: Pull complete
Digest: sha256:5089572c87dd81acc0c83742a866f666c53dd32fd44f44c0694ee3c039f88c64
Status: Downloaded newer image for demo42westus.azurecr-test.io/dotnet/core/sdk:2.1
hello
#2019/10/18 00:46:25 Successfully executed container: acb_step_0
2019/10/18 00:46:25 Successfully executed task (elapsed time in seconds: 40.62) # Trim to 2 decimal places
# 2019/10/18 00:46:25 Step ID: acb_step_0 marked as successful (elapsed time in seconds: 40.621964)
# What's the difference between this and the above. Is this the time we took to assign a node?
Run ID: yd1p was successful after 47s
```
