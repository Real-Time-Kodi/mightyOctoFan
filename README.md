# MightyOctoFan
This project aims to provide an alternitive to [Dr Lex's solution](https://github.com/DrLex0/MightyVariableFan) for adding variable fan speed control to the flashforge creator pro. It doesn't require any firmware modification or fancy Raspberry Pi audio processing. Most importantly, it can be used as a replacement for, or in addition to DrLex's system since it uses the same method to control the fan.

### Notable features
 - Automatically blips fan to 100% on lower rpm settings
 - Minimal printer modification
 - Does not beep constantly

### Limitations
 - Does not work with sd card printing.

### Hardware
The hardware modification is exactly the same as it is in [this repository](https://github.com/DrLex0/MightyVariableFan). In summary, you must disconnect the fan from the 3D printer's mainboard and connect a mosfet between it and the printer's 24v supply. The mosfet's gate (with appropriate resistor) should be connected to the raspberry pi's pin 18. The ground from the printer and the pi should also be tied together.  
I reccomend leaving the wire for the cooling fan connected to the mightyboard and putting a connector on the mosfet package so that you can quickly switch back to mighty board control for sd card printing.

### Installation
1. Install the [OctoPrint-FanSpeedMirror](https://plugins.octoprint.org/plugins/FanSpeedMirror/) plugin in order to trigger the fan.
2. Reboot Octoprint.
3. Log into your raspberry pi via ssh
4. Download m106.sh and m107.sh into /home/pi/ (or wherever)
    wget https://raw.githubusercontent.com/Real-Time-Kodi/mightyOctoFan/master/m106.sh
    wget https://raw.githubusercontent.com/Real-Time-Kodi/mightyOctoFan/master/m107.sh
5. Mark m106.sh and m107.sh executable
    chmod +x m106.sh m107.sh
6. In Octoprint, go to settings>plugins>Fan Speed Mirror and set the following values
![Set the scripts locations to /home/pi/m106.sh and /home/pi/m107.sh](https://raw.githubusercontent.com/Real-Time-Kodi/mightyOctoFan/master/img/fsmsettings.png)

### Testing
You can test to see if your fan is working with the following command:  
    /home/pi/m106.sh 255  
This should turn on the fan. You can turn it off again with:  
    /home/pi/m107.sh
