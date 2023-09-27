# Expansion cards and slots

This file is generated through `inv update-docs` by `tasks.py` from this [template](expansion_cards.md.template)

Parameters to consider for matching cards to slots:

    - long or short: size of slot
    - height: how many pci slots does the card take up? Is it a fat FPGA?
    - internal/external: does the slot need to be accessible from the outside (to plug cables in)

## List of cards

- 1x Nvidia A40 GPU (high profile, dual slot)
    - jack
- 1x Intel Arria 10 GX FPGA Development Kit (high profile, dual slot)
    - momiji
- 3x AMD/Xilinx Alveo U50 FPGA (low profile, single slot)
    - sakura (sakura-sakura, loopback)
        - SN: 501211207MON
        - MAC1: 00:0A:35:06:AE:13
        - MAC2: 00:0A:35:06:AE:14
        - MAC3: 00:0A:35:06:AE:15
        - MAC4: 00:0A:35:06:AE:16
    - hinoki
        - MAC: 
    - amy
        - MAC: 00:0A:35:0E:70:60
- 4x AMD/Xilinx Alveo U280 FPGA (high profile, dual slot)
    - momiji
        - MAC1: 00:0A:35:0C:EF:30
        - MAC2: 00:0A:35:0C:EF:31
    - clara
        - MAC1: 00:0A:35:0E:24:F2
        - MAC2: 00:0A:35:0E:24:F3
    - rose
        - MAC1: 00:0A:35:0E:24:E6
        - MAC2: 00:0A:35:0E:24:E7
    - amy
        - MAC1: 00:0A:35:0E:24:D6
        - MAC2: 00:0A:35:0E:24:D7
- 3x AMD/Xilinx Alveo SN1022 100GbE SmartNIC (bought, on the way)
    - rose (rose1-craig4, rose2-craig5; old firmware)
        - MAC1: 00:0A:35:0B:8B:EA
        - MAC33: 00:0A:35:0B:8C:0A
    - (not installed; firmware bundle_id 1.1.1.1021)
    - (not installed; firmware bundle_id 1.1.1.1021)
- 7x Intel E810-C 100GbE NIC (high and low profile, dual and single port, single slot)
    - graham: dual port. (graham-graham,graham-graham)
        - MAC1: b4:96:91:a4:1c:f0
        - MAC2: b4:96:91:a4:1c:f1
    - jackson: dual port. (,)
        - MAC1: b4:96:91:a4:1b:88
        - MAC2: b4:96:91:a4:1b:89
    - christina: dual port. (christina,christina)
        - MAC1:
        - MAC2:
    - wilfred: single port. (wilfred-craig3)
        - MAC: b4:96:91:b3:8b:04
    - river: single port. (river-craig2)
        - MAC: b4:96:91:b3:8b:3c
    - rose: single port. (rose-craig1)
        - MAC: b4:96:91:b3:8a:90
- 7x Broadcom BCM57416 10G NIC (RJ-45 and SFP)
    - graham: dual port. RJ-45 (graham-graham,graham-graham)
    - ryan: dual port. RJ-45 (ryan-ryan,none)
- 3x BCM57412 10G NIC (SFP+)
    - clara (internet/uplink, clara-craig2)
    - rose (internet/uplink, none)
    - amy (internet/uplink, amy-craig1)
- 5x Intel X520-2 10G NIC (SFI/SFP+)
    - adelaide (maybe internet/uplink?)
    - christina (maybe internet/uplink?)
    - jackson (maybe internet/uplink?)
    - river (maybe internet/uplink?)
    - wilfred (maybe internet/uplink?)
- 2x Mellanox ConnectX-4 10G NIC (SFI/SFP+?)
    - bill (internet/uplink)
    - nardole (internet/uplink)
- 1x Intel X710 10G NIC (SFI/SFP+?)
    - jack
- 4x PCI Samsung PM173X NVMe drive (high profile, low profile mod, x4?)
    - 2x graham: (boot, experiments)
    - 1x ryan: (boot)
    - 1x adelaide: (experiments)

