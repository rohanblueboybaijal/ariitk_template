cmake_minimum_required(VERSION 2.8.3)
project(template_pkg_name)

find_package(catkin_simple REQUIRED)
catkin_simple(ALL_DEPS_REQUIRED)

add_definitions(-std=c++17)
set(CMAKE_BUILD_TYPE Release)

cs_add_library(${PROJECT_NAME}_node_name_lib src/template_pkg_node_name.cpp )
cs_add_executable(${PROJECT_NAME}_node_name_node src/template_pkg_node_name_node.cpp)

target_link_libraries(${PROJECT_NAME}_node_name_node ${PROJECT_NAME}_node_name_lib )

cs_install()
cs_export()