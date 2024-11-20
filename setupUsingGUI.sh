#!/bin/zsh

### Setup my settings ###

if [[ $1 =~ ^s ]]
 then
  echo && echo "---- Setting macOS in GUI ... ----" && echo

### macOS settings in GUI System Settings app

  for scr in $(ls AppleScript/*.scpt)
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

# TODO: Application settings

  #echo "Safari - Prevent Safari from opening safe files automatically after downloading"
  #defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
  #echo "Safari - use Backspace key to navigate back to previous page"
  #defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool YES

fi

