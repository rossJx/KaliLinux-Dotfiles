#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#Fix Java problem
export _JAVA_AWT_WM_NONREPARENTING=1

source ~/powerlevel10k/powerlevel10k.zsh-theme

#To customize prompt, run ´p10k configure´ or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Manual configuration
PATH=/usr/local/bin:/usr/bin:/usr/sbin:/bin:/usr/local/games:/usr/games:/home/ross/.cargo/bin

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

function extractPorts(){
    echo -e "\n${yellowColour}[*] Extracting information...${endColour}\n"
    ip_address=$(cat openPorts | grep -oP "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" | sort -u)
    ports=$(cat openPorts | grep -oP "\d{1,5}/tcp" | awk '{print $1}' FS='/' | xargs | tr " " ",")

    echo -e "${blueColour}[*] IP address: ${endColour}${grayColour}$ip_address${endColour}"
    echo -e "${blueColour}[*] Open ports: ${endColour}${grayColour}$ports${endColour}"

    echo $ports | tr -d '\n' | xclip -sel clip

    echo -e "\n${blueColour}[*] Ports copied to clipboard! :)${endColour}\n"
}
