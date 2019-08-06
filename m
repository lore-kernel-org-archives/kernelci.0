MIME-Version: 1.0
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Tue, 6 Aug 2019 11:45:25 -0700
Message-ID: <CAKwvOdn0kv+N5raBDE_aPv637ROHmu7C1_C9F3PXNnAYSMTOYQ@mail.gmail.com>
Subject: aarch64 Big Endian
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Mark Brown <mark.brown@linaro.org>
Cc: kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>

Mark,
I was able to "boot" a aarch64 kernel with CONFIG_CPU_BIG_ENDIAN=3Dy,
but without a userspace image... the kernel seems to get stuck in a
loop somewhere.  I would have expected it to panic somewhere since no
rootfs was provided.

Is the boot failures KernelCI's reporting a boot timeout or no output at al=
l?

=E2=9E=9C  kernel-all git:(master) =E2=9C=97 qemu-system-aarch64 -kernel
arch/arm64/boot/Image.gz -machine virt -cpu cortex-a57 -nographic
--append "console=3DttyAMA0" -m 2048
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd070]
[    0.000000] Linux version 5.3.0-rc3-00016-g0eb0ce0a78e1
(ndesaulniers@ndesaulniers1.mtv.corp.google.com) (clang version 10.0.0
(https://github.com/llvm/llvm-project.git
5bf16ec02b82c0e2502308c0ba36810b303ead0f)) #109 SMP PREEMPT Tue Aug 6
11:38:10 PDT 2019
[    0.000000] Machine model: linux,dummy-virt
[    0.000000] cma: Reserved 32 MiB at 0x00000000be000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem
0x0000000040000000-0x00000000bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xbdbf1840-0xbdbf2fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000040000000-0x00000000bfffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bffff=
fff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv0.2 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] percpu: Embedded 23 pages/cpu s56216 r8192 d29800 u94208
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 832075
[    0.000000] CPU features: detected: ARM erratum 834220
[    0.000000] CPU features: detected: EL2 vector hardening
[    0.000000] ARM_SMCCC_ARCH_WORKAROUND_1 missing from firmware
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 51609=
6
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: console=3DttyAMA0
[    0.000000] Dentry cache hash table entries: 262144 (order: 9,
2097152 bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8,
1048576 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 1983700K/2097152K available (11582K kernel
code, 1858K rwdata, 5780K rodata, 4992K init, 415K bss, 80684K
reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=
=3D1.
[    0.000000] Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D1
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
[    0.000000] random: get_random_bytes called from
start_kernel+0x1d0/0x390 with crng_init=3D0
[    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
[    0.000046] sched_clock: 56 bits at 62MHz, resolution 16ns, wraps
every 4398046511096ns
[    0.002587] Console: colour dummy device 80x25
[    0.005780] Calibrating delay loop (skipped), value calculated
using timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
[    0.005885] pid_max: default: 32768 minimum: 301
[    0.006624] LSM: Security Framework initializing
[    0.007468] Mount-cache hash table entries: 4096 (order: 3, 32768
bytes, linear)
[    0.007513] Mountpoint-cache hash table entries: 4096 (order: 3,
32768 bytes, linear)
[    0.051639] ASID allocator initialised with 32768 entries
[    0.059550] rcu: Hierarchical SRCU implementation.
[    0.080493] smp: Bringing up secondary CPUs ...
[    0.080667] smp: Brought up 1 node, 1 CPU
[    0.080722] SMP: Total of 1 processors activated.
[    0.080886] CPU features: detected: 32-bit EL0 Support
[    0.081041] CPU features: detected: CRC32 instructions
[    0.085940] CPU: All CPU(s) started at EL1
[    0.086275] alternatives: patching kernel code
[    0.106298] devtmpfs: initialized
[    0.115792] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.115902] futex hash table entries: 256 (order: 2, 16384 bytes, linear=
)
[    0.119939] pinctrl core: initialized pinctrl subsystem
[    0.130474] NET: Registered protocol family 16
[    0.132084] audit: initializing netlink subsys (disabled)
[    0.136810] audit: type=3D2000 audit(0.116:1): state=3Dinitialized
audit_enabled=3D0 res=3D1
[    0.139644] cpuidle: using governor menu
[    0.140560] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.145303] DMA: preallocated 256 KiB pool for atomic allocations
[    0.148195] Serial: AMBA PL011 UART driver
[    0.175320] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 39,
base_baud =3D 0) is a PL011 rev1
[    0.191373] printk: console [ttyAMA0] enabled
[    0.223211] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.223426] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.223677] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.223909] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.247462] cryptd: max_cpu_qlen set to 1000
[    0.277101] vgaarb: loaded
[    0.278702] SCSI subsystem initialized
[    0.281838] usbcore: registered new interface driver usbfs
[    0.282331] usbcore: registered new interface driver hub
[    0.282828] usbcore: registered new device driver usb
[    0.285259] pps_core: LinuxPPS API ver. 1 registered
[    0.285501] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.285984] PTP clock support registered
[    0.286600] EDAC MC: Ver: 3.0.0
[    0.293275] FPGA manager framework
[    0.294082] Advanced Linux Sound Architecture Driver Initialized.
[    0.302087] clocksource: Switched to clocksource arch_sys_counter
[    0.303005] VFS: Disk quotas dquot_6.6.0
[    0.303328] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.321791] thermal_sys: Registered thermal governor 'step_wise'
[    0.321872] thermal_sys: Registered thermal governor 'power_allocator'
[    0.323228] NET: Registered protocol family 2
[    0.326821] tcp_listen_portaddr_hash hash table entries: 1024
(order: 2, 16384 bytes, linear)
[    0.327239] TCP established hash table entries: 16384 (order: 5,
131072 bytes, linear)
[    0.327774] TCP bind hash table entries: 16384 (order: 6, 262144
bytes, linear)
[    0.328296] TCP: Hash tables configured (established 16384 bind 16384)
[    0.329450] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    0.329872] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, li=
near)
[    0.331383] NET: Registered protocol family 1
[    0.346875] RPC: Registered named UNIX socket transport module.
[    0.347167] RPC: Registered udp transport module.
[    0.347399] RPC: Registered tcp transport module.
[    0.347635] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.348053] PCI: CLS 0 bytes, default 64
[    0.351576] Unpacking initramfs...
[    0.451870] Freeing initrd memory: 14796K
[    0.454334] hw perfevents: enabled with armv8_pmuv3 PMU driver, 1
counters available
[    0.454815] kvm [1]: HYP mode not available
[    0.732776] request_module: kmod_concurrent_max (0) close to 0
(max_modprobes: 50), for module binfmt-4c46, throttling...
[    5.882267] request_module: modprobe binfmt-4c46 cannot be
processed, kmod busy with 50 threads for more than 5 seconds now
(qemu) q
=E2=9E=9C  kernel-all git:(master) =E2=9C=97 grep ENDIAN .config
CONFIG_CPU_BIG_ENDIAN=3Dy

--=20
Thanks,
~Nick Desaulniers
