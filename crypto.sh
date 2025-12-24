#!/bin/bash
set -e
echo "[+] Installing Cryptography tools"
sudo pacman -S --noconfirm hashcat john ruby python-pip
pip install  xortool --break-system-packages
git clone https://github.com/Ganapati/RsaCtfTool.git ~/tools/RsaCtfTool || true
pip install  -r ~/tools/RsaCtfTool/requirements.txt --break-system-packages
gem install one_gadget
git clone https://github.com/gchq/CyberChef.git ~/tools/CyberChef || true
echo "[✓] Crypto setup complete"
