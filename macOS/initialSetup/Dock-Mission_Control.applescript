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

set spacesCount to do shell script "defaults read com.apple.spaces | awk '/Spaces =/,/\\);/' | grep ManagedSpaceID | wc -l | tr -d ' '"
# log spacesCount

if spacesCount > 3 then
	log "---> More Spaces available already."
else
	do shell script "open -a 'Mission Control'"
	delay 1.5
	
	tell application "System Events"
		set spaceBar to UI element "Spaces Bar" of UI element 1 of group 1 of process "Dock"
		click (every button whose value of attribute "AXDescription" is "add desktop") of spaceBar
		delay 1.5
		click (every button whose value of attribute "AXDescription" is "add desktop") of spaceBar
		delay 1.5
		click (every button whose value of attribute "AXDescription" is "add desktop") of spaceBar
		delay 1.5
		click (every button whose value of attribute "AXDescription" is "add desktop") of spaceBar
	end tell
	
	delay 1.5
	do shell script "open -a 'Mission Control'"
end if

log "SCRIPT END."

