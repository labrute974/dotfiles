#! /bin/bash

WORKDIR=$(dirname $0)
BREW=$(which brew)
[[ -z "$BREW" ]] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

for pkg in tmux vim bash bash-git-prompt tig wget tcpdump node brew-cask nmap homebrew/dupes/tcpdump gnu-sed
do
  if ! brew list $pkg &> /dev/null
  then
    brew install $pkg
  fi
done

for cpkg in atom evernote spotify virtualbox dash vagrant
do
  if ! brew cask list $cpkg &> /dev/null
  then
    brew cask install $cpkg
  fi
done

for file in tmux.conf vimrc bash_profile
do
  [[ ! -e ~/.$file ]] && cp -f ${WORKDIR}/$file ~/.$file
done

## SETUP GIT
git config --global user.name "Karel Malbroukou"
git config --global user.email "karel.malbroukou@gmail.com"

## Setup Atom
apm install vim-mode markdown-toc markdown-preview-plus atom-ternjs

exit 0
