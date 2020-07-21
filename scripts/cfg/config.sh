#!/bin/sh

directory_name="ariitk_temp_pkg"                                         #name of your main_directory
pkg_names=('temp_pkg1' 'temp_pkg2' 'temp_pkg3')                          #name of pkgs you want to create
node_names=('temp_pkg1_node' 'temp_pkg2_node' 'temp_pkg3_node')          #name of your node corresponding to the particuar pkg
dependencies=('depen1 depen2 depen3' 'depen1 depen2' 'depen1')           #name of pkg_xml dependencies space seperated corresponding to particular pkg