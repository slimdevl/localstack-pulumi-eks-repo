#!/usr/bin/env bash

set -euo pipefail

die () {
    echo "MISSING ${1}"
    echo >&2 "$@"
    exit 1
}

# Check some variables (need real keys)
[ -z "${LOCALSTACK_API_KEY:-}" ] && { die "must have LOCALSTACK_API_KEY for pro features"; }
[ -z "${PULUMI_ACCESS_TOKEN:-}" ] && { die "must have PULUMI_ACCESS_TOKEN for pulumi automation in this repo"; }

# start localstack
docker-compose up -d
sleep 15

# get module dependancies (uncomment these just in case running as root)
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
go mod vendor

# update pulumi
curl -fsSL https://get.pulumi.com | sh
export PATH=$PATH:/root/.pulumi/bin

# setup fake keys for pulumi and localstack to use
export AWS_DEFAULT_REGION=us-east-2
export AWS_REGION=us-east-2
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test

# create a stack
pulumi stack init dev

# quick provision the pulumi config (with references to localstack)
cp Pulumi.dev.yaml.bkup Pulumi.dev.yaml

# run the deploy
pulumi up -y

