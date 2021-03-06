#!/usr/bin/env bash
source ./scripts/cfg/test.sh
main_dir=$(pwd)
# mkdir $(pwd)/$main_dir
# cd $main_dir


function create_package {
    #echo "Enter name of the package"
    # mkdir $(pwd)/$main_dir
    # cd $main_dir
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

    cd ../..
    sed -i "s/template_pkg_name/$pkg_name/" CMakeLists.txt launch/default.launch
    sed -i "s/node_name/$node_name/" CMakeLists.txt
    sed -i "s/template_pkg_node_name/$pkg_name/" CMakeLists.txt launch/default.launch src/${pkg_name}_node.cpp
    sed -i "s/template_pkg_node/$node_name/" launch/default.launch src/${pkg_name}.cpp
    sed -i "s/template_pkg/$pkg_name/" src/${pkg_name}.cpp
    sed -i "s/template_pkg_name/$pkg_name/" src/${pkg_name}.cpp include/${pkg_name}/${pkg_name}.hpp

    x=15
    for depend in ${depends[@]}
    do
        sed -i "${x}i \ \ \ \ <depend>${depend}</depend>" package.xml
        ((x++))
    done

    cd ../

}

# create_package

length=${#pkg_names[@]}
for ((counter=0; counter<$length; counter++))
do 
    pkg_name=${pkg_names[$counter]}
    node_name=${node_names[$counter]}
    depends=${dependencies[$counter]}
    create_package
done