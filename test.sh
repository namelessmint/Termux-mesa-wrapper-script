#!/bin/bash

termux-x11 :0 &>/dev/null &
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1 &>/dev/null
export DISPLAY=:0
vkcube
