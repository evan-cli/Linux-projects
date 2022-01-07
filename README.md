# Linux-system-check

This shell script allows you to get a quick glance of a Linux system's running processes, network, and disk usage. 
The script utilizes the htop command (an interactive processes viewer) and iftop (monitor's the bandwidth of active network interfaces). 
iftop requires the libpcap and libncurses packages. These are usually preinstalled with many Linux distrubutions. Both htop and iftop are required to run the script. The user will be prompted for their password if they are not currently operating as the root user. Installation will commence. This script ends with an infinite "while" loop and will continously prompt the user for input. Input is case-sentive. To end the script, send a SIGINT [CTRL+C].
