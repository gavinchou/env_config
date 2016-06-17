#!/bin/bash

## @brief  install linux config
## @author Gavin Chou
## @email  gavineaglechou@gmail.com
## @date   2016-06-03-Fri

function digitaldatetime() {
  echo `date +"%Y%m%d%H%M%S"`
}

env_config=`pwd -P`
cd $HOME
# backup
mv .bash_profile .bash_profile.`digitaldatetime`2>/dev/null
mv .bashrc .bashrc.`digitaldatetime`2>/dev/null
mv .inputrc .inputrc.`digitaldatetime`2>/dev/null
mv git-completion.bash git-completion.bash.`digitaldatetime`2>/dev/null
mv .gitconfig .gitconfig.`digitaldatetime`2>/dev/null

ln -s ${env_config}/bash_profile_linux .bash_profile
ln -s ${env_config}/bashrc_linux .bashrc
ln -s ${env_config}/inputrc_linux .inputrc
ln -s ${env_config}/git-completion.bash git-completion.bash
ln -s ${env_config}/gitconfig .gitconfig

echo "enjoy!"
