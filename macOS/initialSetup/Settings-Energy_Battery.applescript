global row_names, row_found, batteryMenuFound

set batteryMenuFound to false

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
	set row_found to false
	
	if settings_pane = "Wi-Fi" then
		set settings_pane to "Wi‑Fi"
	end if
	tell application "System Settings"
		activate
		delay 0.5
	end tell
	tell application "System Events"
		tell application process "System Settings"
			
			key code 115 ### keycode Home
			delay 0.5
			
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
								set row_found to true
								exit repeat
							end if
						else
							try
								if item 1 of item i of row_names contains settings_pane then
									log item i of row_names & i
									select row i
									set row_found to true
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

open_settings_to("Energy")

delay 0.5

if not row_found then
	if not batteryMenuFound then
		set batteryMenuFound to true
		open_settings_to("Battery")
	else
		log "---> Can NOT find Setting menu Energy or Battery! Quitting."
		return
	end if
end if



tell application "System Events"
	tell application process "System Settings"
		
		delay 1
		
		if not batteryMenuFound then
			log "---> Found Energy menu - Mac without battery."
			
			repeat with x in UI element of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
				set props to get properties of x
				if class of x is checkbox and name of props starts with "Prevent automatic sleeping" then
					tell x
						if not (its value as boolean) then
							click x
							delay 0.5
						end if
					end tell
				end if
			end repeat
		else
			log "---> Found Battery menu - Mac with battery."
			
			### Options button
			click button 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			delay 0.6
			
			repeat with x in UI element of group 1 of scroll area 1 of group 1 of sheet 1 of window 1
				set props to get properties of x
				if class of x is checkbox and name of props starts with "Prevent automatic sleeping" then
					tell x
						if not (its value as boolean) then
							click x
							delay 1
							exit repeat
						end if
					end tell
				end if
			end repeat
			
			key code 36 ### keycode Enter
			delay 1
			
		end if
		
	end tell
end tell

delay 1
tell application "System Settings" to quit

log "SCRIPT END."

