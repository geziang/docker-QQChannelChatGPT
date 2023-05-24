#!/bin/sh

set -e

groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc

# chown -R abc:users /config

export HOME=/app
cd $HOME

s6-applyuidgid -u "$PUID" -g "$PGID" $@
