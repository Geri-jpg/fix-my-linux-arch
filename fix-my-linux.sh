#!/bin/bash
set -e

# Check if yad is installed
if ! command -v yad &> /dev/null; then
  echo "❌ 'yad' is not installed. Please install it with: sudo pacman -S yad"
  exit 1
fi

# Show selection menu
CHOICES=$(yad --list \
  --checklist \
  --title="🛠️ Fix-my-Linux" \
  --column="Run" --column="Task" \
  TRUE "System Update" \
  TRUE "Optimize Mirrors" \
  FALSE "Clean Cache" \
  FALSE "Remove Orphans" \
  FALSE "Enable Firewall (UFW)" \
  FALSE "Reinstall GRUB" \
  FALSE "Show System Errors" \
  --width=500 --height=400 \
  --separator=" ")

# Exit if no option was selected
if [[ -z "$CHOICES" ]]; then
  yad --warning --text="❌ No tasks selected. Aborting."
  exit 0
fi

# Run selected tasks
for task in $CHOICES; do
  case $task in
    "System")  # matches "System Update"
      yad --info --text="📦 Running: System Update"
      pacman -Syyu
      ;;
    "Optimize")
      yad --info --text="🌍 Running: Mirrorlist Optimization"
      pacman-mirrors --fasttrack && pacman -Syy
      ;;
    "Clean")
      yad --info --text="🧹 Running: Cache Cleanup"
      paccache -r
      ;;
    "Remove")
      yad --info --text="🗑️ Running: Removing Orphaned Packages"
      pacman -Rns $(pacman -Qdtq)
      ;;
    "Enable")
      yad --info --text="🔒 Enabling Firewall (UFW)"
      pacman -S --noconfirm ufw
      ufw enable && ufw default deny
      ;;
    "Reinstall")
      yad --warning --text="⚠️ Reinstalling GRUB (Expert only)"
      grub-install --target=x86_64-efi --efi-directory=/boot/efi
      update-grub
      ;;
    "Show")
      journalctl -p 3 -xb | yad --text-info --title="🧯 System Errors" --width=800 --height=600
      ;;
  esac
done

# Final message
yad --info --text="✅ All selected tasks completed!"
