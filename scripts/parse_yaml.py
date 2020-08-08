#!/usr/bin/python3
import os

if( os.system("pip3 list | grep yaml > /dev/null") ):
    pass
else :
    os.system("pip3 install pyYAML > /dev/null")

import yaml
import subprocess

if(yaml.__version__ < "5.3.1"):
    os.system("pip3 install -U pyYAML > /dev/null")

with open(r"cfg/config.yaml") as file:
    yaml_file = yaml.load(file ,Loader=yaml.FullLoader)

    for item , value in yaml_file.items():
        command  =  "export" + item + "=(" + \
                    " ".join(["'" + string.replace("\t\t\t","").replace("'","").replace("[","").replace("]","").strip() + "'" \
                    for string in value.strip().replace("-","").split("\n")]) \
                    + ")"
        subprocess.Popen(command, shell=True, executable='/bin/bash')
