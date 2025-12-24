#!/bin/bash
set -e
echo "[+] Installing Pwn tools"
pip install --user pwntools ropgadget
git clone https://github.com/longld/peda.git ~/peda || true
grep -q peda ~/.gdbinit || echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "[✓] Pwn setup complete"
