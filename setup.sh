#!/bin/bash
set -e

WGGOSRC=${WGGOSRC:-"https://github.com/bernardkkt/wg-go-builder/releases/latest/download/wireguard-go"}
WGSRC=${WGSRC:-"https://github.com/bernardkkt/wg-tools-builder/releases/latest/download/wg"}
WGQUICK=${WGQUICK:-"https://github.com/bernardkkt/wg-tools-builder/releases/latest/download/linux.bash"}

echo "Standalone WireGuard Set-Up"
echo

echo "Retrieving files from the internet..."
mkdir -p ./bin

DLT=""
DLT=`which wget && echo -ne " -O -"  || echo -ne`
DLT=${DLT:-`which curl && echo -ne " -L" || echo -ne`}
test -n "$DLT" || (echo "Error: Neither wget nor curl was found on this system." && exit 1)

$DLT $WGGOSRC > ./bin/wireguard-go
$DLT $WGSRC > ./bin/wg
$DLT $WGQUICK > ./bin/wg-quick

echo "Configuring downloaded files"
ls ./bin/wireguard-go && chmod +x ./bin/wireguard-go
ls ./bin/wg && chmod +x ./bin/wg
ls ./bin/wg-quick && chmod +x ./bin/wg-quick

chmod +x ./run.sh
echo "Done"
