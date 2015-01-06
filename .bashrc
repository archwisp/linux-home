if [[ "$WINDOW" = "" ]]; then WINDOW="none"; fi
export HISTFILE=~/.bash_history.$WINDOW;

shopt -s histappend

HISTSIZE=10000
HISTFILESIZE=20000

alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
#alias ls="ls --color=auto"
alias phpsearch="fgrep --color=auto -Rn --include=*.php --include=*.phtml"
alias pysearch="fgrep --color=auto -Rn --include=*.py --include=*.pm"
alias screen="screen -mRR"
alias svnstat="svn status --ignore-externals"
alias svnup="svn up --ignore-externals"
# alias git="git --no-pager"
alias gpgswitchcurses='echo "pinentry-program /usr/bin/pinentry-curses" > /home/username/.gnupg/gpg-agent.conf ; gpgconf --reload gpg-agent'

export CLICOLOR=1
export EDITOR=vim
export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_25
export PATH=$PATH:"/opt/local/bin:/opt/local/sbin:$PATH"
export PATH=$PATH:/home/bryan/.gem/ruby/1.9.2/bin

COLOR_RED="\[\e[31;40m\]"
COLOR_GREEN="\[\e[32;40m\]"
COLOR_YELLOW="\[\e[33;40m\]"
COLOR_BLUE="\[\e[34;40m\]"
COLOR_MAGENTA="\[\e[35;40m\]"
COLOR_CYAN="\[\e[36;40m\]"

COLOR_RED_BOLD="\[\e[31;1m\]"
COLOR_GREEN_BOLD="\[\e[32;1m\]"
COLOR_YELLOW_BOLD="\[\e[33;1m\]"
COLOR_BLUE_BOLD="\[\e[34;1m\]"
COLOR_MAGENTA_BOLD="\[\e[35;1m\]"
COLOR_CYAN_BOLD="\[\e[36;1m\]"

COLOR_NONE="\[\e[0m\]"

promptFunc()
{
    PREV_RET_VAL=$?;

    PS1=""

    if [ `whoami` != "root" ]
    then
        PS1="${PS1}${COLOR_GREEN_BOLD}\u@\h ${COLOR_BLUE_BOLD}\w"
    else
        PS1="${PS1}${COLOR_RED_BOLD}\u@\h ${COLOR_BLUE_BOLD}\w"
    fi

    if [ $PREV_RET_VAL -eq 0 ]
    then
        PS1="${PS1} ${COLOR_BLUE_BOLD}\\$ ${COLOR_NONE}"
    else
        PS1="${PS1} ${COLOR_RED_BOLD}[${PREV_RET_VAL}] \\$ ${COLOR_NONE}"
    fi
}

PROMPT_COMMAND="promptFunc; history -a";
#PROMPT_COMMAND="promptFunc;";

###
# Auto-screen invocation. 
# This is a modified approach to the example found here:
# http://taint.org/wk/RemoteLoginAutoScreen
##

if [ "$PS1" != "" -a "$STARTED_SCREEN" = "" ];
then
   export STARTED_SCREEN=1;

   if [ -d $HOME/log/screen ];
   then
      mkdir -p $HOME/log/screen;
   fi

   screen && exit 0;
   echo "Screen failed! continuing with normal bash startup";
fi
