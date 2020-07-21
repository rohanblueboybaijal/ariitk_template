#!/bin/bash
source ./scripts/cfg/test.sh
main_dir=$(pwd)


function create_package {
    #echo "Enter name of the package"
    cd $main_dir
    #echo $(pwd)

    mkdir $pkg_name
    cp -r ./template_pkg/* ./$pkg_name
    
    cd ./$pkg_name/src/
    mv template_pkg_node_name.cpp "${pkg_name}.cpp"
    mv template_pkg_node_name_node.cpp "${pkg_name}_node.cpp"

    cd ../include/
    mv  template_pkg ${pkg_name}
    cd ./$pkg_name
    mv template_pkg_node_name.hpp "${pkg_name}.hpp"
}

# create_package

for name in ${pkg_names[@]}
do 
    pkg_name=$name
    create_package
done