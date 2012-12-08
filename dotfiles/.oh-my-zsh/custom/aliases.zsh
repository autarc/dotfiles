#################
#				#
#	Aliases		#
#				#
#################


#### files

	alias zshrc="subl ~/.oh-my-zsh/custom/aliases.zsh"
	alias zshfiles="nautilus ~/.oh-my-zsh/custom/"

	alias {note,notes}="subl /mnt/Media/Documents/Notes/Notes.txt"


#### enhancements

	# allow pipe to clipboard
	alias xclip="xclip -selection c"
	alias {history,h}="fc -l -i"

	alias shutdown="sudo shutdown now -h"
	alias reboot="sudo reboot"


#### applications

	# open news links
	alias news="~/Scripts/news.zsh"

	# pick an element and get the "instance" +  "class" name
	alias pick='xprop | grep "WM_CLASS(STRING)"'

	alias g="git"
	alias naut="nautilus"
	alias {sublime,s}="subl"

	alias chr="google-chrome"
	alias ff="firefox-trunk"



#### no spelling correction

alias man='nocorrect man'
alias rm='nocorrect rm'
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias mkdir='nocorrect mkdir'
