#!/bin/bash
apt-get install msr-tools
modprobe msr
cat << EOF >> /etc/rc.local
modprobe msr
wrmsr 0x1FC "$(printf '0x%x' "$(( 0x$(sudo rdmsr 0x1FC) & 0xFFFFFFFE ))")"
EOF
