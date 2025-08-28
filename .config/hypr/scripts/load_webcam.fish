#!/usr/bin/env fish

# --- User Controls ---
v4l2-ctl -c brightness=30
v4l2-ctl -c contrast=40
v4l2-ctl -c saturation=80
v4l2-ctl -c hue=0
v4l2-ctl -c white_balance_automatic=1
v4l2-ctl -c gamma=145
v4l2-ctl -c gain=10
v4l2-ctl -c power_line_frequency=2
v4l2-ctl -c white_balance_temperature=4000
v4l2-ctl -c sharpness=0
v4l2-ctl -c backlight_compensation=0

# --- Camera Controls ---
v4l2-ctl -c auto_exposure=3
v4l2-ctl -c exposure_time_absolute=313
v4l2-ctl -c exposure_dynamic_framerate=0
v4l2-ctl -c focus_absolute=240
v4l2-ctl -c focus_automatic_continuous=0
