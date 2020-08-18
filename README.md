# ariitk_template
Template repository for ease of setting up a new project


# Installation and Usage

run `sudo ./setup.sh` to install this package.

For making meta_pkg , go into the src folder of your workspace-
run `ariitk_create_metapkg`   
change the template file according to your need and press `:x` to save changes.

For making simple_pkg , go into the src folder of your workspace-  
run  `ariitk_create_pkg <pkg_name> <node_name> <dependencies>`   

For creating a dependencies.rosinstall, go into the package.  
run ```ariitk_rosinstall``` : vim editor will open a file with ```repositories=""```   
Fill in the common name of the repositories you want. Some will already be available by default, for others you will get a prompt to set the github link.   
The list of common repos and their links is available inside ariitk_rosinstall.

# Without installation


Use command   
`wget https://tinyurl.com/ariitk && chmod +x ariitk && ./ariitk && rm -rf ariitk`    
to create a meta package and setup git remote accordingly. You do not need to clone this package to run this command.   
Vim will open a text file and in that you should edit the directory paths, package names and dependencies as per your need.