Onboard (not listed by [List of slots](#List of slots)):

    - Intel X720
        - jack: 2 ports RJ-45 (jack-jack,jack-jack), 2 port SFP+ (internet,none)
    - Intel X550: 2 port RJ-45
        - christina: (chistina-adelaide, christina-adelaide)
        - adelaide: (adelaide-chistina, adelaide-christina)
        - wilfred: (wilfred-river, wilfred-river)
        - river: (river-wilfred, river-wilfred)
        - probably jackson: (none-none)

(^ list last updated 06.03.23)


## List of slots

Note that ubuntu workstations and servers don't appear in this list.

### adelaide.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c -p00, Intel Corporation, Device 0000  
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01 -p00, Super Micro Computer Inc, Device 1b63  
- ✅  Slot: 2 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: Available    
ff:00.0, System peripheral, Intel Corporation, Device 344c -p00, Intel Corporation, Device 0000  
  length: Long    
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01 -p00, Intel Corporation, Ethernet Server Adapter X520-2  
 

### amy.dos.cit.tum.de 

PCI Slots:   
- ❌  Slot: 1 type: x16 PCI Express 4 x16 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
e1:00.0, Ethernet controller, Vendor 1234, Device 1001 -p00, Xilinx Corporation, Device 9118  
- ✅  Slot: 2 type: x16 PCI Express 4 x16 SLOT2 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 3 type: x16 PCI Express 4 x16 SLOT3 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 4 type: x16 PCI Express 4 x16 SLOT4 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ❌  Slot: 5 type: x16 PCI Express 4 x16 SLOT5 PCI-E 4.0 X16 status: In Use length: Long    
c2:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57412 NetXtreme-E 10Gb RDMA Ethernet Controller -r01 -p00, Broadcom Inc. and subsidiaries, Device 4124  
- ❌  Slot: 6 type: x16 PCI Express 4 x16 SLOT6 PCI-E 4.0 X16 status: In Use length: Long    
c2:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57412 NetXtreme-E 10Gb RDMA Ethernet Controller -r01 -p00, Broadcom Inc. and subsidiaries, Device 4124  
- ❌  Slot: 7 type: x16 PCI Express 4 x16 SLOT7 PCI-E 4.0 X16 status: In Use length: Long    
61:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02 -p00, Intel Corporation, Ethernet Network Adapter E810-C-Q2  
- ✅  Slot: 8 type: x16 PCI Express 4 x16 SLOT8 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 9 type: x16 PCI Express 4 x16 SLOT9 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 10 type: x16 PCI Express 4 x16 SLOT10 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
 

### astrid.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 3 type: x16 PCI Express 3 PCIe Slot 3 status: In Use length: Short    
af:00.0, RAID bus controller, Broadcom / LSI, MegaRAID 12GSAS/PCIe Secure SAS39xx -p00, Dell, PERC H750 Adapter  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Other    
5e:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01 -p00, Dell, NetXtreme-E 10Gb SFP+ Adapter  
- ✅  Slot: 8 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 8 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ❌  Slot: 9 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 9 in Bay 1 status: In Use    
19:00.0, Non-Volatile memory controller, Intel Corporation, NVMe DC SSD [3DNAND, Sentinel Rock Controller] -p02, Dell, NVMe MU U.2 1.6TB (P5600)  
  length: 2.5" drive form factor    
- ✅  Slot: 7 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 7 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ✅  Slot: 6 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 6 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
 

### bill.dos.cit.tum.de 

PCI Slots:   
- ❌  Slot: 4 type: x4 PCI Express 3 x8 PCH SLOT4 PCI-E 3.0 X4 (IN X8) status: In Use length: Short    
02:00.0, Ethernet controller, Mellanox Technologies, MT27710 Family [ConnectX-4 Lx] -p00, Mellanox Technologies, ConnectX-4 Lx Stand-up dual-port 10GbE MCX4121A-XCAT  
- ✅  Slot: 6 type: x16 PCI Express 3 x16 CPU SLOT6 PCI-E 3.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 7 type: x4 PCI Express 3 x4 PCH SLOT7 PCI-E 3.0 X4 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: N/A type: x4 M.2 Socket 3 PCI-E M.2-M1 status: In Use length: Short    
01:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM9A1/PM9A3/980PRO -p02, Samsung Electronics Co Ltd, Device a812  
- ✅  Slot: N/A type: x1 M.2 Socket 1-SD PCI-E M.2-E1 status: Available length: Short    
No device/PCI ID.  
 

### christina.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c -p00, Intel Corporation, Device 0000  
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01 -p00, Super Micro Computer Inc, Device 1b63  
- ❌  Slot: 2 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
51:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01 -p00, Intel Corporation, Ethernet Server Adapter X520-2  
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02 -p00, Intel Corporation, Ethernet Network Adapter E810-C-Q2  
 

### clara.dos.cit.tum.de 

PCI Slots:   
- ❌  Slot: 1 type: x16 PCI Express 4 x16 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
e1:00.0, Serial controller, Xilinx Corporation, Device 903f -p01, Xilinx Corporation, Device 0007  
- ✅  Slot: 2 type: x16 PCI Express 4 x16 SLOT2 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 3 type: x16 PCI Express 4 x16 SLOT3 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 4 type: x16 PCI Express 4 x16 SLOT4 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ❌  Slot: 5 type: x16 PCI Express 4 x16 SLOT5 PCI-E 4.0 X16 status: In Use length: Long    
c2:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57412 NetXtreme-E 10Gb RDMA Ethernet Controller -r01 -p00, Broadcom Inc. and subsidiaries, Device 4124  
- ❌  Slot: 6 type: x16 PCI Express 4 x16 SLOT6 PCI-E 4.0 X16 status: In Use length: Long    
c2:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57412 NetXtreme-E 10Gb RDMA Ethernet Controller -r01 -p00, Broadcom Inc. and subsidiaries, Device 4124  
- ✅  Slot: 7 type: x16 PCI Express 4 x16 SLOT7 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ❌  Slot: 8 type: x16 PCI Express 4 x16 SLOT8 PCI-E 4.0 X16 status: In Use length: Long    
41:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02 -p00, Intel Corporation, Ethernet Network Adapter E810-C-Q2  
- ✅  Slot: 9 type: x16 PCI Express 4 x16 SLOT9 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 10 type: x16 PCI Express 4 x16 SLOT10 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
 

### dan.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 3 type: x16 PCI Express 3 PCIe Slot 3 status: In Use length: Short    
af:00.0, RAID bus controller, Broadcom / LSI, MegaRAID 12GSAS/PCIe Secure SAS39xx -p00, Dell, PERC H750 Adapter  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Other    
5e:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01 -p00, Dell, NetXtreme-E 10Gb SFP+ Adapter  
- ✅  Slot: 8 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 8 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ❌  Slot: 9 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 9 in Bay 1 status: In Use    
19:00.0, Non-Volatile memory controller, Intel Corporation, NVMe DC SSD [3DNAND, Sentinel Rock Controller] -p02, Dell, NVMe MU U.2 1.6TB (P5600)  
  length: 2.5" drive form factor    
- ✅  Slot: 7 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 7 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ✅  Slot: 6 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 6 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
 

### graham.dos.cit.tum.de 

PCI Slots:   
- ❌  Slot: 3 type: x16 PCI Express 4 PCIe Slot 3 status: In Use length: Long    
c4:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01 -p00, Broadcom Inc. and subsidiaries, Device 4161  
- ❌  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: In Use length: Long    
81:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02 -p00, Intel Corporation, Ethernet Network Adapter E810-C-Q2  
- ❌  Slot: 5 type: x16 PCI Express 3 PCIe Slot 5 status: In Use length: Long    
03:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM173X -p02, Dell, EMC PowerEdge Express Flash Ent NVMe AGN MU AIC Gen4 1.6TB  
- ❌  Slot: 4 type: x16 PCI Express 4 PCIe Slot 4 status: In Use length: Long    
41:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM173X -p02, Dell, EMC PowerEdge Express Flash Ent NVMe AGN MU AIC Gen4 1.6TB  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Long    
02:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01 -p00, Dell, NetXtreme-E 10Gb SFP+ Adapter  
 

### jack.dos.cit.tum.de 

PCI Slots:   
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
ca:00.0, 3D controller, NVIDIA Corporation, GA102GL [A40] -ra1 -p00, NVIDIA Corporation, Device 145a  
- ✅  Slot: 2 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: Available    
ff:00.0, System peripheral, Intel Corporation, Device 344c -p00, Intel Corporation, Device 0000  
  length: Long    
- ✅  Slot: 1 type: x16 PCI Express 4 x16 RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: Available length: Long    
ff:00.0, System peripheral, Intel Corporation, Device 344c -p00, Intel Corporation, Device 0000  
- ❌  Slot: N/A type: SXB3 status: In Use length: Other    
19:00.0, Ethernet controller, Intel Corporation, Ethernet Controller X710 for 10GBASE-T -r02 -p00, Super Micro Computer Inc, Device 1b7b  
- ✅  Slot: 1 type: x16 PCI Express 4 x16 AOC-URG4N4-i4XTS Slot1:PCIe Gen4 X16 status: Available    
ff:00.0, System peripheral, Intel Corporation, Device 344c -p00, Intel Corporation, Device 0000  
  length: Long    
 

### jackson.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c -p00, Intel Corporation, Device 0000  
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01 -p00, Super Micro Computer Inc, Device 1b63  
- ❌  Slot: 2 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
51:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02 -p00, Intel Corporation, Ethernet Network Adapter E810-C-Q2  
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01 -p00, Intel Corporation, Ethernet Server Adapter X520-2  
 

### mickey.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 3 type: x16 PCI Express 3 PCIe Slot 3 status: In Use length: Short    
af:00.0, RAID bus controller, Broadcom / LSI, MegaRAID 12GSAS/PCIe Secure SAS39xx -p00, Dell, PERC H750 Adapter  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Other    
5e:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01 -p00, Dell, NetXtreme-E 10Gb SFP+ Adapter  
- ✅  Slot: 8 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 8 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ❌  Slot: 9 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 9 in Bay 1 status: In Use    
19:00.0, Non-Volatile memory controller, Intel Corporation, NVMe DC SSD [3DNAND, Sentinel Rock Controller] -p02, Dell, NVMe MU U.2 1.6TB (P5600)  
  length: 2.5" drive form factor    
- ✅  Slot: 7 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 7 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
- ✅  Slot: 6 type: x4 PCI Express 3 SFF-8639 (U.2) PCIe SSD Slot 6 in Bay 1 status: Available    
No device/PCI ID.  
  length: 2.5" drive form factor    
 

### nardole.dos.cit.tum.de 

PCI Slots:   
- ❌  Slot: 4 type: x4 PCI Express 3 x8 PCH SLOT4 PCI-E 3.0 X4 (IN X8) status: In Use length: Short    
02:00.0, Ethernet controller, Mellanox Technologies, MT27710 Family [ConnectX-4 Lx] -p00, Mellanox Technologies, ConnectX-4 Lx Stand-up dual-port 10GbE MCX4121A-XCAT  
- ✅  Slot: 6 type: x16 PCI Express 3 x16 CPU SLOT6 PCI-E 3.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 7 type: x4 PCI Express 3 x4 PCH SLOT7 PCI-E 3.0 X4 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: N/A type: x4 M.2 Socket 3 PCI-E M.2-M1 status: In Use length: Short    
01:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM9A1/PM9A3/980PRO -p02, Samsung Electronics Co Ltd, Device a812  
- ✅  Slot: N/A type: x1 M.2 Socket 1-SD PCI-E M.2-E1 status: Available length: Short    
No device/PCI ID.  
 

### river.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c -p00, Intel Corporation, Device 0000  
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01 -p00, Super Micro Computer Inc, Device 1b63  
- ❌  Slot: 2 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
51:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02 -p00, Intel Corporation, Ethernet Network Adapter E810-C-Q1  
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01 -p00, Intel Corporation, Ethernet Server Adapter X520-2  
 

### rose.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: 1 type: x16 PCI Express 4 x16 SLOT1 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ❌  Slot: 2 type: x16 PCI Express 4 x16 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
c1:00.0, Processing accelerators, Xilinx Corporation, Alveo U280 Golden Image -p00, Xilinx Corporation, Device 000e  
- ✅  Slot: 3 type: x16 PCI Express 4 x16 SLOT3 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 4 type: x16 PCI Express 4 x16 SLOT4 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ❌  Slot: 5 type: x16 PCI Express 4 x16 SLOT5 PCI-E 4.0 X16 status: In Use length: Long    
c3:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57412 NetXtreme-E 10Gb RDMA Ethernet Controller -r01 -p00, Broadcom Inc. and subsidiaries, Device 4124  
- ❌  Slot: 6 type: x16 PCI Express 4 x16 SLOT6 PCI-E 4.0 X16 status: In Use length: Long    
c3:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57412 NetXtreme-E 10Gb RDMA Ethernet Controller -r01 -p00, Broadcom Inc. and subsidiaries, Device 4124  
- ✅  Slot: 7 type: x16 PCI Express 4 x16 SLOT7 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ❌  Slot: 8 type: x16 PCI Express 4 x16 SLOT8 PCI-E 4.0 X16 status: In Use length: Long    
41:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02 -p00, Intel Corporation, Ethernet Network Adapter E810-C-Q1  
- ✅  Slot: 9 type: x16 PCI Express 4 x16 SLOT9 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 10 type: x16 PCI Express 4 x16 SLOT10 PCI-E 4.0 X16 status: Available length: Long    
No device/PCI ID.  
 

### ryan.dos.cit.tum.de 

PCI Slots:   
- ❌  Slot: 3 type: x16 PCI Express 4 PCIe Slot 3 status: In Use length: Long    
c4:00.0, Non-Volatile memory controller, SK hynix, Platinum P41 NVMe Solid State Drive 2TB -p02, SK hynix, Platinum P41 NVMe Solid State Drive 2TB  
- ❌  Slot: 2 type: x16 PCI Express 3 PCIe Slot 2 status: In Use length: Long    
81:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller SM981/PM981/PM983 -p02, Samsung Electronics Co Ltd, SSD 970 EVO  
- ❌  Slot: 5 type: x16 PCI Express 3 PCIe Slot 5 status: In Use length: Long    
03:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM173X -p02, Dell, EMC PowerEdge Express Flash Ent NVMe AGN MU AIC Gen4 1.6TB  
- ❌  Slot: 4 type: x16 PCI Express 4 PCIe Slot 4 status: In Use length: Long    
41:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller PM173X -p02, Dell, EMC PowerEdge Express Flash Ent NVMe AGN MU AIC Gen4 1.6TB  
- ❌  Slot: 1 type: x8 PCI Express 3 Mezzanine 1 status: In Use length: Long    
02:00.0, Ethernet controller, Broadcom Inc. and subsidiaries, BCM57416 NetXtreme-E Dual-Media 10G RDMA Ethernet Controller -r01 -p00, Dell, NetXtreme-E 10Gb SFP+ Adapter  
 

### wilfred.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: N/A type: x4 M.2 Socket 3 M.2-H status: Available length: Short    
ff:00.0, System peripheral, Intel Corporation, Device 344c -p00, Intel Corporation, Device 0000  
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
8a:00.0, RAID bus controller, Broadcom / LSI, MegaRAID Tri-Mode SAS3408 -r01 -p00, Super Micro Computer Inc, Device 1b63  
- ❌  Slot: 2 type: x16 PCI Express 4 x16 RSC-W-66G4 SLOT2 PCI-E 4.0 X16 status: In Use length: Long    
51:00.0, Ethernet controller, Intel Corporation, Ethernet Controller E810-C for QSFP -r02 -p00, Intel Corporation, Ethernet Network Adapter E810-C-Q1  
- ❌  Slot: 1 type: x16 PCI Express 4 x16 RSC-WR-6 SLOT1 PCI-E 4.0 X16 status: In Use length: Long    
18:00.0, Ethernet controller, Intel Corporation, 82599ES 10-Gigabit SFI/SFP+ Network Connection -r01 -p00, Intel Corporation, Ethernet Server Adapter X520-2  
 

### yasmin.dos.cit.tum.de 

PCI Slots:   
- ✅  Slot: 0 type: x16 PCI Express 3 OCP_1_x16 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: 4 type: x8 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x8 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 6 type: x4 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x4 status: In Use length: Short    
07:00.0, Non-Volatile memory controller, Samsung Electronics Co Ltd, NVMe SSD Controller SM981/PM981/PM983 -p02, Samsung Electronics Co Ltd, SSD 970 EVO  
- ✅  Slot: 7 type: x4 PCI Express 3 PCIE SLOT2_1 / PCIE SLOT1_x4 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: 8 type: x8 PCI Express 3 PCIE SLOT2_2_x8 status: Available length: Short    
No device/PCI ID.  
- ❌  Slot: 10 type: x4 PCI Express 3 LoM QL41102 status: In Use length: Short    
0b:00.0, Ethernet controller, QLogic Corp., FastLinQ QL41000 Series 10/25/40/50GbE Controller -r02 -p00, Gigabyte Technology Co., Ltd, Device 0011  
- ❌  Slot: 12 type: x8 PCI Express 3 LSI 3008 status: In Use length: Short    
0f:00.0, Serial Attached SCSI controller, Broadcom / LSI, SAS3008 PCI-Express Fusion-MPT SAS-3 -r02 -p00, Gigabyte Technology Co., Ltd, Device 3008  
- ✅  Slot: 14 type: x16 PCI Express 3 OCP_2_x16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 18 type: x16 PCI Express 3 PCIE SLOT3_1_x16 status: Available length: Long    
No device/PCI ID.  
- ✅  Slot: 26 type: x8 PCI Express 3 PCIE SLOT3_2_x8 status: Available length: Short    
No device/PCI ID.  
- ✅  Slot: 22 type: x16 PCI Express 3 PCIE SLOT4_x16 status: Available length: Long    
No device/PCI ID.  
 


