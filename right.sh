#!/bin/bash
#
# Positions my specific terminal to be 80 characters wide
# on my specific screen.

window=`xdotool getactivewindow`
wmctrl -i -r $window -e 0,760,0,610,707
