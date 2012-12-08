#################
#				#
#	Settings	#
#				#
#################

export EDITOR="subl"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export BROWSER=links
export PAGER=less
export MANPAGER=$PAGER
export HISTTIMEFORMAT="%F %T "
export LC_CTYPE=$LANG


# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games


## Git

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTAE=true


# GREP

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export LSCOLORS="Gxfxcxdxbxegedabagacad"




# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"




# ##################################################################

# for i in $HOME/local/*; do
#   [ -d $i/bin ] && PATH="${i}/bin:${PATH}"
#   [ -d $i/sbin ] && PATH="${i}/sbin:${PATH}"
#   [ -d $i/include ] && CPATH="${i}/include:${CPATH}"
#   [ -d $i/lib ] && LD_LIBRARY_PATH="${i}/lib:${LD_LIBRARY_PATH}"
#   [ -d $i/lib ] && LD_RUN_PATH="${i}/lib:${LD_RUN_PATH}"
# # uncomment the following if you use macintosh
# #  [ -d $i/lib ] && DYLD_LIBRARY_PATH="${i}/lib:${DYLD_LIBRARY_PATH}"
#   [ -d $i/lib/pkgconfig ] && PKG_CONFIG_PATH="${i}/lib/pkgconfig:${PKG_CONFIG_PATH}"
#   [ -d $i/share/man ] && MANPATH="${i}/share/man:${MANPATH}"
# done


# # This allows you to install programs into $HOME/local/someprogram
# # for example, when I install node locally I install it like this:
# #
# #    ./configure --prefix=$HOME/local/node-v0.8.4
# #    make
# #    make install
# #
# # To uninstall a program, just rm -rf $HOME/local/someprogram
# #
