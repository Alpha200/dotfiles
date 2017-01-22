source /usr/share/nvm/init-nvm.sh
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

alias nterm='urxvt -cd $PWD&!'
alias tp='trash-put'
alias te='trash-empty'
alias mktmp='cd $(mktemp -d)'
alias trans='dict -d eng-deu'

# Skip everything after this line if not interactive
[[ $- != *i* ]] && return

#task next

echo
git --git-dir ~/.homesick/repos/dotfiles/.git --work-tree ~/.homesick/repos/dotfiles status -s
git --git-dir ~/.homesick/repos/dotfiles-private/.git --work-tree ~/.homesick/repos/dotfiles-private status -s
homeshick --quiet refresh
