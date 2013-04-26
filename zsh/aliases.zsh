# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -lA1'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

#Fix for rake new_post['']
alias rake='noglob rake'

#Custom Aliases
alias hibernate='sudo pm-hibernate'
alias shutdown='sudo init 0'
alias restart='sudo init 6'
alias l.='ls -d .* --color=auto'
alias grep='grep --color=auto'
alias ports='netstat -tulanp'
alias ipt='sudo /sbin/iptables'
alias fastping='ping -c 100 -s.2'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias pinstall='sudo apt-get install'
alias premove='sudo apt-get remove'
alias pupdate='sudo apt-get update'
alias vim='sudo vim'
alias hardware='sudo lshw'
alias gcc='gcc -Wall -Wextra -Werror -g'
alias ssh_ec2='ssh -v -i /home/kiran/Downloads/kirankey.pem ubuntu@ec2-23-2    3-65-211.compute-1.amazonaws.com'
alias tweet='~/workspace/PYTHON_SCRIPTS/twitter_connect.py'
alias diffnice='diff --side-by-side'

