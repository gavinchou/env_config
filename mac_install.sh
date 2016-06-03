#!/bin/bash

## @brief  install mac config
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

ln -s ${env_config}/.bash_profile_mac .bash_profile
ln -s ${env_config}/.bashr_mac .bashrc
ln -s ${env_config}/.inputrc_mac .inputrc
ln -s ${env_config}/git-completion.bash git-completion.bash

echo "enjoy!"
