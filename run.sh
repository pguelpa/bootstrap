#!/bin/bash

printf "Checking for pip ... "
which pip > /dev/null
if [ $? -ne 0 ]; then
  echo "No"
  echo "Installing pip"
  sudo easy_install pip
else
  echo "OK"
fi

printf "Checking for ansible ... "
which ansible > /dev/null
if [ $? -ne 0 ]; then
  echo "No"
  echo "Installing ansible"
  sudo easy_install ansible
else
  echo "OK"
fi

ansible-playbook -i hosts site.yml
