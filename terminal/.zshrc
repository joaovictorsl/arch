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
    mise
    docker
    docker-compose
    git
    helm
    kubectl
    terraform
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
        target=$(fd --hidden --exclude .git | fzf-tmux -p)
        initial_dir=$(pwd)

        if [ -n "$target" ]; then
            # If something was selected try to open it on neovim
            if [ -d "$target" ]; then
                # If target is directory
                cd "$target"
                nvim
            elif [ -f "$target" ]; then
                # If target is a regular file
                # Get the directory of the file
                file_dir=$(dirname "$target")
                # Change to the directory of the file
                cd "$file_dir"
                # Open the file in nvim
                nvim "$(basename "$target")"
            fi
            # Go back to dir where we started our editing from
            cd "$initial_dir"
        fi

    fi
}
alias v=neovim_alias
# Aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Go stuff
export GOPRIVATE=github.com/joaovictorsl/*
# Go stuff

# Flutter stuff
export CHROME_EXECUTABLE=google-chrome-stable
# Flutter stuff

# Docker stuff
clean_docker_containers() {
    docker rm -f $(docker ps -qa)
}

clean_docker_images() {
    docker rmi -f $(docker images -qa)
}

clean_docker_volumes() {
    docker volume rm $(docker volume ls -q)
}

clean_docker_networks() {
    docker network rm $(docker network ls --format {{.Name}} | grep -v 'bridge\|host\|none')
}

clean_docker() {
    clean_docker_containers
    clean_docker_images
    clean_docker_volumes
    clean_docker_networks
}
# Docker sutff

# Start hyprland
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec hyprland
fi
