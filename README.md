---

# 🛠️ Fix-my-Linux (GUI Edition)

A simple graphical repair tool for Arch based Linux.
Select common maintenance and recovery tasks via checkboxes and run them with one click – perfect for both beginners and power users.

> Built with Bash + YAD — no dependencies beyond your system and `pacman`.

---

## 🎯 Features

* ✅ GUI-based checklist using `yad`
* 🔄 Update system packages
* 🌍 Optimize pacman mirrorlist
* 🧼 Clear package cache
* 🗑️ Remove orphaned packages
* 🔐 Enable and configure UFW firewall
* 🧱 Reinstall GRUB bootloader (optional)
* 🧯 View recent system errors (journal)

---

## 📦 Requirements

* Arch based Linux
* `yad` installed:

  ```bash
  sudo pacman -S yad
  ```

---

## 🚀 How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/Geri-jpg/fix-my-linux-gui.git
   cd fix-my-linux-gui
   ```

2. Make the script executable:

   ```bash
   chmod +x fix-my-linux.sh
   ```

3. **Run the script with `sudo`**:

   ```bash
   sudo ./fix-my-linux.sh
   ```

> ⚠️ The script **must be run as root (with sudo)** since it performs system-level changes like package installation, firewall activation, and GRUB configuration.

---


## 📁 Project Structure

| File                    | Description                               |
| ----------------------- | ----------------------------------------- |
| `arch-app-installer.sh` | Main script with GUI and app logic        |
| `README.md`             | Project documentation (you’re reading it) |


---

## ⚠️ Disclaimer

Use at your own risk. Some actions like reinstalling GRUB can break your boot setup if misused.
Always double-check what you're selecting.

---

## 📌 To-Do / Future Plans

* [ ] Add log output after actions
* [ ] Add automatic detection of broken pacman locks
* [ ] Group tasks by category (System / Network / Bootloader)
* [ ] Optional AUR support
