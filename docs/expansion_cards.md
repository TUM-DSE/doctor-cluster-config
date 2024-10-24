# Expansion cards and slots

Note also the auto-generated [PCI slots](./expansion_cards_autogen.md) enoumeration.

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
    - graham: dual port. (graham-adric1,graham-vislor)
        - MAC1: b4:96:91:a4:1c:f0
        - MAC2: b4:96:91:a4:1c:f1
    - jackson: dual port. (jackson-adric2,jackson-adric4)
        - MAC1: b4:96:91:a4:1b:88
        - MAC2: b4:96:91:a4:1b:89
    - christina: dual port. (christina-river)
        - MAC1:
        - MAC2:
    - wilfred: single port. (wilfred-amy)
        - MAC: b4:96:91:b3:8b:04
    - river: single port. (river-christina)
        - MAC: b4:96:91:b3:8b:3c
    - amy: single port. (amy-wilfred)
        - MAC: b4:96:91:b3:8a:90
    - vislor: single port
        - MAC: 30:3e:a7:05:d0:98 
    - ian: single port (ian-river)
        - MAC: 30:3e:a7:10:d6:b4
- 7x Broadcom BCM57416 10G NIC (RJ-45)
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
- Mellanox ConnectX-6
    - vislor: 2 ports RJ-45 (,)

(^ list last updated 08.11.23)

