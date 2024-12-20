activate application "Terminal"

tell application "System Events" to tell process "Terminal"
	set menuEntry to menu item "Secure Keyboard Entry" of menu 1 of menu bar item "Terminal" of menu bar 1
	-- get value of attribute "AXMenuItemMarkChar" of menuEntry
	set p to get properties of attribute "AXMenuItemMarkChar" of menuEntry
	-- log p
	if value of p is missing value then
		log "Secure Keyboard Entry is DISABLED."
	else
		log "Secure Keyboard Entry is ENABLED. Disabling ..."
		click menuEntry
		delay 0.5
	end if
end tell
