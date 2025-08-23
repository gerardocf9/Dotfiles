# ~/.bashrc inspirado en Ubuntu 22.04, optimizado para Ubuntu 24 + Alacritty + Neovim

# Salir si no es shell interactiva
[[ $- != *i* ]] && return

# ---------------
# Configuración de entorno
# ---------------
export COLORTERM=truecolor
export TERM=xterm-256color

# ---------------
# Historial
# ---------------
## Historial por "slot" de terminal (persistente)
if [ -n "$TERMINAL_SLOT" ]; then
  HISTFILE="$HOME/.bash_history.slot_$TERMINAL_SLOT"
  HISTSIZE=20000
  HISTFILESIZE=200000
  shopt -s histappend
  # Sincroniza el historial por prompt: escribe, limpia, relee
  PROMPT_COMMAND='history -a; history -c; history -r; '"$PROMPT_COMMAND"
fi

#HISTFILE=~/.bash_history_$$
#HISTCONTROL=ignoredups:erasedups
#HISTSIZE=5000
#HISTFILESIZE=10000
#PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# ---------------
# Prompt estilo Ubuntu (verde/azul clásico)
# ---------------
# Formato: usuario@host:~ruta$
if [ -n "$debian_chroot" ]; then
    PS1="\[\e]0;${debian_chroot}: \u@\h: \w\a\]"
else
    PS1="\[\e]0;\u@\h: \w\a\]"
fi
PS1+="\n"
PS1+="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ "

# ---------------
# Alias comunes de Ubuntu
# ---------------
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias update='sudo apt update && sudo apt upgrade'

alias generatePentaLicense='/home/gerardo/backs/licencias/pentaLicense/generarLicencia'
# ---------------
# Autocompletado
# ---------------
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# ---------------
# PATHs adicionales
# ---------------
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# ---------------
# Recargar configuración rápidamente
# ---------------
alias reloadbash='source ~/.bashrc && echo "¡Bash recargado!"'

# ---------------
# Configurar Neovim para colores verdaderos (true colors)
# ---------------
alias nvim='nvim --cmd "let g:termguicolors = 1"'
alias v=nvim
alias vim=nvim

export EDITOR=nvim
export VISUAL=nvim


# --- NVM lazy load (npm/node/npx/nvm) ---
export NVM_DIR="$HOME/.nvm"

_nvm_lazy_load() {
  unset -f node npm npx nvm _nvm_lazy_load
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # carga nvm 1 sola vez
}

node() { _nvm_lazy_load; command node "$@"; }
npm()  { _nvm_lazy_load; command npm "$@"; }
npx()  { _nvm_lazy_load; command npx "$@"; }
nvm()  { _nvm_lazy_load; nvm "$@"; }
# --- fin ---
