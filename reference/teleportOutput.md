# Teleport Output

## Current Output

```sh
$ az acr run -r demo42westus --cmd "orca run {{.Run.Registry}}/hello-world:latest" /dev/null
Queued a run with ID: yd1q
Waiting for an agent...
2019/10/18 00:51:53 Creating Docker network: acb_default_network, driver: 'bridge'
2019/10/18 00:51:53 Successfully set up Docker network: acb_default_network
2019/10/18 00:51:53 Setting up Docker configuration...
2019/10/18 00:51:54 Successfully set up Docker configuration
2019/10/18 00:51:54 Logging in to registry: demo42westus.azurecr-test.io
2019/10/18 00:51:56 Successfully logged into demo42westus.azurecr-test.io
2019/10/18 00:51:56 Executing step ID: acb_step_0. Timeout(sec): 600, Working directory: '', Network: 'acb_default_network'
2019/10/18 00:51:56 Launching container with name: acb_step_0
time="2019-10-18T00:51:57Z" level=info msg="requesting manifest..." url="https://demo42westus.azurecr-test.io/v2/hello-world/manifests/latest"
demo42westus.azurecr-test.io/hello-world:latest: resolving      |--------------------------------------|
elapsed: 0.1 s                                   total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest: resolving      |--------------------------------------|
elapsed: 0.2 s                                   total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest: resolving      |--------------------------------------|
elapsed: 0.3 s                                   total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest: resolving      |--------------------------------------|
elapsed: 0.4 s                                   total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest: resolving      |--------------------------------------|
elapsed: 0.5 s                                   total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest: resolving      |--------------------------------------|
elapsed: 0.6 s                                   total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest:                                  resolved       |++++++++++++++++++++++++++++++++++++++|
manifest-sha256:92c7f9c92844bbbb5d0a101b22f7c2a7949e40f8ea90c8b3bc396879d95e899a: waiting        |--------------------------------------|
elapsed: 0.7 s                                                                    total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest:                                  resolved       |++++++++++++++++++++++++++++++++++++++|
manifest-sha256:92c7f9c92844bbbb5d0a101b22f7c2a7949e40f8ea90c8b3bc396879d95e899a: waiting        |--------------------------------------|
elapsed: 0.8 s                                                                    total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest:                                  resolved       |++++++++++++++++++++++++++++++++++++++|
manifest-sha256:92c7f9c92844bbbb5d0a101b22f7c2a7949e40f8ea90c8b3bc396879d95e899a: waiting        |--------------------------------------|
elapsed: 0.9 s                                                                    total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest:                                  resolved       |++++++++++++++++++++++++++++++++++++++|
manifest-sha256:92c7f9c92844bbbb5d0a101b22f7c2a7949e40f8ea90c8b3bc396879d95e899a: waiting        |--------------------------------------|
layer-sha256:1b930d010525941c1d56ec53b97bd057a67ae1865eebf042686d2a2d18271ced:    waiting        |--------------------------------------|
config-sha256:fce289e99eb9bca977dae136fbe2a82b6b7d4c372474c9235adc1741675f587e:   downloading    |--------------------------------------|    0.0 B/1.5 KiB
elapsed: 1.0 s                                                                    total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest:                                  resolved       |++++++++++++++++++++++++++++++++++++++|
manifest-sha256:92c7f9c92844bbbb5d0a101b22f7c2a7949e40f8ea90c8b3bc396879d95e899a: waiting        |--------------------------------------|
layer-sha256:1b930d010525941c1d56ec53b97bd057a67ae1865eebf042686d2a2d18271ced:    waiting        |--------------------------------------|
config-sha256:fce289e99eb9bca977dae136fbe2a82b6b7d4c372474c9235adc1741675f587e:   downloading    |--------------------------------------|    0.0 B/1.5 KiB
elapsed: 1.1 s                                                                    total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest:                                  resolved       |++++++++++++++++++++++++++++++++++++++|
manifest-sha256:92c7f9c92844bbbb5d0a101b22f7c2a7949e40f8ea90c8b3bc396879d95e899a: waiting        |--------------------------------------|
layer-sha256:1b930d010525941c1d56ec53b97bd057a67ae1865eebf042686d2a2d18271ced:    waiting        |--------------------------------------|
config-sha256:fce289e99eb9bca977dae136fbe2a82b6b7d4c372474c9235adc1741675f587e:   downloading    |--------------------------------------|    0.0 B/1.5 KiB
elapsed: 1.2 s                                                                    total:   0.0 B (0.0 B/s)
demo42westus.azurecr-test.io/hello-world:latest:                                  resolved       |++++++++++++++++++++++++++++++++++++++|
manifest-sha256:92c7f9c92844bbbb5d0a101b22f7c2a7949e40f8ea90c8b3bc396879d95e899a: done           |++++++++++++++++++++++++++++++++++++++|
layer-sha256:1b930d010525941c1d56ec53b97bd057a67ae1865eebf042686d2a2d18271ced:    done           |++++++++++++++++++++++++++++++++++++++|
config-sha256:fce289e99eb9bca977dae136fbe2a82b6b7d4c372474c9235adc1741675f587e:   done           |++++++++++++++++++++++++++++++++++++++|
elapsed: 1.3 s                                                                    total:   0.0 B (0.0 B/s)
2019/10/18 00:51:58 teleporting linux/amd64 sha256:92c7f9c92844bbbb5d0a101b22f7c2a7949e40f8ea90c8b3bc396879d95e899a using the loopback snapshotter...
2019/10/18 00:51:58 Successfully teleported!
2019/10/18 00:51:58 All mounts set up
2019/10/18 00:51:58 Creating the container...
2019/10/18 00:51:59 Starting the container...
# container output blah, blah, blah
2019/10/18 00:51:59 Successfully executed container: acb_step_0
2019/10/18 00:51:59 Step ID: acb_step_0 marked as successful (elapsed time in seconds: 3.470856)
Run ID: yd1q was successful after 8s
```
## Current Output Commented

