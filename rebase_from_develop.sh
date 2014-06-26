#!/bin/bash
# arne - Initial start

set -e

if branch=$(git symbolic-ref --short -q HEAD)
then
  echo "This will rebase current branch (${branch}) on top of upstream/develop."
  echo "Enter to continue:"
  read
else
  echo "Not currently on any branch!"
  exit
fi

echo "Fetching upstream"
git fetch upstream

echo "Rebasing"
git rebase upstream/develop
