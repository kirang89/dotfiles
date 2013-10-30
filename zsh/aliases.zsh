alias zshconfig="vim ~/.zshrc"

# General
alias ll='ls -alF'
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
alias wp="cd ~/Workspace"

# Open sublime text from the command line
alias subl='open -a Sublime\ Text\ 2'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Git
alias gl='git pull'
alias gp='git push'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gcl='git clone'
alias gra='git remote add'
alias gs='git status -sb'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# Python related
alias pipi='sudo pip install'
alias pips='pip search'
alias pipu='sudo pip uninstall'

# AWS ElasticBeanstalk
alias eb="python /usr/local/AWS-ElasticBeanstalk-CLI-2.5.1/eb/macosx/python2.7/eb"

# Ruby related
alias gi='sudo gem install'