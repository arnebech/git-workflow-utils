#!/bin/bash
# arne - Settigns

# override these variables in your 'setting.user.sh' file

## VARS THAT MUST BE OVERRIDEN IN YOUR USER SETTINGS
GITHUB_USERNAME="No user name set"

## OPTIONAL VAR TO OVERRIDE ##
UPSTREAM_REMOTE_NAME="upstream" # the "main" repo
UPSTREAM_DEV_BRANCH="develop"
ORIGIN_REMOTE_NAME="origin" # your fork
RELEASE_BRANCH_REGEX="release_v[0-9]\+$"




## OTHER

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"



# tput colors
# 0 – Black
# 1 – Red
# 2 – Green
# 3 – Yellow
# 4 – Blue
# 5 – Magenta
# 6 – Cyan
# 7 – White


A_RED=$(tput setaf 1)
A_CYAN=$(tput setaf 6)
A_BOLD=$(tput bold)
A_NO=$(tput sgr0)

user_settings="${SCRIPT_DIR}/settings.user.sh"

if [ -f "$user_settings" ]; then
    source "$user_settings"
else
    echo "${A_RED}Please set up 'settings.user.sh' in '${dir}' with your settings${A_NO}"
    exit
fi


