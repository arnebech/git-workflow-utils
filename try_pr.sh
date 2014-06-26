#!/bin/bash
# arne - Initial start

set -e

if test -z "$1"; then
  echo "Enter Pull Request ID:"
  read pr_id
else
  pr_id=$1
fi

branch_name="pr_${pr_id}"

(git show-ref --verify --quiet refs/heads/"${branch_name}")

if [ $? -eq 0 ]; then

  orig_branch_name=$branch_name
  counter=2

  while [ $? -eq 0 ]; do

    branch_name="${orig_branch_name}-v${counter}"

    counter=$((counter + 1))

    (git show-ref --verify --quiet refs/heads/"${branch_name}")

  done

fi


echo "This will create a new branch '${branch_name}' with PR #${pr_id}. Hit enter to continue."

read

echo "Fetching upstream PR"
git fetch upstream pull/$pr_id/head:$branch_name

echo "Checking out PR"
git checkout $branch_name
