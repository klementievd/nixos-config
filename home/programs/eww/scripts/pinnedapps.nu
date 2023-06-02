#!/usr/bin/env nu

mut output = ""

let apps = (open ~/.config/eww/config.toml | get bar-pinned-apps | values)

for $application in $apps {
    $output += $"\(button :class \"applications-button\" :onclick \"($application | get cmd)\" \"($application | get icon)\"\)"
}

bash -c $"echo '\(box ($output)\)'"
