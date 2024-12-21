# See it in action

* On YouTube https://youtu.be/NtREW4gOSgs

# macOS setup

* install git
```
xcode-select --install
```
* clone repository
```
git clone https://github.com/jorycz/macOS-setup
```
* run initialSetup.sh & reboot
```
cd macOS-setup
./initialSetup.sh
sudo shutdown -r now
```
* run afterRebootSetup.sh and let all apps sync
```
./afterRebootSetup.sh
```

In case you need to run one Apple Script, run:
```
./macOS/guiSetup.sh ./macOS/InitialSetup/Finder.applescript
```

# macOS version

* macOS 15 Sequoia

# List of Settings - Apple Script

## InitialSetup

### Desktop
* Sort By: Date Created

### Dock-MissionControl
* Add 4 Spaces if less than 4 Spaces detected

### Finder
* // Add NAS to Connect to Server (CMD + K)
* View > Show Path Bar
* View > Show Status Bar
* // Create Applications floder in home if not exists
* Show View Options
  * Show item info : TRUE
  * Show icon preview : TRUE
  * Show Library Folder : TRUE
  * Always open in icon view : TRUE
  * Group By : Name
  * Sort By : Name
  * Click > Use as Defaults
* Settings...
  * Sidebar
    * Recents : FALSE
	* HOME FOLDER : TRUE
  * Advanced
    * Show all filename extensions : TRUE
	* Keep folders on top :
	  * In windows when sorting by name : TRUE
	  * On Desktop : TRUE
	* When performing a search: Search the Current Folder
  * General
    * Show these items on the desktop
      * Hard disks : TRUE
	  * Connected servers : TRUE
	* New Finder windows show : HOME FOLDER

### Settings-AppleAccount
* Apple Account > iCloud > Drive > Desktop & Documents Folders : TRUE

### Settings-AppleIntelligenceAndSiri
* Apple Intelligence & Siri > Custom shortcut to open AI or Siri (Globe + Space or S)

### Settings-ControlCenter
* Control Center
  * Sound : Always Show in Menu Bar
  * Battery
    * Show Percentage : TRUE
	* Show Energy Mode : Always
  * Fast User Switching
    * Show in Menu Bar : Account Name
  * Recent documents, applications, and servers : 30

### Settings-DesktopAndDock
* Desktop & Dock
  * Position on screen: Right
  * Automatically hide and show the Dock : TRUE
  * Show suggested and recent apps in Dock : FALSE
  * Click wallpaper to reveal desktop : Only in Stage Manager
  * Ask to keep changes when closing documents : TRUE
  * Automatically rearrange Spaces based on most recent use : FALSE
  * Group windows by application : TRUE

### Settings-Energy_Battery
* Energy (Mac without battery)
  * Prevent automatic sleeping when the display if off : TRUE
* Battery (Mac with battery)
  * Options > Prevent automatic sleeping on power adapter when the display is off : TRUE

### Settings-Keyboard-Dictation
* Keyboard
  * Dictation : TRUE
  * Dictation > Languages : // Add Czechia

### Settings-Keyboard-InputSources
* Keyboard
  * Automatically switch to a document's input source : TRUE
  * Correct spelling automatically : FALSE
  * Capitalize words automatically : FALSE
  * Add period with double-space : FALSE
  * Use smart quotes and dashes : FALSE
  * // Click on + and add Czech – QWERTY input source ...

### Settings-Keyboard-Shortcuts
* Keyboard > Keyboard Shortcuts...
  * Mission Control
    * Show Notification Center : Control + Space
  * App Shortcuts
    * All Applications
      * Zoom : Control + Command + Z
	  * Window Top Left : Option + Control + 1
	  * Window Top Right : Option + Control + 2
	  * Window Bottom Left : Option + Control + 3
	  * Window Bottom Right : Option + Control + 4
	  * Return to Default Size : Control + Command + X (for Terminal in Utility)
	* Safari
	  * Quit : Control + Option + Q
	* Stickies
	  * Paste and Match Style : Command + V
	* Notes
	  * Paste and Match Style : Command + V
	* Photos
	  * Move 1 Photo to Shared Library : Command + S
  * Input Sources
    * Select the previous input source : FALSE
	* Select next source in Input menu : Shift + Command + A

### Settings-LockScreen
* Lock Screen
  * Require password after screen saver begins or display is turned off : After 5 seconds
  * (Mac with battery) Turn display off on battery when inactive : For 30 minutes
  * (Mac with battery) Turn display off on power adapter when inactive : For 1 hour
  * (Mac without battery) Turn display off when inactive : For 2 hours

### Settings-Mouse-Apple-Magic-Mouse
* Mouse (Apple Mouse only)
  * Secondary click : Right Click
  * Smart zoom : TRUE
  * Swipe between pages : Scroll Left or Right with One Finger
  * Swipe between full-screen applications : TRUE
  * Mission Control : TRUE

### Settings-TouchIDAndPassword
* Touch ID & Password > Enable unlock with Apple Watch (in case Watch word is found in name) : TRUE

### Settings-Trackpad
* Trackpad
  * Point & Click > Tap to click : TRUE
  * More Gestures > App Exposé : Swipe Down with Three Fingers

### Settings-Trackpad2-Dragging
* Accessibility > Pointer Control > Trackpad Options...
  * Use trackpad for dragging : TRUE
  * Dragging style : Without Drag Lock

### Terminal
* Settings...
  * General
    * New window with profile : Pro
  * Profiles
    * Pro (select as default)
  * Profiles > Shell > When the shell exits : Close if the shell exited cleanly
  * Profiles > Advanced > Set locale environment variables on startup : FALSE
* font name : SF Mono Light
* font size : 13

## AfterRebootSetup

### Notes
* Sort notes by : Title

### Safari
* View > Show Favorites Bar
* View > Show Status Bar
* View > Show Sidebar
* Settings...
  * General
    * Safari opens with : All windows from last session
	* Remove history items : Manually
	* Remove download list items : Manually
	* Open “safe” files after downloading : FALSE
  * Advanced
    * Show full website address : TRUE
	* Default encoding : Unicode (UTF-8)
	* Show features for web developers : TRUE

### X-Run-Last
* Open Application
  * Messages
  * Music
  * Calendar
  * Notes
  * Reminders
  * Photos

