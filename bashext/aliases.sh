############ TMUX ############
# Run a command in a new split-off window inside tmux
# by prepending the command with a comma (,)
# e.g. , ping 8.8.8.8
alias ,='tmux split-window'

############# GIT ############
# Show all git conflicts
alias gitcon='git status --short | "^U[UAD]"'

########### TMUX #############
alias tmux="TERM=screen-256color-bce tmux"

############ MISC  ###########
# Show text content of a x509 ssl cert
alias catssl='openssl x509 -text -in'

