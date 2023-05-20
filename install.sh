#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export USERNAME=`whoami`

sudo apt-get update
sudo apt-get -y install --no-install-recommends apt-utils dialog 2>&1
sudo apt-get install -y \
  apt-transport-https \
  build-essential \
  curl \
  git \
  jq \
  less \
  lsb-release \
  sudo \
  tmux \
  unzip \
  wget \
  zsh

sudo apt-get autoremove -y
sudo rm -rf /var/lib/apt/lists/*

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ln -s ${BASEDIR}/.tmux.conf ~/.tmux.conf

# install homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/home/linuxbrew/.linuxbrew/bin/brew install \
  gcc \
  tig

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.profile
