#!/bin/bash

termux-x11 :0 &>/dev/null &
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1 &>/dev/null

export DISPLAY=:0

export VK_ICD_FILENAMES=$PREFIX/share/vulkan/icd.d/wrapper_icd.aarch64.json
export MESA_VK_WSI_PRESENT_MODE=mailbox
export GALLIUM_DRIVER=zink
export MESA_LOADER_DRIVER_OVERRIDE=zink
export MESA_NO_ERROR=1
export MESA_DEBUG=0
export tu_allow_oob_indirect_ubo_loads=true
export TU_DEBUG=noconform
export vblank_mode=0
export USE_HEAP=1
export DISPLAY=:0
export PULSE_SERVER=127.0.0.1
export XDG_RUNTIME_DIR=/tmp:${TMPDIR}
export WINEESYNC=1
export WINEDEBUG=-all
export DXVK_HUD=full
export DXVK_ASYNC=1
export DXVK_CONFIG_FILE=/sdcard/dxvk.conf

export WINEESYNC_TERMUX=1
export WINEESYNC=1

~/wine_hangover/arm64-v8a/bin/wine explorer /desktop=shell explorer


