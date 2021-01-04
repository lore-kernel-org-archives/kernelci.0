MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 4 Jan 2021 03:37:02 +0000
Message-ID: <CACPK8Xdfxkj3fRzF6UezOcBY2tJwsG0bhXNPZV+1M8ZYKxRHNA@mail.gmail.com>
Subject: Adding BMC systems
List-ID: <info.kernelci.org>
List-Post: <https://groups.google.com/a/kernelci.org/group/info/post>, <mailto:info@kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
List-Archive: <https://groups.google.com/a/kernelci.org/group/info/>
List-Unsubscribe: <mailto:googlegroups-manage+1098402462627+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/kernelci.org/group/info/subscribe>
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: info@kernelci.org

Hello,

I work on the OpenBMC project, a yocto based distro for baseboard
management controllers (BMCs). I spend most of my time on the Linux
kernel, where we support two vendor's SoC families: I maintain the
Aspeed platform and help others maintain the Nuvoton platform.

We have good upstream support for both soc families. The OpenBMC
project has a staging/integration tree where we accept patches that
are destined for but not yet upstream.

I have a collection of evaluation boards that I have for bringup
purposes that are now mostly unused. I would like to do hardware boot
and regression testing of these systems.

 - AST2500 EVB
 - AST2600 EVB
 - NPCM750 EVB

We also have upstream qemu support for these SoC families, as well as
the NPCM730 (a cut down variant of hte 750) and the AST2400.

Does adding these to the ci runs sound like something that fits the
goals of kernelci?

I am employed by IBM in my day job.

Cheers,

Joel
