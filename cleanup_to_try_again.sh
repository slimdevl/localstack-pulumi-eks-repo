#!/usr/bin/env bash

set -euo pipefail

die () {
    echo "MISSING ${1}"
    echo >&2 "$@"
    exit 1
}

# Check some variables (need real keys)
[ -z "${PULUMI_ACCESS_TOKEN:-}" ] && { die "must have PULUMI_ACCESS_TOKEN for pulumi automation in this repo"; }

docker-compose stop

# hard delete the stack
export PATH=$PATH:/root/.pulumi/bin
pulumi stack rm -s dev --force

sudo rm -fr /tmp/localstack

