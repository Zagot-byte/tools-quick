# TOOLS QUICK (Arch Linux)

A minimal, practical CTF / pentesting toolkit for **Arch Linux**.

Built for:
- Forensics
- OSINT
- Cryptography
- Reverse engineering
- Binary exploitation (pwn)
- Privilege escalation
- Network reconnaissance

No bloated web tools.
No broken Python installs.
Arch-first and auditable.

---

## 📁 Structure

```
quick-tools/
├── utils.sh        # Base utilities
├── forensics.sh   # Forensics + steganography
├── osint.sh       # OSINT tools
├── crypto.sh      # Cryptography tools
├── reversing.sh   # Reverse engineering
├── pwn.sh         # Binary exploitation
├── privesc.sh     # Privilege escalation
├── network.sh     # Port scanning & recon
└── uninstall.sh   # Safe uninstaller
```

---

## ⚙️ Requirements

- Arch Linux
- `base-devel`
- Internet connection
- Optional: AUR access (manual or helper)

---

## 🚀 Installation

Make scripts executable:
```bash
chmod +x *.sh
```

Run only what you need (recommended order):
```bash
./utils.sh
./forensics.sh
./network.sh
./privesc.sh
```

You do **not** need to run everything.

Scripts use `pacman`, manual AUR builds, and `pipx`.
System Python is never modified.

---

## 🐍 Python Note (Important)

Arch follows **PEP 668**.
All Python CLI tools are installed using **pipx**, not pip.

If needed:
```bash
sudo pacman -S python-pipx
pipx ensurepath
```
Restart your terminal after this.

---

## 🧹 Uninstall

To remove everything installed by this toolkit:
```bash
./uninstall.sh
```

The uninstaller:
- Checks before removing
- Skips missing packages
- Removes cloned tools in `~/tools`
- Does **not** break your system

---

## ⚠️ Disclaimer

This toolkit is intended for:
- Learning
- CTFs
- Labs
- Authorized security testing only

You are responsible for how you use these tools.

---

## 🧠 Philosophy
- Prefer `pacman` over pip
- Prefer simplicity over automation
- Prefer tools you understand
- Avoid unnecessary duplicates

---

Happy hacking 🐧
