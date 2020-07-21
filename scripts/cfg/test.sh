#!/bin/bash

chmod +x $(pwd)/scripts/cfg/config.sh
source $(pwd)/scripts/cfg/config.sh

echo -e "directory_name = $directory_name"
echo -e "pkg_names = ${pkg_names[@]}"
echo -e "node_name = ${node_name[@]}"
echo -e "dependencies = ${dependencies[@]}"
