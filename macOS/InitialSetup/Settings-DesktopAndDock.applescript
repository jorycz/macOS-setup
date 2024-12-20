global row_names

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

on open_settings_to(settings_pane)
	if settings_pane = "Wi-Fi" then
		set settings_pane to "Wi‑Fi"
	end if
	tell application "System Settings"
		activate
		delay 0.5
	end tell
	tell application "System Events"
		tell application process "System Settings"
			tell splitter group 1 of group 1 of window 1
				repeat until outline 1 of scroll area 1 of group 1 exists
					delay 0.1
				end repeat
				tell outline 1 of scroll area 1 of group 1
					set row_names to value of static text of UI element 1 of every row
					repeat with i from 1 to (count row_names)
						set menuItem to item i of row_names as string
						if menuItem = "missing value" then
							key code 119 ### keycode Page Down
							delay 0.6
							repeat until static text of UI element 1 of every row exists
								delay 0.1
							end repeat
							set row_names to value of static text of UI element 1 of every row
						end if
						if settings_pane is not "Apple Account" then
							set mi to item i of row_names
							if mi = {settings_pane} then
								log item i of row_names & i
								select row i
								exit repeat
							end if
						else
							try
								if item 1 of item i of row_names contains settings_pane then
									log item i of row_names & i
									select row i
									exit repeat
								end if
							end try
						end if
					end repeat
				end tell
			end tell
			-- tell 
		end tell
	end tell
end open_settings_to

tell application "System Settings" to quit
delay 1

open_settings_to("Desktop & Dock")

delay 1

tell application "System Events"
	tell application process "System Settings"
		
		delay 2
		
		set s to scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		
		repeat with element in UI elements of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			if class of element is group then
				repeat with gElement in UI element of element
					set props to get properties of gElement
					#log props
					#log "---------------------"
					
					### DOCK
					
					if class of gElement is pop up button and name of props = "Position on screen" then
						click gElement
						delay 0.5
						keystroke "Right"
						delay 0.5
						key code 36 ### keycode Enter
						delay 0.5
					end if
					
					if class of gElement is checkbox and name of props = "Automatically hide and show the Dock" then
						tell gElement
							if not (its value as boolean) then
								click gElement
								delay 0.5
							end if
						end tell
					end if
					
					if class of gElement is checkbox and name of props = "Show suggested and recent apps in Dock" then
						tell gElement
							if (its value as boolean) then
								click gElement
								delay 0.5
							end if
						end tell
					end if
					
					### Desktop & Stage Manager
					
					if class of gElement is pop up button and name of props = "Click wallpaper to reveal desktop" then
						click gElement
						delay 0.5
						keystroke "Only"
						delay 0.5
						key code 36 ### keycode Enter
						delay 0.5
					end if
					
					### Windows
					
					if class of gElement is checkbox and name of props = "Ask to keep changes when closing documents" then
						### Scroll down
						tell s
							set value of scroll bar 1 of s to 0.95
							delay 0.5
						end tell
						
						tell gElement
							if not (its value as boolean) then
								click gElement
								delay 0.5
							end if
						end tell
					end if
					
					#if class of gElement is checkbox and name of props = "Close windows when quitting an application" then
					#	tell gElement
					#		if not (its value as boolean) then
					#			click gElement
					#			delay 0.5
					#		end if
					#	end tell
					#end if
					
					### Mission Control
					
					if class of gElement is checkbox and name of props = "Automatically rearrange Spaces based on most recent use" then
						tell gElement
							if (its value as boolean) then
								click gElement
								delay 0.5
							end if
						end tell
					end if
					
					if class of gElement is checkbox and name of props = "Group windows by application" then
						tell gElement
							if not (its value as boolean) then
								click gElement
								delay 0.5
							end if
						end tell
					end if
					
				end repeat
			end if
		end repeat
		
	end tell
end tell

delay 0.6
tell application "System Settings" to quit

log "SCRIPT END."

