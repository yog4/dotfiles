
for file in ~/.bash/{functions,exports,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

if [ -e $HOME/.proxy_enable ]; then
    proxy_enable
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    autoenv
    history
    aws
    zsh-autosuggestions
    zsh-syntax-highlighting
)
# install zsh-syntax-highlighting in ~/.oh-my-zsh/custom/plugins
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

source $ZSH/oh-my-zsh.sh

if [ -e $HOME/.local.bash_profile ]; then
    source $HOME/.local.bash_profile
fi

# Load Completion if its zsh
compinit

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs virtualenv)
POWERLEVEL9K_AWS_FOREGROUND=123
POWERLEVEL9K_AWS_BACKGROUND=239
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(aws status time)
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=255
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=239
POWERLEVEL9K_DIR_HOME_FOREGROUND=255
POWERLEVEL9K_DIR_HOME_BACKGROUND=239
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=255
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=239
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=255
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=93
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=255
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=93
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=255
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=93
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❯ "
