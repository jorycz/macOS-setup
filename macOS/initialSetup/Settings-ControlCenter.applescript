global row_names, battery_found
set battery_found to false

(*
### This piece of code is to identify all UI elements inside any other (window, group, scroll area, ...)
repeat with x in UI elements
	log class of x & name of x
end repeat

### This piece of code is to identify all UI elements with properties inside any other
repeat with x in UI elements
	set p to get properties of x
	log p
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

open_settings_to("Control Center")

delay 1

tell application "System Events"
	tell application process "System Settings"
		
		delay 1
		
		set foundUserSwitching to false
		repeat with element in UI elements of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			if class of element is group then
				repeat with gElement in UI element of element
					set p to get properties of gElement
					#log p
					#log "***************************"
					
					if class of gElement is pop up button and name of p = "Sound" then
						click gElement
						delay 0.6
						keystroke "Always show"
						delay 0.6
						key code 36 ### keycode Enter
						delay 0.6
					end if
					
					if class of gElement is static text and name of p = "Battery" then
						set battery_found to true
					end if
					
					if battery_found then
						if class of gElement is checkbox and name of p = "Show Percentage" then
							tell scroll bar 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
								set value to 0.5
							end tell
							delay 0.5
							
							tell gElement
								if not (its value as boolean) then
									click gElement
									delay 1
								end if
							end tell
						end if
						
						if class of gElement is pop up button and name of p = "Show Energy Mode" then
							set battery_found to false
							delay 0.5
							click gElement
							delay 0.6
							keystroke "Always"
							delay 0.6
							key code 36 ### keycode Enter
							delay 0.6
						end if
					end if
					
					if name of p = "Fast User Switching" and class of gElement is static text then
						# log "FUS Found"
						set foundUserSwitching to true
						tell scroll bar 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
							set value to 0.8
						end tell
						delay 0.5
					end if
					
					if foundUserSwitching then
						# log "FUS Detected"
						# log p
						# log "----------------------------"
						if class of gElement is pop up button then
							click gElement
							delay 0.6
							keystroke "Account Na"
							delay 0.6
							key code 36 ### keycode Enter
							### set it only once
							set foundUserSwitching to false
							delay 0.6
						end if
					end if
					
					if class of gElement is pop up button and name of p = "Recent documents, applications, and servers" then
						tell scroll bar 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
							set value to 1
						end tell
						delay 0.5
						click gElement
						delay 0.6
						keystroke "30"
						delay 0.6
						key code 36 ### keycode Enter
						delay 0.6
					end if
				end repeat
			end if
			
		end repeat
		
		
	end tell
end tell

delay 1
tell application "System Settings" to quit

log "SCRIPT END."

