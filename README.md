# Kali Linux Customization Playbook


This Ansible playbook is designed to set up a customized Kali Linux instance for penetration testing, tailored to my preferences.
- It automates the installation of various cybersecurity tools
- Customizes my Terminal and Tmux configuration
- Configures logging with Auditd
- Personalizes my GNOME desktop environment
- Configures Firefox and installs browser addons.

**Note:** This playbook is based on the work of [IppSec](https://github.com/IppSec/parrot-build). I have adapted and extended it to suit my specific requirements.


## Prerequisites

Before running this playbook, ensure you have the following:

- A fresh installation of Kali Linux.
- Ansible installed on your Kali Linux instance.
- Internet connectivity to download packages and extensions.

## Usage

1. Start with a fresh install of Kali Linux
2. Install Ansible and add it to your PATH
   ```bash
   pip3 install ansible
   export PATH=$PATH:~/.local/bin
   ```
3. Clone this repository to your Kali Linux instance and enter it:
   ```bash
   git clone https://github.com/KevinLauer/playbook-kali-build.git
   cd playbook-kali-build
   ```
4. Install requirements
   ```bash
   ansible-galaxy role install -r requirements.yml
   ```
5. Run the playbook and enter your sudo password
   ```
   ansible-playbook main.yml -K
   ```