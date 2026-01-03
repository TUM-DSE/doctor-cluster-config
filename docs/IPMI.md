# Management Interfaces (IPMI)

All our servers have a dedicated management interface (IPMI/BMC) that allows controlling the server state (power on/off, reboot), monitoring hardware health (power consumption, temperature), and accessing the serial console or a virtual KVM.

## Access Requirements

To access the management interfaces, you need to be connected to the management network.
- **VPN**: Use the `il01` VPN profile provided by RBG (see "Accessing the server" in [README.md](./README.md)). This is generally only available for staff.

## Web Interface

BIOS and the boot flow can be accessed/observed via "Remote Console" (HTML5 based KVM) on the IPMI web interfaces.

1.  Connect to the VPN.
2.  Navigate to `https://$hostname-mgmt.dos.cit.tum.de` in your browser.
    *   For example: `https://astrid-mgmt.dos.cit.tum.de`
3.  **Login Credentials**: The credentials are encrypted in the doctor cluster repository in `secrets.yml`. You can decrypt them manually using `sops`:
    ```bash
    sops secrets.yml
    ```
    If you don't have access, see [SECRETS.md](./SECRETS.md) on how to add yourself.


### Self-Signed Certificates & HSTS

Most BMCs use self-signed certificates. Modern browsers (like Firefox) may strictly block access to the domain due to HSTS.
To bypass this, resolve the hostname to an IP address and access it via the IP:

```bash
host astrid-mgmt.dos.cit.tum.de
# astrid-mgmt.dos.cit.tum.de has address 172.24.90.X
```

Then navigate to `https://172.24.90.X` in your browser.

## Command Line Interface (CLI)

We use `invoke` (defined in `tasks.py`) to automate common IPMI tasks. You need to be in the root of the repository to run these commands.

### Prerequisites

- **Repository**: You must have this repository checked out locally or be logged into one of our servers.
- **Environment**: You need `ipmitool`, `sops`, and `invoke` (available in the project's dev shell):
    - **Local**: If you have Nix installed, run `nix develop` to enter the environment.
    - **Remote**: If you don't have Nix installed locally, you can run these tasks from any of our servers, as they already have the environment set up or have Nix available.
- **Secrets**: You must have `sops` configured to decrypt `secrets.yml` to retrieve the IPMI password.

### Common Tasks

All tasks generally take a `--host` argument (e.g., `astrid.dos.cit.tum.de` or just the hostname if the script handles it, but usually full FQDN or just the name is fine depending on the task implementation. `tasks.py` mostly splits by `.` so `astrid` works if mapped correctly, but `astrid.dos.cit.tum.de` is safer).

#### 1. Serial Console
Connect to the serial console of a server. Useful for debugging boot issues or accessing the shell if SSH is down.

```bash
inv ipmi-serial --host astrid.dos.cit.tum.de
```
*   **Exit**: The escape sequence to exit is usually `~.` (tilde dot).

#### 2. Power Cycle
Hard reboot the server (power off, then power on).

```bash
inv ipmi-powercycle --host astrid.dos.cit.tum.de
```

#### 3. Power Consumption
Measure the power consumption of supported servers (Dell and Supermicro).

```bash
inv ipmi-powerconsumption
```

#### 4. Reboot BMC
If the management interface itself is unresponsive, you can try rebooting the BMC. This does not affect the running OS.

```bash
inv ipmi-reboot-bmc --host astrid.dos.cit.tum.de
```

#### 5. Boot Order (One-time)
Set the next boot device.

*   **Boot to BIOS**:
    ```bash
    inv ipmi-boot-bios --host astrid.dos.cit.tum.de
    ```
*   **Boot to PXE** (Network Boot):
    ```bash
    inv ipmi-boot-pxe --host astrid.dos.cit.tum.de
    ```

### Other Reboot Methods
For a graceful reboot (via SSH), you can use the `reboot` task:
```bash
inv reboot --hosts astrid.dos.cit.tum.de
```
