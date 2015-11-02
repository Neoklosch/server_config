# ls aliases
alias l='ls --color'
alias ll='ls -la'
alias lt='l -rt'
alias la='l -A'
alias llt='l -lrt'
alias lla='l -lA'
alias llat='l -lArt'
alias h='history'

# hadoop aliases
unalias fs &> /dev/null
alias fs="hadoop fs"
unalias hls &> /dev/null
alias hls="fs -ls"
