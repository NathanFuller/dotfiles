#!/bin/bash

battime=`acpi -b | cut -f 5 -d " "` 
if [[ $battime < 08:15:00 ]] ;
then
	env > /home/natef/dotfiles/jobs/log
	exec /usr/bin/notify-send "FEEEEED MEEEEEE!" #$battime
fi

#`echo $BATTINFO | grep Discharging` && 
