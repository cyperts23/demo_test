#!/bin/bash

cd /root/pythonbackend || exit 1

source venv/bin/activate || exit 1

exec gunicorn app:app --bind 0.0.0.0:8000
