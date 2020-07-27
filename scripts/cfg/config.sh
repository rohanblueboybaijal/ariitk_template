#!/bin/sh
directory_path="~/ros/"                                                  #path where your workspace should be created
workspace_name="ariitk_ws"                                               #name of your workspace
directory_name="ariitk_temp_pkg"                                         #name of your main_directory
pkg_names=('temp_pkg1' 'temp_pkg2' 'temp_pkg3')                          #name of pkgs you want to create
node_names=('pkg1' 'pkg2' 'pkg3')                                        #name of your node corresponding to the particuar pkg
dependencies=('depen1 depen2 depen3' 'depen1 depen2' 'depen1')           #name of pkg_xml dependencies space seperated corresponding to particular pkg
rosinstall_dependencies=('catkin_simple')                                #name of your rosinstall dependencies