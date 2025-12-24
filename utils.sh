#!/bin/bash
set -e
echo "[+] Installing base utilities"
sudo pacman -S --noconfirm git wget curl openbsd-netcat base-devel libcap
echo "[✓] Utilities installed"
