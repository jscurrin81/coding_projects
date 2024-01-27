#!/bin/bash

#Un Enroll from current LH instance
rm -r /etc/config/lhvpn

#Configure new LH Enrollment
config -d config.lhvpn -a

#Set Sleep Timer
MINWAIT=30
MAXWAIT=60
sleep $((MINWAIT+RANDOM % (MAXWAIT-MINWAIT)))

lhvpn-callhome -a 10.99.0.52 -p 443 -s 12345 -m IM_US
