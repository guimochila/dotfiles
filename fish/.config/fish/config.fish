set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# pnpm
set -gx PNPM_HOME "/Users/scaldela/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/scaldela/miniconda3/bin/conda
    eval /Users/scaldela/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

alias vim='nvim'

# fzf bindings
fzf_configure_bindings --directory=\cF --git_status=\cS --git_log=\cG --processes=\cP

# Local PATH
set -gx PATH "$HOME/.local/scripts" $PATH
# Tmux-sessionizer
bind \ct tmux-sessionizer

starship init fish | source
