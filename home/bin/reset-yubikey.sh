#!/usr/bin/env bash

VENDOR="1050"
PRODUCT="0116"

for X in /sys/bus/usb/devices/*; do 
  C_VENDOR=$(cat "$X/idVendor" 2>/dev/null) 
  C_PRODUCT=$(cat "$X/idProduct" 2>/dev/null)

  if [[ "$VENDOR" == "$C_VENDOR" && "$PRODUCT" == "$C_PRODUCT" ]]; then
    echo "Resetting ${X}"
    echo 0 | sudo tee "${X}/authorized"
    echo 1 | sudo tee "${X}/authorized"
    echo "Reset successful"
  fi
done
