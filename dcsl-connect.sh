#!/bin/bash

nmcli=$(nmcli)

if [[ $nmcli == *"DCSL"* ]]; then
	notify-send --hint=int:transient:1 'Disconeccting.' -i dcsl
	nmcli con down 'DCSL Office VPN'
	pkill remmina
	exit 0
fi

notify-send --hint=int:transient:1 'Connecting to VPN... Check 2FA Device.' -i dcsl

# connect to vpn
if ! nmcli con up 'DCSL Office VPN'; then
        notify-send --hint=int:transient:1 'Failed to connect.' -i dcsl
	exit 0
fi

# connect to rdp
remmina -c /home/bassie/.local/share/remmina/group_rdp_dcsl-pc_192-168-50-124.remmina

# exit
exit 0
