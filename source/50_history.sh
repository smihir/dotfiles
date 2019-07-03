# History settings

shopt -s histappend
shopt -s cmdhist
# Allow use to re-edit a faild history substitution.
shopt -s histreedit
# History expansions will be verified before execution.
shopt -s histverify

# Entries beginning with space aren't added into history, and duplicate
# entries will be erased (leaving the most recent entry).
export HISTCONTROL="ignoreboth:erasedups"
# Give history timestamps.
export HISTTIMEFORMAT="[%F %T] "
# Lots o' history.
export HISTSIZE=1000000
export HISTFILESIZE=1000000

HISTIGNORE='ls:bg:fg:history'
PROMPT_COMMAND='history -a'

# Easily re-execute the last history command.
alias r="fc -s"
