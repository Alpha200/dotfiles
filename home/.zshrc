source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source /opt/kube-ps1/kube-ps1.sh

alias nterm='urxvt -cd $PWD&!'
alias tp='trash-put'
alias te='trash-empty'
alias mktmp='cd $(mktemp -d)'
alias pdfgrep='pdfgrep -in'
alias open="nautilus . > /dev/null 2>&1 &!"
alias vim="nvim"
alias ssh="TERM=xterm-color ssh"

export LP_PS1_PREFIX='$(kube_ps1) '
export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_CTX_COLOR=cyan
export KUBE_PS1_NS_COLOR=blue
export KUBE_PS1_PREFIX=[
export KUBE_PS1_SUFFIX=]

kubeoff() {
  export LP_PS1_PREFIX=""
}

pless() {
  pygmentize -f terminal256 -O style=monokai -g $1 | less -r
}

# Skip everything after this line if not interactive
[[ $- != *i* ]] && return

echo
git --git-dir ~/.homesick/repos/dotfiles/.git --work-tree ~/.homesick/repos/dotfiles status -s
git --git-dir ~/.homesick/repos/dotfiles-private/.git --work-tree ~/.homesick/repos/dotfiles-private status -s
homeshick --quiet refresh