I've commented out lines that should be removed/changed

```sh
#az acr run -r demo42westus --cmd "orca run {{.Run.Registry}}/hello-world:latest" /dev/null
# remove requirement to include `orca run`
az acr run -r demo42westus --cmd "{{.Run.Registry}}/hello-world:latest" /dev/null
#Queued a run with ID: yd1q
2019/10/18 00:46:20 Queued run ID: yd1q
2019/10/18 00:46:23 Waiting for an agent...
#2019/10/18 00:51:53 Creating Docker network: acb_default_network, driver: 'bridge'
#2019/10/18 00:51:53 Successfully set up Docker network: acb_default_network
#2019/10/18 00:51:53 Setting up Docker configuration...
#2019/10/18 00:51:54 Successfully set up Docker configuration
#2019/10/18 00:51:54 Logging in to registry: demo42westus.azurecr-test.io
#2019/10/18 00:51:56 Successfully logged into demo42westus.azurecr-test.io
#2019/10/18 00:51:56 Executing step ID: acb_step_0. Timeout(sec): 600, Working directory: '', Network: 'acb_default_network'
#2019/10/18 00:51:56 Launching container with name: acb_step_0
Unable to find image 'demo42westus.azurecr-test.io/dotnet/core/sdk:2.1' locally
Teleport enabled, remote mounting: `demo42westus.azurecr-test.io/dotnet/core/sdk:2.1`
#time="2019-10-18T00:51:57Z" level=info msg="requesting manifest..." url="https://demo42westus.azurecr-test.io/v2/hello-world/manifests/latest"
9a0b0ce99936: Remote mounting layer
db3b6004c61a: Remote mounting layer
f8f075920295: Remote mounting layer
6ef14aff1139: Remote mounting layer
c0b734b089e6: Remote mounting layer
448be77c31ad: Remote mounting layer
36147795feb5: Remote mounting layer
2019/10/18 00:51:58 Creating the container...
2019/10/18 00:51:59 Starting the container...
# container output blah, blah, blah
2019/10/18 00:46:25 Successfully executed task (elapsed time in seconds: 3.47)
Run ID: yd1q was successful after 8s
```

## Cleaned up output

The following accounts for:

- **Orca:** --cmd incorporates orca. No need to specify `--cmd "orca run [image]"
- **Tasks:** timestamps on all Task output lines
- **Teleport:** reference to teleport enabled or not: (yes, I'm ok using teleport as the project name)
- **Teleport:** layer mounting streamlined, similar to docker pull
- **Tasks:** removal of all the internal acb steps
- **Tasks:** cleaner formatting of final time reporting
 

```sh
az acr run -r demo42westus --cmd "{{.Run.Registry}}/hello-world:latest" /dev/null
2019/10/18 00:46:20 Queued run ID: yd1q
2019/10/18 00:46:23 Waiting for an agent...
2019/10/18 00:46:24 Unable to find image 'demo42westus.azurecr-test.io/dotnet/core/sdk:2.1' locally
2019/10/18 00:46:25 Teleport enabled, remote mounting: `demo42westus.azurecr-test.io/dotnet/core/sdk:2.1`

9a0b0ce99936: Remote mounting layer
db3b6004c61a: Remote mounting layer
f8f075920295: Remote mounting layer
6ef14aff1139: Remote mounting layer
c0b734b089e6: Remote mounting layer
448be77c31ad: Remote mounting layer
36147795feb5: Remote mounting layer
2019/10/18 00:51:58 Creating the container...
2019/10/18 00:51:59 Starting the container...
# container output...
2019/10/18 00:58:28 Successfully executed task (elapsed time in seconds: 3.47)
Run ID: yd1q was successful after 8s
```
