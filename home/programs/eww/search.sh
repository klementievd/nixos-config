#!/usr/bin/env sh

list=$(ls /usr/bin/ | grep -m 10 -i "$1")
buf=""
for l in $list ; do
  buf="$buf (button :class \"item\" :onclick \"$l &\" \"$l\")"
done
echo "(box :orientation \"v\" :spacing 5 :class \"apps\" :halign \"center\" :valign \"center\" $buf)" > $XDG_CONFIG_HOME/eww/search_items.txt
