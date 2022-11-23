
# Expansion cards and slots

This file is generated through `inv update-docs` by `tasks.py`.

Parameters to consider for matching cards to slots: 

    - long or short: size of slot
    - height: how many pci slots does the card take up? Is it a fat FPGA?
    - internal/external: does the slot need to be accessible from the outside (to plug cables in)

## List of cards

- 1x Nvidia A40 GPU (high profile, dual slot)
- 3x AMD/Xilinx Alveo U50 FPGA (low profile, single slot)
- 4x AMD/Xilinx Alveo U280 FPGA (high profile, dual slot)
    - 1x available
    - 3x bought, on the way
- 3x AMD/Xilinx Alveo SN1022 100GbE SmartNIC (bought, on the way)
    - ryan: dual port (,)
- 7x Intel E810-C 100GbE NIC (high and low profile, dual and single port, single slot)
    - graham: dual port. (graham-graham,graham-graham)
    - jackson: dual port. (Jackson-craig,) Cx0/1, vlan1
    - christina: dual port. (christina,christina)
    - wilfred: single port. (wilfred-river)
    - river: single port. (river-wilfred)
    - unassinged: single port. former: (adelaide-craig) vlan1
- 7x Broadcom BCM57416 10G NIC (RJ-45 and SFP)
    - graham: dual port. RJ-45 (graham-graham,graham-graham)
    - ryan: dual port. RJ-45 (ryan-ryan,none)
- 5x Intel X520-2 10G NIC (SFI/SFP+)
- 2x Mellanox ConnectX-4 10G NIC (SFI/SFP+?)
- 1x Intel X710 10G NIC (SFI/SFP+?)
- 4x PCI Samsung PM173X NVMe drive (high profile, low profile mod, x4?)
    - 2x graham: (boot, experiments)
    - 1x ryan: (boot)
    - 1x adelaide: (experiments)

Onboard:
    - Intel X720
        - jack: 2 ports RJ-45 (jack-jack,jack-jack), 2 port SFP+ (internet,none)
    - Intel X550: 2 port RJ-45
        - christina: (chistina-adelaide, none)
        - adelaide: (adelaide-chistina, none)
        - wilfred: (wilfred-river, none)
        - river: (river-wilfred, none)
        - probably jackson: (none-none)

Most of the 10G NICs are in use to provider internet.

(^ list last updated 28.10.22)


## List of slots

Note that ubuntu workstations and servers don't appear in this list. 

### adelaide.dse.in.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c, Intel Corporation, Device 0000  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01, Super Micro Computer Inc, Device 1b63  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
51:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM173X -p02, Dell, EMC PowerEdge Express Flash Ent NVMe AGN MU AIC Gen4 1.6TB  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01, Intel Corporation, Ethernet Server Adapter X520-2  
 

### astrid.dse.in.tum.de 

PCI Slots:   
- ✅  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 3 type: x16 PCI Express 3 PCIe Slot 3 status: In Use length: Short    
af:00.0, RAID bus controller, Broadcom / LSI, MegaRAID 12GSAS/PCIe Secure SAS39xx, Dell, Device 2176  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Other    
5e:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01, Dell, NetXtreme-E 10Gb SFP+ Adapter  
- ✅  Slot: 8 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 8 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ❌  Slot: 9 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 9 in Bay 1 status: In Use    
19:00.0, Non-Volatile memory controller, Intel Corporation, NVMe DC SSD [3DNAND, Sentinel Rock Controller] -p02, Dell, NVMe MU U.2 1.6TB (P5600)  
  length: 2.5" drive form factor    
- ✅  Slot: 7 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 7 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ✅  Slot: 6 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 6 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
 

### bill.dse.in.tum.de 

PCI Slots:   
- ❌  Slot: 4 type: x4 PCI Express 3 x8 PCH SLOT4 PCI-E 3.0 X4 (IN X8) status: In Use length: Short    
02:00.0, Ethernet controller, Mellanox Technologies, MT27710 Family [ConnectX-4 Lx], Mellanox Technologies, ConnectX-4 Lx Stand-up dual-port 10GbE MCX4121A-XCAT  
- ❌  Slot: 6 type: x16 PCI Express 3 x16 CPU SLOT6 PCI-E 3.0 X16 status: In Use length: Long    
01:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller SM981/PM981/PM983 -p02, Samsung Electronics Co Ltd, Device a801  
- ✅  Slot: 7 type: x4 PCI Express 3 x4 PCH SLOT7 PCI-E 3.0 X4 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: N/A type: x4 M.2 Socket 3 PCI-E M.2-M1 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: N/A type: x1 M.2 Socket 1-SD PCI-E M.2-E1 status: Available length: Short    
No device/PCI ID.  
 

