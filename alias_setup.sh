#!/bin/bash
# arne - Initial start
#
# source this script from profile for easy setup

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias create_feature_branch="${dir}/create_feature_branch.sh"
alias try_pr="${dir}/try_pr.sh"
alias rebase_from_dev="${dir}/rebase_from_develop.sh"
alias create_pr="${dir}/create_pr.sh"
