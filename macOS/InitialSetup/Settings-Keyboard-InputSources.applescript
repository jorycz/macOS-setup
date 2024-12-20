global row_names

(*
### This piece of code is to identify all UI elements inside any other (window, group, scroll area, ...)
### dd1
repeat with x in UI elements
	log class of x & name of x
end repeat

### This piece of code is to identify all UI elements with properties inside any other
### dd2
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
			-- tell 
		end tell
	end tell
end open_settings_to

tell application "System Settings" to quit
delay 1

open_settings_to("Keyboard")
-- open_settings_to("Lock Screen")
-- open_settings_to("Displays")
-- open_settings_to("Trackpad")
-- open_settings_to("Apple Account")

tell application "System Events"
	tell application process "System Settings"
		
		delay 1
		(*repeat with x in UI element of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			set props to get properties of x
			log props
			log "----------------------------"
		end repeat*)
		
		repeat until button 1 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 exists
			delay 0.1
		end repeat
		
		### Show Input Sources
		delay 0.5
		click button 1 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		delay 1
		
		### Set basics
		repeat with x in UI element of group 1 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window "Keyboard"
			set props to get properties of x
			
			if name of props starts with "Automatically switch to a document" and role of props = "AXCheckBox" then
				tell x
					if not (its value as boolean) then
						click x
						delay 0.5
					end if
				end tell
			end if
		end repeat
		
		repeat with x in UI element of group 2 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window "Keyboard"
			set props to get properties of x
			if name of props = "Correct spelling automatically" and role of props = "AXCheckBox" then
				tell x
					if (its value as boolean) then
						click x
						delay 0.5
					end if
				end tell
			end if
			if name of props = "Capitalize words automatically" and role of props = "AXCheckBox" then
				tell x
					if (its value as boolean) then
						click x
						delay 0.5
					end if
				end tell
			end if
			if name of props = "Add period with double-space" and role of props = "AXCheckBox" then
				tell x
					if (its value as boolean) then
						click x
						delay 0.5
					end if
				end tell
			end if
		end repeat
		
		repeat with x in UI element of group 4 of scroll area 1 of group 2 of splitter group 1 of group 1 of sheet 1 of window "Keyboard"
			set props to get properties of x
			if name of props = "Use smart quotes and dashes" and role of props = "AXCheckBox" then
				tell x
					if (its value as boolean) then
						click x
						delay 0.5
					end if
				end tell
			end if
		end repeat
		
		delay 1
		
		set plusButton to button 1 of group 1 of splitter group 1 of group 1 of sheet 1 of window 1
		set minusButton to button 2 of group 1 of splitter group 1 of group 1 of sheet 1 of window 1
		
		### Delete all but first sources
		tell outline 1 of scroll area 1 of group 1 of splitter group 1 of group 1 of sheet 1 of window 1
			set row_id to UI element 1 of every row
			repeat with i from -(count row_id) to -4
				select row -i
				delay 0.5
				click minusButton
				delay 0.5
			end repeat
		end tell
		
		delay 1
		
		### Add layout Czech - QWERTY
		click plusButton
		delay 1
		tell text field 1 of sheet 1 of sheet 1 of window "Keyboard"
			keystroke "Czech"
			delay 1
		end tell
		
		repeat with t_row in UI elements of table 1 of scroll area 1 of sheet 1 of sheet 1 of window 1
			if class of t_row is row then
				set uiElmnt to UI element 1 of t_row
				set rowProps to get properties of uiElmnt
				if name of rowProps = "Czech – QWERTY" then
					select t_row
					delay 0.5
					key code 36 ### keycode Enter
					exit repeat
				end if
			end if
		end repeat
		
		-- key code 36 ### keycode Enter above
		-- click button 1 of sheet 1 of sheet 1 of window "Keyboard"
		
		delay 1
		key code 36 ### keycode Enter
		
	end tell
end tell

delay 2
tell application "System Settings" to quit

log "SCRIPT END."

