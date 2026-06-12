# ansible

Personal collection of **Ansible playbooks** for provisioning and configuring
Linux hosts — focused on **NetworkManager (`nmcli`) network profiles** and
**SSH key / certificate distribution**.

> Archival / personal tooling.

## Playbooks

| Playbook | Purpose |
|----------|---------|
| `GetInterfaces.yml`, `CheckInterface.yml`, `Checknmcli.yml` | Inspect network interfaces and NetworkManager state. |
| `CreateProfile.yml`, `Delete_Profile.yml` | Create / remove NetworkManager connection profiles via `nmcli`. |
| `Deploy_ssh.yml`, `Deploy_ssh2.yml`, `deploy_auth_keys.yml`, `auth_key.yml` | Distribute SSH authorized keys to managed hosts. |
| `CopyCert.yml`, `CopyScript.yml` | Push certificates / scripts to hosts. |
| `install_phyton.yml` | Install Python (Ansible's interpreter prerequisite) on targets. |
| `CheckRool.yml` | Role / permission check. |

## Supporting files

| File | Purpose |
|------|---------|
| `hosts`, `hosts.cfg` | Inventory. |
| `ansible.cfg.ORIG` | Sample Ansible configuration. |
| `PrimeKnownHosts.sh` | Pre-populate `~/.ssh/known_hosts` for inventory hosts. |
| `j.sh`, `nm.sh` | Helper wrapper scripts. |

## Usage

```bash
# Point the inventory at your hosts (edit ./hosts), then:
ansible-playbook -i hosts GetInterfaces.yml
ansible-playbook -i hosts deploy_auth_keys.yml
```

Review `ansible.cfg` before running. On brand-new hosts, run
`install_phyton.yml` first to ensure a Python interpreter is present for the
other playbooks.
