#!/bin/sh
BATCURRENT=`acpi | awk '$0~/ /{print $4}' | tr -d ','`
BATTIME=`acpi | awk '$0~/ /{print $5}' | tr -d ','`

if [[ "$BATTIME" == "until" ]]; then
  BATTIME=""
fi

echo "$BATCURRENT  $BATTIME"
