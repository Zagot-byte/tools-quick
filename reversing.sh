#!/bin/bash
set -e
echo "[+] Installing Reverse Engineering tools"
sudo pacman -S --noconfirm ghidra radare2 gdb
git clone https://github.com/pwndbg/pwndbg.git ~/pwndbg || true
cd ~/pwndbg && ./setup.sh
pip install --user angr
echo "[✓] Reversing setup complete"
