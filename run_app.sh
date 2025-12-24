#!/bin/bash

cd /root/pythonbackend || exit 1

sudo chmod +x deploy.sh

python3 -m venv venv

source venv/bin/activate || exit 1

python3 app.py