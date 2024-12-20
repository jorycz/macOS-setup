#!/bin/zsh

### Not active lines are moved to GUI setting method using Apple Script.

### PREREQS - Install git: xcode-select --install

### Should be already installed
#if [ -f /usr/libexec/PlistBuddy ] ; then echo "PlistBuddy found." ; else echo "Install /usr/libexec/PlistBuddy" ; exit 1 ; fi
#xcode-select --install &> /dev/null

### Setup my settings ###

if [[ $1 =~ ^g ]]
then
  echo && echo "---- Setting macOS in Terminal ... ----" && echo

  echo "Quitting System Preferences if it's open ... "
  osascript -e 'tell application "System Preferences" to quit'
  sync
  echo
  sleep 1

  ##############################
  ### macOS system settings ####
  ##############################

  #echo "General - Ask to keep change when closing documents"
  #defaults write -globalDomain NSCloseAlwaysConfirmsChanges -bool true
  #echo "General - Close windows when quitting an app"
  #defaults write -globalDomain NSQuitAlwaysKeepsWindows -bool true

  #echo "Dock - Position on screen - right"
  #defaults write com.apple.dock orientation -string "right"
  #echo "Dock - Automatically hide and show the Dock"
  #defaults write com.apple.dock autohide -bool true
  #echo "Dock - DO NOT Show recent applications in Dock"
  #defaults write com.apple.dock show-recents -bool false

  #echo "Mission Control - DO NOT Automatically rearrange Spaces based on most recet use"
  #defaults write com.apple.dock mru-spaces -bool false
  #echo "Mission Control - Group windows by application"
  #defaults write com.apple.dock expose-group-apps -bool true
  #echo "Mission Control - Hot Corners - TOP Right - App Expose"
  ### Start Screen Saver = 5, Disable Screen Saver = 6, Mission Control = 2, Application Windows = 3
  ### Desktop = 4, Dashboard = 7, Notification Center = 12, Launchpad = 11, Put Display to Sleep = 10
  ### Modifier is always 0, with exception of "None":
  ### None = 1 + Modifier = 1048576
  #defaults write com.apple.dock wvous-tr-corner -int 3
  #defaults write com.apple.dock wvous-tr-modifier -int 0

  #echo "Keyboard - DO NOT Correct spelling automatically"
  #defaults write -globalDomain WebAutomaticSpellingCorrectionEnabled -bool false
  #echo "Keyboard - DO NOT Capitalise words automatically"
  #defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false
  #echo "Keyboard - DO NOT Add full stop with double-space"
  #defaults write -globalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
  #echo "Keyboard - DO NOT Use smart quotes and dashes"
  #defaults write -globalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  #echo "Keyboard - Use keyboard navigation to move focus between controls"
  #defaults write -globalDomain AppleKeyboardUIMode -int 2

  #echo "Finder - Show Path bar"
  #defaults write com.apple.finder ShowPathbar -bool true
  #echo "Finder - Show Status bar"
  #defaults write com.apple.finder ShowStatusBar -bool true
  #echo "Finder - Advanced - Show all filename extensions"
  #defaults write -globalDomain AppleShowAllExtensions -bool true
  #echo "Finder - Hard disks - on Desktop"
  #defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
  #echo "Finder - Connected servers - on Desktop"
  #defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
  #echo "Finder - New Finder windows show: Home folder"
  #defaults write com.apple.finder NewWindowTarget -string "PfHm"
  #defaults write com.apple.finder NewWindowTargetPath -string ""file://${HOME}/""
  #echo "Finder - Advanced - Search the Current Folder"
  #defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
  #echo "Finder - Display full POSIX path as Finder window title"
  #defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
  #echo "Finder - Show item info near icons on the desktop"
  #/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  #echo "Finder - on Desktop - Sort by Name"
  #/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
  #echo "Finder - Show item info near icons in Finder icon views in windows"
  #/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  #/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  #echo "Finder - Show the ~/Library folder"
  #chflags nohidden ~/Library

  #echo "Terminal - Profile Pro - Font Name - SF Mono Light"
  #osascript -e "tell application \"Terminal\" to set font name of settings set \"Pro\" to \"SF Mono Light\""
  #echo "Terminal - Profile Pro - Font Size - 13"
  #osascript -e "tell application \"Terminal\" to set font size of settings set \"Pro\" to \"13\""
  #echo "Terminal - Profile Pro - Shell - DO NOT set env. variables (LC_CTYPE) - issues on linux"
  ### -bash: warning: setlocale: LC_CTYPE: cannot change locale (UTF-8)
  ### locale -a: locale: Cannot set LC_CTYPE to default locale: No such file or directory
  #if ! /usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:SetLanguageEnvironmentVariables false" ~/Library/Preferences/com.apple.Terminal.plist
  #then
  #  echo " ---> Key NOT found, adding."
  #  /usr/libexec/PlistBuddy -c "Add :'Window Settings':Pro:SetLanguageEnvironmentVariables bool false" ~/Library/Preferences/com.apple.Terminal.plist
  #fi
  #echo "Terminal - set default and start window to profile - Pro"
  #defaults write com.apple.Terminal "Startup Window Settings" -string Pro
  #defaults write com.apple.Terminal "Default Window Settings" -string Pro
  #echo "Terminal - Enable Secure Keyboard Entry in Terminal.app"
  ### https://security.stackexchange.com/a/47786/8918
  #defaults write com.apple.terminal SecureKeyboardEntry -bool true

  #echo "Energy Saver - AC Power - Enable Prevent computer from sleeping automatically"
  #sudo pmset -a sleep 0
  #echo "Energy Saver - AC Power - Turn display off after 1 hour"
  #sudo pmset -a displaysleep 60

  ### Not needed anymore.
  ### If your Mac has multiple users and you want all users to see your primary language in the login window, click the Settings pop-up menu
  ### in General > Language & Region > Preferred Languages ... then choose Apply to Login Window.
  ### If you don't see the Settings pop-up menu, it means the login window is already set to use your primary language.
  #echo "Users & Groups - Login Screen - Show language menu in the top right corner of the login screen"
  #sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

  #echo "Users & Groups - Enable fast user switching"
  #sudo defaults write /Library/Preferences/com.apple.loginwindow MultipleSessionEnabled -bool true
  #echo "Users & Groups - Enable fast user switching as Account Name"
  #defaults write ~/Library/Preferences/.GlobalPreferences userMenuExtraStyle -int 1

  #echo "Mouse - Point & Click - Secondary click / Two Buttons"
  #defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string "TwoButton"
  #echo "Mouse - Point & Click - Smart zoom"
  #defaults write com.apple.AppleMultitouchMouse MouseOneFingerDoubleTapGesture -int 1
  #echo "Mouse - Point & Click - Swipes ..."
  #defaults write com.apple.AppleMultitouchMouse MouseTwoFingerHorizSwipeGesture -int 2
  #echo "Mouse - Point & Click - Mission control"
  #defaults write com.apple.AppleMultitouchMouse MouseTwoFingerDoubleTapGesture -int 3

  #echo "Trackpad - Tap To Click"
  #defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  #defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad.plist Clicking -bool true
  #echo "Trackpad - More Gestures - Mission Control"
  #defaults write com.apple.dock showMissionControlGestureEnabled -bool true
  #echo "Trackpad / Accessibility - Tap & Drag"
  #defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
  #defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad.plist Dragging -bool true
  #defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
  #defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad.plist DragLock -bool false

  ##############################
  ###### Non-GUI Settings ######
  ##############################

  echo "Finder - Allowing text selection in Quick Look/Preview in Finder by default"
  defaults write com.apple.finder QLEnableTextSelection -bool true
  echo "Finder - Expand the following File Info panes: General, Metadata, Open with, and Sharing & Permissions"
  defaults write com.apple.finder FXInfoPanesExpanded -dict-add "General" -bool true
  defaults write com.apple.finder FXInfoPanesExpanded -dict-add "MetaData" -bool true
  defaults write com.apple.finder FXInfoPanesExpanded -dict-add "OpenWith" -bool true
  defaults write com.apple.finder FXInfoPanesExpanded -dict-add "Privileges" -bool true

  echo "Dock - Launchpad - more space in grid"
  ### You can reset Launchpad: defaults write com.apple.dock ResetLaunchPad -bool true ; killall Dock
  defaults write com.apple.dock springboard-columns -int 9
  defaults write com.apple.dock springboard-rows -int 7

  ##############################
  #### Application settings ####
  ##############################

  echo "TextEdit - Use plain text mode for new TextEdit documents"
  defaults write com.apple.TextEdit RichText -int 0
  echo "TextEdit - Open and save files as UTF-8 in TextEdit"
  defaults write com.apple.TextEdit PlainTextEncoding -int 4
  defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
  echo "TextEdit - Set default plain text font and size"
  defaults write com.apple.TextEdit NSFixedPitchFont -string "Verdana"
  defaults write com.apple.TextEdit NSFixedPitchFontSize -int 14
  echo "TextEdit - Set default rich text font and size"
  defaults write com.apple.TextEdit NSFont -string "Verdana"
  defaults write com.apple.TextEdit NSFontSize -int 14

  echo "Global - Expand Save dialogs"
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  echo "Global - Do NOT create .DS_Store files on Network or USB volumes"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
 
  echo ""

  ##############################
  ###### Private Settings ######
  ##############################

  if [ -d "../macOS-private/" ]
  then
    echo "---- PRIVATE REPOSITORY FOUND ----" && echo
    cd "../macOS-private/"
    ./privateInitialSetup.sh
    echo ""
  fi

  echo ""
  sync
  sleep 3

  echo "##############################################"
  echo "##############################################"
  echo
  echo " !!! QUIT this Terminal app & Reboot NOW !!!"
  echo
  echo "##############################################"
  echo "##############################################"
  echo ""
fi

