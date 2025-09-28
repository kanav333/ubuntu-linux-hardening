# ubuntu-linux-hardening
Hardening an Ubuntu Linux VM on VMware by implementing firewall rules, security best practices, and system optimizations. Includes scripts and docs for UFW setup, custom iptables, and service restrictions to enhance protection and demonstrate cybersecurity habits.


# Linux Security Hardening Project 🔐

## 📌 Overview
This project demonstrates how to harden a Linux virtual machine by:
- Enabling and configuring a firewall (UFW).
- Securing SSH (disable root login, enforce password rules, set explicit port).
- Ensuring system updates are applied.
- Automating checks with a custom Bash script (`hardening_check.sh`).

It is part of my cybersecurity learning journey to practice **server hardening, automation, and documentation**.

---

## 🛠️ Steps Taken

### 1. Firewall Configuration
- Enabled UFW (Uncomplicated Firewall).
- Default policy: **deny incoming**, **allow outgoing**.
- Explicitly allowed SSH traffic only.
- Verified using `nc -zv 127.0.0.1 22`.

**Why:** Prevents unauthorized access by blocking all ports except the ones we explicitly allow.

---

### 2. SSH Hardening
- Edited `/etc/ssh/sshd_config`:
  - `PermitRootLogin no` → blocks direct root login.
  - `Port 22` → explicitly set SSH port (can later change to 2222 for extra obscurity).
  - `PasswordAuthentication yes` → allows password-based login (will migrate to SSH keys later).
  - `PermitEmptyPasswords no` → forbids blank passwords.

**Why:** SSH is the most common attack vector. Disabling root login and empty passwords reduces brute-force attack risk.

---

### 3. System Updates
- Checked and installed updates:
  ```bash
  sudo apt update && sudo apt upgrade -y
---

### 4. Learning Outcomes

- Understood the importance of a firewall in limiting attack surface.

- Learned how to harden SSH (root login, passwords, ports).

- Practiced using netcat to test firewall rules.

- Automated system checks with a Bash script.

---
### Example Output
See [`demo_output.txt`](demo_output.txt) for a sample run of the script.

