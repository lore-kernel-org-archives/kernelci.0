MIME-Version: 1.0
References: <CAHRSSEw4VGGKjTKG7aWv=bSuhTNGEOKpbtxO4niogBoLSb=O=Q@mail.gmail.com>
 <CAOi56cUEw6f9UXodgFkATZhwt443eVgNka2mH=R1gAyaEMYggQ@mail.gmail.com>
In-Reply-To: <CAOi56cUEw6f9UXodgFkATZhwt443eVgNka2mH=R1gAyaEMYggQ@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Wed, 12 Dec 2018 15:57:04 -0800
Message-ID: <CAHRSSEytOOdAZaDzNJfo6LKZnpf23wB7TkZERuth2YTJBY2YoA@mail.gmail.com>
Subject: Re: arc builds for older android kernels?
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: khilman@kernel.org
Cc: Alistair Strachan <astrachan@google.com>, kernelci@groups.io

Ah, yes, I should have looked at the upstream branches. Glad to see
that fixes are on the way. Thanks.
On Wed, Dec 12, 2018 at 3:36 PM Kevin Hilman <khilman@kernel.org> wrote:
>
> Hi Todd,
>
> On Wed, Dec 12, 2018 at 9:20 AM 'Todd Kjos' via info <info@kernelci.org> wrote:
> >
> > I noticed that some of the arc builds for android kernels are working now (yay), however there are still lots of broken builds for older kernels. Any ideas how to fix these?
> >
> > android-4.9 (zebu_hs_*):
> > android-4.4 (axs103_*, nsim*, tinyconfig):
> >   ../scripts/gen_initramfs_list.sh: Cannot open '../../arc_initramfs_hs/'
>
> I think this one should be fixed int stable/linux-4.9.y now (or very soon):
> http://lists.infradead.org/pipermail/linux-snps-arc/2018-December/004980.html
>
> > android-4.4 (allnoconfig):
> > arc-linux-ld: error: vmlinux.o: unable to merge ISA extension attributes code-density.arc-linux-ld: failed to merge target specific data of file /usr/bin/../arc-snps-linux-uclibc/sysroot/usr/lib/libgcc.a(_mulsi3.o)
> > arc-linux-ld: ERROR: Attempting to link /usr/bin/../arc-snps-linux-uclibc/sysroot/usr/lib/libgcc.a(_umulsidi3.o) with a binary vmlinux.o of different architecture
>
> Hmm, this was also fixed upstream and stable, but it appears didn't
> auto-apply to stable 4.9 or 4.4, but is being discussed:
> http://lists.infradead.org/pipermail/linux-snps-arc/2018-December/004897.html
>
> Also,just curious, I'm assuming you are comparing the android-4.x
> builds to the stable-rc/linux-4.x equivalents?  That would probably
> also tell you whether the android tree is missing a patch from stable
> or not.
>
> Kevin
