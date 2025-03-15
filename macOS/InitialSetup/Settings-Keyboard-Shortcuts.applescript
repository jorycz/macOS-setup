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
							delay 0.5
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
		end tell
	end tell
end open_settings_to

tell application "System Settings" to quit
delay 1

open_settings_to("Keyboard")
# open_settings_to("Lock Screen")
# open_settings_to("Displays")
# open_settings_to("Trackpad")
# open_settings_to("Apple Account")

delay 2

tell application "System Events"
	tell application process "System Settings"
		
		delay 1
		(*repeat with x in UI element of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			set props to get properties of x
			log props
			log "----------------------------"
		end repeat*)
		
		repeat until button 1 of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 exists
			delay 0.1
		end repeat
		
		delay 0.6
		
		### Keyboard Navigation - move focus between controls
		repeat with element in UI elements of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			set p to get properties of element
			if class of element is checkbox and name of p = "Keyboard navigation" then
				tell element
					if not (its value as boolean) then
						click element
						delay 0.6
					end if
				end tell
			end if
		end repeat
		
		### Show Keyboard Shortcuts
		### Click to LAST button in group 2 which is Keyboard Shortcuts...
		set KeyboardShortcutsButton to false
		repeat with element in UI elements of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			if class of element is button then
				set KeyboardShortcutsButton to element
			end if
		end repeat
		click KeyboardShortcutsButton
		delay 2
		
		keystroke "Mission Control"
		delay 0.5
		
		### Reset current key combinations to defaults so it can be setup later without actually using key shortcuts instead of setting it
		set resetButton to button 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		### This - using Apple magic - turns on all shortcuts "Switch to Desktop x", which is not expected but you can use it
		### I am disabling it below one by one
		delay 0.6
		click resetButton
		delay 0.6
		
		### Access UI element in rows in right side of Settings sheet
		# repeat with x in UI element of UI element 1 of row 1 of outline 1 of scroll area 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		repeat with x in UI element of outline 1 of scroll area 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
			set p to get properties of x
			if role of p = "AXRow" then
				repeat with y in UI element of x
					
					# UI element 1 -- checkbox -- AXCheckBox
					# UI element 2 -- static text -- AXStaticText
					# UI element 3 -- button -- AXButton
					
					set props to get properties of UI element 2 of y
					# log value of props
					# log props
					
					### Language & Region - Preferred Languages
					### If there is English first, it shows "Show Notification Centre", "Control Centre", ...
					### If there is English (US) first, it shows "Show Notification Center", "Control Center", ...
					if value of props starts with "Show Notification Cent" then
						set shortcut_box to UI element 1 of y
						tell shortcut_box
							if not (its value as boolean) then click shortcut_box
							delay 0.5
						end tell
						set shortcut_button to UI element 3 of y
						tell shortcut_button
							click shortcut_button
							delay 1
							# Control + Space
							key code 49 using {control down}
							delay 1
						end tell
					end if
					
					# Mission Control with Triangle (value is 0)
					if role of props = "AXDisclosureTriangle" then
						# log props
						set small_arrow to UI element 2 of y
						tell small_arrow
							click small_arrow
							delay 1
							# Now I need to loop it all again with new rows
						end tell
					end if
					
				end repeat
			end if
		end repeat
		
		### Repeat again with all rows disclosured
		repeat with x in UI element of outline 1 of scroll area 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
			set p to get properties of x
			if role of p = "AXRow" then
				repeat with y in UI element of x
					
					# UI element 1 -- checkbox -- AXCheckBox
					# UI element 2 -- static text -- AXStaticText
					# UI element 3 -- button -- AXButton
					
					set props to get properties of UI element 2 of y
					# log value of props
					# log props
					
					# DISABLE ALL Switch to Desktop ...
					if value of props starts with "Switch to Desktop" then
						set shortcut_box to UI element 1 of y
						tell shortcut_box
							if (its value as boolean) then click shortcut_box
							delay 1
						end tell
					end if
					
				end repeat
			end if
		end repeat
		
		### Repeat again with all rows disclosured and now without switching to another desktop in the middle of settings
		repeat with x in UI element of outline 1 of scroll area 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
			set p to get properties of x
			if role of p = "AXRow" then
				repeat with y in UI element of x
					
					# UI element 1 -- checkbox -- AXCheckBox
					# UI element 2 -- static text -- AXStaticText
					# UI element 3 -- button -- AXButton
					
					set props to get properties of UI element 2 of y
					# log value of props
					# log props
					
					### Move to left Desktop using control + num 1
					if value of props = "Move left a space" then
						set shortcut_box to UI element 1 of y
						tell shortcut_box
							if not (its value as boolean) then click shortcut_box
							delay 0.5
						end tell
						set shortcut_button to UI element 3 of y
						tell shortcut_button
							click shortcut_button
							delay 1
							key code 18 using {control down}
							delay 1
						end tell
					end if
					
					### Move to right Desktop using control + num 2
					if value of props = "Move right a space" then
						set shortcut_box to UI element 1 of y
						tell shortcut_box
							if not (its value as boolean) then click shortcut_box
							delay 0.5
						end tell
						set shortcut_button to UI element 3 of y
						tell shortcut_button
							click shortcut_button
							delay 1
							key code 19 using {control down}
							delay 1
						end tell
					end if
				end repeat
			end if
		end repeat
		
						
		delay 0.5
		keystroke "App Shortcuts"
		delay 1
		
		### All Apps - Zoom
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.6
		key code 48 ### TAB
		delay 0.4
		keystroke "Zoom"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "z" using {option down, control down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### All Apps (Terminal in Utility) - Return to Default Size
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.6
		key code 48 ### TAB
		delay 0.4
		keystroke "Return to Default Size"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "x" using {option down, control down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### All Apps - Window Top Left
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.6
		key code 48 ### TAB
		delay 0.4
		keystroke "Top Left"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "1" using {option down, control down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### All Apps - Window Top Right
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.6
		key code 48 ### TAB
		delay 0.4
		keystroke "Top Right"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "2" using {option down, control down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### All Apps - Window Bottom Left
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.6
		key code 48 ### TAB
		delay 0.4
		keystroke "Bottom Left"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "3" using {option down, control down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### All Apps - Window Bottom Right
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.6
		key code 48 ### TAB
		delay 0.4
		keystroke "Bottom Right"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "4" using {option down, control down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### Safari - Quit
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.8
		click pop up button 1 of group 1 of scroll area 1 of group 1 of sheet 1 of sheet 1 of window 1
		delay 0.6
		keystroke "Safari"
		delay 0.8
		key code 36 ### keycode Enter
		delay 0.6
		key code 48 ### TAB
		delay 0.6
		keystroke "Quit Safari"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "q" using {option down, control down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### Safari - Duplicate Tab
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.8
		click pop up button 1 of group 1 of scroll area 1 of group 1 of sheet 1 of sheet 1 of window 1
		delay 0.6
		keystroke "Safari"
		delay 0.8
		key code 36 ### keycode Enter
		delay 0.6
		key code 48 ### TAB
		delay 0.6
		keystroke "Duplicate Tab"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "d" using {option down, control down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### Stickies - Paste and Match Style
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.8
		click pop up button 1 of group 1 of scroll area 1 of group 1 of sheet 1 of sheet 1 of window 1
		delay 0.4
		keystroke "Stickies"
		delay 0.8
		key code 36 ### keycode Enter
		delay 0.6
		key code 48 ### TAB
		delay 0.4
		keystroke "Paste and Match Style"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "v" using {command down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### Notes - Paste and Match Style
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.8
		click pop up button 1 of group 1 of scroll area 1 of group 1 of sheet 1 of sheet 1 of window 1
		delay 0.4
		keystroke "Notes"
		delay 0.8
		key code 36 ### keycode Enter
		delay 0.6
		key code 48 ### TAB
		delay 0.4
		keystroke "Paste and Match Style"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "v" using {command down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		### Photos - Move 1 Photo to Shared Library
		click button 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.8
		click pop up button 1 of group 1 of scroll area 1 of group 1 of sheet 1 of sheet 1 of window 1
		delay 0.4
		keystroke "Photos"
		delay 0.8
		key code 36 ### keycode Enter
		delay 0.6
		key code 48 ### TAB
		delay 0.4
		keystroke "Move 1 Photo to Shared Library"
		delay 0.8
		key code 48 ### TAB
		delay 0.8
		keystroke "s" using {command down}
		delay 0.8
		click button 2 of group 1 of sheet 1 of sheet 1 of window 1
		delay 1
		
		keystroke "Input Sources"
		delay 0.8
		
		### Reset current key combinations to defaults so it can be setup later without actually using key shortcuts instead of setting it
		set resetButton to button 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		click resetButton
		delay 0.5
		
		### Access UI element in rows in right side of Settings sheet
		# repeat with x in UI element of UI element 1 of row 1 of outline 1 of scroll area 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		repeat with x in UI element of outline 1 of scroll area 1 of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
			set p to get properties of x
			if role of p = "AXRow" then
				repeat with y in UI element of x
					
					# UI element 1 -- checkbox -- AXCheckBox
					# UI element 2 -- static text -- AXStaticText
					# UI element 3 -- button -- AXButton
					
					set props to get properties of UI element 2 of y
					
					if value of props = "Select the previous input source" then
						set shortcut_box to UI element 1 of y
						tell shortcut_box
							if (its value as boolean) then click shortcut_box
							delay 0.5
						end tell
					end if
					
					if value of props = "Select next source in Input menu" then
						set shortcut_button to UI element 3 of y
						tell shortcut_button
							click shortcut_button
							delay 0.8
							keystroke "a" using {command down, shift down}
							delay 0.5
						end tell
					end if
					
				end repeat
			end if
		end repeat
		
		set doneButton to button 2 of group 2 of splitter group 1 of group 1 of sheet 1 of window 1
		delay 0.8
		click doneButton
		
	end tell
end tell

delay 1
tell application "System Settings" to quit

log "SCRIPT END."

