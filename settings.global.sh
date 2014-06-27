#!/bin/bash
# arne - Settigns

# override these variables in your 'setting.user.sh' file

## VARS THAT MUST BE OVERRIDEN IN YOUR USER SETTINGS

GITHUB_USERNAME="No user name set"



## OTHER

RED='\033[00;31m'
END_COLOR='\033[00m'

if [ -f settings.user.sh ]; then
    source settings.user.sh
else
    dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    echo -e "${RED}Please set up 'settings.user.sh' in '${dir}' with your settings${END_COLOR}"
    exit
fi

