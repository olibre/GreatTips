
Bash
====

This chapter is about `~/.bashrc`.

Improve `~/.bash_history`
------------------------

```sh
export HISTTIMEFORMAT="%d %h %H:%M:%S  "     # Format: 115  08 Jun 16:31:19  ping 1.1.1.1
export HISTSIZE=10000                        # Number of commands to remember in the command history
export HISTFILESIZE=10000                    # Maximum number of lines contained in the history file
export HISTCONTROL=ignorespace:erasedups     # Do line beginning with a space + No duplicates
export HISTIGNORE="ls:ll:ps:history"         # No ls, ps and history commands
PROMPT_COMMAND="$PROMPT_COMMAND;history -a"  # Save each command right after it has been executed
shopt -s histappend                          # Append commands to the history file, rather than overwrite it
shopt -s cmdhist                             # Store multi-line commands in one history entry
```

Configure `ccache`
-----------------

```sh
if [[ $- == *i* ]]
then
    export USE_CCACHE=1
    #xport CCACHE_COMPRESS=1
    ccache -M 80G
fi
```
