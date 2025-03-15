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

  if ! ./macOS/guiSetup.sh ./macOS/afterRebootSetup ; then show_error ; fi

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

