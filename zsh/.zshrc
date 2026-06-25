#!/usr/bin/env zsh
#############################################################
#   .zshrc - badsignal's config
#############################################################

# --- History -----------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# --- Sane defaults -----------------------------------------
setopt AUTO_CD CORRECT NO_BEEP
autoload -Uz compinit && compinit

# --- Prompt ------------------------------------------------
PROMPT='%F{178}%n@%m%f %F{109}%~%f %F{167}»%f '

# --- Editor / pager ----------------------------------------
export EDITOR=vim
export VISUAL=vim
export PAGER=less

# --- Wayland-related env -----------------------------------
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1

# --- Aliases -----------------------------------------------
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias docker='podman'
alias vim='nvim'
alias cat='bat --paging=never'

# pacman/AUR shortcuts
alias update='sudo pacman -Syu && paru -Sua'
alias orphans='pacman -Qtdq'

# git
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gp='git push'

# --- Plugins -----------------------------------------------
# AUR: zsh-autosuggestions, zsh-fast-syntax-highlighting
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] && \
	source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# --- zoxide / fzf if installed (optional) ------------------
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec uwsm start hyprland.desktop
fi
