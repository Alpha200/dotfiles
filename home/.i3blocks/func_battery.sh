#!/bin/sh
BATCURRENT=`acpi | awk '$0~/ /{print $4}' | tr -d ','`
BATTIME=`acpi | awk '$0~/ /{print $5}' | tr -d ','`

echo "$BATCURRENT  $BATTIME"
