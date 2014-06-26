#!/bin/bash
# arne - Initial start

set -e

username='arnebech'

if branch=$(git symbolic-ref --short -q HEAD)
then

  url="https://github.com/${username}/datapad-web/compare/datapad:develop...${branch}"

  echo "This will push ${branch} to origin, and open the PR page for you."
  echo "Did you remember to run GRUNT TEST?"
  echo "Hit enter to continue:"
  read
else
  echo "Not currently on any branch!"
  exit
fi

echo "Pushing branch"
git push -u origin $branch

open $url

