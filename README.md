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
   At this point you can look at localstack logs in another terminal
4. Cleanup to run it again...
    ```bash
    ./cleanup_to_try_again.sh
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
