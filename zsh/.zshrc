# Shared shell config (env, aliases, functions)
for f in ~/.config/shell/env.sh ~/.config/shell/aliases.sh ~/.config/shell/functions.sh; do
    [ -f "$f" ] && . "$f"
done

# --- macOS / Homebrew PATH ---
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# --- history ---
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt share_history inc_append_history hist_ignore_all_dups hist_ignore_space hist_reduce_blanks
setopt auto_cd auto_pushd pushd_ignore_dups interactive_comments

# --- completion ---
fpath=(/opt/homebrew/share/zsh/site-functions "$HOME/.docker/completions" $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# --- keybinds ---
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[1;5C' forward-word    # ctrl-right
bindkey '^[[1;5D' backward-word   # ctrl-left

# --- plugins (Homebrew) ---
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh ]] && source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh   # must be last plugin

# --- tools ---
command -v gshuf >/dev/null && alias shuf='gshuf'
command -v fzf >/dev/null && source <(fzf --zsh)
# fzf catppuccin mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a --multi"

# --- prompt ---
eval "$(starship init zsh)"

# sdkman (must be at end of file)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
