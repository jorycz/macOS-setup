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

tell application "Terminal"
	activate
	delay 0.6
	set font name of settings set "Pro" to "SF Mono Light"
	delay 0.5
	set font size of settings set "Pro" to "13"
	delay 0.5
end tell

tell application "System Events"
	
	tell application process "Terminal"
		
		keystroke "," using {command down}
		delay 0.5
		
		repeat with x in UI elements of toolbar 1 of window 1
			set props to get properties of x
			
			### Setup startup profile - Pro
			if name of props = "General" then
				click x
				delay 0.5
				repeat with element in UI elements of group 1 of window 1
					set props to get properties of element
					if class of element is pop up button and description of props = "startup window profile" then
						click element
						delay 0.5
						keystroke "Pro"
						delay 0.5
						key code 36 ### keycode Enter
						delay 0.6
					end if
				end repeat
			end if
			
			if name of props = "Profiles" then
				click x
				
				delay 0.6
				set profileProFound to false
				set tabBar to false
				set buttonDefault to false
				
				repeat with elm in UI elements of group 1 of window 1
					set props to get properties of elm
					
					if role of props = "AXTabGroup" then
						set tabBar to elm
					end if
					
					if class of elm is button and name of props = "Default" then
						set buttonDefault to elm
					end if
					
					### LIST OF Profiles - choose Pro
					if role of props = "AXScrollArea" then
						repeat with tableRow in UI elements of table of scroll area 1 of group 1 of window 1
							set props to get properties of tableRow
							
							if role of props = "AXRow" then
								set tf to UI element 1 of tableRow
								set p to get properties of tf
								
								if value of p = "Pro" then
									select tableRow
									delay 0.5
									set profileProFound to true
									click buttonDefault
									delay 0.5
									exit repeat
								end if
							end if
						end repeat
					end if
					
					### TAB BAR
					if profileProFound then
						set profileProFound to false
						
						repeat with x in UI elements of tabBar
							set props to get properties of x
							#log props
							#log "........."
							if class of x is radio button and title of props = "Shell" then
								click x
								delay 0.5
								exit repeat
							end if
						end repeat
						
						click pop up button 1 of tabBar
						keystroke "Close if the"
						delay 0.5
						key code 36 ### keycode Enter
						delay 0.6
						
						#repeat with x in UI elements of tabBar
						#	set props to get properties of x
						#	#log props
						#	#log "........."
						#	if class of x is radio button and title of props = "Advanced" then
						#		click x
						#		delay 0.5
						#		exit repeat
						#	end if
						#end repeat
						
						#repeat with x in UI elements of tabBar
						#	set p to get properties of x
						#	if class of x is checkbox and title of p = "Set locale environment variables on startup" then
						#		tell x
						#			if (its value as boolean) then
						#				click x
						#				delay 0.5
						#			end if
						#		end tell
						#	end if
						#end repeat
						
					end if
					
				end repeat
				
			end if
		end repeat
		
		repeat with x in UI elements of window 1
			set p to properties of x
			if subrole of x = "AXCloseButton" then
				delay 0.5
				click x
				exit repeat
			end if
		end repeat
		
	end tell
	
end tell


log "SCRIPT END."

