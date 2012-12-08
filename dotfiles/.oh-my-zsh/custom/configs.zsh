#####################
#					#
#	Configurations	#
#					#
#####################


autoload -U edit-command-line
zle -N edit-command-line

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

zmodload -i zsh/complist

setopt long_list_jobs

unsetopt beep notify

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end
setopt autocd extendedglob nomatch
setopt autopushd pushdminus pushdsilent pushdtohome
setopt auto_name_dirs
setopt pushd_ignore_dups
setopt AUTO_LIST
setopt CHASE_LINKS
setopt NUMERIC_GLOB_SORT
setopt cdablevars
setopt interactivecomments
setopt nobanghist
setopt noclobber
setopt SH_WORD_SPLIT
setopt nohup
setopt correct_all
setopt multios


autoload -U compinit && compinit

autoload -U colors; colors;

## History

export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:c:h:history:cd:cd ..:cd.."           # doesn't show up the included commands
export HISTSIZE=10000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
eval `dircolors -b`

setopt append_history
setopt extended_history
setopt hist_ignore_all_dups                                             # doesn't show up double entries = first & expire dups
setopt hist_ignore_space                                                # doesn't show up space
setopt hist_verify
setopt hist_reduce_blanks                                               # doesn't show up blanks / reduces them
setopt inc_append_history
setopt share_history


typeset -Ag FX FG BG





## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
	zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
	unset CASE_SENSITIVE
else
	zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

zstyle ':completion:*' list-colors ''

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# use /etc/hosts and known_hosts for hostname completion
[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
	"$_global_ssh_hosts[@]"
	"$_ssh_hosts[@]"
	"$_etc_hosts[@]"
	"$HOST"
	localhost
)
zstyle ':completion:*:hosts' hosts $hosts


# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.oh-my-zsh/cache/


# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
				adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
				dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
				hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
				mailman mailnull mldonkey mysql nagios \
				named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
				operator pcap postfix postgres privoxy pulse pvm quagga radvd \
				rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

# ... unless we really want to.
zstyle '*' single-ignored show

if [ "x$COMPLETION_WAITING_DOTS" = "xtrue" ]; then
	expand-or-complete-with-dots() {
		echo -n "\e[31m......\e[0m"
		zle expand-or-complete
		zle redisplay
	}
	zle -N expand-or-complete-with-dots
	bindkey "^I" expand-or-complete-with-dots
fi
