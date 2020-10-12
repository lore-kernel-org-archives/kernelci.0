MIME-Version: 1.0
References: <20201008164044.GE5505@zn.tnic> <4162cfa4-7bf2-3e6e-1b8c-e19187e6fa10@infradead.org>
 <2538da14-0f4b-5d4a-c7bf-6fdb46ba2796@collabora.com> <20201011122020.GA15925@zn.tnic>
 <107a6fb0-a667-2f30-d1f4-640e3fee193a@collabora.com> <20201011155754.GC15925@zn.tnic>
 <1dfdf163-9b54-ceae-b178-c566e6109263@collabora.com> <20201012035846.GB11282@1wt.eu>
 <b188f977-b11e-f570-599a-7bcf364be0fd@collabora.com> <20201012143212.GC22829@zn.tnic>
 <20201012144040.GB11614@1wt.eu> <a165781d-d1c8-04e2-0b60-8d776a21a625@collabora.com>
In-Reply-To: <a165781d-d1c8-04e2-0b60-8d776a21a625@collabora.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Mon, 12 Oct 2020 10:52:51 -0700
Message-ID: <CAKwvOd=sEO0fYgZXGSOin02VBhKHybS=Tx9RC8_Gu3TC-=JDDA@mail.gmail.com>
Subject: Re: [PATCH] x86/x86_64_defconfig: Enable the serial console
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Willy Tarreau <w@1wt.eu>, Borislav Petkov <bp@alien8.de>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Collabora Kernel ML <kernel@collabora.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.com>, "H. Peter Anvin" <hpa@zytor.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Nathan Chancellor <natechancellor@gmail.com>

On Mon, Oct 12, 2020 at 8:10 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 12/10/2020 15:40, Willy Tarreau wrote:
> > On Mon, Oct 12, 2020 at 04:32:12PM +0200, Borislav Petkov wrote:
> >> On Mon, Oct 12, 2020 at 11:22:10AM +0100, Guillaume Tucker wrote:
> >>> However, it was found while adding some x86 Chromebooks[1] to
> >>> KernelCI that x86_64_defconfig lacked some basic things for
> >>> anyone to be able to boot a kernel with a serial console enabled
> >>> on those.
> >>
> >> Hold on, those are laptops, right? How come they do have serial console?
> >> Because laptops don't have serial console - that has been the eternal
> >> problem with debugging kernels on laptops.
>
> Yes the link you pointed at is a prerequisite to enable serial
> console in the firmware (Coreboot/Depthcharge).
>
> > Well, to be precise, they don't have *anymore*. I used to exclusively
> > select laptops having a serial port given that I was using it daily with
> > routers, until I had to resign when I abandonned my good old NC8000 :-/
>
> You can get serial console on recent enough Chromebooks with a
> debug interface such as SuzyQable:
>
>   https://www.sparkfun.com/products/14746
>
> It's not a USB Type-C adapter, it has a debug interface which
> works with Chromebooks that support Case-Closed Debugging.
> Anyone can do that without modifying the Chromebook, and with a
> bit of patience to go through the documentation[1]...
>
> The KernelCI sample results from my previous email were run using
> just that: off-the-shelf Chromebooks + SuzyQ + rebuilt firmware
> for interactive console and tftp boot + kernel with the config
> options in Enric's patch.
>
> Thanks,
> Guillaume
>
>
> [1] https://chromium.googlesource.com/chromiumos/platform/ec/+/cr50_stab/docs/case_closed_debugging_cr50.md

Thanks for the links, I've just now ordered one.  For the open case
debugging, we have some custom daughter board with a ribbon cable.
It's...not pretty.  I didn't know we had closed case debugging on
CrOS.

-- 
Thanks,
~Nick Desaulniers
