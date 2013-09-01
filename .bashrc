#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$TERM" != "linux" ]; then
	if which tmux 2>&1 >/dev/null; then
	    # if no session is started, start a new session
	    test -z ${TMUX} && tmux

	    # when quitting tmux, try to attach
	    while test -z ${TMUX}; do
		tmux attach || break
	    done
	fi
fi

source ~/.git-prompt.sh

#export TERM=xterm-256color
#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;16m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[0;32m\]$(__git_ps1 " (%s)") \$ \[\e[m\]\[\e[0;00m\] '
#PS1='$(tput bold)\u $(tput setaf 154)\w$(tput setaf 197)$(__git_ps1 " (%s)")$(tput sgr0)$(tput setaf 154)$(tput bold) \$ $(tput sgr0)'
#PS1='[\u $(tput setaf 154)$(tput bold)\w$(tput setaf 197)$(__git_ps1 " (%s)")$(tput setaf 154)] \$ $(tput sgr0)'
#PS1='\u $(tput setaf 5)$(tput bold)\w$(tput setaf 6)$(__git_ps1 " (%s)")$(tput setaf 5) \$ $(tput sgr0)'
export PYTHONPATH=:/home/seb/workspace:/home/seb/workspace
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'set colorcolumn=0' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
alias grep='grep --color=auto' 
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias lt='ls -clthra'
eval $(dircolors -b)
alias ping='ping -c 3'
alias ..='cd ..'
alias hist='history | grep'
alias tmux='tmux -2'
alias less='/usr/share/vim/vim73/macros/less.sh'
alias moff='sleep 1 && xset dpms force off'
alias duh='du -hs * | sort -h'
alias tmuxp=/home/seb/.tmux_code_session.sh

alias xrandrs='xrandr --output LVDS1 --auto --primary;xrandr --output VGA1 --auto --same-as LVDS1'
alias xrandrr='xrandr --output LVDS1 --auto --primary;xrandr --output VGA1 --noprimary --auto --right-of LVDS1'
alias xrandrl='xrandr --output LVDS1 --auto --primary;xrandr --output VGA1 --noprimary --auto --left-of LVDS1'
alias xrandro='xrandr --output LVDS1 --off;xrandr --output VGA1 --auto'
alias xrandrn='xrandr --output LVDS1 --auto;xrandr --output VGA1 --off'
alias xrandra='xrandr --output LVDS1 --auto --primary;xrandr --output VGA1 --noprimary --auto --above LVDS1'
alias xrandrb='xrandr --output LVDS1 --auto --primary;xrandr --output VGA1 --noprimary --auto --below LVDS1'
alias xrandroff='xrandr --output LVDS1 --auto --primary;xrandr --output VGA1 --off'

alias mntpi=/home/seb/.connect.sh
alias umntpi='fusermount -u /home/seb/rasp'

alias linarofs='sshfs linaro@linaro-alip.intern.kom.e-technik.tu-darmstadt.de:/home/linaro /home/seb/workspace/linaro'
alias linaro='ssh -X linaro@linaro-alip.intern.kom.e-technik.tu-darmstadt.de'
alias linarofsh='sshfs linaro@linaro-alip.fritz.box:/home/linaro /home/seb/workspace/linaro'
alias linaroh='ssh -X linaro@linaro-alip.fritz.box'

alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'

alias fun='figlet -f $(ls /usr/share/figlet/fonts/*.flf | shuf -n1) "als
OB EY"| cowsay -n -f $(ls /usr/share/cows/ | shuf -n1)'
