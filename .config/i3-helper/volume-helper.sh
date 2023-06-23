#!/bin/bash
set -eu

mute() {
  declare -r sink="$1"
  declare -r xobsock="$2"
  pactl set-sink-mute "$sink" toggle
  value=$(pactl get-sink-volume "$sink" | head -n1 | awk '{ print substr($5, 1, length($5)-1) }')
  if [[ $(pactl get-sink-mute "$sink" | awk '{ print $2 }') == 'yes' ]]; then
    value=0
  fi
  echo "$value" >"$xobsock"
}

lower_volume() {
  declare -r sink="$1"
  declare -r xobsock="$2"
  declare -r volume="$3"
  op='-'
  pactl set-sink-volume "$sink" "${op}${volume}%"
  value=$(pactl get-sink-volume "$sink" | head -n1 | awk '{ print substr($5, 1, length($5)-1) }')
  echo "$value" >"$xobsock"
}

raise_volume() {
  declare -r sink="$1"
  declare -r xobsock="$2"
  declare -r volume="$3"
  op='+'
  pactl set-sink-volume "$sink" "${op}${volume}%"
  value=$(pactl get-sink-volume "$sink" | head -n1 | awk '{ print substr($5, 1, length($5)-1) }')
  echo "$value" >"$xobsock"
}

main() {
  case "$1" in
    'mute')
      declare -r sink="$2"
      declare -r xobsock="$3"
      mute "$sink" "$xobsock"
      ;;
    'lower-volume')
      declare -r sink="$2"
      declare -r xobsock="$3"
      declare -r volume="$4"
      lower_volume "$sink" "$xobsock" "$volume"
      ;;
    'raise-volume')
      declare -r sink="$2"
      declare -r xobsock="$3"
      declare -r volume="$4"
      raise_volume "$sink" "$xobsock" "$volume"
      ;;
    *)
      echo "error: Unknown command \`$1\`"
      exit 1
      ;;
  esac
}

main "$@"
