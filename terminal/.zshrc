# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
neovim_alias() {
    if [ "$#" -gt 0 ]; then
        # If there are arguments, open them in nvim directly
        nvim "$@"
    else
        # If no arguments, use fzf to find a file/dir
        target=$(fdfind --hidden --exclude .git | fzf-tmux -p)
        initial_dir=$(pwd)
        if [ -n "$target" ]; then
            cd "$target"
            nvim .
            cd "$initial_dir"
        fi
    fi
}
alias v=neovim_alias
# Aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Go stuff
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export GOPRIVATE=github.com/joaovictorsl/gorkpool,github.com/joaovictorsl/bencoding
# Go stuff

# NVM stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# NVM stuff

# Docker stuff
clean_docker_images() {
    docker rmi $(docker images -q)
}

clean_docker_containers() {
    docker rm $(docker ps -qa) --force
}

clean_docker_volumes() {
    docker volume rm $(docker volume ls -q)
}

clean_docker() {
    clean_docker_containers
    clean_docker_images
    clean_docker_volumes
}
# Docker sutff
