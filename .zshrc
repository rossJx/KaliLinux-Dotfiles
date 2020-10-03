Fix Java problem
export _JAVA_AWT_WM_NONREPARENTING=1

source ~/powerlevel10k/powerlevel10k.zsh-theme

#To customize prompt, run ´p10k configure´ or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Manual configuration
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

#Manual aliases
alias ls='lsd --group-dirs=first'
alias lsl='lsd -lh --group-dirs=first'
alias lsal='lsd -lha --group-dirs=first'
alias cat='/usr/bin/bat --paging=never'

#Manual plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Manual functions
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}
