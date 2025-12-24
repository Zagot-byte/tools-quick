#!/bin/bash
set -e
echo "[+] Installing OSINT tools"
sudo pacman -S --noconfirm python python-pip
git clone https://github.com/sherlock-project/sherlock.git ~/tools/sherlock || true
pip install --user -r ~/tools/sherlock/requirements.txt
pip install --user theharvester shodan
paru -S --noconfirm maltego
echo "[✓] OSINT setup complete"
