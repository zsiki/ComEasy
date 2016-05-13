# ComEasy
Serial communication program used for total station - pc communication.
(c) Zoltan Siki 

## Installation
Install Tcl/Tk on your machine from http://www.tcl.tk/

Download ComEasy sources from https://github.com/zsiki/ComEasy into an empty
directory.

On Linux change the *maincom\_easy.tcl* to be executable:
`chmod +x maincom_easy.tcl`

## Usage
Connect your totalstation to your computer through a serial line (RS-232).
Open a shell/cmd window.
Change directory to the installation directory of ComEasy.
Start the ComEasy program:
`./maincom_easy.tcl` (Linux)

or

`wish maincom_easy.tcl` (Windows and Linux)

You can make a shortcut to start ComEasy.

Select **Commands/Settings...** from the menu.
Set up the serial communication parameters (port, baudrate, parity, stop bits, 
etc.). You can save settings into a file and load later. There are some
sample settings in the `com\_set` directory.

Select **Commands/Download...** from the menu. Enter an output file and press
**Save** button.

Start to send data to serial line on your instrument. The downloaded data is
shown in the program window and saved to the output file.

## Tested instruments
* Leica GIF 10
* Leica TC(R) 300/400/600/700
* Geodimeter 510
* Trimble 5500/M3
* Sokkia Set4C
* TopCon GTS 210
* Spectra Precision Focus 10 (lucaarcteam)

Another description by Luca Bezzi: http://arc-team-open-research.blogspot.hu/2016/05/comeasy-new-tool-for-total-station.html

