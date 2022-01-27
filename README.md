# Local Stack EKS Bug Reproduction

1. Get a pulumi account, get a token, export the token
   ```bash
   export PULUMI_ACCESS_TOKEN="pul-..."
   ```
2. Get a localstack pro account, get a token, export the token
   ```bash
   export LOCALSTACK_API_KEY="..."
   ```
3. Run the reproduction case
   ```bash
   ./run_issue_reproduction.sh
   ```
4. In another terminal you can dump the logs (log example below)

5. Cleanup to run it again...
    ```bash
    ./cleanup_to_try_again.sh
    ```

## Log Snapshot
```bash
Waiting for all LocalStack services to be ready
2022-01-27 00:32:00,402 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2022-01-27 00:32:00,403 INFO supervisord started with pid 14
2022-01-27 00:32:01,407 INFO spawned: 'infra' with pid 20
. .venv/bin/activate; LOCALSTACK_INFRA_PROCESS=1 exec bin/localstack start --host --no-banner
2022-01-27 00:32:02,421 INFO success: infra entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)

LocalStack version: 0.13.3.3
LocalStack Docker container id: c51cc7988d28
LocalStack build date: 2022-01-25
LocalStack build git hash: 5cb915bd

2022-01-27T00:32:02.526:DEBUG:stevedore.extension: found extension EntryPoint(name='register_partition_adjusting_proxy_listener', value='localstack.plugins:register_partition_adjusting_proxy_listener', group='localstack.hooks.on_infra_start')
2022-01-27T00:32:02.527:DEBUG:stevedore.extension: found extension EntryPoint(name='setup_pro_infra', value='localstack_ext.plugins:setup_pro_infra', group='localstack.hooks.on_infra_start')
2022-01-27T00:32:02.533:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.register_partition_adjusting_proxy_listener = <function register_partition_adjusting_proxy_listener at 0x7fa87f7ff040>)
2022-01-27T00:32:02.533:DEBUG:plugin.manager: plugin localstack.hooks.on_infra_start:register_partition_adjusting_proxy_listener is disabled
2022-01-27T00:32:02.534:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.setup_pro_infra = <function setup_pro_infra at 0x7fa87f748b80>)
2022-01-27T00:32:02.534:DEBUG:plugin.manager: loading plugin localstack.hooks.on_infra_start:setup_pro_infra
2022-01-27T00:32:02.535:DEBUG:localstack_ext.bootstrap.install: Attempting to download local SSL certificate file
2022-01-27T00:32:02.683:DEBUG:localstack.utils.common: Starting download from https://github.com/localstack/localstack-artifacts/raw/master/local-certs/server.key to /var/lib/localstack/cache/server.test.pem (5163 bytes)
2022-01-27T00:32:02.689:DEBUG:localstack.utils.common: Done downloading https://github.com/localstack/localstack-artifacts/raw/master/local-certs/server.key, response code 200, total bytes 7575
2022-01-27T00:32:02.695:WARNING:localstack_ext.plugins: !! Configuring EDGE_PORT=4566 without setting EDGE_PORT_HTTP may lead to issues; better leave the defaults, or set EDGE_PORT=443 and EDGE_PORT_HTTP=4566
2022-01-27T00:32:03.279:INFO:localstack_ext.bootstrap.licensing: Successfully activated API key
2022-01-27T00:32:03.461:DEBUG:localstack.utils.run: Executing command: whoami
2022-01-27T00:32:03.466:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('\n' + f)" /etc/resolv.conf
2022-01-27T00:32:03.491:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('nameserver 0.0.0.0\n' + f)" /etc/resolv.conf
2022-01-27T00:32:03.517:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('# The following line is required by LocalStack\n' + f)" /etc/resolv.conf
Starting DNS servers (tcp/udp port 53 on 0.0.0.0)...
Starting edge router (https port 4566)...
2022-01-27T00:32:06.040:INFO:localstack_ext.utils.aws.metadata_service: Starting AWS instance metadata service on port 80
2022-01-27T00:32:06.052:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T00:32:06.060:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T00:32:06.069:DEBUG:localstack.services.install: getting kinesis-mock for linux x86_64
2022-01-27T00:32:06.069:DEBUG:localstack.services.install: kinesis-mock found at /opt/code/localstack/localstack/infra/kinesis-mock/kinesis-mock-linux-amd64-static
2022-01-27T00:32:06.070:DEBUG:localstack.utils.run: Executing command: cd "/opt/code/localstack/localstack/infra/dynamodb" && zip -u DynamoDBLocal.jar log4j2.xml || true
2022-01-27T00:32:06.124:DEBUG:localstack_ext.bootstrap.install: Using cached SSL certificate (less than 6hrs since last update).
[2022-01-27 00:32:06 +0000] [21] [INFO] Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-01-27T00:32:06.129:INFO:hypercorn.error: Running on https://0.0.0.0:4566 (CTRL + C to quit)
Ready.
2022-01-27T00:32:17.038:DEBUG:localstack_ext.services.dns_server: Determined fallback dns: 127.0.0.11
2022-01-27T00:33:04.846:WARNING:localstack_ext.services.ec2.ec2_starter: VM manager not reachable: MyHTTPConnectionPool(host='172.17.0.1', port=4600): Max retries exceeded with url: / (Caused by NewConnectionError('<urllib3.connection.HTTPConnection object at 0x7fa877a801f0>: Failed to establish a new connection: [Errno 111] Connection refused'))
2022-01-27T00:33:04.846:INFO:localstack.services.infra: Starting mock EC2 service on http port 4566 ...
2022-01-27T00:33:04.847:INFO:localstack.services.motoserver: starting moto server on http://0.0.0.0:52167
2022-01-27T00:33:04.847:DEBUG:localstack.services.plugins: checking service health ec2:52167
2022-01-27T00:33:08.073:INFO:localstack.services.infra: Starting mock IAM service on http port 4566 ...
2022-01-27T00:33:08.073:DEBUG:localstack.services.plugins: checking service health iam:52167
2022-01-27T00:33:10.075:INFO:localstack.services.infra: Starting mock EKS service on http port 4566 ...
2022-01-27T00:33:10.076:DEBUG:localstack.services.plugins: checking service health eks:41835
2022-01-27 00:33:10,076:API:  * Running on all addresses.
   WARNING: This is a development server. Do not use it in a production deployment.
2022-01-27T00:33:10.579:DEBUG:localstack.utils.docker_utils: Getting networks for container: localstack-pulumi-eks-repo_localstack_1
2022-01-27T00:33:10.581:INFO:localstack.services.awslambda.lambda_utils: Determined lambda container network: localstack-pulumi-eks-repo_internal
2022-01-27T00:33:10.581:DEBUG:localstack.utils.docker_utils: Getting ipv4 address for container localstack-pulumi-eks-repo_localstack_1 in network localstack-pulumi-eks-repo_internal.
2022-01-27T00:33:10.584:INFO:localstack.services.awslambda.lambda_utils: Determined main container target IP: 172.22.0.2
2022-01-27T00:33:11.008:DEBUG:localstack.utils.common: Starting download from https://github.com/rancher/k3d/releases/download/v5.0.1-rc.1/k3d-linux-amd64 to /var/lib/localstack/var_libs/k3d.linux.bin (17125376 bytes)
2022-01-27T00:33:11.088:DEBUG:localstack.utils.common: Written 1048576 bytes (total 1048576) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.131:DEBUG:localstack.utils.common: Written 1048576 bytes (total 2097152) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.168:DEBUG:localstack.utils.common: Written 1048576 bytes (total 3145728) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.206:DEBUG:localstack.utils.common: Written 1048576 bytes (total 4194304) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.241:DEBUG:localstack.utils.common: Written 1048576 bytes (total 5242880) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.285:DEBUG:localstack.utils.common: Written 1048576 bytes (total 6291456) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.319:DEBUG:localstack.utils.common: Written 1048576 bytes (total 7340032) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.345:DEBUG:localstack.utils.common: Written 1048576 bytes (total 8388608) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.379:DEBUG:localstack.utils.common: Written 1048576 bytes (total 9437184) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.420:DEBUG:localstack.utils.common: Written 1048576 bytes (total 10485760) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.455:DEBUG:localstack.utils.common: Written 1048576 bytes (total 11534336) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.492:DEBUG:localstack.utils.common: Written 1048576 bytes (total 12582912) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.526:DEBUG:localstack.utils.common: Written 1048576 bytes (total 13631488) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.602:DEBUG:localstack.utils.common: Written 1048576 bytes (total 14680064) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.635:DEBUG:localstack.utils.common: Written 1048576 bytes (total 15728640) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.680:DEBUG:localstack.utils.common: Written 1048576 bytes (total 16777216) to /var/lib/localstack/var_libs/k3d.linux.bin
2022-01-27T00:33:11.716:DEBUG:localstack.utils.common: Done downloading https://github.com/rancher/k3d/releases/download/v5.0.1-rc.1/k3d-linux-amd64, response code 200, total bytes 17125376
2022-01-27T00:33:11.718:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'create', 'eks-cluster-44b8be3', '--api-port', '6443', '-p', '8081:80@loadbalancer']
2022-01-27T00:33:41.718:INFO:localstack_ext.services.eks.k8s_utils: Error creating cluster eks-cluster-44b8be3 - deleting and retrying:
2022-01-27T00:33:41.719:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'delete', 'eks-cluster-44b8be3']
2022-01-27T00:33:42.776:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'create', 'eks-cluster-44b8be3', '--api-port', '6443', '-p', '8081:80@loadbalancer']
2022-01-27T00:34:12.778:INFO:localstack_ext.services.eks.k8s_utils: Error creating cluster eks-cluster-44b8be3 - deleting and retrying:
2022-01-27T00:34:12.779:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'delete', 'eks-cluster-44b8be3']
2022-01-27T00:34:13.826:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'create', 'eks-cluster-44b8be3', '--api-port', '6443', '-p', '8081:80@loadbalancer']
2022-01-27T00:34:43.835:INFO:localstack_ext.services.eks.k8s_utils: Error creating cluster eks-cluster-44b8be3 - deleting and retrying:
2022-01-27T00:34:43.836:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'delete', 'eks-cluster-44b8be3']
2022-01-27T00:34:44.881:INFO:localstack.utils.run: Thread run method <function start_cluster.<locals>._startup at 0x7fa87feade50>(None) failed:  Traceback (most recent call last):
  File "/opt/code/localstack/localstack/utils/run.py", line 153, in run
    result = self.func(self.params, **kwargs)
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/eks_api.py.enc", line 50, in _startup
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/k8s_utils.py.enc", line 109, in create_cluster
  File "/opt/code/localstack/localstack/utils/common.py", line 945, in retry
    raise raise_error
  File "/opt/code/localstack/localstack/utils/common.py", line 941, in retry
    return function(**kwargs)
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/k8s_utils.py.enc", line 104, in _try
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/k8s_utils.py.enc", line 127, in _try_create_cluster
AssertionError

Waiting for all LocalStack services to be ready
2022-01-27 00:51:52,156 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2022-01-27 00:51:52,157 INFO supervisord started with pid 14
2022-01-27 00:51:53,161 INFO spawned: 'infra' with pid 20
. .venv/bin/activate; LOCALSTACK_INFRA_PROCESS=1 exec bin/localstack start --host --no-banner
2022-01-27 00:51:54,177 INFO success: infra entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
Waiting for all LocalStack services to be ready

LocalStack version: 0.13.3.3
LocalStack Docker container id: c51cc7988d28
LocalStack build date: 2022-01-25
LocalStack build git hash: 5cb915bd

2022-01-27T00:52:04.135:DEBUG:stevedore.extension: found extension EntryPoint(name='register_partition_adjusting_proxy_listener', value='localstack.plugins:register_partition_adjusting_proxy_listener', group='localstack.hooks.on_infra_start')
2022-01-27T00:52:04.136:DEBUG:stevedore.extension: found extension EntryPoint(name='setup_pro_infra', value='localstack_ext.plugins:setup_pro_infra', group='localstack.hooks.on_infra_start')
2022-01-27T00:52:04.140:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.register_partition_adjusting_proxy_listener = <function register_partition_adjusting_proxy_listener at 0x7f1b91656040>)
2022-01-27T00:52:04.140:DEBUG:plugin.manager: plugin localstack.hooks.on_infra_start:register_partition_adjusting_proxy_listener is disabled
2022-01-27T00:52:04.140:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.setup_pro_infra = <function setup_pro_infra at 0x7f1b915a4b80>)
2022-01-27T00:52:04.140:DEBUG:plugin.manager: loading plugin localstack.hooks.on_infra_start:setup_pro_infra
2022-01-27T00:52:04.141:DEBUG:localstack_ext.bootstrap.install: Using cached SSL certificate (less than 6hrs since last update).
2022-01-27T00:52:04.141:WARNING:localstack_ext.plugins: !! Configuring EDGE_PORT=4566 without setting EDGE_PORT_HTTP may lead to issues; better leave the defaults, or set EDGE_PORT=443 and EDGE_PORT_HTTP=4566
2022-01-27T00:52:04.695:INFO:localstack_ext.bootstrap.licensing: Successfully activated API key
2022-01-27T00:52:04.864:DEBUG:localstack.utils.run: Executing command: whoami
2022-01-27T00:52:04.868:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('\n' + f)" /etc/resolv.conf
2022-01-27T00:52:04.895:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('nameserver 0.0.0.0\n' + f)" /etc/resolv.conf
2022-01-27T00:52:04.921:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('# The following line is required by LocalStack\n' + f)" /etc/resolv.conf
Waiting for all LocalStack services to be ready
Starting DNS servers (tcp/udp port 53 on 0.0.0.0)...
Starting edge router (https port 4566)...
Ready.
2022-01-27T00:52:07.372:INFO:localstack_ext.utils.aws.metadata_service: Starting AWS instance metadata service on port 80
2022-01-27T00:52:07.382:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T00:52:07.390:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T00:52:07.399:DEBUG:localstack.services.install: getting kinesis-mock for linux x86_64
2022-01-27T00:52:07.399:DEBUG:localstack.services.install: kinesis-mock found at /opt/code/localstack/localstack/infra/kinesis-mock/kinesis-mock-linux-amd64-static
2022-01-27T00:52:07.400:DEBUG:localstack.utils.run: Executing command: cd "/opt/code/localstack/localstack/infra/dynamodb" && zip -u DynamoDBLocal.jar log4j2.xml || true
2022-01-27T00:52:07.449:DEBUG:localstack_ext.bootstrap.install: Using cached SSL certificate (less than 6hrs since last update).
[2022-01-27 00:52:07 +0000] [21] [INFO] Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-01-27T00:52:07.455:INFO:hypercorn.error: Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-01-27T00:52:12.414:DEBUG:localstack_ext.services.dns_server: Determined fallback dns: 127.0.0.11
Waiting for all LocalStack services to be ready
2022-01-27 00:57:29,022 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2022-01-27 00:57:29,024 INFO supervisord started with pid 14
2022-01-27 00:57:30,028 INFO spawned: 'infra' with pid 20
. .venv/bin/activate; LOCALSTACK_INFRA_PROCESS=1 exec bin/localstack start --host --no-banner
2022-01-27 00:57:31,033 INFO success: infra entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)

LocalStack version: 0.13.3.3
LocalStack Docker container id: c51cc7988d28
LocalStack build date: 2022-01-25
LocalStack build git hash: 5cb915bd

2022-01-27T00:57:31.363:DEBUG:stevedore.extension: found extension EntryPoint(name='register_partition_adjusting_proxy_listener', value='localstack.plugins:register_partition_adjusting_proxy_listener', group='localstack.hooks.on_infra_start')
2022-01-27T00:57:31.363:DEBUG:stevedore.extension: found extension EntryPoint(name='setup_pro_infra', value='localstack_ext.plugins:setup_pro_infra', group='localstack.hooks.on_infra_start')
2022-01-27T00:57:31.367:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.register_partition_adjusting_proxy_listener = <function register_partition_adjusting_proxy_listener at 0x7f5e04bd0040>)
2022-01-27T00:57:31.368:DEBUG:plugin.manager: plugin localstack.hooks.on_infra_start:register_partition_adjusting_proxy_listener is disabled
2022-01-27T00:57:31.368:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.setup_pro_infra = <function setup_pro_infra at 0x7f5e04b1eb80>)
2022-01-27T00:57:31.368:DEBUG:plugin.manager: loading plugin localstack.hooks.on_infra_start:setup_pro_infra
2022-01-27T00:57:31.368:DEBUG:localstack_ext.bootstrap.install: Using cached SSL certificate (less than 6hrs since last update).
2022-01-27T00:57:31.368:WARNING:localstack_ext.plugins: !! Configuring EDGE_PORT=4566 without setting EDGE_PORT_HTTP may lead to issues; better leave the defaults, or set EDGE_PORT=443 and EDGE_PORT_HTTP=4566
Waiting for all LocalStack services to be ready
2022-01-27T00:57:37.304:INFO:localstack_ext.bootstrap.licensing: Successfully activated API key
2022-01-27T00:57:37.476:DEBUG:localstack.utils.run: Executing command: whoami
2022-01-27T00:57:37.481:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('\n' + f)" /etc/resolv.conf
2022-01-27T00:57:37.506:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('nameserver 0.0.0.0\n' + f)" /etc/resolv.conf
2022-01-27T00:57:37.531:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('# The following line is required by LocalStack\n' + f)" /etc/resolv.conf
Starting DNS servers (tcp/udp port 53 on 0.0.0.0)...
Starting edge router (https port 4566)...
Ready.
2022-01-27T00:57:39.918:INFO:localstack_ext.utils.aws.metadata_service: Starting AWS instance metadata service on port 80
2022-01-27T00:57:39.930:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T00:57:39.938:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T00:57:39.945:DEBUG:localstack.services.install: getting kinesis-mock for linux x86_64
2022-01-27T00:57:39.946:DEBUG:localstack.services.install: kinesis-mock found at /opt/code/localstack/localstack/infra/kinesis-mock/kinesis-mock-linux-amd64-static
2022-01-27T00:57:39.946:DEBUG:localstack.utils.run: Executing command: cd "/opt/code/localstack/localstack/infra/dynamodb" && zip -u DynamoDBLocal.jar log4j2.xml || true
2022-01-27T00:57:39.996:DEBUG:localstack_ext.bootstrap.install: Using cached SSL certificate (less than 6hrs since last update).
[2022-01-27 00:57:40 +0000] [21] [INFO] Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-01-27T00:57:40.001:INFO:hypercorn.error: Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-01-27T00:57:51.111:DEBUG:localstack_ext.services.dns_server: Determined fallback dns: 127.0.0.11
Waiting for all LocalStack services to be ready
2022-01-27 00:58:22,016 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2022-01-27 00:58:22,018 INFO supervisord started with pid 15
2022-01-27 00:58:23,022 INFO spawned: 'infra' with pid 21
. .venv/bin/activate; LOCALSTACK_INFRA_PROCESS=1 exec bin/localstack start --host --no-banner
2022-01-27 00:58:24,515 INFO success: infra entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)

LocalStack version: 0.13.3.3
LocalStack Docker container id: c51cc7988d28
LocalStack build date: 2022-01-25
LocalStack build git hash: 5cb915bd

2022-01-27T00:58:23.945:DEBUG:stevedore.extension: found extension EntryPoint(name='register_partition_adjusting_proxy_listener', value='localstack.plugins:register_partition_adjusting_proxy_listener', group='localstack.hooks.on_infra_start')
2022-01-27T00:58:23.945:DEBUG:stevedore.extension: found extension EntryPoint(name='setup_pro_infra', value='localstack_ext.plugins:setup_pro_infra', group='localstack.hooks.on_infra_start')
2022-01-27T00:58:23.950:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.register_partition_adjusting_proxy_listener = <function register_partition_adjusting_proxy_listener at 0x7fb2c7e8c040>)
2022-01-27T00:58:23.950:DEBUG:plugin.manager: plugin localstack.hooks.on_infra_start:register_partition_adjusting_proxy_listener is disabled
2022-01-27T00:58:23.950:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.setup_pro_infra = <function setup_pro_infra at 0x7fb2c7ddbb80>)
2022-01-27T00:58:23.950:DEBUG:plugin.manager: loading plugin localstack.hooks.on_infra_start:setup_pro_infra
2022-01-27T00:58:23.950:DEBUG:localstack_ext.bootstrap.install: Using cached SSL certificate (less than 6hrs since last update).
2022-01-27T00:58:23.950:WARNING:localstack_ext.plugins: !! Configuring EDGE_PORT=4566 without setting EDGE_PORT_HTTP may lead to issues; better leave the defaults, or set EDGE_PORT=443 and EDGE_PORT_HTTP=4566
2022-01-27T00:58:24.515:INFO:localstack_ext.bootstrap.licensing: Successfully activated API key
2022-01-27T00:58:24.687:DEBUG:localstack.utils.run: Executing command: whoami
2022-01-27T00:58:24.692:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('\n' + f)" /etc/resolv.conf
2022-01-27T00:58:24.717:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('nameserver 0.0.0.0\n' + f)" /etc/resolv.conf
2022-01-27T00:58:24.743:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('# The following line is required by LocalStack\n' + f)" /etc/resolv.conf
Starting DNS servers (tcp/udp port 53 on 0.0.0.0)...
Starting edge router (https port 4566)...
Ready.
2022-01-27T00:58:27.128:INFO:localstack_ext.utils.aws.metadata_service: Starting AWS instance metadata service on port 80
2022-01-27T00:58:27.140:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T00:58:27.148:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T00:58:27.156:DEBUG:localstack.services.install: getting kinesis-mock for linux x86_64
2022-01-27T00:58:27.156:DEBUG:localstack.services.install: kinesis-mock found at /opt/code/localstack/localstack/infra/kinesis-mock/kinesis-mock-linux-amd64-static
2022-01-27T00:58:27.156:DEBUG:localstack.utils.run: Executing command: cd "/opt/code/localstack/localstack/infra/dynamodb" && zip -u DynamoDBLocal.jar log4j2.xml || true
2022-01-27T00:58:27.204:DEBUG:localstack_ext.bootstrap.install: Using cached SSL certificate (less than 6hrs since last update).
[2022-01-27 00:58:27 +0000] [22] [INFO] Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-01-27T00:58:27.209:INFO:hypercorn.error: Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-01-27T00:58:37.614:DEBUG:localstack_ext.services.dns_server: Determined fallback dns: 127.0.0.11
2022-01-27T00:58:59.617:WARNING:localstack_ext.services.ec2.ec2_starter: VM manager not reachable: MyHTTPConnectionPool(host='172.17.0.1', port=4600): Max retries exceeded with url: / (Caused by NewConnectionError('<urllib3.connection.HTTPConnection object at 0x7fb2c27da640>: Failed to establish a new connection: [Errno 111] Connection refused'))
2022-01-27T00:58:59.617:INFO:localstack.services.infra: Starting mock EC2 service on http port 4566 ...
2022-01-27T00:58:59.618:INFO:localstack.services.motoserver: starting moto server on http://0.0.0.0:46989
2022-01-27T00:58:59.618:DEBUG:localstack.services.plugins: checking service health ec2:46989
2022-01-27T00:59:02.557:INFO:localstack.services.infra: Starting mock IAM service on http port 4566 ...
2022-01-27T00:59:02.557:DEBUG:localstack.services.plugins: checking service health iam:46989
2022-01-27T00:59:04.263:INFO:localstack.services.infra: Starting mock EKS service on http port 4566 ...
2022-01-27T00:59:04.263:DEBUG:localstack.services.plugins: checking service health eks:52879
2022-01-27 00:59:04,264:API:  * Running on all addresses.
   WARNING: This is a development server. Do not use it in a production deployment.
2022-01-27T00:59:04.767:DEBUG:localstack.utils.docker_utils: Getting networks for container: localstack-pulumi-eks-repo_localstack_1
2022-01-27T00:59:04.768:INFO:localstack.services.awslambda.lambda_utils: Determined lambda container network: localstack-pulumi-eks-repo_internal
2022-01-27T00:59:04.768:DEBUG:localstack.utils.docker_utils: Getting ipv4 address for container localstack-pulumi-eks-repo_localstack_1 in network localstack-pulumi-eks-repo_internal.
2022-01-27T00:59:04.771:INFO:localstack.services.awslambda.lambda_utils: Determined main container target IP: 172.22.0.2
2022-01-27T00:59:04.773:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'create', 'eks-cluster-952e746', '--api-port', '6443', '-p', '8081:80@loadbalancer']
2022-01-27T00:59:34.773:INFO:localstack_ext.services.eks.k8s_utils: Error creating cluster eks-cluster-952e746 - deleting and retrying:
2022-01-27T00:59:34.774:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'delete', 'eks-cluster-952e746']
2022-01-27T00:59:35.855:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'create', 'eks-cluster-952e746', '--api-port', '6443', '-p', '8081:80@loadbalancer']
2022-01-27T01:00:05.864:INFO:localstack_ext.services.eks.k8s_utils: Error creating cluster eks-cluster-952e746 - deleting and retrying:
2022-01-27T01:00:05.865:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'delete', 'eks-cluster-952e746']
2022-01-27T01:00:06.913:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'create', 'eks-cluster-952e746', '--api-port', '6443', '-p', '8081:80@loadbalancer']
2022-01-27T01:00:36.914:INFO:localstack_ext.services.eks.k8s_utils: Error creating cluster eks-cluster-952e746 - deleting and retrying:
2022-01-27T01:00:36.914:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'delete', 'eks-cluster-952e746']
2022-01-27T01:00:37.954:INFO:localstack.utils.run: Thread run method <function start_cluster.<locals>._startup at 0x7fb2c14c2820>(None) failed:  Traceback (most recent call last):
  File "/opt/code/localstack/localstack/utils/run.py", line 153, in run
    result = self.func(self.params, **kwargs)
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/eks_api.py.enc", line 50, in _startup
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/k8s_utils.py.enc", line 109, in create_cluster
  File "/opt/code/localstack/localstack/utils/common.py", line 945, in retry
    raise raise_error
  File "/opt/code/localstack/localstack/utils/common.py", line 941, in retry
    return function(**kwargs)
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/k8s_utils.py.enc", line 104, in _try
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/k8s_utils.py.enc", line 127, in _try_create_cluster
AssertionError

Waiting for all LocalStack services to be ready
2022-01-27 01:01:41,386 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2022-01-27 01:01:41,388 INFO supervisord started with pid 15
2022-01-27 01:01:42,392 INFO spawned: 'infra' with pid 21
. .venv/bin/activate; LOCALSTACK_INFRA_PROCESS=1 exec bin/localstack start --host --no-banner

LocalStack version: 0.13.3.3
LocalStack Docker container id: c51cc7988d28
LocalStack build date: 2022-01-25
LocalStack build git hash: 5cb915bd

2022-01-27T01:01:43.329:DEBUG:stevedore.extension: found extension EntryPoint(name='register_partition_adjusting_proxy_listener', value='localstack.plugins:register_partition_adjusting_proxy_listener', group='localstack.hooks.on_infra_start')
2022-01-27T01:01:43.329:DEBUG:stevedore.extension: found extension EntryPoint(name='setup_pro_infra', value='localstack_ext.plugins:setup_pro_infra', group='localstack.hooks.on_infra_start')
2022-01-27T01:01:43.334:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.register_partition_adjusting_proxy_listener = <function register_partition_adjusting_proxy_listener at 0x7fa6f0e19040>)
2022-01-27T01:01:43.334:DEBUG:plugin.manager: plugin localstack.hooks.on_infra_start:register_partition_adjusting_proxy_listener is disabled
2022-01-27T01:01:43.334:DEBUG:plugin.manager: instantiating plugin PluginSpec(localstack.hooks.on_infra_start.setup_pro_infra = <function setup_pro_infra at 0x7fa6f0d67b80>)
2022-01-27T01:01:43.334:DEBUG:plugin.manager: loading plugin localstack.hooks.on_infra_start:setup_pro_infra
2022-01-27T01:01:43.334:DEBUG:localstack_ext.bootstrap.install: Using cached SSL certificate (less than 6hrs since last update).
2022-01-27T01:01:43.334:WARNING:localstack_ext.plugins: !! Configuring EDGE_PORT=4566 without setting EDGE_PORT_HTTP may lead to issues; better leave the defaults, or set EDGE_PORT=443 and EDGE_PORT_HTTP=4566
2022-01-27 01:01:44,336 INFO success: infra entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-01-27T01:01:44.377:INFO:localstack_ext.bootstrap.licensing: Successfully activated API key
2022-01-27T01:01:44.551:DEBUG:localstack.utils.run: Executing command: whoami
2022-01-27T01:01:44.556:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('\n' + f)" /etc/resolv.conf
2022-01-27T01:01:44.583:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('nameserver 0.0.0.0\n' + f)" /etc/resolv.conf
2022-01-27T01:01:44.609:DEBUG:localstack.utils.run: Executing command:  python -c "import sys; f=open(sys.argv[1]).read(); open(sys.argv[1], 'w').write('# The following line is required by LocalStack\n' + f)" /etc/resolv.conf
Starting DNS servers (tcp/udp port 53 on 0.0.0.0)...
Starting edge router (https port 4566)...
2022-01-27T01:01:47.030:INFO:localstack_ext.utils.aws.metadata_service: Starting AWS instance metadata service on port 80
2022-01-27T01:01:47.042:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T01:01:47.050:INFO:botocore.credentials: Found credentials in environment variables.
2022-01-27T01:01:47.057:DEBUG:localstack.services.install: getting kinesis-mock for linux x86_64
2022-01-27T01:01:47.057:DEBUG:localstack.services.install: kinesis-mock found at /opt/code/localstack/localstack/infra/kinesis-mock/kinesis-mock-linux-amd64-static
2022-01-27T01:01:47.057:DEBUG:localstack.utils.run: Executing command: cd "/opt/code/localstack/localstack/infra/dynamodb" && zip -u DynamoDBLocal.jar log4j2.xml || true
2022-01-27T01:01:47.105:DEBUG:localstack_ext.bootstrap.install: Using cached SSL certificate (less than 6hrs since last update).
[2022-01-27 01:01:47 +0000] [22] [INFO] Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-01-27T01:01:47.110:INFO:hypercorn.error: Running on https://0.0.0.0:4566 (CTRL + C to quit)
Ready.
2022-01-27T01:01:57.903:DEBUG:localstack_ext.services.dns_server: Determined fallback dns: 127.0.0.11
2022-01-27T01:02:18.609:WARNING:localstack_ext.services.ec2.ec2_starter: VM manager not reachable: MyHTTPConnectionPool(host='172.17.0.1', port=4600): Max retries exceeded with url: / (Caused by NewConnectionError('<urllib3.connection.HTTPConnection object at 0x7fa6eb7830a0>: Failed to establish a new connection: [Errno 111] Connection refused'))
2022-01-27T01:02:18.610:INFO:localstack.services.infra: Starting mock EC2 service on http port 4566 ...
2022-01-27T01:02:18.610:INFO:localstack.services.motoserver: starting moto server on http://0.0.0.0:59137
2022-01-27T01:02:18.611:DEBUG:localstack.services.plugins: checking service health ec2:59137
2022-01-27T01:02:21.693:INFO:localstack.services.infra: Starting mock IAM service on http port 4566 ...
2022-01-27T01:02:21.693:DEBUG:localstack.services.plugins: checking service health iam:59137
2022-01-27T01:02:23.668:INFO:localstack.services.infra: Starting mock EKS service on http port 4566 ...
2022-01-27T01:02:23.668:DEBUG:localstack.services.plugins: checking service health eks:37645
2022-01-27 01:02:23,669:API:  * Running on all addresses.
   WARNING: This is a development server. Do not use it in a production deployment.
2022-01-27T01:02:24.180:DEBUG:localstack.utils.docker_utils: Getting networks for container: localstack-pulumi-eks-repo_localstack_1
2022-01-27T01:02:24.186:INFO:localstack.services.awslambda.lambda_utils: Determined lambda container network: localstack-pulumi-eks-repo_internal
2022-01-27T01:02:24.186:DEBUG:localstack.utils.docker_utils: Getting ipv4 address for container localstack-pulumi-eks-repo_localstack_1 in network localstack-pulumi-eks-repo_internal.
2022-01-27T01:02:24.196:INFO:localstack.services.awslambda.lambda_utils: Determined main container target IP: 172.22.0.2
2022-01-27T01:02:24.199:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'create', 'eks-cluster-1d7138a', '--api-port', '6443', '-p', '8081:80@loadbalancer']
2022-01-27T01:02:54.201:INFO:localstack_ext.services.eks.k8s_utils: Error creating cluster eks-cluster-1d7138a - deleting and retrying:
2022-01-27T01:02:54.202:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'delete', 'eks-cluster-1d7138a']
2022-01-27T01:02:55.255:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'create', 'eks-cluster-1d7138a', '--api-port', '6443', '-p', '8081:80@loadbalancer']
2022-01-27T01:03:25.257:INFO:localstack_ext.services.eks.k8s_utils: Error creating cluster eks-cluster-1d7138a - deleting and retrying:
2022-01-27T01:03:25.257:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'delete', 'eks-cluster-1d7138a']
2022-01-27T01:03:26.314:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'create', 'eks-cluster-1d7138a', '--api-port', '6443', '-p', '8081:80@loadbalancer']
2022-01-27T01:03:56.314:INFO:localstack_ext.services.eks.k8s_utils: Error creating cluster eks-cluster-1d7138a - deleting and retrying:
2022-01-27T01:03:56.315:DEBUG:localstack.utils.run: Executing command: ['/var/lib/localstack/var_libs/k3d.linux.bin', 'cluster', 'delete', 'eks-cluster-1d7138a']
2022-01-27T01:03:57.395:INFO:localstack.utils.run: Thread run method <function start_cluster.<locals>._startup at 0x7fa6ea998a60>(None) failed:  Traceback (most recent call last):
  File "/opt/code/localstack/localstack/utils/run.py", line 153, in run
    result = self.func(self.params, **kwargs)
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/eks_api.py.enc", line 50, in _startup
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/k8s_utils.py.enc", line 109, in create_cluster
  File "/opt/code/localstack/localstack/utils/common.py", line 945, in retry
    raise raise_error
  File "/opt/code/localstack/localstack/utils/common.py", line 941, in retry
    return function(**kwargs)
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/k8s_utils.py.enc", line 104, in _try
  File "/opt/code/localstack/.venv/lib/python3.8/site-packages/localstack_ext/services/eks/k8s_utils.py.enc", line 127, in _try_create_cluster
AssertionError

```
---

