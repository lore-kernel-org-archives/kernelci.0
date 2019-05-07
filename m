From: Paul Burton <paul.burton@mips.com>
Subject: Re: MIPS build failures in kernelCI
Date: Tue, 7 May 2019 22:54:17 +0000
Message-ID: <20190507225415.t5rizubyn2vzu3mu@pburton-laptop>
References: <7hpnsgrgel.fsf@baylibre.com>
 <20190128223906.b73t4tympcpom5fl@pburton-laptop>
 <7hy33ijlyi.fsf@baylibre.com> <7hpnoujiq0.fsf@baylibre.com>
In-Reply-To: <7hpnoujiq0.fsf@baylibre.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D89CA3853D964A4DA25015221E1586D5@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>

Hi Kevin,

On Tue, May 07, 2019 at 10:08:07AM -0700, Kevin Hilman wrote:
> >>> The other build failures seem to be failing because there is no make
> >>> target for uImage.gz (which we set as the default target for MIPS.)
> >>>=20
> >>> We don't currently have a good way to have different make targets for
> >>> different defconfigs.
> >>
> >> Would it be an option to build the 'all' target? That typically
> >> generates the appropriate image for the configured platform.
> >
> > Revisiting this...
> >
> > Turns out that 'make all' doesn't build the uImage.gz target, which is
> > what's used on the pistachio_marduk (with pistachio_defconfig) so we
> > switched the builds back to 'make uImage.gz'.
> >
> > However, that fails for a few other defconfigs where that target doesn'=
t
> > work.
> >
> > What's your recommendation to have this working for all defconfigs?
> >
> > I'm guessing we should keep 'make all' but fix any defconfigs that are
> > not building the uImage.gz target?=20
>=20
> I had a little closer look, and AFAICT, there's nothing to be added into
> the defconfigs to enable the uImage.gz build.  It already gets added to
> the available make targets (boot-y) if the platform-specific
> kconfig/make fragments add a load address (load-y), which is already the
> case for pistachio.
>=20
> The problem is that the 'all' target doesn't build the boot-y targets,
> so with the current Makefile, 'make all' will never build any of the
> uImage targets, no matter what's in the defconfig.
>=20
> As a quick hack, I enabled all the boot-y targets for all, which will
> actually build all the targets, but unfortunately, a few of them don't
> actually build[2].

Right, boot-y is a list of all the targets that arch/mips/boot/Makefile
supports & not all of them necessarily make sense for each platform.

> Any recommendations for how to have a single make target for all MIPS
> boards, that will also build bootable images?

I think it probably makes sense to have platforms like pistachio add the
uImage target to their Platform file, like so:

diff --git a/arch/mips/pistachio/Platform b/arch/mips/pistachio/Platform
index d80cd612df1f..c3592b374ad2 100644
--- a/arch/mips/pistachio/Platform
+++ b/arch/mips/pistachio/Platform
@@ -6,3 +6,4 @@ cflags-$(CONFIG_MACH_PISTACHIO)         +=3D               =
               \
                -I$(srctree)/arch/mips/include/asm/mach-pistachio
 load-$(CONFIG_MACH_PISTACHIO)          +=3D 0xffffffff80400000
 zload-$(CONFIG_MACH_PISTACHIO)         +=3D 0xffffffff81000000
+all-$(CONFIG_MACH_PISTACHIO)           :=3D uImage.gz

Then when you build the all target you should get the uImage.gz file for
this target, but not try to build all the other images that pistachio
systems don't need or support.

Does that sound reasonable to you? Are there platforms other than
pistachio where you think the all target ought to build an image that
it currently isn't?

> The other option for kernelCI is to only build the defconfigs that we
> know generate a bootable target for boards that we have.  But whis would
> be less useful for MIPS maintainers, because I'm sure it would be more
> useful for you guys to see build results for all the builds.

Yeah, the more coverage the better from my perspective :)

Thanks,
    Paul
