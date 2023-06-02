#!/usr/bin/env nu

mut output = ""

let apps = (open ~/.config/eww/config.toml | get taskspanel-pinned-apps | values)

for $application in $apps {
    $output += $"\(button :class \"applications-button\" :onclick \"($application | get cmd)\" \"($application | get icon)\"\)\n"
}

echo $output
