From: Paul Burton <paul.burton@mips.com>
Subject: Re: MIPS build failures in kernelCI
Date: Mon, 28 Jan 2019 22:39:08 +0000
Message-ID: <20190128223906.b73t4tympcpom5fl@pburton-laptop>
References: <7hpnsgrgel.fsf@baylibre.com>
In-Reply-To: <7hpnsgrgel.fsf@baylibre.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <334FC435BE9B784DA26464349B4C00B3@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>

Hi Kevin,

On Mon, Jan 28, 2019 at 03:44:02PM +0100, Kevin Hilman wrote:
> We're having various build failures for a handful of defconfigs with
> linux-next and mainline:
>=20
> Go to one of these views, and click on "Failed":
> mainline: https://kernelci.org/build/mainline/branch/master/kernel/v5.0-r=
c4/
>=20
> Some of those defconfig targets (decstation_defconfig,
> jmr3927_defconfig) are failing with:
>=20
>      cc1: error: '-march=3Dr3900' requires '-mfp32'
>=20
> We're trying to use standard debian compilers for all targets, and for
> MIPS we're using: mips-linux-gnu-gcc (Debian 7.4.0-1) 7.4.0

Thanks for the report. I've just submitted a fix for that [1], and
assuming nobody points out a problem in the next day or so I'll apply it
to my mips-fixes branch.

> The other build failures seem to be failing because there is no make
> target for uImage.gz (which we set as the default target for MIPS.)
>=20
> We don't currently have a good way to have different make targets for
> different defconfigs.

Would it be an option to build the 'all' target? That typically
generates the appropriate image for the configured platform.

> Switching to linux-next:
>  https://kernelci.org/build/next/branch/master/kernel/next-20190125/
>=20
> There are a few more build failures that seem to be missig some tools:
>=20
>    ./arch/mips/tools/elf-entry: Command not found
>=20
> This smells like a build step missing for the uImage.gz target?

Hmm, I'm confused as to what happened there & haven't yet managed to
reproduce it locally. The elf-entry tool is built as part of the
archscripts target which ought to run for pretty much any build. I don't
suppose it got built but failed to execute for some reason? Is there a
way to get the full build log which should show the tool being built?

Thanks,
    Paul

[1] https://lore.kernel.org/linux-mips/20190128222106.19100-1-paul.burton@m=
ips.com/
