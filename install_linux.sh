#!/bin/bash

## @brief  install linux config
## @author Gavin Chou
## @email  gavineaglechou@gmail.com
## @date   2016-06-03-Fri

function digitaldatetime() {
  date +"%Y%m%d%H%M%S"
}

env_config=`pwd -P`
cd $HOME
# backup
# mv .bash_profile .bash_profile.$(digitaldatetime) 2>/dev/null
# mv .bashrc .bashrc.$(digitaldatetime) 2>/dev/null
# mv .git-completion.bash .git-completion.bash.$(digitaldatetime) 2>/dev/null
mv .inputrc .inputrc.bak.$(digitaldatetime) 2>/dev/null
mv .gitconfig .gitconfig.bak.$(digitaldatetime) 2>/dev/null
mv .tmux.conf .tmux.conf.bak.$(digitaldatetime) 2>/dev/null
mv .zshrc .zshrc.bak.$(digitaldatetime) 2>/dev/null
mv .editrc .editrc.bak.$(digitaldatetime) 2>/dev/null
mv .tigrc .tigrc.bak.$(digitaldatetime) 2>/dev/null

# ln -s ${env_config}/bash_profile_linux .bash_profile
# ln -s ${env_config}/bashrc_linux .bashrc
# ln -s ${env_config}/git-completion.bash .git-completion.bash
ln -s ${env_config}/inputrc_linux .inputrc
ln -s ${env_config}/gitconfig .gitconfig
ln -s ${env_config}/tmux.conf .tmux.conf
ln -s ${env_config}/zshrc_linux .zshrc
ln -s ${env_config}/editrc .editrc
ln -s ${env_config}/tigrc .tigrc

echo "enjoy!"
