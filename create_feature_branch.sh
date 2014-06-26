#!/bin/bash
# arne - Initial start


set -e

if test -z "$1"; then
  echo "Enter issue number:"
  read issueNum
else
  issueNum=$1
fi

if test -z "$2"; then
  echo "Enter branch name:"
  read branchName
else
  branchName=$2
fi



name="DAT-${issueNum}-${branchName}"

name=${name//" "/"-"}

echo "Will create branch named $name. Hit enter to continue."
read

echo "Fetching upstream"
git fetch upstream

echo "Checking out new branch"
git checkout -b $name upstream/develop --no-track
