Return-Path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4.19 00/79] 4.19.83-stable review
References: <5dc600ff.1c69fb81.8f91b.fea1@mx.google.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <aee12426-1dfa-a072-47cd-b37d1f4bd8c6@roeck-us.net>
Date: Fri, 8 Nov 2019 18:31:00 -0800
MIME-Version: 1.0
In-Reply-To: <5dc600ff.1c69fb81.8f91b.fea1@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi folks,

what I am really missing in those reports is complete build results.
Below it says:

Tested: 68 unique boards, 22 SoC families, 14 builds out of 206

but that is not really correct. On the kernelci web site,
https://kernelci.org/job/stable-rc/branch/linux-4.19.y/ tells me
that 206 builds passed, not just 14. Even the referenced
https://kernelci.org/build/stable-rc/branch/linux-4.19.y/kernel/v4.19.82-80-gb56f5a59d51a/
clearly shows that way more than 14 builds passed.

Can we include this information in the report to the community, possibly
including build errors if there are any ?

On a side note, I am not sure if the offline information adds ay value
in the report to the community. I personally I find it just confusing.
Can we possibly drop it ? I mean, really, who cares if there are systems offline,
and which systems are offline. I'd rather send such messages to the lab owners,
not to everyone in the world.

Thanks,
Guenter

-------- Forwarded Message --------
Subject: Re: [PATCH 4.19 00/79] 4.19.83-stable review
Date: Fri, 08 Nov 2019 15:57:51 -0800 (PST)
From: kernelci.org bot <bot@kernelci.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org, stable@vger.kernel.org

stable-rc/linux-4.19.y boot: 116 boots: 0 failed, 109 passed with 7 offline (v4.19.82-80-gb56f5a59d51a)

Full Boot Summary: https://kernelci.org/boot/all/job/stable-rc/branch/linux-4.19.y/kernel/v4.19.82-80-gb56f5a59d51a/
Full Build Summary: https://kernelci.org/build/stable-rc/branch/linux-4.19.y/kernel/v4.19.82-80-gb56f5a59d51a/

Tree: stable-rc
Branch: linux-4.19.y
Git Describe: v4.19.82-80-gb56f5a59d51a
Git Commit: b56f5a59d51ac99b2c9af3df39a0a7a573053bcc
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
Tested: 68 unique boards, 22 SoC families, 14 builds out of 206

Offline Platforms:

arm:

     sunxi_defconfig:
         gcc-8
             sun5i-r8-chip: 1 offline lab
             sun7i-a20-bananapi: 1 offline lab

     multi_v7_defconfig:
         gcc-8
             qcom-apq8064-cm-qs600: 1 offline lab
             sun5i-r8-chip: 1 offline lab
             sun7i-a20-bananapi: 1 offline lab

     davinci_all_defconfig:
         gcc-8
             dm365evm,legacy: 1 offline lab

     qcom_defconfig:
         gcc-8
             qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>