> Original README from pulumi/examples


# AWS Golang EKS Cluster
This example creates an AWS EKS Cluster and deploys a sample container application to it

## Deploying the App

 To deploy your infrastructure, follow the below steps.

### Prerequisites

1. [Install Pulumi](https://www.pulumi.com/docs/get-started/install/)
2. [Install Go 1.13](https://golang.org/doc/install)
3. [Configure AWS Credentials](https://www.pulumi.com/docs/intro/cloud-providers/aws/setup/)
4. [Install `aws-iam-authenticator`](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
4. [Install `kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

### Steps

After cloning this repo, run these commands from the working directory:

1. Create a new stack, which is an isolated deployment target for this example:

    ```bash
    $ pulumi stack init dev
    ```

2. Set your desired AWS region:

    ```bash
    $ pulumi config set aws:region us-east-1 # any valid AWS region will work
    ```

4. Execute the Pulumi program to create our EKS Cluster:

	```bash
	pulumi up
	```

5. After 10-15 minutes, your cluster will be ready, and the kubeconfig JSON you'll use to connect to the cluster will
   be available as an output. You can save this kubeconfig to a file like so:

    ```bash
    $ pulumi stack output kubeconfig --show-secrets >kubeconfig.json
    ```

    Once you have this file in hand, you can interact with your new cluster as usual via `kubectl`:

    ```bash
    $ KUBECONFIG=./kubeconfig.json kubectl get nodes
    ```

6. Ensure that the application is running as expected:

    ```bash
   $ curl $(pulumi stack output url)
   ```


7. Afterwards, destroy your stack and remove it:

	```bash
	pulumi destroy --yes
	pulumi stack rm --yes
	```
