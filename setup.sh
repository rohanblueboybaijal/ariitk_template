#!/bin/bash

config_file=${2}

if [[ ${1} != "--set" ]] && [[ ${1} != "-s" ]]; then
  printf "error: invalid command\n"
  exit
fi

if [[ $config_file != "yaml" ]] && [[ $config_file != "sh" ]]; then
  printf "error: invalid command\n"
  exit
fi

if [ ! -f ~/.bash_profile ]; then
    touch ~/.bash_profile    
fi

if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi

if [[ ! $(grep -x "export PATH=$PATH":$HOME/bin"" ~/.bash_profile) ]]; then
  echo -e "export PATH=$PATH":$HOME/bin"" >> ~/.bash_profile
fi

sed -i "/export ariitk_config_file_type=yaml/d" ~/.bash_profile
sed -i "/export ariitk_config_file_type=sh/d" ~/.bash_profile
echo -e "export ariitk_config_file_type=${config_file}" >> ~/.bash_profile

if [[ ! $(grep -x "source ~/.bash_profile" ~/.bashrc) ]]; then
  sed -i "1i source ~/.bash_profile" ~/.bashrc
fi

cp -r ./scripts/ariitk_create_metapkg ~/bin/
cp -r ./scripts/ariitk_create_pkg ~/bin/
cp -r ./scripts/ariitk_create_lib ~/bin/
cp -r ./scripts/ariitk_rosinstall ~/bin/

chmod +x ~/bin/ariitk_create_metapkg
chmod +x ~/bin/ariitk_create_pkg
chmod +x ~/bin/ariitk_create_lib
chmod +x ~/bin/ariitk_rosinstall