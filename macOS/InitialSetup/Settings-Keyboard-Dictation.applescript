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
		
		repeat until checkbox 1 of group 4 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 exists
			delay 0.1
		end repeat
		
		### Enable Dictation
		set enableButton to checkbox 1 of group 4 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		tell enableButton
			if not (its value as boolean) then
				click enableButton
				delay 0.5
			end if
		end tell
		
		set firstTimeSetup to false
		if sheet 1 of window 1 exists then
			set firstTimeSetup to true
			repeat with x in UI element of sheet 1 of window 1
				set props to get properties of x
				if name of props = "Enable" and role of props = "AXButton" then
					delay 1
					click x
					delay 0.5
					exit repeat
				end if
			end repeat
			
			delay 0.5
			click button 1 of group 4 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			delay 0.5
			keystroke "Czech"
			delay 0.5
			
			set dictLangConfirmButton to button 1 of sheet 1 of window 1
			set dictLangCancelButton to button 2 of sheet 1 of window 1
			
			repeat with x in UI element of table 1 of scroll area 1 of sheet 1 of window 1
				if sheet 1 of window 1 exists then
					set rowProperties to get properties of x
					-- log props
					-- log "----------------------------"
					if role of rowProperties = "AXRow" then
						repeat with elementInsideRow in UI element of x
							repeat with elementInsideUIElement in UI element of elementInsideRow
								set insProps to get properties of elementInsideUIElement
								-- log insProps
								if value of insProps = "Czechia" then
									set cBox to checkbox 1 of elementInsideRow
									tell cBox
										if not (its value as boolean) then
											click cBox
											delay 1
											click dictLangConfirmButton
											delay 0.5
										else
											delay 1
											click dictLangCancelButton
											delay 0.5
										end if
									end tell
									exit repeat
								end if
							end repeat
						end repeat
					end if
				end if
			end repeat
		else
			log "---> Dictation is already enabled. Do not continue with languages ..."
		end if
		
	end tell
end tell

delay 1
tell application "System Settings" to quit

log "SCRIPT END."

