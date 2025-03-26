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
		delay 0.6
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

open_settings_to("Lock Screen")
-- open_settings_to("Displays")
-- open_settings_to("Trackpad")
-- open_settings_to("Apple Account")

tell application "System Events"
	tell application process "System Settings"
		repeat until group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Lock Screen" exists
			delay 0.1
		end repeat
		set windowLockScreen to window "Lock Screen"
		tell group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Lock Screen"
			
			repeat with x in UI elements
				set props to get properties of x
				-- log props
				if name of props = "Require password after screen saver begins or display is turned off" and role of props = "AXPopUpButton" then
					click x
					delay 0.5
					keystroke "After 5 seconds"
					key code 36 ### keycode Enter
					delay 0.5
				end if
				-- Mac with battery
				if name of props = "Turn display off on battery when inactive" and role of props = "AXPopUpButton" then
					click x
					delay 0.5
					keystroke "For 30 minutes"
					key code 36
					delay 0.5
				end if
				-- Mac with battery
				if name of props = "Turn display off on power adapter when inactive" and role of props = "AXPopUpButton" then
					click x
					delay 0.5
					keystroke "For 1 hour"
					key code 36
					delay 0.5
				end if
				-- Mac without battery
				if name of props = "Turn display off when inactive" and role of props = "AXPopUpButton" then
					click x
					delay 0.5
					keystroke "For 2 hours"
					key code 36
					delay 0.5
				end if
				
				### Check if any settings caused Touch ID or Password dialog to appear.
				### If it's Touch ID, try to click on Use Pasword... button.
				### Finally, try to enter string from pasteboard or wait.
				set touchIDOrPasswordDialog to missing value
				
				repeat with x in UI elements of windowLockScreen
					if class of x is sheet then
						#log "---> Sheet Found!"
						
						### IF Password dialog if found - not Touch ID message
						repeat with y in UI elements of x
							set props to get properties of y
							
							if title of y = "Password" then
								log "---> Password dialog found!"
								set touchIDOrPasswordDialog to x
							end if
							
							if class of y is static text and value of props = "Touch ID or enter your password to allow this." then
								log "---> Touch ID dialog found!"
								set touchIDOrPasswordDialog to x
							end if
							
							if class of y is button and title of props = "Use Password…" then
								### Touch ID button that shows "Use Password…"
								click y
								log "---> Touch ID button Use Password clicked!"
								delay 0.5
							end if
							
						end repeat
					end if
				end repeat
				
				if touchIDOrPasswordDialog exists then
					set passwordTried to 0
					log "---> Any kind of authorization dialog found."
					repeat until not (touchIDOrPasswordDialog exists)
						if passwordTried < 1 then
							set passwordTried to passwordTried + 1
							log "---> Trying password from clipboard ... "
							keystroke "v" using {command down}
							delay 0.6
							key code 36 ### keycode Enter
							delay 2
						else
							delay 1
						end if
					end repeat
				end if
				
			end repeat
			
		end tell
	end tell
end tell

delay 1
tell application "System Settings" to quit

log "SCRIPT END."

