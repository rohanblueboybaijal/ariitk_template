#include "yaml-cpp/yaml.h"
#include <iostream>


int main() {
    std::cout<<"varun\n";
    YAML::Node config = YAML::LoadFile("./config.yaml");
    std::cout<<"file_found\n";

    // if (config["lastLogin"]) {
    // std::cout << "Last logged in: " << config["lastLogin"].as<DateTime>() << "\n";
    // }

    const std::string name = config["directory_name"].as<std::string>();
    std::cout << "directory_name"<<name << "\n";
    // const std::string password = config["password"].as<std::string>();
    // login(username, password);
    // config["lastLogin"] = getCurrentDateTime();

    // std::ofstream fout("script/cfg/config.yaml");
    // fout << config
}