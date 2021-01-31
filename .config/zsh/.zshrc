# SOURCE ALIASES AND FUNCTIONS
	. ~/.config/aliasrc
	. ~/.config/funcrc

# AUTO CHANGE DIR
	setopt autocd autopushd

# HISTORY
	HISTFILE=~/.config/zsh/histfile
	HISTSIZE=1000
	SAVEHIST=1000

# ENABLE VIM-KEYS
	bindkey -v

# COMPLETION
	# zstyle :compinstall filename '~/.config/zsh/.zshrc'
	# autoload -Uz compinit
	# compinit
	autoload -U compinit
	zstyle ':completion:*' menu select
	zmodload zsh/complist
	compinit
	_comp_options+=(globdots)	# Include hidden files

	bindkey -M menuselect 'h' vi-backward-char
	bindkey -M menuselect 'k' vi-up-line-or-history
	bindkey -M menuselect 'l' vi-forward-char
	bindkey -M menuselect 'j' vi-down-line-or-history
	bindkey -v '^?' backward-delete-char

# SET WINDOW-TITLE
	WIN_TITLE='printf "\033]0; (zsh) - $PWD\007" > /dev/tty'
	precmd() { eval "$WIN_TITLE" }

# PROMPT
	source $HOME/.config/zsh/prompt

# SYNTAX-HIGHLIGHT
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
