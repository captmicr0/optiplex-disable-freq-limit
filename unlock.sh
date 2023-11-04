#!/bin/bash
apt-get install msr-tools

cat << EOF >> /etc/rc.local
## make sure msr module loaded
modprobe msr
## unlock
wrmsr 0x1FC "$(printf '0x%x' "$(( 0x$(rdmsr 0x1FC) & 0xFFFFFFFE ))")"
## might not work without setting no_turbo to 0 even though it's already 0
echo 0 | tee /sys/devices/system/cpu/intel_pstate/no_turbo 
EOF

bash /etc/rc.local
