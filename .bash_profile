# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
#umask 022

importrc(){ test -f "$1" && source "$1" ; }

#importrc /etc/bashrc
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    importrc "$HOME/.bashrc"
fi

##Sewt locale to Default [dawnsong 20080714]
#export LC_ALL=en_US.UTF8
#export LANG=en_US.UTF8
#export LANGUAGE=en_US.UTF8

export EDITOR=vi


#Reference: zhup.profile
ARCH=`uname -m`
#Set Path
pathmunge () {
        if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH=$PATH:$1
           else
              PATH=$1:$PATH
           fi
        fi
}
pathmunge_many(){
	for thePath in $@ ; do
		pathmunge $thePath $2
		#echo $thePath
	done
	export PATH
}
#PROTOMO=/home/programs/protomo-${ARCH}
#I3=/home/programs/i3/${ARCH}
pathmunge_many /bin /sbin  /usr/bin /usr/sbin $HOME/abin $HOME/bin $HOME/dawn/bin

ldPathMunge(){
	if ! echo $LD_LIBRARY_PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
        	LD_LIBRARY_PATH=$1:$LD_LIBRARY_PATH 
	fi 
}
ldPathMunge_many(){
	for thePath in $@ ; do
		ldPathMunge $thePath
	done
	export LD_LIBRARY_PATH
}
ldPathMunge_many /usr/lib /usr/local/lib /home/programs/lib ~/lib/${ARCH}

#dawnsong Env config
TIME_LOGIN=`date`


#import dawn defined functions
importrc "$HOME/.bash_dawnfunc"

