#!/bin/zsh

### Setup my settings ###

if [[ $1 =~ ^s ]]
 then
  echo && echo "---- Setting macOS in GUI ... ----" && echo

### macOS settings in GUI System Settings app

  for scr in $(ls InitialSetup/AppleScript/*.scpt)
  do
    echo "RUNNING: $scr"
    if ! osascript $scr
    then
      echo "------------ !!! ERROR !!! ------------"
      echo " Apple Script run failed."
      echo " Allow Terminal in"
      echo "     System Settings > Privacy & Security > Accessibility"
      echo " and run this script again."
      echo "------------ !!! ERROR !!! ------------"
      exit 1
    fi
    echo
  done
  echo ""

fi

