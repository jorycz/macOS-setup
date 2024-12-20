global row_names, closeSeq
set closeSeq to 0

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

-- open_settings_to("Lock Screen")
-- open_settings_to("Displays")
-- open_settings_to("Trackpad")
open_settings_to("Apple Account")

tell application "System Events"
	tell application process "System Settings"
		
		### iCloud - Manage
		delay 1
		
		if not (button 1 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 exists) then
			log "---> Apple Account / iCloud is NOT configured!"
			return
		end if
		
		click button 1 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		delay 1
		click button 3 of group 2 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		delay 1
		
		set documentsInCloud to checkbox 1 of group 2 of scroll area 1 of group 1 of sheet 1 of window 1
		tell documentsInCloud
			if not (its value as boolean) then click documentsInCloud
		end tell
		
		### For some reason, checkbox is disabled in GUI right after turned on, but sync stays enabled. Just turn it on in GUI again ...
		delay 2
		tell documentsInCloud
			if not (its value as boolean) then click documentsInCloud
		end tell
		
		# display notification "Waiting until dialog is closed. Max 10 seconds." with title "New Setup"
		log "---> Waiting until dialog is closed by user ... (maximum 10 seconds)"
		
		delay 0.5
		### Stop here until sheet is dismissed
		repeat until not (sheet 1 of window 1 exists)
			delay 0.5
			set closeSeq to closeSeq + 1
			if closeSeq > 20 then
				key code 36 ### keycode Enter
				delay 1
			end if
		end repeat
		
		
	end tell
end tell

delay 1
tell application "System Settings" to quit

log "SCRIPT END."

