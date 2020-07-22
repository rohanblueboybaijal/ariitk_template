#!/bin/bash

if [ ! -f ~/.bash_profiles ]; then
    touch ~/.bash_profiles    
fi

if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi

echo -e "export PATH=$PATH":$HOME/bin"" >> ~/.bash_profiles
echo -e "source ~/.bash_profiles" >> ~/.bashrc
source ~/.bash_profiles

cp -r ./scripts/ariitk_create_metapkg ~/bin/
cp -r ./scripts/ariitk_create_pkg ~/bin/
cp -r ./scripts/ariitk_create_lib ~/bin/

chmod +x ~/bin/ariitk_create_metapkg
chmod +x ~/bin/ariitk_create_pkg
chmod +x ~/bin/ariitk_create_lib
