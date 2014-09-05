#!/bin/bash
# arne - Initial start
#
# source this script from profile for easy setup

shopt -s expand_aliases

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias gf_feature_branch="${dir}/create_feature_branch.sh"
alias gf_try_pr="${dir}/try_pr.sh"
alias gf_rebase_from_dev="${dir}/rebase_from_develop.sh"
alias gf_create_pr="${dir}/create_pr.sh"
alias gf_latest_dev="${dir}/latest_develop.sh"
