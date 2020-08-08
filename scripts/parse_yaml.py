#!/usr/bin/python3
import os

if( os.system("pip3 list | grep yaml > /dev/null") ):
    pass
else :
    os.system("pip3 install pyYAML > /dev/null")

import yaml
import subprocess
import sys

if(yaml.__version__ < "5.3.1"):
    os.system("pip3 install -U pyYAML > /dev/null")

path = sys.argv[1]
f = open(path+ "/config.sh","w+")
f.write("#!usr/bin/env bash\n")
with open(path + "/config.yaml") as file:
    yaml_file = yaml.load(file ,Loader=yaml.FullLoader)

    for item , value in yaml_file.items():
        command  =  item + "=(" + \
                    " ".join(["'" + string.replace("\t","").replace("'","").replace("[","").replace("]","").strip() + "'" \
                    for string in value.strip().replace("-","").split("\n")]) \
                    + ")"
        # subprocess.Popen(command, shell=True, executable='/bin/bash')
        f.write(command + "\n")
        
