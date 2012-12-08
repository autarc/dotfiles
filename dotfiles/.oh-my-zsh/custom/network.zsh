#################
#				#
#	Network		#
#				#
#################


#### traffic

	# noch kombinieren mit:  ss -p
	alias network="lsof -P -i -n"

	alias check="netstat -enatup | grep $1" #2020


#### local

	alias hosts="sudo subl /etc/hosts"

	alias server_restart="sudo service apache2 restart"

	# add | remove to localdev enviroment
	alias index="~/Scripts/add.zsh"
	alias remove="~/Scripts/remove.zsh"


	# a simple server
	function server() {
		local port="${1:-8000}"
		open "http://localhost:${port}/"
		python -m SimpleHTTPServer "$port"
	}

#### remote



#### address

# mac-address-change()
# {
#    sudo /etc/rc.d/network stop
# 	 sudo ip link set wlan0 down         				# sets wlan0 down
# 	 sudo ip link set wlan0 address 00:11:22:33:44:55
# 	 sudo ip link set wlan0 up               			# sets wlan0 up
# 	 sudo /etc/rc.d/network start


# 	sudo ifconfig wlan0 down
# 	sudo ifconfig wlan hw ether 00:11:22:33:44:55
# 	sudo ifconfig wlan0 up
# }

