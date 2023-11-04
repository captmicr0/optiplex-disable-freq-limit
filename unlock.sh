#!/bin/bash
modprobe msr
apt-get install msr-tools
wrmsr -a 0x1a0 0x850089 && echo 0 | tee /sys/devices/system/cpu/intel_pstate/no_turbo
