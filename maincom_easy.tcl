#!/bin/sh
# the next line restarts using wish \
exec prowish83 "$0" "$@"

# Copied from geo_easy.tcl!
#------------------------------------------------------------------------------
#
#   -- CenterWnd
#       this - handle to window
#
#   Center window on screen
#------------------------------------------------------------------------------
proc CenterWnd {this} {

    set g [split [winfo geometry $this] "x+"]
    set wthis [lindex $g 0]         ;# width of dialog
    set hthis [lindex $g 1]         ;# height of dialog
    set w [winfo screenwidth .]     ;# width of screen
    set h [winfo screenheight .]    ;# height of screen
    set x [expr {int(($w - $wthis) / 2.0)}]
    set y [expr {int(($h - $hthis) / 2.0)}]
    wm geometry $this "+${x}+${y}"
    update
}

#-------------------------------------------------------------------------------
#	-- main module for stanalone ComEasy application
#-------------------------------------------------------------------------------
	global env
	global auto_path
	global tcl_platform
	global lastDir
	set home "."
	set lastDir $home
	set auto_path [linsert $auto_path 0 $home]

	if {[file isfile [file join $home com_easy.eng]] == 0 || \
			[file readable [file join $home com_easy.eng]] == 0} {
		tk_dialog .msg "ERROR" "Message file (com_easy.eng) not found" \
			error 0 OK
		exit
	}

	if {[catch {source [file join $home com_easy.eng]} msg] == 1} {
		tk_dialog .msg "ERROR" "Loading message file failed:\n$msg" error 0 OK
		exit
	}
	
	ComEasy .
