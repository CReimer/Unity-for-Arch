#!/usr/bin/env bash

source "$(dirname ${0})/PKGBUILD"

echo "Getting latest Ubuntu version..."
UBUNTU_VER=($(wget -q 'http://packages.ubuntu.com/quantal/source/indicator-printers' -O - | sed -n 's/.*>indicator-printers_\(.*\)-\(.*\)\.diff\.gz<.*/\1 \2/p'))

echo "Getting latest upstream version..."
UPSTREAM_VER=$(wget -q 'https://launchpad.net/indicator-printers/+download' -O - | sed -n 's/.*indicator-printers-\(.*\)\.tar\.gz.*/\1/p' | head -n 1)

echo ""

echo -e "PKGBUILD version: ${_actual_ver} ${_ubuntu_rel}"
echo -e "Upstream version: ${UPSTREAM_VER}"
echo -e "Ubuntu version:   ${UBUNTU_VER[@]}"
