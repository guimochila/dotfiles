set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# pnpm
set -gx PNPM_HOME "/Users/guilherme/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/guilherme/miniconda3/bin/conda
    eval /Users/guilherme/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

alias vim='nvim'
alias rmmodules='find . -name \'node_modules\' -type d -prune -exec rm -rf \'{}\' +'
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

# fzf bindings
fzf_configure_bindings --directory=\cF --git_status=\cS --git_log=\cG --processes=\cP

# Local PATH
set -gx PATH "$HOME/.local/scripts" $PATH
# Tmux-sessionizer
bind \ct tmux-sessionizer

# Add GoPath
set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin

starship init fish | source
