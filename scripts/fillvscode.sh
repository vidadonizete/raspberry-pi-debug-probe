#!/bin/bash

ROOT=$(pwd)
PICO_EXAMPLES=$(pwd)/pico-examples
VSCODE=$PICO_EXAMPLES/ide/vscode

cd .vscode

cp $VSCODE/settings.json settings.json
cp $VSCODE/launch-probe-swd.json launch.json
