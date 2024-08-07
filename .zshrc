source $HOME/.aliases
if [ -f $HOME/.aliases_private ] ; then source $HOME/.aliases_private ; fi

PROMPT='%F{039}%m%f %F{082}%~%f $ '

HISTSIZE=10000000
SAVEHIST=10000000
#setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Make scp user@machine:*test* . - wildcards work
setopt nonomatch

# Do NOT remove trailing slash when parsing folder name
# e.g. keep name like Island/ and not Island. rsync then create new subfolder.
setopt no_auto_remove_slash

export PATH="${PATH}:/Users/${USER}/Documents/Scripts"

#export LC_ALL="en_US.UTF-8"
#export LANG="en_US.UTF-8"

autoload -Uz compinit && compinit

