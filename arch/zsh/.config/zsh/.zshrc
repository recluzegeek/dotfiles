# --- 1. DEFAULT PLUGINS (Antidote Auto-Manager) ---
ANTIDOTE_DIR="$HOME/.local/share/antidote"

if [[ ! -d "$ANTIDOTE_DIR" ]]; then
  echo "📥 Bootstrapping default Zsh plugins via Antidote..."
  git clone --depth=1 "https://github.com/mattmc3/antidote.git" "$ANTIDOTE_DIR"
fi

source "$ANTIDOTE_DIR/antidote.zsh"
antidote load "$ZDOTDIR/.zsh_plugins.txt"

# --- 1.1 PERSISTENT SHELL HISTORY ---
# Set the destination path using your dynamic ZDOTDIR variable
HISTFILE="$ZDOTDIR/.zsh_history"

# Maximum number of commands stored inside internal memory
HISTSIZE=50000

# Maximum number of commands written and saved to the history disk file
SAVEHIST=50000

# Optimization Triggers (Highly Recommended Options)
setopt APPEND_HISTORY          # Append items to the history file rather than overwriting it
setopt INC_APPEND_HISTORY      # Save commands directly to the file immediately after typing them
setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries to prevent history bloat
setopt HIST_REDUCE_BLANKS      # Remove unnecessary space tabs from history strings

# --- 2. RESTORE OUTPUT COLORS (ls, grep) ---
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# ==============================================================================
# --- 3. STANDARD KEYMAPS & SHORTCUT FIXES ---
# ==============================================================================

# Explicitly enforce Standard interactive Emacs-style key-bindings
bindkey -e
autoload -Uz compinit && compinit

# Standard Navigation Keys (Home / End)
bindkey '^[[H' beginning-of-line                 # Home key
bindkey '^[[F' end-of-line                       # End key

# Word Skipping Navigation (Ctrl + Left / Right Arrow Keys)
bindkey '^[[1;5D' backward-word                 # Modern Xterm Ctrl + Left
bindkey '^[[1;5C' forward-word                  # Modern Xterm Ctrl + Right
bindkey '^[OD'    backward-word                 # Legacy/Application mode Ctrl + Left
bindkey '^[OC'    forward-word                  # Legacy/Application mode Ctrl + Right

# Advanced Word Deletions (Ctrl / Alt Combinations)
bindkey '^H'      backward-kill-word            # Ctrl + Backspace
bindkey '^[^?'    backward-kill-word            # Alt + Backspace
bindkey '^[[3;5~' kill-word                     # Ctrl + Delete (deletes word forward)

bindkey '^[[3~' delete-char               # Standard Delete key (deletes character forward)
bindkey '^[[3;5~' kill-word               # Ctrl + Delete (deletes entire word forward)

# ==============================================================================
# --- 4. FAST NATIVE HISTORY SEARCH (Up/Down Arrow Keys) ---
# ==============================================================================
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Match basic up/down arrow behaviors natively
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# --- 5. STARSHIP PROMPT ---
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
