# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin



function importrc(){
	test -f "$1" && source "$1" ;
}

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    importrc "$HOME/.bashrc"
fi

export EDITOR=vi

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
pathmunge_many /bin /sbin  /usr/bin /usr/sbin $HOME/abin $HOME/bin $HOME/dawn/bin $HOME/dawn/bin/fred.imagemagick.scripts


ARCH=$(uname -m)
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
ldPathMunge_many /usr/lib /usr/local/lib ~/lib/${ARCH}

#dawnsong Env config
TIME_LOGIN=`date`



importrc ~/.bash_quest
export PATH

importrc ~/.bash_dawnfunc
