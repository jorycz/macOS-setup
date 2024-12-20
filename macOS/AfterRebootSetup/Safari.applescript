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

tell application "Safari"
	activate
	repeat while not (window 1 exists)
	end repeat
end tell

tell application "System Events"
	tell application process "Safari"
		
		try
			click menu item "Show Favorites Bar" of menu 1 of menu bar item "View" of menu bar 1
			delay 0.8
		end try
		try
			click menu item "Show Status Bar" of menu 1 of menu bar item "View" of menu bar 1
			delay 0.8
		end try
		try
			click menu item "Show Sidebar" of menu 1 of menu bar item "View" of menu bar 1
			delay 0.8
		end try
		
		keystroke "," using {command down}
		delay 0.5
		
		### GENERAL
		
		repeat with x in UI elements of toolbar of window 1
			set p to get properties of x
			if role of p = "AXButton" and title of p = "General" then
				click x
				delay 0.5
			end if
		end repeat
		
		set closeButton to false
		
		repeat with x in UI elements of window 1
			set p to get properties of x
			#log p
			if description of p = "close button" then
				set closeButton to x
			end if
		end repeat
		
		repeat with x in UI elements of group 1 of group 1 of window 1
			set p to get properties of x
			#log p
			
			if class of x is pop up button and name of p = "Safari opens with:" then
				click x
				delay 0.3
				keystroke "All windows from last"
				delay 1
				key code 36 ### keycode Enter
				delay 0.5
			end if
			
			if class of x is pop up button and name of p = "Remove history items:" then
				click x
				delay 0.3
				keystroke "Manual"
				delay 1
				key code 36 ### keycode Enter
				delay 0.5
			end if
			
			if class of x is pop up button and name of p = "Remove download list items:" then
				click x
				delay 0.3
				keystroke "Manual"
				delay 1
				key code 36 ### keycode Enter
				delay 0.5
			end if
			
			if class of x is checkbox and name of p = "Open “safe” files after downloading" then
				tell x
					if (its value as boolean) then click x
					delay 0.2
				end tell
			end if
		end repeat
		
		### ADVANCED
		
		repeat with x in UI elements of toolbar of window 1
			set p to get properties of x
			if role of p = "AXButton" and title of p = "Advanced" then
				click x
			end if
		end repeat
		
		repeat with x in UI elements of group 1 of group 1 of window 1
			set p to get properties of x
			
			if class of x is checkbox and name of p = "Show full website address" then
				tell x
					if not (its value as boolean) then click x
					delay 0.2
				end tell
			end if
			
			if class of x is pop up button and name of p = "Default encoding:" then
				click x
				delay 0.3
				keystroke "Unicode"
				delay 1
				key code 36 ### keycode Enter
				delay 0.5
			end if
			
			if class of x is checkbox and name of p = "Show features for web developers" then
				tell x
					if not (its value as boolean) then click x
					delay 0.2
				end tell
			end if
		end repeat
		
		delay 1
		click closeButton
		
	end tell
end tell

log "SCRIPT END."

