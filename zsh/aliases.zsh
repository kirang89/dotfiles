alias zshconfig="vim ~/.zshrc"

# General
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias cl='clear'
alias diffnice='diff --side-by-side'

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Get local ip
alias localip="ipconfig getifaddr en1"

# Folder shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias msc="cd ~/Music"
alias wp="cd ~/Workspace"
alias sbot="cd ~/Workspace/song-bot"
alias pgd="cd /Users/kiran/Library/Application\ Support/Postgres/var-9.3/"
# Open sublime text from the command line
alias subl='open -a Sublime\ Text\ 2'

# Show/hide hidden files in Finder
alias showHidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hideHidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Git
alias ga='git add --all'
alias gb='git branch -vv'
alias gc='git commit -a'
alias gchbr='git checkout -b'
alias gchm='git checkout master'
alias gcm='git commit -a -m'
alias gcam='git commit --amend'
alias gco='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gdlds="find . -depth -name '.DS_Store' -exec git rm --cached '{}' \; -print"
alias gdm="git daemon --reuseaddr --base-path=/Users/kiran/Workspace/ --export-all --verbose"
alias gl="git log --oneline"
alias glg="git log --graph"
alias glgp="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gls='git ls-files'
alias gpl='git pull'
alias gplu='git pull upstream'
alias gps='git push'
alias gra='git remote add origin'
alias grs='git remote show'
alias gs='git status'
alias gsb='git status -sb'
alias gwd='git show --word-diff=color'
alias giwd='git instaweb -d webrick'
alias gst='git stash'
alias gsta='git stash apply'

# Python related
alias pipi='sudo pip install'
alias pips='pip search'
alias pipu='sudo pip uninstall'

# AWS ElasticBeanstalk
alias eb="python /usr/local/AWS-ElasticBeanstalk-CLI-2.5.1/eb/macosx/python2.7/eb"

# Ruby related
alias gi='sudo gem install'

# Jenkins
alias jenstop='sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist'
alias jenstart='sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist'

# Song Bot
alias sbot='python /Users/kiran/Workspace/song-bot/song-bot.py'

alias pag="ps aux | grep"
alias kl="kill -9"

# Docker
alias drm="docker rm"
alias drmi="docker rmi"
alias dr="docker run -t -i"
alias dpa="docker ps -a"
alias di="docker images"
alias dbi="docker build -t"
alias dcm="docker commit -m"
alias dk="docker kill"

#Ngrok
alias ngr="/Users/kiran/Workspace/ngrok"

# Mosquitto
alias mosq="/usr/local/sbin/mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf"

#Tmux
alias tma='tmux attach -d -t'

#Emacs
alias em='emacsclient -n -a ""'

#kill pid
alias k9='kill -9'

#sed with saner regular expressions
alias sed='sed -E'

#offlinemap
alias offlinemap="/usr/local/Cellar/offline-imap/6.5.6/bin/offlineimap"

#syntax highlighted snippet
alias pyg="pygmentize -f rtf -O "fontface=Inconsolata""

#Misc
alias utctime='python -c "from datetime import datetime; print datetime.utcnow()"'

#Speedtest CLI
alias spdt='speedtest-cli'
alias ipy='ipython'

#Boot2Docker
alias bstart="boot2docker start"
alias bstop="boot2docker stop"
alias boff="boot2docker poweroff"
