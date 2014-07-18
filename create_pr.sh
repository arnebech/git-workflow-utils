#!/bin/bash
# arne - Initial start

set -e

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${dir}/settings.global.sh"

if branch=$(git symbolic-ref --short -q HEAD); then

  receving_branch=$UPSTREAM_DEV_BRANCH

  if [[ $branch == RF-* ]]; then
    echo "Looks like you're on a release feature branch. Let's check what release branches exist on $UPSTREAM_REMOTE_NAME. Fetching..."
    git fetch "$UPSTREAM_REMOTE_NAME"
    ref="refs/remotes/$UPSTREAM_REMOTE_NAME"
    upstream_ref=$(git for-each-ref --format='%(refname:short)' "$ref" | grep "${RELEASE_BRANCH_REGEX}" | sort -r | head -1)

    receving_branch=${upstream_ref#"$UPSTREAM_REMOTE_NAME"/}

    echo -n "Is${A_CYAN} $receving_branch ${A_NO}correct release branch [yn]? "
    read -n 1 is_correct_branch
    echo ''

    if [ "$is_correct_branch" != "y" ]; then
      echo "Good luck... Aborting!"
      exit
    fi

  fi


  url="https://github.com/${GITHUB_USERNAME}/datapad-web/compare/datapad:${receving_branch}...${branch}"

  echo "This will push ${branch} to origin, and open the PR page for you."
  echo -n "Did you remember to run ${A_RED}GRUNT TEST and NOSETESTS?${A_NO} "
  read
else
  echo "Not currently on any branch!"
  exit
fi

echo "Pushing branch"
git push -u origin $branch
open $url

