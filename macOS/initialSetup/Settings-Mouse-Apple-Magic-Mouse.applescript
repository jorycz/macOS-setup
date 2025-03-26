global row_names, tab_bar
set tab_bar to missing value

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
			-- tell 
		end tell
	end tell
end open_settings_to

tell application "System Settings" to quit
delay 1

open_settings_to("Mouse")
-- open_settings_to("Lock Screen")
-- open_settings_to("Displays")
-- open_settings_to("Trackpad")
-- open_settings_to("Apple Account")

tell application "System Events"
	tell application process "System Settings"
		
		delay 2
		
		repeat with x in UI element of group 1 of group 2 of splitter group 1 of group 1 of window 1
			set p to get properties of x
			# log p
			if role of p = "AXTabGroup" then
				set tab_bar to x
				exit repeat
			end if
		end repeat
		
		delay 0.6
		
		if tab_bar exists then
			log "---> Apple Magic Mouse settings detected."
			
			click radio button 1 of tab_bar
			delay 0.3
			
			repeat with x in UI element of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
				set p to get properties of x
				# log p
				if class of x is pop up button and name of p = "Secondary click" then
					click x
					delay 0.8
					keystroke "Click Right"
					delay 0.8
					key code 36 ### keycode Enter
					delay 0.8
				end if
				
				if class of x is checkbox and name of p = "Smart zoom" then
					tell x
						if not (its value as boolean) then
							click x
							delay 0.6
						end if
					end tell
				end if
			end repeat
			
			click radio button 2 of tab_bar
			delay 0.3
			
			repeat with x in UI element of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
				set p to get properties of x
				# log p
				if class of x is pop up button and name of p = "Swipe between pages" then
					click x
					delay 0.5
					keystroke "Scroll Left or Right with One Finger"
					delay 0.5
					key code 36 ### keycode Enter
					delay 0.5
				end if
				
				if class of x is checkbox and name of p = "Swipe between full-screen applications" then
					tell x
						if not (its value as boolean) then
							click x
							delay 0.6
						end if
					end tell
				end if
				
				if class of x is checkbox and name of p = "Mission Control" then
					tell x
						if not (its value as boolean) then
							click x
							delay 0.6
						end if
					end tell
				end if
			end repeat
			
		else
			
			log "---> Standard or no mouse detected. No setup is needed."
			
		end if
		
	end tell
end tell

delay 1
tell application "System Settings" to quit

log "SCRIPT END."

