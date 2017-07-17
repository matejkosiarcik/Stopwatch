#!/bin/sh
#
# helpers.sh
# Copyright © 2017 Matej Kosiarcik. All rights reserved.
# This file contains helper functions for tools
#

# setup
set -euf
cd "$(dirname "${0}")/.."

# this removes excessive whitespace
strip() {
    printf "%s\n" "$(cat -s "${1}")" >"${1}"                   # strip multiple empty lines and trailing newlines
    printf "%s\n" "$(sed 's~[[:space:]]*$~~' <"${1}")" >"${1}" # remove trailing whitespace
}
