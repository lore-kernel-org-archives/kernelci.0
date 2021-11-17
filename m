MIME-Version: 1.0
References: <20211115111816.3911213-1-ardb@kernel.org> <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com> <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk> <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
 <YZS2eC0lmR+bonvc@atomide.com>
In-Reply-To: <YZS2eC0lmR+bonvc@atomide.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 17 Nov 2021 09:28:12 +0100
Message-ID: <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Tony Lindgren <tony@atomide.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Guillaume Tucker <guillaume.tucker@collabora.com>, linux-omap <linux-omap@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Keith Packard <keithpac@amazon.com>, Linus Walleij <linus.walleij@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, "kernelci@groups.io" <kernelci@groups.io>

On Wed, 17 Nov 2021 at 08:59, Tony Lindgren <tony@atomide.com> wrote:
>
> * Ard Biesheuvel <ardb@kernel.org> [211116 22:03]:
> > Of course, I may have missed something, but I wouldn't expect a
> > fundamental flaw in this logic to affect only OMAP3/4 based platforms
> > in such a weird way. Perhaps there is something I missed in terms of
> > TLB maintenance, although I would expect the existing fault handler to
> > take care of that.
>
> Looks like disabling the deeper idle states for cpuidle where the CPUSs
> get shut down and restored seems to work around the issue at least for
> omap4. The assembly code is in arch/arm/mach-omap2/sleep44xx.S, and in
> sleep34xx.S for omap3. No idea so far what might be causing this..
>

Thanks Tony, that is very helpful. I have a Beaglebone white somewhere
so I'll try and reproduce it locally as well.
