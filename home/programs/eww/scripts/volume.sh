#!/usr/bin/env bash

# shellcheck source=/dev/null
source "$(dirname "$0")"/utils.sh

volicons=("" "" "")

vol() {
  wpctl get-volume @DEFAULT_AUDIO_"$1"@ | awk '{print int($2*100)}'
}
ismuted() {
  wpctl get-volume @DEFAULT_AUDIO_"$1"@ | rg -qi muted
  echo -n $?
}

gen_output() {
  percent="$(vol "SINK")"
  if [[ "$event" == *source* ]]; then
    pactl list sources | rg -q RUNNING
    [ $? -eq 1 ] && in_use=0 || in_use=1
  else
    lvl=$(awk -v n="$percent" 'BEGIN{print int(n/34)}')
    ismuted=$(ismuted "SINK")

    if [ "$ismuted" = 1 ]; then
      icon="${volicons[$lvl]}"
    else
      icon=""
    fi
  fi

  echo '{"icon": "'"$icon"'", "percent": "'"$percent"'", "microphone": "'"$(vol "SOURCE")"'", "in_use": "'"$in_use"'"}'
}

# initial values
in_use=0
last_time=$(get_time_ms)
gen_output

# event loop
pactl subscribe | rg --line-buffered ".*(source|sink).*" | while read -r event; do
  current_time=$(get_time_ms)
  delta=$((current_time - last_time))
  # 50ms debounce
  if [[ $delta -gt 50 ]]; then
    gen_output
    # reset debounce timer
    last_time=$(get_time_ms)
  fi
done
