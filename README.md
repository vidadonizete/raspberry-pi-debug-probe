# Files
We have 4 files in this repository:  

 - configure.sh
 - launch.json
 - settings.json
 - README.md

## configure.sh
It's a bash script to make it easy to setup udev for debug probe

## *json
I've copied it from raspberry pi pico configuration:  
[pico-examples](https://github.com/raspberrypi/pico-examples/tree/master/ide/vscode)

# Changes
openocd configuration is describe as below:  
```bash
$  sudo openocd -f interface/cmsis-dap.cfg -f target/rp2040.cfg -c "adapter speed 5000" -c "program blink.elf verify reset exit"
```

I added the code below:  

```json
"configFiles": [
    "interface/cmsis-dap.cfg",
    ...
]
```

```json
"openOCDLaunchCommands": [
    "adapter speed 5000"
],
```

I get it from debug probe openocd command line tutorial.

# How to setup environment
> It's a debug environment, not a build one. Read the documentation:
https://www.raspberrypi.com/documentation/microcontrollers/debug-probe  
https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html

## Install
This environment relies on an open source VSCode extension: [cortex-debug](https://github.com/Marus/cortex-debug)
```bash
code --install-extension marus25.cortex-debug
```

## Problems
cortex-debug is trying to launch openocd but isn't finding debug probe device.
See error below:  

**Launch command**:
```bash
openocd -c "gdb_port 50000" -c "tcl_port 50001" -c "telnet_port 50002" -s yourhomehere -f yourhomehere/.vscode/extensions/marus25.cortex-debug-1.10.0/support/openocd-helpers.tcl -f interface/cmsis-dap.cfg -f target/rp2040.cfg -c "adapter speed 5000"
```

**Error**:
```bash
Error: unable to find a matching CMSIS-DAP device
```

To fix, you need to add your device into udev permission.
Execute ./configure.sh and your life will be great.