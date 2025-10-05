#!/bin/bash

sudo /etc/libvirt/hooks/qemu.d/win10/release/end/10-release-hugepages.sh
sudo /etc/libvirt/hooks/qemu.d/win10/release/end/20-return-cpus.sh
sudo /etc/libvirt/hooks/qemu.d/win10/release/end/30-restore-governor.sh
sudo /etc/libvirt/hooks/qemu.d/win10/release/end/40-asusd-integrated.sh
sleep 5
supergfxctl -m Hybrid
