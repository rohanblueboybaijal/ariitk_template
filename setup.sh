#!/bin/bash

if [ ! -f ~/.bash_profile ]; then
    touch ~/.bash_profile    
fi

if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi

if [[ ! $(grep -x "export PATH=$PATH":$HOME/bin"" ~/.bash_profile) ]]; then
  echo -e "export PATH=$PATH":$HOME/bin"" >> ~/.bash_profile
fi

if [[ ! $(grep -x "source ~/.bash_profile" ~/.bashrc) ]]; then
  sed -i "1i source ~/.bash_profile" ~/.bashrc
fi

source ~/.bash_profile

cp -r ./scripts/ariitk_create_metapkg ~/bin/
cp -r ./scripts/ariitk_create_pkg ~/bin/
cp -r ./scripts/ariitk_create_lib ~/bin/

chmod +x ~/bin/ariitk_create_metapkg
chmod +x ~/bin/ariitk_create_pkg
chmod +x ~/bin/ariitk_create_lib
