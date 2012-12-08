#################
#				#
#	Scripts		#
#				#
#################


# multiple ways back
cd()
{
	if   [[ "x$*" == "x..." ]]; then
		cd ../..
	elif [[ "x$*" == "x...." ]]; then
		cd ../../..
	elif [[ "x$*" == "x....." ]]; then
		cd ../../..
	elif [[ "x$*" == "x......" ]]; then
		cd ../../../..
	else
		builtin cd "$@"
	fi
}

# tree view
tree()
{
	ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'
}


## x - archive extractor
# usage: x <file>

x()
{
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2)	tar xjf $1   	;;
			*.tar.gz)	tar xzf $1   	;;
			*.bz2)		bunzip2 $1   	;;
			*.rar)		rar x $1     	;;
			*.gz)		gunzip $1    	;;
			*.tar)		tar xf $1    	;;
			*.tbz2)		tar xjf $1   	;;
			*.tgz)		tar xzf $1   	;;
			*.zip)		unzip $1     	;;
			*.Z)		uncompress $1	;;
			*.7z)		7z x $1			;;
			*)			echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}


# push paths on the stack -> use popd
alias {cd,cda,cdl,cdd,cdf,cdad,cdaf,cdbig,cdnew,cdold,cdsmall}='builtin pushd'


# ls on directory change
chpwd()
{
	case "$LS_USED" in

		cd)			ls --color=auto --group-directories-first -hF;;
		cdl)		ls --color=auto --group-directories-first -hlF;;
		cda)		ls --color=auto --group-directories-first -hlAF;;
		cdd)		ls --color=auto -d *(-/N);;
		cdf)		ls --color=auto *(-.N);;
		cdad)		ls --color=auto -d *(-/DN);;
		cdaf)		ls --color=auto *(-.DN);;
		cdbig)		ls --color=auto -lArSh;;
		cdnew)		ls --color=auto -lAhrt;;
		cdold)		ls --color=auto -lAht;;
		cdsmall)	ls --color=auto -lASh;;
		*)			ls --color=auto --group-directories-first -hF;;

	esac
}

# youtube
yt()
{
	/mnt/Media/Musik/Youtube
	~/Scripts/youtube-dl/youtube-dl --extract-audio -t $1
	nautilus ~/Musik/Youtube/
}
