#!/bin/bash
let pwmvalue=$(expr $1 \* 4 + 3)
if [ $1 -lt 64 ] #blip to 100 for low fan speeds
  then
    gpio -g pwm 18 1023
    sleep 0.1
fi
if [ $1 -lt 32 ] 
  then
    pwmvalue=0
fi
gpio -g pwm 18 $pwmvalue
exit $?
