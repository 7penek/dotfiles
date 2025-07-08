#!/bin/sh
# MEANT TO BE RUN AS ROOT
ufw enable
ufw default deny
ufw default deny routed
ufw default deny incoming
ufw default allow outgoing
