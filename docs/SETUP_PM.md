# Setting up Persistent Memory (PM)

## App Direct mode with `ext4-dax` FS

Software requirements:
- [`ipmctl`](https://github.com/intel/ipmctl)
- [`ndctl`](https://github.com/pmem/ndctl)

### PM mode selection
- Inspect the memory modules topology: `ipmctl show -topology`
- Inspect the memory modules state after reboot: `ipmctl show -memoryresources`
- Create a goal to change PM to AppDirect mode: `ipmctl create -goal PersistentMemoryType=AppDirect`
To apply the created goal, **reboot** the machine.
- Verify PM regions, type and capacity: `ipmctl show -region`

### Namespace creation
- Inspect the available PM regions: `ndctl list --regions --human`
- Create [namespaces](https://docs.pmem.io/ndctl-user-guide/ndctl-man-pages/ndctl-create-namespace): `sudo ndctl create-namespace --mode fsdax -r all`
- Verify the created namespaces: `ndctl list --human`
- Verify the created devices which are listed as `/dev/pmem*`

### Enable dax mount option
- The kernel has to have `CONFIG_FS_DAX` parameter enabled. This is done via the [`modules/dax.nix`](../modules/dax.nix) file.
- Add `../modules/dax.nix` in the import section of the `hosts/[machine_name].nix` (similarly to [jack](../hosts/jack.nix))
- Deploy the new config on the machine. Be patient. The kernel is rebuilt. 
- Reboot the machine.

### Mount ext4-dax fs:
Example with the `/dev/pmem0`. Please, adapt accordingly. 
- Enter the following on the command line `mkfs.ext4 -F /dev/pmem0` to create the file system and mount it on the PM device.
- Enter the following on the command line `mkdir /mnt/pmem0` to create a mount point.
- Enter the following on the command line `mount -o dax /dev/pmem0 /mnt/pmem0` to mount the file system with the *-o dax* option.

References:
1. [Intel's guide](https://www.intel.com/content/dam/support/us/en/documents/memory-and-storage/data-center-persistent-mem/Intel-Optane-DC-Persistent-Memory-Quick-Start-Guide.pdf)
2. [PM provision](https://www.intel.com/content/www/us/en/developer/articles/technical/qsg-intro-to-provisioning-pmem.html)
3. [PM provision Linux](https://www.intel.com/content/www/us/en/developer/articles/technical/qsg-part2-linux-provisioning-with-optane-pmem.html)
