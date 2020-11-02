Subject: Re: License compliance with binary distribution
References: <20201031193734.GA571423@kozik-lap>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <5604860b-18b1-7d53-9c1e-5f7c0834a4ea@collabora.com>
Date: Mon, 2 Nov 2020 11:23:09 +0000
MIME-Version: 1.0
In-Reply-To: <20201031193734.GA571423@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, krzk@kernel.org

Hi Krzysztof,

On 31/10/2020 19:37, Krzysztof Kozlowski wrote:
> Dear Kernel CI team,
> 
> I saw that you keep the compiled Linux kernel binary on
> https://storage.kernelci.org. To be GPLv2 license compliant you might
> need to mention the license and offer the source code. Knowing the
> purpose of Kernel CI, the source code and license are kind of obvious...
> but it might not be that obvious if someone visits the link directly,
> e.g.:
> https://storage.kernelci.org/stable-rc/queue-4.9/v4.9.241-11-g04b990a9881a/arm/omap2plus_defconfig/gcc-8/

The source code for all the kernel binaries on kernelci.org can
be found in the top-level directory for each kernel revision
being built.  For the example you mentioned, it's there:

  https://storage.kernelci.org/stable-rc/queue-4.9/v4.9.241-11-g04b990a9881a/linux-src_stable-rc_queue-4.9.tar.gz

Alternatively, you can see the build meta-data in this JSON file:

  https://storage.kernelci.org/stable-rc/queue-4.9/v4.9.241-11-g04b990a9881a/arm/omap2plus_defconfig/gcc-8/bmeta.json

which contains things such as:

    "git_branch": "queue/4.9",
    "git_commit": "04b990a9881ae9d88501e81eb6999063636e9f18",
    "git_url": "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git",

I believe this would make it obvious where to find the source
code from a Git repository, and the source tarballs also contain
the license file.

Does that seem enough to comply with GPL-2.0?  If we need to show
some explanation like I just did in this email, maybe we could
add a custom footer on the storage index pages.

Best regards,
Guillaume
