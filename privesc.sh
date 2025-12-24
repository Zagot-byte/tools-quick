#!/bin/bash
set -e
echo "[+] Installing Privilege Escalation tools"
mkdir -p ~/tools/privesc
cd ~/tools/privesc
wget -nc https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
chmod +x linpeas.sh
git clone https://github.com/diego-treitos/linux-smart-enumeration.git lse || true
chmod +x lse/lse.sh
git clone https://github.com/mzet-/linux-exploit-suggester.git || true
chmod +x linux-exploit-suggester/linux-exploit-suggester.sh
git clone https://github.com/TH3xACE/SUDO_KILLER.git || true
chmod +x SUDO_KILLER/sudo_killer.sh
mkdir -p pspy
cd pspy
wget -nc https://github.com/DominicBreuker/pspy/releases/latest/download/pspy64
chmod +x pspy64
echo "[✓] Privilege escalation tools ready"
