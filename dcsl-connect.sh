#!/bin/bash

# connect to vpn
notify-send --hint=int:transient:1 'Connecting to VPN... Check 2FA Device.' -i dcsl
if ! nmcli con up 'DCSL Office VPN'; then
	exit 0
fi

# connect to rdp
remmina -c /home/bassie/.local/share/remmina/group_rdp_dcsl-pc_192-168-50-124.remmina

# exit
exit 0
