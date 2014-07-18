#!/bin/bash
# arne - Initial start

set -e

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${dir}/settings.global.sh"


if test -z "$1"; then
  echo -n "Enter issue number (e.g. 3245): "
  read issue_num
else
  issue_num=$1
fi

if test -z "$2"; then
  echo -n "Enter branch name (e.g. broken analysis fix): "
  read branch_name
else
  branch_name=$2
fi

if test -z "$3"; then
  echo -n "Is this a release branch fix [y/n]? "
  read -n 1 is_release_fix
  echo ''
else
  is_release_fix=$3
fi

echo "Fetching upstream"
git fetch "$UPSTREAM_REMOTE_NAME"

if [ "$is_release_fix" == "y" ]; then

  ref="refs/remotes/$UPSTREAM_REMOTE_NAME"
  upstream_ref=$(git for-each-ref --format='%(refname:short)' "$ref" | grep "${RELEASE_BRANCH_REGEX}" | sort -r | head -1)

  echo -n "Is $upstream_ref correct release branch [yn]? "
  read -n 1 is_correct_branch
  echo ''

  if [ "$is_correct_branch" != "y" ]; then
    echo "Good luck... Aborting!"
    exit
  fi

  name="RF-DAT-${issue_num}-${branch_name}"

else
  upstream_ref="$UPSTREAM_REMOTE_NAME/$UPSTREAM_DEV_BRANCH"

  name="DAT-${issue_num}-${branch_name}"

fi

name=${name//" "/"-"}


echo -n "Will create branch named $name based of $upstream_ref. Hit enter to continue. "
read

echo "Checking out new branch"
git checkout -b "$name" "$upstream_ref" --no-track
