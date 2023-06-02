#!/bin/sh
list=$(ls ~/.nix-profile/bin | grep -m 10 -i "$1")
buf=""
for l in $list ; do
  buf="$buf (button :class \"finded-item\" :onclick \"$l &\" \"$l\")"
done
echo "(box :orientation \"v\" :spacing 5 :class \"apps\" :halign \"center\" :valign \"center\" $buf)" > ~/.config/eww/scripts/finded_items.txt
