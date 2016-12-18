#!/bin/bash

printf "Checking for XCode command line tools ... "
xcode-select --print-path > /dev/null
if [ $? -ne 0 ]; then
  echo "No"
  echo "Installing XCode command line tools, re-run this script once they are installed."
  xcode-select --install
  exit
else
  echo "OK"
fi

printf "Checking for pip ... "
which pip > /dev/null
if [ $? -ne 0 ]; then
  echo "No"
  echo "Installing pip"
  easy_install --user pip
else
  echo "OK"
  export PATH=$PATH:$HOME/Library/Python/2.7/bin
fi

printf "Checking for ansible ... "
which ansible > /dev/null
if [ $? -ne 0 ]; then
  echo "No"
  echo "Installing ansible"
  pip install --egg --user --upgrade ansible
else
  echo "OK"
fi

printf "Checking for Homebrew ... "
which brew > /dev/null
if [ $? -ne 0 ]; then
  echo "No"
  echo "Installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "OK"
fi

ansible-playbook -i hosts site.yml
