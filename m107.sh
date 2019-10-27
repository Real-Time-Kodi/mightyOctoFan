#!/bin/bash
gpio -g mode 18 pwm
sleep 0.5
gpio -g pwm 18 0
exit $?
