#!/bin/bash
set -e
echo "[+] Installing Network & Port Scanning tools"
sudo pacman -S --noconfirm nmap openbsd-netcat
yay -S --noconfirm rustscan masscan
pip install  enum4linux-ng --break-system-packages
echo "[✓] Network tools installed"
