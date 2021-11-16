MIME-Version: 1.0
References: <20211115111816.3911213-1-ardb@kernel.org> <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com> <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk>
In-Reply-To: <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 16 Nov 2021 23:02:26 +0100
Message-ID: <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Tony Lindgren <tony@atomide.com>, linux-omap <linux-omap@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Keith Packard <keithpac@amazon.com>, Linus Walleij <linus.walleij@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, "kernelci@groups.io" <kernelci@groups.io>

On Tue, 16 Nov 2021 at 21:06, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Nov 16, 2021 at 08:28:02PM +0100, Ard Biesheuvel wrote:
> > (+ Tony and linux-omap@)
> >
> > On Tue, 16 Nov 2021 at 10:23, Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> > >
> > > Hi Ard,
> > >
> > > Please see the bisection report below about a boot failure on
> > > omap4-panda which is pointing to this patch.
> > >
> > > Reports aren't automatically sent to the public while we're
> > > trialing new bisection features on kernelci.org but this one
> > > looks valid.
> > >
> > > Some more details can be found here:
> > >
> > >   https://linux.kernelci.org/test/case/id/6191b1b97c175a5ade335948/
> > >
> > > It seems like the kernel just froze after about 3 seconds without
> > > any obvious errors in the log.
> > >
> > > Please let us know if you need any help debugging this issue or
> > > if you have a fix to try.
> > >
> >
> > Thanks for the report.
> >
> > I wonder if this might be related to low level platform code running
> > off a different stack (maybe in SRAM?) when an interrupt is taken? Or
> > using a different set of page tables that are out of sync in terms of
> > VMALLOC space mappings?
> >
> > Could anyone who speaks OMAP please take a look at the linked boot
> > log, and hopefully make sense of it?
> >
> > For background, this series enables vmap'ed stacks support for ARMv7,
> > which means that the entry code checks whether the stack pointer may
> > be pointing into the guard region before the vmalloc'ed stack, and
> > kills the task if it looks like the kernel stack overflowed.
> >
> > Here's another instance:
> > https://linux.kernelci.org/build/id/6193fa5c6c4e1d02bd3358ff/
> >
> > Everything builds and boots happily, but odd things happen on OMAP
> > based devices: Panda just gives up right after discovering the USB
> > controller, and Beagle-XM just starts showing all kinds of weird
> > crashes at roughly the same point in the boot.
>
> I haven't looked at the logs yet... but there may be a more
> fundamental reason that it may be stalling.
>
> vmalloc space is lazily mapped to process page tables that the
> allocation did not happen inside - specifically the L1 entries.
>
> When a new thread is created, you're vmalloc()ing a kernel stack.
> This is done in the parent task for the child task. If the child
> task doesn't contain the L1 entry for its vmalloc'd stack, then
> the first stack access by the child will fault.
>
> The fault processing will be done in the child's context, so we
> immediately try to save the state to the child's kernel stack,
> which is not yet mapped. The result is another fault, which
> triggers yet another fault, etc.
>

I deal with this condition specifically in two different places:
- at context switch time, there is a dummy read from the new stack
while running from the old one, to ensure that the fault takes place
while SP points to a valid mapping;
- at mm_switch() time, the vmalloc_seq counter is used to ensure that
the new MM is synced to init_mm in terms of vmalloc PMD entries.

Of course, I may have missed something, but I wouldn't expect a
fundamental flaw in this logic to affect only OMAP3/4 based platforms
in such a weird way. Perhaps there is something I missed in terms of
TLB maintenance, although I would expect the existing fault handler to
take care of that.
