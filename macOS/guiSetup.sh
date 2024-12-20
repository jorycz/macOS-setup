#!/bin/zsh

### Setup my settings ###

enableSecureKeyboard() {
  echo
  osascript ./macOS/SecureKeyboardEntry/enableSecureKeyboardEntry.applescript
}

showError() {
  echo "------------ !!! ERROR !!! ------------"
  echo " Apple Script run failed."
  echo " Allow Terminal in"
  echo "     System Settings > Privacy & Security > Accessibility"
  echo " and run this script again."
  echo "------------ !!! ERROR !!! ------------"
  enableSecureKeyboard
  exit 1
}

disableSecureKeyboard() {
  ### I'm using Secure Keyboard Entry when working in Terminal.
  ### This must be disabled, otherwise Terminal will not change focus when running Apple Script.
  if ! osascript ./macOS/SecureKeyboardEntry/disableSecureKeyboardEntry.applescript ; then showError ; fi
  echo
}

runScript() {
  if [ -f "${1}" ]
  then
    if ! osascript "${1}"
    then
      showError
    fi
  else
    echo "!!! ERROR !!! Script [ ${1} ] does not exists."
  fi
}

### GO

if [ -z "${1}" ] ; then echo "Nothing to run." ; exit 0 ; fi

echo && echo "---- Setting macOS in GUI ... ----" && echo
disableSecureKeyboard

if [[ "${1}" =~ applescript$ ]]
then
  echo "Running script [ ${1} ] ..."
  runScript "${1}"
else
  echo "Running all scripts in folder [ ${1} ] ..."
  for scr in $(ls "${1}/"*.applescript)
  do
    echo "RUNNING: $scr"
    runScript "${scr}"
  done
fi

enableSecureKeyboard

