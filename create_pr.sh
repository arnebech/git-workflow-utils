#!/bin/bash
# arne - Initial start

set -e

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${dir}/settings.global.sh"

if branch=$(git symbolic-ref --short -q HEAD)
then

  url="https://github.com/${GITHUB_USERNAME}/datapad-web/compare/datapad:develop...${branch}"

  echo "This will push ${branch} to origin, and open the PR page for you."
  echo -e "Did you remember to run ${RED}GRUNT TEST and NOSETESTS?${END_COLOR}"
  echo "Hit enter to continue:"
  read
else
  echo "Not currently on any branch!"
  exit
fi

echo "Pushing branch"
git push -u origin $branch

open $url

