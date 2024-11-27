#!/bin/zsh

show_error() {
  echo
  echo "Fix errors and RUN again."
  echo "Allow rights in 'System Settings > Privacy & Security > Accessibility' ... ?"
  echo
  exit 1
}

if defaults read NSGlobalDomain NSNavPanelExpandedStateForSaveMode | grep 1 > /dev/null
then

  echo ""
  echo " --- After Reboot setup."
  echo ""

  ### I'm using Secure Keyboard Entry when working in Terminal.
  ### This must be disabled, otherwise Terminal will not change focus when running Apple Script.
  if ! osascript ./SecureKeyboardEntry/disableSecureKeyboardEntry.scpt ; then show_error ; fi

  if ! ./AfterRebootSetup/setupUsingGUI.sh s ; then show_error ; fi

  sleep 1

  osascript ./SecureKeyboardEntry/enableSecureKeyboardEntry.scpt

else
  
  echo "*********************************************************"
  echo ""
  echo "        RUN ./initialSetup.sh"
  echo ""
  echo "        Reboot Mac"
  echo ""
  echo "   Then run this script with go: $0 go"
  echo ""
  echo "*********************************************************"

fi

