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

tell application "System Events"
	
	tell application "Finder"
		activate
		delay 0.5
		tell application "Finder" to close every window
		delay 0.5
	end tell
	
	keystroke "j" using {command down}
	delay 0.5
	
end tell

delay 0.6

tell application "System Events" to tell process "Finder"
	
	set frontmost to true
	set wName to name of window 1
	if not (exists (first window whose (name is wName and subrole is "AXSystemFloatingWindow"))) then
		keystroke "j" using {command down}
		repeat
			if exists (first window whose (name is wName and subrole is "AXSystemFloatingWindow")) then exit repeat
			delay 0.1
		end repeat
	end if
	tell (first window whose (name is wName and subrole is "AXSystemFloatingWindow"))
		set thePopUp to pop up button 2
		click thePopUp
		delay 0.5
		keystroke "Date create"
		delay 0.5
		key code 36 ### keycode Enter
		delay 1
	end tell
	
	keystroke "j" using {command down}
	delay 1
	
end tell

log "SCRIPT END."

