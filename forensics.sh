#!/bin/bash
set -e
echo "[+] Installing Forensics & Steganography tools"
sudo pacman -S --noconfirm exiftool  binwalk foremost wireshark-qt imagemagick
sudo usermod -aG wireshark $USER || true
git clone https://aur.archlinux.org/steghide.git
makepkg -si if ! pacman -Qi steghide &>/dev/null;
 then git clone https://aur.archlinux.org/steghide.git /tmp/steghide
  cd /tmp/steghide
  makepkg -si --noconfirm
  echo "Downloading steghide"
fi  
yay -S --noconfirm stegseek autopsy
pip install --user volatility3
sudo pacman -S --noconfirm ruby
gem install zsteg
mkdir -p ~/tools/stegsolve
cd ~/tools/stegsolve
wget -nc http://www.caesum.com/handbook/Stegsolve.jar
echo 'java -jar ~/tools/stegsolve/Stegsolve.jar' > stegsolve
chmod +x stegsolve
sudo ln -sf ~/tools/stegsolve/stegsolve /usr/local/bin/stegsolve
echo "[✓] Forensics setup complete"
