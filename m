Date: Mon, 12 Oct 2020 16:32:12 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] x86/x86_64_defconfig: Enable the serial console
Message-ID: <20201012143212.GC22829@zn.tnic>
References: <20201008162206.862203-1-enric.balletbo@collabora.com>
 <20201008164044.GE5505@zn.tnic>
 <4162cfa4-7bf2-3e6e-1b8c-e19187e6fa10@infradead.org>
 <2538da14-0f4b-5d4a-c7bf-6fdb46ba2796@collabora.com>
 <20201011122020.GA15925@zn.tnic>
 <107a6fb0-a667-2f30-d1f4-640e3fee193a@collabora.com>
 <20201011155754.GC15925@zn.tnic>
 <1dfdf163-9b54-ceae-b178-c566e6109263@collabora.com>
 <20201012035846.GB11282@1wt.eu>
 <b188f977-b11e-f570-599a-7bcf364be0fd@collabora.com>
MIME-Version: 1.0
In-Reply-To: <b188f977-b11e-f570-599a-7bcf364be0fd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Willy Tarreau <w@1wt.eu>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, x86@kernel.org, Collabora Kernel ML <kernel@collabora.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Diego Elio =?utf-8?Q?Petten=C3=B2?= <flameeyes@flameeyes.com>, "H. Peter Anvin" <hpa@zytor.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Nathan Chancellor <natechancellor@gmail.com>, kernelci@groups.io

On Mon, Oct 12, 2020 at 11:22:10AM +0100, Guillaume Tucker wrote:
> However, it was found while adding some x86 Chromebooks[1] to
> KernelCI that x86_64_defconfig lacked some basic things for
> anyone to be able to boot a kernel with a serial console enabled
> on those.

Hold on, those are laptops, right? How come they do have serial console?
Because laptops don't have serial console - that has been the eternal
problem with debugging kernels on laptops. Or do they do some sort of
serial over USB emulation and this is something which only chromebooks
have?

Or is that how it is done:

https://www.chromium.org/chromium-os/how-tos-and-troubleshooting/serial-debugging-howto

?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
