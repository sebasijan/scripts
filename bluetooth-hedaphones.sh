
# udevadm monitor
# bluetoothctl

left=00:1F:F0:14:47:C1
right=00:1F:F0:14:4B:60

sudo service bluetooth restart

bluetoothctl -- remove $left
bluetoothctl -- remove $right

bluetoothctl -- power on
bluetoothctl -- scan on

bluetoothctl -- pair $left
bluetoothctl -- pair $right

bluetoothctl -- connect $left
# bluetoothctl -- connect $right

bluetoothctl -- trust $left
bluetoothctl -- trust $right