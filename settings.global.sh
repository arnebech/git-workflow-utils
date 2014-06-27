#!/bin/bash
# arne - Settigns

# override these variables in your 'setting.user.sh' file

## VARS THAT MUST BE OVERRIDEN IN YOUR USER SETTINGS

GITHUB_USERNAME="No user name set"



## OTHER

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

RED='\033[00;31m'
END_COLOR='\033[00m'

user_settings="${SCRIPT_DIR}/settings.user.sh"

if [ -f "$user_settings" ]; then
    source "$user_settings"
else
    echo -e "${RED}Please set up 'settings.user.sh' in '${dir}' with your settings${END_COLOR}"
    exit
fi

