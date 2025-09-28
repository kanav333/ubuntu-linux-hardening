#!/bin/bash
echo "=== Linux Hardening Check ==="

# ---------- Firewall (UFW) ----------
ufw_status=$(sudo ufw status | grep -i active)
if [[ $ufw_status ]]; then
  echo "[+] Firewall is enabled"
else
  echo "[-] Firewall is NOT enabled"
fi

# ---------- SSH Root Login ----------
ssh_root=$(grep -i "^PermitRootLogin" /etc/ssh/sshd_config | awk '{print $2}')
if [[ $ssh_root == "no" ]]; then
  echo "[+] Root login is disabled in SSH"
else
  echo "[-] Root login is still allowed in SSH (value: $ssh_root)"
fi

# ---------- SSH Port ----------
ssh_port=$(grep -i "^Port " /etc/ssh/sshd_config | awk '{print $2}')
if [[ -n $ssh_port ]]; then
  echo "[*] SSH is configured to listen on port: $ssh_port"
else
  echo "[-] SSH port not explicitly set (defaults to 22)"
fi

# ---------- Updates ----------
updates=$(apt list --upgradable 2>/dev/null | grep -v "Listing" | wc -l)
if [[ $updates -eq 0 ]]; then
  echo "[+] System is fully updated"
else
  echo "[-] There are $updates pending updates"
fi

echo "=== Hardening Check Complete ==="
