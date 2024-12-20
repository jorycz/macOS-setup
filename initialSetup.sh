#!/bin/zsh

show_error() {
  echo
  echo "Fix errors and RUN again."
  echo "Allow rights in 'System Settings > Privacy & Security > Accessibility' ... ?"
  echo
  exit 1
}

if [[ $1 =~ ^g ]]
then

  echo ""
  sw_vers
  echo ""
  echo " --- Initial setup. Some changes needs root't password ..."
  CU=$(whoami)
  echo "Setting shell for user [ $CU ] - /bin/zsh"
  #sudo chsh -s /bin/bash "${CU}"
  sudo chsh -s /bin/zsh "${CU}"
  echo ; echo "Enter Computer Name or hit ENTER to keep current [ $(hostname -s) ] : "
  read CNAME
  if [ ! -z "${CNAME}" ]
  then
    echo "Setting to : [ ${CNAME} ]"
    sudo scutil --set ComputerName "${CNAME}"
    sudo scutil --set HostName "${CNAME}"
    sudo scutil --set LocalHostName "${CNAME}"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${CNAME}"
  else
    echo "Leaving [ $(hostname -s) ]"
  fi
  
  echo "Enabling Firewall ..."
  sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
  echo

  echo "If you want to Apple Scripts automatically paste you password to password dialogs, store your password to clipboard now."
  echo "HIT Enter to continue ..."
  read
  
  if ! ./macOS/guiSetup.sh ./macOS/InitialSetup ; then show_error ; fi
  sleep 1
  if ! ./macOS/terminalSetup.sh go ; then show_error ; fi

else
  
  echo "*********************************************************"
  echo ""
  echo " Set 'Language & Region' --> 'Preferred Languages' to:"
  echo ""
  echo "     primary Language: 'English (US)'"
  echo "     another Language: 'Czech'"
  echo ""
  echo "    (Your Mac may need to reboot ...)"
  echo ""
  echo " Then run this script with go: $0 go"
  echo ""
  echo "*********************************************************"

  open /System/Library/PreferencePanes/Localization.prefPane

fi

