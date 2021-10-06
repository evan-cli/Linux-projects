 #!/bin/bash

#This shell script allows you to get a quick glance of Linux system's running processes, network, and disk usage. 
#The script utilizes the htop command (an interactive processes viewer) and iftop (monitor's the bandwidth of active network interfaces).
#iftop requires the libpcap and libncurses packages. These are usually preinstalled with many Linux distrubutions. 
#Both htop and iftop are required to run the script. The user will be prompted for their password if they are not currently operating as the root user. Installation will commence. 
#This script ends with an infinite "while" loop and will continously prompt the user for input. Input is case-sentive. To end the script, send a SIGINT [CTRL+C].
#By Evan Oliver

#check to see if htop and iftop are already installed
if [ -e /usr/bin/htop ]
then
	echo "good to go"
	else
	echo "installing htop..."
	sudo apt-get install htop -q
	fi
if [ -e /usr/sbin/iftop ]
then
	echo "good to go"
	else
	echo "installing iftop..."
	sudo apt install iftop -q
	fi

#functions that display system info
#more info on disks

moredisk() {
echo ------------------------------------------------------------------
read -p "Would like to see more disks info? [enter Y/N]" answer
case $answer in
	Y|y)
	sudo fdisk -l
	;;
	N|n)
	return 0
	;;
	*)
	(echo "Invalid input"; return 1)
	;;
esac
}

#monitor live network traffic

livenetwork() {
echo ------------------------------------------------------------------
read -p "Would like to see live network traffic? [enter Y/N]" answer
case $answer in
	Y|y)
	sudo iftop
	;;
	N|n)
	return 0
	;;
	*)
	echo "Invalid input"
	return 1
esac
}


#more info on the network

#PROMPT for user input; primary function 

promptinput() {
echo ------------------------------------------------------------------
read -p "What would you like to check? [enter] processes, disks, network:" input
case $input in
	processes)
	(sudo htop; return 1)
	;;
	disks)
	(df; moredisk)
	;;
	network)
	(ip a show; livenetwork)
	;;
	*)
	(echo "Invalid input"; return 1)

esac

}

until promptinput; do : ; done ;
while :
do
	promptinput
done

exit
