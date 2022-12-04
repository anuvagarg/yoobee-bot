#! /bin/sh
python train.py
exec gunicorn --workers=4 -b 0.0.0.0:$PORT --access-logfile - --error-logfile - app:app