#!/bin/zsh

osascript ./disableSecureKeyboardEntry.scpt

if ! ./setupUsingGUI.sh s
then
  echo ; echo "Fix errors and RUN again." ; echo
  exit 1
fi

sleep 1

if ! ./setupUsingTerminal.sh s
then
  echo ; echo "Fix errors and RUN again." ; echo
  exit 1
fi

osascript ./enableSecureKeyboardEntry.scpt

