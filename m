Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: MIPS build failures in kernelCI
In-Reply-To: <20190507225415.t5rizubyn2vzu3mu@pburton-laptop>
References: <7hpnsgrgel.fsf@baylibre.com> <20190128223906.b73t4tympcpom5fl@pburton-laptop> <7hy33ijlyi.fsf@baylibre.com> <7hpnoujiq0.fsf@baylibre.com> <20190507225415.t5rizubyn2vzu3mu@pburton-laptop>
Date: Wed, 08 May 2019 14:50:47 -0700
Message-ID: <7hftpoipjc.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Paul Burton <paul.burton@mips.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>

Paul Burton <paul.burton@mips.com> writes:

> Hi Kevin,
>
> On Tue, May 07, 2019 at 10:08:07AM -0700, Kevin Hilman wrote:
>> >>> The other build failures seem to be failing because there is no make
>> >>> target for uImage.gz (which we set as the default target for MIPS.)
>> >>> 
>> >>> We don't currently have a good way to have different make targets for
>> >>> different defconfigs.
>> >>
>> >> Would it be an option to build the 'all' target? That typically
>> >> generates the appropriate image for the configured platform.
>> >
>> > Revisiting this...
>> >
>> > Turns out that 'make all' doesn't build the uImage.gz target, which is
>> > what's used on the pistachio_marduk (with pistachio_defconfig) so we
>> > switched the builds back to 'make uImage.gz'.
>> >
>> > However, that fails for a few other defconfigs where that target doesn't
>> > work.
>> >
>> > What's your recommendation to have this working for all defconfigs?
>> >
>> > I'm guessing we should keep 'make all' but fix any defconfigs that are
>> > not building the uImage.gz target? 
>> 
>> I had a little closer look, and AFAICT, there's nothing to be added into
>> the defconfigs to enable the uImage.gz build.  It already gets added to
>> the available make targets (boot-y) if the platform-specific
>> kconfig/make fragments add a load address (load-y), which is already the
>> case for pistachio.
>> 
>> The problem is that the 'all' target doesn't build the boot-y targets,
>> so with the current Makefile, 'make all' will never build any of the
>> uImage targets, no matter what's in the defconfig.
>> 
>> As a quick hack, I enabled all the boot-y targets for all, which will
>> actually build all the targets, but unfortunately, a few of them don't
>> actually build[2].
>
> Right, boot-y is a list of all the targets that arch/mips/boot/Makefile
> supports & not all of them necessarily make sense for each platform.
>
>> Any recommendations for how to have a single make target for all MIPS
>> boards, that will also build bootable images?
>
> I think it probably makes sense to have platforms like pistachio add the
> uImage target to their Platform file, like so:
>
> diff --git a/arch/mips/pistachio/Platform b/arch/mips/pistachio/Platform
> index d80cd612df1f..c3592b374ad2 100644
> --- a/arch/mips/pistachio/Platform
> +++ b/arch/mips/pistachio/Platform
> @@ -6,3 +6,4 @@ cflags-$(CONFIG_MACH_PISTACHIO)         +=                              \
>                 -I$(srctree)/arch/mips/include/asm/mach-pistachio
>  load-$(CONFIG_MACH_PISTACHIO)          += 0xffffffff80400000
>  zload-$(CONFIG_MACH_PISTACHIO)         += 0xffffffff81000000
> +all-$(CONFIG_MACH_PISTACHIO)           := uImage.gz
>
> Then when you build the all target you should get the uImage.gz file for
> this target, but not try to build all the other images that pistachio
> systems don't need or support.
>
> Does that sound reasonable to you?

Yes, I like this solution!  When you submit upstream, feel free to add:

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Also, if you want kernelCI to test older kernels (e.g. stable trees)
where this patch doesn't exist, you'll need to submit this to stable as
well.  This may not strictly qualify for stable rules, but Greg is often
pretty accepting if you can make the case that this only affects a
particular platform, and increases coverage in kernelCI.

> Are there platforms other than pistachio where you think the all
> target ought to build an image that it currently isn't?

I haven't looked at any others, since pistachio is the only one where I
have physical hardware.  But as we add boards, we can fix this up as we
go.

>> The other option for kernelCI is to only build the defconfigs that we
>> know generate a bootable target for boards that we have.  But whis would
>> be less useful for MIPS maintainers, because I'm sure it would be more
>> useful for you guys to see build results for all the builds.
>
> Yeah, the more coverage the better from my perspective :)

Agreed.

Thanks,

Kevin
