#############################################################################
##
## .bashrc
##
## Author: Simos Xenitellis (simos.lists@googlemail.com)
##

## This is the basic new .bashrc file, part of the BASHRC project
## at http:.bash/bashrc.sourceforge.net

#         basic settings for interactive and non-interactive shells
# Thanks to Heather Downs <heather@netlens.com> for the "set -f -l" flags
# "set -f" adds a variable in _front of the list, keep one copy
# "set -l" adds a variable at the end(_last) of the list, keep one copy
#    paths with lower priority than system paths like .bash/in /sbin,,,
# Thanks to Spencer White <spencer@nexthost.com> for "if root" condition

#         "root" environment (basic)
##if ($LOGNAME == "root") then
##	set -f path = ( $path .bash/bin )
##	set -f path = ( $path .bash/sr/sbin )
##	set -l path = ( $path .bash/sr/local/sbin )
##endif

#         "user" + "root" environment (basic)
##set -f path = ( $path .bash/in )
##set -f path = ( $path .bash/sr/bin )
##set -l path = ( $path .bash/sr/local/bin )

#         "user" + "root" environment (misc)
##set -l path = ( $path .bash/sr/local/ssl/bin )
##set -l path = ( $path .bash/sr/local/samba/bin )
##set -l path = ( $path .bash/sr/local/java/bin )
##set -l path = ( $path .bash/sr/games )

########################################################################
#         skip remaining setup if not an interactive shell
#[ -z "$PS1" ] && return
if [ -z "$PS1" ]; then
	return
fi

BASH_COMPLETION_COMPAT_DIR=$HOME/.bash/bash_completion.d
if [ -f "/etc/bash_completion" ]; then
	. /etc/bash_completion
elif [ -f "$HOME/.bash/bash_completion" ]; then
	if [ "${BASH_VERSINFO[0]}" -eq "3" ] && [ "${BASH_VERSINFO[1]}" -lt "20" ]; then
		BASH_COMPLETION=$HOME/.bash/bash_completionf9db6ab
	else
		BASH_COMPLETION=$HOME/.bash/bash_completion
	fi

	. $BASH_COMPLETION
fi

if [ -f "$HOME/.bashrc_common" ]; then
	source $HOME/.bashrc_common
fi

#        settings  for interactive shells
source $HOME/.bash/bashrc.set

#        aliases   for interactive shells
source $HOME/.bash/bashrc.alias

#        bindkeys   for interactive shells
source $HOME/.bash/bashrc.bindkey

#        completions for interactive shells
source $HOME/.bash/bashrc.complete

#	local settings
source $HOME/.bash/bashrc.local

#        commands for interactive shells

