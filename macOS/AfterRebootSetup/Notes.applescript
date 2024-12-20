global settingsCloseButton
set settingsCloseButton to missing value

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

tell application "Notes"
	activate
	repeat while not (window 1 exists)
		delay 0.1
	end repeat
end tell

tell application "System Events"
	tell application process "Notes"
		
		keystroke "," using {command down}
		delay 0.5
		
		repeat with x in UI elements of window 1
			set p to get properties of x
			if subrole of x = "AXCloseButton" then
				set settingsCloseButton to x
			end if
		end repeat
		
		repeat with x in UI elements of group 1 of window 1
			set p to get properties of x
			
			### Default value for "Sort notes by:" is "Date Edited". No other identification of element is possible.
			if class of x is pop up button and value of p = "Date Edited" then
				click x
				delay 0.5
				keystroke "Title"
				delay 0.5
				key code 36 ### keycode Enter
				delay 0.5
				exit repeat
			end if
		end repeat
		
		delay 0.5
		if settingsCloseButton exists then
			click settingsCloseButton
			delay 0.5
		end if
		
	end tell
end tell

#delay 1
#tell application "Notes" to quit

log "SCRIPT END."

