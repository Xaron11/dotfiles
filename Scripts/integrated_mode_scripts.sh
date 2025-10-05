#!/bin/bash

cd /etc/libvirt/hooks/qemu.d/win10/prepare/begin

sudo ./10-asusd-vfio.sh
sudo ./20-reserve-hugepages.sh
sudo ./30-set-governor.sh
sudo ./40-isolate-cpus.sh
