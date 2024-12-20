global appFolder
set appFolder to missing value

(*
### This piece of code is to identify all UI elements inside any other (window, group, scroll area, ...)
repeat with x in UI elements
	log class of x & name of x
end repeat

### This piece of code is to identify all UI elements with properties inside any other
repeat with x in UI elements
	set props to get properties of x
	log props
	log "----------------------------"
end repeat

### RUN Apple Script from Terminal: osascript YourScript.scpt
*)

on checkFolderOrFileExists(FileOrFolderToCheckString)
	try
		alias FileOrFolderToCheckString
		return true
	on error
		return false
	end try
end checkFolderOrFileExists

set homeFolder to path to home folder as string
# log homeFolder
#set checkFolder to "Applications:Some.app:Some_File"
set checkFolder to "Applications"
set fullPath to homeFolder & checkFolder as string

if checkFolderOrFileExists(fullPath) then
	log "---> Applications folder already exists in " & homeFolder
	set appFolder to "Applications"
end if

tell application "Finder"
	activate
	make new Finder window
	repeat while not (window 1 exists)
	end repeat
end tell

tell application "System Events"
	set homeFolder to name of current user
	
	tell application process "Finder"
		
		keystroke "k" using {command down}
		delay 0.5
		
		keystroke "smb://nas@nas/NAS"
		delay 0.5
		click button 1 of group 1 of window 1
		delay 0.5
		key code 53 ### ESC Escape
		delay 0.5
		
		try
			delay 0.3
			click menu item "Show Path Bar" of menu 1 of menu bar item "View" of menu bar 1
			delay 0.3
			click menu item "Show Status Bar" of menu 1 of menu bar item "View" of menu bar 1
			delay 0.3
		end try
		
		set homeFolderPath to get path to home folder
		
		### Change to /Users first - if I'm already in home, dialog will not disappear
		keystroke "g" using {command down, shift down}
		repeat while not (sheet 1 of window 1 exists)
			delay 0.1
		end repeat
		keystroke homeFolderPath
		key code 36 ### keycode Enter
		delay 0.5
		
		if not (appFolder exists) then
			### Create Applications folder
			keystroke "n" using {command down, shift down}
			delay 0.5
			keystroke "Applications"
			delay 0.5
			key code 36 ### keycode Enter
			delay 0.5
		end if
		
		keystroke "j" using {command down}
		delay 0.5
		
		repeat with x in UI elements of group 1 of window 1
			set props to get properties of x
			if name of props = "Show item info" then
				tell x
					if not (its value as boolean) then click x
					delay 0.5
				end tell
			end if
			if name of props = "Show icon preview" then
				tell x
					if not (its value as boolean) then click x
					delay 0.5
				end tell
			end if
			if name of props = "Show Library Folder" then
				tell x
					if not (its value as boolean) then click x
					delay 0.5
				end tell
			end if
		end repeat
		
		repeat with x in UI elements of window 1
			set props to get properties of x
			
			if name of props = "Always open in icon view" then
				tell x
					if not (its value as boolean) then click x
					delay 0.5
				end tell
			end if
			if name of props = "Group By:" and role of props = "AXPopUpButton" then
				delay 0.5
				click x
				delay 0.5
				keystroke "Name"
				delay 0.5
				key code 36 ### keycode Enter
			end if
			if name of props = "Sort By:" and role of props = "AXPopUpButton" then
				delay 0.5
				click x
				delay 0.5
				keystroke "Name"
				delay 0.5
				key code 36 ### keycode Enter
			end if
			if name of props = "Use as Defaults" and role of props = "AXButton" then
				delay 0.5
				click x
			end if
		end repeat
		
		delay 0.5
		tell application "Finder" to if it is running then close its front window
		delay 0.5
		
		keystroke "," using {command down}
		delay 0.5
		
		click button "Sidebar" of toolbar 1 of window "Finder Settings"
		delay 0.5
		
		repeat with x in UI elements of scroll area 1 of window "Finder Settings"
			set props to get properties of x
			-- log props
			if description of x = "Recents" and role of props = "AXCheckBox" then
				tell x
					if (its value as boolean) then click x
					delay 0.5
				end tell
			end if
			if description of x = homeFolder and role of props = "AXCheckBox" then
				tell x
					if not (its value as boolean) then click x
					delay 0.5
				end tell
			end if
		end repeat
		
		delay 0.5
		
		click button "Advanced" of toolbar 1 of window "Finder Settings"
		delay 0.5
		
		repeat with x in UI elements of window "Finder Settings"
			set props to get properties of x
			#log props
			if title of x = "Show all filename extensions" and role of props = "AXCheckBox" then
				tell x
					if not (its value as boolean) then click x
					delay 0.5
				end tell
			end if
			if title of x = "In windows when sorting by name" and role of props = "AXCheckBox" then
				tell x
					if not (its value as boolean) then click x
					delay 0.5
				end tell
			end if
			if title of x = "On Desktop" and role of props = "AXCheckBox" then
				tell x
					if not (its value as boolean) then click x
					delay 0.5
				end tell
			end if
			
			if name of x = "When performing a search:" and role of props = "AXPopUpButton" then
				tell x
					click x
					delay 0.5
					keystroke "Search the current"
					delay 0.5
					key code 36 ### keycode Enter		
					delay 0.5
				end tell
			end if
		end repeat
		
		click button "General" of toolbar 1 of window "Finder Settings"
		delay 0.5
		
		set hdd to checkbox 1 of group 1 of window "Finder Settings"
		tell hdd
			if not (its value as boolean) then click hdd
			delay 0.5
		end tell
		
		set servers to checkbox 4 of group 1 of window "Finder Settings"
		tell servers
			if not (its value as boolean) then click servers
			delay 0.5
		end tell
		
		click pop up button 1 of group 1 of window "Finder Settings"
		delay 0.5
		keystroke homeFolder
		delay 0.5
		key code 36 ### keycode Enter		
		
	end tell
	
	delay 0.5
	### Close settings window
	tell application "Finder" to if it is running then close its front window
	delay 0.5
	### Close Finder window
	tell application "Finder" to if it is running then close its front window
	
end tell

log "SCRIPT END."

