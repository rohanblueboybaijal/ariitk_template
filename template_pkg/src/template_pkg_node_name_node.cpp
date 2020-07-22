#include <template_pkg/template_pkg_node_name.hpp>

using namespace ariitk::template_pkg_name;

int main(int argc, char** argv) {
    ros::init(argc, argv, "template_pkg_node_name_node");
    ros::NodeHandle nh;

    TemplatePkg obj;

    obj.init(nh);

    ros::Rate loop_rate(10);

    while(ros::ok()) {
        ros::spinOnce();
        obj.run();
        loop_rate.sleep();
    }

    return 0;
} 