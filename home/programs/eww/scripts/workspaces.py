#!/usr/bin/env python3

import subprocess
import os
import socket

icons = ["󰜌","󰜌","󰜌","󰜌","󰜌","󰜋","󰜋","󰜋","󰜋","󰜋"]

def update_workspace(active_workspace):
    icons_index = [0,1,2,3,4]

    icons_index[active_workspace - 1] = icons_index[active_workspace - 1] + 5
    workspace_buttons = ""
    for i in range(5):
        workspace_buttons += f"(label :text \"{icons[icons_index[i]]}\")"
    prompt = f"(box :orientation \"v\" {workspace_buttons} )"

    subprocess.run(f"echo '{prompt}'",
                   shell=True)

update_workspace(1)

sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

server_address = f'/tmp/hypr/{os.environ["HYPRLAND_INSTANCE_SIGNATURE"]}/.socket2.sock'

sock.connect(server_address)

while True:
    new_event = sock.recv(4096).decode("utf-8")

    for item in new_event.split("\n"):

        if "workspace>>" == item[0:11]:
            workspaces_num = item[-1]

            if int(workspaces_num) < 6:
                update_workspace(int(workspaces_num))
