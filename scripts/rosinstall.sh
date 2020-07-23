#!bin/bash

declare -A repos
repos[catkin_simple]=git@github.com:catkin/catkin_simple.git
repos[rotors_simulator]=git@github.com:ethz-asl/rotors_simulator.git
repos[mav_nonlinear_mpc]=git@github.com:AerialRobotics-IITK/mav_control_rw.git
repos[mav_control_rw]=git@github.com:AerialRobotics-IITK/mav_control_rw.git
repos[eigen_catkin]=git@github.com:ethz-asl/eigen_catkin.git
repos[eigen_checks]=git@github.com:ethz-asl/eigen_checks.git
repos[glog_catkin]=git@github.com:ethz-asl/glog_catkin.git
repos[mav_comm]=git@github.com:ethz-asl/mav_comm.git
repos[nlopt]=git@github.com:ethz-asl/nlopt.git
repos[ceres_catkin]=git@github.com:ethz-asl/ceres_catkin.git
repos[voxblox]=git@github.com:ethz-asl/voxblox.git
repos[mav_trajectory_generation]=git@github.com:ethz-asl/mav_trajectory_generation.git

function exists {
    for key in "${!repos[@]}"; do
        if [ "$1" == "$key" ]; then
            echo "exists"
            return 0
        fi
    done
}

file=./dependencies.rosinstall
if test -f "$file"; then
    echo "$file  exists"
else 
    touch dependencies.rosinstall
    echo "Created $file"
fi

touch depend_config.sh
echo repositories="" >>depend_config.sh
vim depend_config.sh
source depend_config.sh
#echo "${repositories[@]}"

for repo in ${repositories[@]}
do
    if [ $( exists $repo ) ]; then
        echo - git: {local-name: $repo, uri: "'${repos[$repo]}'"}  >> ./dependencies.rosinstall
    else
        echo "Enter the github link for $repo :"
        read url
        echo - git: {local-name: $repo, uri: "'$url'"}  >> ./dependencies.rosinstall
    fi
done

rm depend_config.sh