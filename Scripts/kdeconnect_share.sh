#!/bin/bash

device_name=$(kdeconnect-cli --list-available --name-only)

kdeconnect-cli -n "$device_name" --share "$@"
