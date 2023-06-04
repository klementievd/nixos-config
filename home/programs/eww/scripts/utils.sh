#!/usr/bin/env bash

if [ ! "$XDG_CACHE_HOME" ]; then
  XDG_CACHE_HOME="/home/mihai/.local/cache"
fi

function get_time_ms {
  date -u +%s%3N
}
