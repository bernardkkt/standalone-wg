#!/bin/bash
set -e

# Prerequisite check
[[ -f ${@} ]] || (echo "Error: Invalid path provided - ${@}" && echo "Usage: ${0} <path to configuration file>" && exit 1)
BINRT=`realpath -e "./bin" || echo -ne`
[[ ! -z ${BINRT} ]] || (echo "Error: cannot find the bin folder. Make sure you have run setup.sh successfully before running this script." && exit 1)

# List binaries
PATH=${BINRT}:${PATH}
which wireguard-go
which wg-quick
which wg

# Run file
CONFP=`readlink -e ${@}`
echo "Selected configuration file: ${CONFP}"
wg-quick up ${CONFP} || wg-quick down ${CONFP}
