#!/bin/bash

echo "[!] CTF Toolkit Uninstaller (Safe Mode)"
echo

read -p "Continue uninstall? (y/N): " confirm
[[ "$confirm" != "y" ]] && exit 0

echo
echo "[+] Removing pacman packages (if installed)"

PACMAN_PKGS=(
  exiftool
  steghide
  binwalk
  foremost
  wireshark-qt
  imagemagick
  hashcat
  john
  ghidra
  radare2
  gdb
  nmap
  netcat-openbsd
)

for pkg in "${PACMAN_PKGS[@]}"; do
  if pacman -Qi "$pkg" &>/dev/null; then
    echo "  - removing $pkg"
    sudo pacman -R --noconfirm "$pkg"
  else
    echo "  - $pkg not installed, skipping"
  fi
done

echo
echo "[+] Removing AUR packages (if installed)"

AUR_PKGS=(
  stegseek
  autopsy
  maltego
  rustscan
  masscan
)

for pkg in "${AUR_PKGS[@]}"; do
  if pacman -Qi "$pkg" &>/dev/null; then
    echo "  - removing $pkg"
    sudo pacman -R --noconfirm "$pkg"
  else
    echo "  - $pkg not installed, skipping"
  fi
done

echo
echo "[+] Removing pipx tools (if present)"

if command -v pipx &>/dev/null; then
  PIPX_PKGS=(
    volatility3
    theharvester
    shodan
    xortool
    angr
    pwntools
    ropgadget
    enum4linux-ng
  )

  for pkg in "${PIPX_PKGS[@]}"; do
    if pipx list | grep -q "$pkg"; then
      echo "  - removing pipx $pkg"
      pipx uninstall "$pkg"
    else
      echo "  - pipx $pkg not installed, skipping"
    fi
  done
else
  echo "  - pipx not installed, skipping pipx cleanup"
fi

echo
echo "[+] Removing cloned directories"

DIRS=(
  ~/tools/sherlock
  ~/tools/RsaCtfTool
  ~/tools/CyberChef
  ~/tools/stegsolve
  ~/tools/privesc
  ~/pwndbg
  ~/peda
)

for dir in "${DIRS[@]}"; do
  if [[ -d "$dir" ]]; then
    echo "  - removing $dir"
    rm -rf "$dir"
  else
    echo "  - $dir not found, skipping"
  fi
done

echo
echo "[+] Cleaning GDB config"

if [[ -f ~/.gdbinit ]]; then
  sed -i '/peda/d' ~/.gdbinit
  sed -i '/pwndbg/d' ~/.gdbinit
fi

echo
echo "[+] Optional: remove wireshark group from user"
read -p "Remove wireshark group from $USER? (y/N): " wg
if [[ "$wg" == "y" ]]; then
  sudo gpasswd -d "$USER" wireshark 2>/dev/null || true
fi

echo
echo "[✓] Uninstall complete"
echo "[!] Relogin recommended"
