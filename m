From: Hans de Goede <hdegoede@redhat.com>
Subject: Donating some boards for testing?
Message-ID: <0e8451f7-53d9-f9dd-7959-f236b24d679a@redhat.com>
Date: Mon, 2 Dec 2019 11:38:17 +0100
MIME-Version: 1.0
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: info@kernelci.org

Hi,

Quick self intro: I'm a FOSS enthusiast / developer. My main contribution
area is the kernel and low level user space bits. I'm working for Red Hat,
but this mail is send on a personal title.

As a side-project I have been working on
  hardware enablement for Intel Bay and
Cherry Trail based devices. To have a
  wide range of hardware to test on I have
been buying these kind of devices on the
  Dutch second hand market.
I may have slightly over
  done the "wide range of hardware" thing, so I have
plenty (too much) of these devices.

During the last few years there have been a number of cases where esp.
Bay Trail devices would no longer boot with the latest mainline kernel,
as such it would be good if we can get a couple of these into the kernel
CI system.

The main cause why these stop booting is because of the use of 32 bit UEFI
while running a 64 bit Linux kernel. When changes are made to the UEFI bits
of the kernel this mixed-mode support is often overlooked and broken.
Bay Trail is somewhat old but still relevant, it is used in a lot of
POS systems and IOT gateways.

So I wonder if there already are any Bay Trail based systems using 32 bit
UEFI in kernel-CI and if these are tested with 64 bit kernels. If the answer
to that is yes, then the rest of this mail is probably irrelevant ...

I've been reading your FAQ:
https://kernelci.org/faq/#my-board

Which points to how things need to work with LAVA, then I looked at the
LAVA docs and those are not really helpful, I did find:

https://connect.linaro.org/resources/hkg18/hkg18-tr10/

Which among other things talks about how the device should preferably
not have a battery or at least work without one, which in itself may
already be a bit of a challenge as most of my test hardware are
in tablet form factor and typically they refuse to boot without a
battery...  Also they lack wired ethernet...

So my main question is can you give a quick summary of what you need
from an X86 UEFI system for it to be added to the kernel CI infra?

Regards,

Hans

p.s.

Will someone from kernel-ci be at Fosdem 2020 ?

