# Enabling MTE on the Supermicro ARS-211M-NR

MTE is available on the Ampere-1a (AmpereOne AC04), but not on the Ampere-1 (AmpereOne AC03).
Supermicro disables this feature by default. To enable it, boot into the UEFI shell (reboot, press F11, then select the builtin EFI shell).
There, run the following command:

```shell
nvparam -s NVPDBOOT -i 56 -w 0x1
```

Then, reboot the system.