### christina.dse.in.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c, Intel Corporation, Device 0000  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01, Super Micro Computer Inc, Device 1b63  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
51:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01, Intel Corporation, Ethernet Server Adapter X520-2  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02, Intel Corporation, Ethernet Network Adapter E810-C-Q2  
 

### dan.dse.in.tum.de 

PCI Slots:   
- ✅  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 3 type: x16 PCI Express 3 PCIe Slot 3 status: In Use length: Short    
af:00.0, RAID bus controller, Broadcom / LSI, MegaRAID 12GSAS/PCIe Secure SAS39xx, Dell, Device 2176  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Other    
5e:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01, Dell, NetXtreme-E 10Gb SFP+ Adapter  
- ✅  Slot: 8 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 8 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ❌  Slot: 9 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 9 in Bay 1 status: In Use    
19:00.0, Non-Volatile memory controller, Intel Corporation, NVMe DC SSD [3DNAND, Sentinel Rock Controller] -p02, Dell, NVMe MU U.2 1.6TB (P5600)  
  length: 2.5" drive form factor    
- ✅  Slot: 7 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 7 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ✅  Slot: 6 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 6 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
 

### graham.dse.in.tum.de 

PCI Slots:   
- ❌  Slot: N/A type: x16 <OUT OF SPEC> PCIe Slot 3 status: In Use length: Long    
c4:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01, Broadcom Inc. and subsidiaries, Device 4161  
- ❌  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: In Use length: Long    
81:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02, Intel Corporation, Ethernet Network Adapter E810-C-Q2  
- ❌  Slot: 5 type: x16 PCI Express 3 PCIe Slot 5 status: In Use length: Long    
03:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM173X -p02, Dell, EMC PowerEdge Express Flash Ent NVMe AGN MU AIC Gen4 1.6TB  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> PCIe Slot 4 status: In Use length: Long    
41:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM173X -p02, Dell, EMC PowerEdge Express Flash Ent NVMe AGN MU AIC Gen4 1.6TB  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Long    
02:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01, Dell, NetXtreme-E 10Gb SFP+ Adapter  
 

### jack.dse.in.tum.de 

PCI Slots:   
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
ca:00.0, 3D controller, NVIDIA Corporation, GA102GL [A40] -ra1, NVIDIA Corporation, Device 145a  
- ✅  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: Available length: Long    
ff:00.0, System peripheral, Intel Corporation, Device 344c, Intel Corporation, Device 0000  
- ✅  Slot: N/A type: x16 <OUT OF SPEC> RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: Available length: Long    
ff:00.0, System peripheral, Intel Corporation, Device 344c, Intel Corporation, Device 0000  
- ❌  Slot: N/A type: SXB3 status: In Use length: Other    
19:00.0, Ethernet controller, Intel Corporation, Ethernet Controller X710 for 10GBASE-T -r02, Super Micro Computer Inc, Device 1b7b  
- ✅  Slot: N/A type: x16 <OUT OF SPEC> AOC-URG4N4-i4XTS Slot1:PCIe Gen4 X16 status: Available    
ff:00.0, System peripheral, Intel Corporation, Device 344c, Intel Corporation, Device 0000  
  length: Long    
 

### jackson.dse.in.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c, Intel Corporation, Device 0000  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01, Super Micro Computer Inc, Device 1b63  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
51:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02, Intel Corporation, Ethernet Network Adapter E810-C-Q2  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01, Intel Corporation, Ethernet Server Adapter X520-2  
 

### mickey.dse.in.tum.de 

PCI Slots:   
- ✅  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 3 type: x16 PCI Express 3 PCIe Slot 3 status: In Use length: Short    
af:00.0, RAID bus controller, Broadcom / LSI, MegaRAID 12GSAS/PCIe Secure SAS39xx, Dell, Device 2176  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Other    
5e:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01, Dell, NetXtreme-E 10Gb SFP+ Adapter  
- ✅  Slot: 8 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 8 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ❌  Slot: 9 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 9 in Bay 1 status: In Use    
19:00.0, Non-Volatile memory controller, Intel Corporation, NVMe DC SSD [3DNAND, Sentinel Rock Controller] -p02, Dell, NVMe MU U.2 1.6TB (P5600)  
  length: 2.5" drive form factor    
