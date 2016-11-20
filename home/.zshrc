export GOPATH=~/.go
export PATH="/home/dsendzik/.go/bin:$PATH"
export PATH="/home/dsendzik/Android/Sdk/platform-tools:$PATH"

source /usr/share/nvm/init-nvm.sh
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

export SSH_AUTH_SOCK=/run/user/1000/gnupg/S.gpg-agent.ssh;
export BROWSER=vivaldi-stable

alias nterm='urxvt -cd $PWD&!'
alias tp='trash-put'
alias te='trash-empty'

# Skip everything after this line if not interactive
[[ $- != *i* ]] && return

task next

echo
git --git-dir ~/.homesick/repos/dotfiles/.git --work-tree ~/.homesick/repos/dotfiles status -s
homeshick --quiet refresh
