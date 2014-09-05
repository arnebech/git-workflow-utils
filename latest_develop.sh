#!/bin/bash
# arne - Initial start

set -e

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${dir}/settings.global.sh"

current_branch=$(git rev-parse --abbrev-ref HEAD)

if [[ $current_branch != "${UPSTREAM_DEV_BRANCH}" ]]; then
  echo "not on ${UPSTREAM_DEV_BRANCH}. checking out ${UPSTREAM_DEV_BRANCH}."
  git checkout "${UPSTREAM_DEV_BRANCH}"
fi

git pull "${UPSTREAM_REMOTE_NAME}" "$UPSTREAM_DEV_BRANCH"
