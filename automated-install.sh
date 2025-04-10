#!/bin/sh
set -eu

LOGFILE="/tmp/nixos-install.log"
# Redirect output to log file and console
exec > >(tee -a "$LOGFILE") 2>&1

echo "===== Starting Automated NixOS Installation (Non-Flake) ====="
date

echo "Step 1: Checking network connectivity..."
if ! ping -c 1 google.com >/dev/null 2>&1; then
  echo "Network connectivity test failed. Please ensure you are connected to the internet."
  exit 1
fi
echo "Network connectivity is OK."

echo "Step 2: Partitioning and mounting target disk..."
# Run the partitioning script (which mounts the partitions)
./replicate-partitions.sh

echo -n "Re-enter the target disk used (e.g., /dev/sda or /dev/nvme0n1): "
read TARGET_DISK

case "$TARGET_DISK" in
  *[0-9])
    PART_SUFFIX="p"
    ;;
  *)
    PART_SUFFIX=""
    ;;
esac

EFI_PART="${TARGET_DISK}${PART_SUFFIX}1"
ROOT_PART="${TARGET_DISK}${PART_SUFFIX}2"
MOUNT_POINT="/mnt"

echo "Using root partition: $ROOT_PART and EFI partition: $EFI_PART."

echo "Step 3: Cloning the configuration repository..."
# Change REPO_URL to your repository URL.
REPO_URL="https://github.com/jojihatzz/aa"
git clone "$REPO_URL" "$MOUNT_POINT/nixos-config"

echo "Step 4: Installing NixOS using non-flake configuration..."
# Create /mnt/etc/nixos if it does not exist and copy the repository files there.
sudo mkdir -p "$MOUNT_POINT/etc/nixos"
sudo cp -r "$MOUNT_POINT/nixos-config/"* "$MOUNT_POINT/etc/nixos/"

# Run the installer (which will pick up /mnt/etc/nixos/configuration.nix)
nixos-install --root "$MOUNT_POINT"

echo "Step 5: Unmounting filesystems..."
umount -R "$MOUNT_POINT"

echo "Installation complete. Rebooting..."
reboot
