
# udevadm monitor
# btmon
# bluetoothctl

left=00:1F:F0:14:47:C1
right=00:1F:F0:14:4B:60

# sudo service bluetooth restart

# bluetoothctl -- remove $left
# bluetoothctl -- remove $right

# bluetoothctl -- disconnect $left
# bluetoothctl -- disconnect $right

# bluetoothctl -- power on
# bluetoothctl -- scan on

# bluetoothctl -- pair $left
# bluetoothctl -- pair $right

# bluetoothctl -- trust $left
# bluetoothctl -- trust $right

# bluetoothctl -- connect $left
# bluetoothctl -- connect $right

# signal strength
# hcitool rssi 00:1F:F0:14:4B:60

## pipewire
## https://askubuntu.com/questions/1339765/replacing-pulseaudio-with-pipewire-in-ubuntu-20-04

# sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
# sudo apt update
# sudo apt install pipewire
# sudo apt install libspa-0.2-bluetooth
# sudo apt install pipewire-audio-client-libraries
# systemctl --user daemon-reload
# systemctl --user --now disable pulseauConnection successful

# systemctl --user restart pipewire

# $ sudo bluetoothctl
# bluetoothctl -- power on
# bluetoothctl -- agent on
# bluetoothctl -- default-agent
# bluetoothctl -- scan on
# # [NEW] Device XX:XX:XX:XX:XX:XX 
# bluetoothctl -- scan off
# bluetoothctl -- trust $right
# bluetoothctl -- pair $right
# [CHG] Device XX:XX:XX:XX:XX:XX Connected: yes


function tbt {
    current_mode_is_a2dp=`pactl list | grep Active | grep a2dp`
    card=`pactl list | grep "Name: bluez_card." | cut -d ' ' -f 2`

    if [ -n "$current_mode_is_a2dp" ]; then
        echo "Switching $card to mSBC (headset, for making calls)..."
        pactl set-card-profile $card headset-head-unit-msbc
    else
        echo "Switching $card to A2DP (high-fidelity playback)..."
        pactl set-card-profile $card a2dp-sink
    fi
}