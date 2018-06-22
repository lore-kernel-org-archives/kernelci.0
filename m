From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: Testing with distros
Message-ID: <82611570-bbc6-cfaf-e4bc-9b99a899ccb8@collabora.com>
Date: Fri, 22 Jun 2018 13:34:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi,

One subject that comes up regularly is about testing distributions
against upstream kernels in KernelCI.  We've been historically using a
bare buildroot user-space to do boot testing and run very low-level test
cases.  We're now starting to produce Debian root file systems for more
advanced test plans and extend the coverage of kernel-user interfaces
(DRM, V4L2...).

It seems like there would also be some value in having tests that
capture distro user-space breakages due to kernel changes.  This may
mean building upstream kernels with a distro config, booting with a
fixed stable user-space from that distro and detecting new failures.

The next part to be defined would be what tests to run with these
distros, as even booting means choosing which services to start etc...
The point being to increase kernel test coverage without ending up
testing the user-space itself as this would seem outside of the scope of
KernelCI.

Does this sound like a path worth exploring?

Best wishes,
Guillaume
