#
#	Display html document in browser
#	@param doc name of html file to open in browser
#	@param topic position in html file (for example #load)
proc GeoHelp {{doc "sugo.html"} {topic ""}} {
	global geoEasyMsg
	global comEasyMsg
	global browser
	global tcl_platform

	set helpdir [file join [pwd] help]
	set helpdir1 [file join [pwd] comhelp]
	set htmlfile [file join $helpdir $doc]
	if {![file exists $htmlfile]} {
		set htmlfile [file join $helpdir1 $doc]
	}
	if {[file exists $htmlfile]} {
		if {[string length $topic]} {
			append htmlfile $topic
		}
		if {$tcl_platform(platform) == "unix"} {
			if {[catch {exec $browser "file://$htmlfile" "&"}] != 0} {
				if {[info exists geoEasyMsg]} {
					tk_dialog .msg $geoEasyMsg(warning) $geoEasyMsg(browser) \
						warning 0 OK
				} else {
					tk_dialog .msg $comEasyMsg(warning) $comEasyMsg(browser) \
						warning 0 OK
				}
			}
		} else {
			if {[shellexecute $htmlfile] < 33} {
				if {[info exists geoEasyMsg]} {
					tk_dialog .msg $geoEasyMsg(warning) $geoEasyMsg(browser) \
						warning 0 OK
				} else {
					tk_dialog .msg $comEasyMsg(warning) $comEasyMsg(browser) \
						warning 0 OK
				}
			}
		}
	} else {
		if {[info exists geoEasyMsg]} {
			tk_dialog .msg $geoEasyMsg(warning) $geoEasyMsg(helpfile) \
				warning 0 OK
		} else {
			tk_dialog .msg $comEasyMsg(warning) $comEasyMsg(helpfile) \
				warning 0 OK
		}
	}
}

#
#	Display About dialog box
proc GeoAbout {} {
	global geoEasyMsg
	global geoModules
	global tcl_platform
	global build_date
	global LICENCE
	global demoMode
	global wrapRoot

	if {! [info exists build_date]} { set build_date "?" }
	set w [focus]
	if {$w == ""} { set w "." }
	set bmdir [file join $wrapRoot bitmaps]
	catch {destroy .about}
	toplevel .about -class Dialog
	wm title .about $geoEasyMsg(menuHelpAbout)
	wm resizable .about 0 0
	wm transient .about $w
	if {[lsearch -exact [image names] about] == -1} {
		image create photo about -file [file join $bmdir about.gif]
	}
	label .about.l -image about
	label .about.t1 -text $geoEasyMsg(mainTitle)
# add built string to about
	set s "internal use only"
	if {$tcl_platform(platform) == "unix"} {
		set n "GeoEasy"
	} else {
		set n "GeoEasy.exe"
	}
	if {[file exist $n]} {
		set s [file size $n]
	}
	label .about.t11 -text "(built $s $build_date)"
	label .about.t2 -text $geoEasyMsg(digikom)
	label .about.t3 -text $geoEasyMsg(about1)
	label .about.t4 -text $geoEasyMsg(about2)
	label .about.t5 -text "$geoEasyMsg(modules) [join $geoModules]"
	if {$demoMode} {
		label .about.t6 -text "DEMO"
	} elseif {[info exists LICENCE] && $LICENCE == "yes"} {
		label .about.t6 -text "LICENSE"
	} else {
		label .about.t6 -text "HARDWARE KEY"
	}
	grid .about.l -column 0 -row 0 -rowspan 4
	grid .about.t1 -column 1 -row 0
	grid .about.t11 -column 1 -row 1
	grid .about.t2 -column 1 -row 2
	grid .about.t3 -column 1 -row 3
	grid .about.t4 -column 1 -row 4
	grid .about.t5 -column 1 -row 5
	grid .about.t6 -column 1 -row 6
	button .about.ok -text $geoEasyMsg(ok) -command "destroy .about"
	grid .about.ok -row 7 -column 0 -columnspan 2
	tkwait visibility .about
	CenterWnd .about
	grab set .about
}
