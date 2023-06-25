#!/bin/bash

PROBE=( $(lsusb | grep "CMSIS-DAP") )

echo "Device: ${PROBE[@]}"

ID=${PROBE[5]}

VENDOR_PRODUCT=(${ID//:/ })

VENDOR=${VENDOR_PRODUCT[0]}

PRODUCT=${VENDOR_PRODUCT[1]}

sudo useradd -G plugdev $(whoami)

RULES=/etc/udev/rules.d/10-my-usb.rules

sudo touch $RULES

sudo tee -a $RULES << END

# Raspberry Pi Picoprobe
ATTRS{idVendor}=="$VENDOR", ATTRS{idProduct}=="$PRODUCT", MODE="660", GROUP="plugdev", TAG+="uaccess"

END

sudo udevadm trigger