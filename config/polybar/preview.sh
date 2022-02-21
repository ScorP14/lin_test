#!/usr/bin/env bash


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the preview bar
DIR="${HOME}/.config/polybar/bars"
polybar -q top -c "$DIR"/preview.ini &

#polybar -q bottom -c "$DIR"/preview.ini &
