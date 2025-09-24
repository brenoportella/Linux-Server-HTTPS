# Project A — Linux HTTPS Server Setup

## Objective
The goal of this project is to transform a fresh Ubuntu Linux installation into a secure HTTPS web server using shell scripts.  
The setup includes Nginx, basic system hardening, and HTTPS support via Let's Encrypt.

## Architecture & Stack
- **OS:** Ubuntu 24.04 LTS  
- **Scripting:** Bash / Shell Scripts  
- **Web Server:** Nginx  
- **Firewall:** UFW (Uncomplicated Firewall)  
- **HTTPS:** Let's Encrypt (via Certbot)  

## Prerequisites
- A fresh installation of **Ubuntu 24.04 LTS** (local VM, cloud VM, or WSL).  
- Optional: a domain name pointing to the server IP for HTTPS setup.  

## Step-by-Step Instructions

1. **Create a Ubuntu 24.04 LTS VM**  
   - Ensure you have root access or a sudo-enabled user.

2. **Run the setup script**  
   ```bash
   bash 1_setup_server.sh
   ```

   This script will:
   - Update and upgrade the system packages  
   - Install essential packages: Nginx, UFW, Certbot, Git, Curl, Wget  
   - Configure and enable UFW firewall  
   - Enable and start Nginx  
   - Display server IP for access

3. **Test the server**  
   - Open your browser and access:  
     ```
     http://<SERVER_IP>
     ```  
   - You should see the default Nginx page or a custom page configured by the script.

4. **Enable HTTPS (optional, requires domain)**  
   ```bash
   certbot --nginx -d yourdomain.com -d www.yourdomain.com
   ```  
   - This will generate SSL certificates via Let's Encrypt and configure Nginx automatically.  

5. *Add a new user**  
   ```bash
   bash 2_adduser.sh
   ```  
   - This will create a new user with sudo permissions.  

6. **SSH hardening**  
   ```bash
   bash 3_sshconfig.sh
   ```  
   - This will disable root logins by ssh.  

## Security & Hardening
- Root login via SSH is disabled (login via sudo-enabled user only)  
- Firewall configured to allow only SSH, HTTP, and HTTPS  
- `.ssh` directory prepared for secure key-based authentication

## Logs & Monitoring
- Nginx access log: `/var/log/nginx/access.log`  
- Nginx error log: `/var/log/nginx/error.log`  

## Next Steps / Extensions
- Configure automatic HTTPS renewal (Certbot does this by default)  
- Add additional users and roles for team access  
- Implement more hardening (fail2ban, SSH rate limiting, security updates cron)  

---

**Author:** Breno Portella  
**Project:** DevOps Portfolio — Project A — Linux Server Automation
