# How to Enable SEV-SNP on Gigabyte Boards

Tested on: **Gigabyte XV23-ZX0-AAJ1** (polly)

To enable SEV-SNP on these boards, the following BIOS settings must be configured.

## AMD CBS → CPU Common Options

- `SMEE` set to `Enabled`. Only after this the the ASID, SEV and RMP settings show up
- `SEV Control` set to `Enabled`
- `SNP Memory (RMP Table) Coverage` set to `Enabled` 
- `ASID` set to at least `64`
- `RMP` set to `Enabled`

## AMD CBS → NBIO Common Options → IOMMUSecurity

- `SEV-SNP Support` set to `Enabled`
- `IOMMU` set to `Enabled`
- `DMA Protection` set to `Enabled`