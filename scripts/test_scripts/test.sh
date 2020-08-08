#!/bin/bash

chmod +x $(pwd)/../cfg/config.sh
source $(pwd)/../cfg/config.sh

echo -e "directory_name = $directory_name"
echo -e "pkg_names = ${pkg_names[@]}"
echo -e "node_name = ${node_names[@]}"
echo -e "dependencies = ${dependencies[@]}"