- ✅  Slot: 7 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 7 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ✅  Slot: 6 type: x4 PCI Express 3 SFF-8639 PCIe SSD Slot 6 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
 

### nardole.dse.in.tum.de 

PCI Slots:   
- ❌  Slot: 4 type: x4 PCI Express 3 x8 PCH SLOT4 PCI-E 3.0 X4 (IN X8) status: In Use length: Short    
02:00.0, Ethernet controller, Mellanox Technologies, MT27710 Family [ConnectX-4 Lx], Mellanox Technologies, ConnectX-4 Lx Stand-up dual-port 10GbE MCX4121A-XCAT  
- ❌  Slot: 6 type: x16 PCI Express 3 x16 CPU SLOT6 PCI-E 3.0 X16 status: In Use length: Long    
01:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller SM981/PM981/PM983 -p02, Samsung Electronics Co Ltd, Device a801  
- ✅  Slot: 7 type: x4 PCI Express 3 x4 PCH SLOT7 PCI-E 3.0 X4 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: N/A type: x4 M.2 Socket 3 PCI-E M.2-M1 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: N/A type: x1 M.2 Socket 1-SD PCI-E M.2-E1 status: Available length: Short    
No device/PCI ID.  
 

### river.dse.in.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c, Intel Corporation, Device 0000  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01, Super Micro Computer Inc, Device 1b63  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
51:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02, Intel Corporation, Ethernet Network Adapter E810-C-Q1  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01, Intel Corporation, Ethernet Server Adapter X520-2  
 

### ryan.dse.in.tum.de 

PCI Slots:   
- ❌  Slot: N/A type: x16 <OUT OF SPEC> PCIe Slot 3 status: In Use length: Long    
c4:00.0, PCI bridge, Xilinx Corporation, Device 913f, ,   
- ❌  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: In Use length: Long    
81:00.0, Processing accelerators, Xilinx Corporation, Device d020, Xilinx Corporation, Device 000e  
- ❌  Slot: 5 type: x16 PCI Express 3 PCIe Slot 5 status: In Use length: Long    
03:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM173X -p02, Dell, EMC PowerEdge Express Flash Ent NVMe AGN MU AIC Gen4 1.6TB  
- ✅  Slot: N/A type: x16 <OUT OF SPEC> PCIe Slot 4 status: Available length: Long    
No device/PCI ID.  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Long    
02:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01, Dell, NetXtreme-E 10Gb SFP+ Adapter  
 

### wilfred.dse.in.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c, Intel Corporation, Device 0000  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01, Super Micro Computer Inc, Device 1b63  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
51:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02, Intel Corporation, Ethernet Network Adapter E810-C-Q1  
- ❌  Slot: N/A type: x16 <OUT OF SPEC> RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01, Intel Corporation, Ethernet Server Adapter X520-2  
 

### yasmin.dse.in.tum.de 

PCI Slots:   
- ✅  Slot: 0 type: x16 PCI Express 3 OCP_1_x16 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: 4 type: x8 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x8 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 6 type: x4 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x4 status: In Use length: Short    
07:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller SM981/PM981/PM983 -p02, Samsung Electronics Co Ltd, Device a801  
- ✅  Slot: 7 type: x4 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x4 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: 8 type: x8 PCI Express 3 PCIE SLOT2_2_x8 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 10 type: x4 PCI Express 3 LoM QL41102 status: In Use length: Short    
0b:00.0, Ethernet controller, QLogic Corp., FastLinQ QL41000 Series 10/25/40/50GbE Controller -r02, Gigabyte Technology Co., Ltd, Device 0011  
- ❌  Slot: 12 type: x8 PCI Express 3 LSI 3008 status: In Use length: Short    
0f:00.0, Serial Attached SCSI controller, Broadcom / LSI, SAS3008 PCI-Express Fusion-MPT SAS-3 -r02, Gigabyte Technology Co., Ltd, Device 3008  
- ✅  Slot: 14 type: x16 PCI Express 3 OCP_2_x16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 18 type: x16 PCI Express 3 PCIE SLOT3_1_x16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 26 type: x8 PCI Express 3 PCIE SLOT3_2_x8 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: 22 type: x16 PCI Express 3 PCIE SLOT4_x16 status: Available length: Long    
No device/PCI ID.  
 

