Date: Mon, 12 Oct 2020 18:43:08 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] x86/x86_64_defconfig: Enable the serial console
Message-ID: <20201012164308.GF22829@zn.tnic>
References: <2538da14-0f4b-5d4a-c7bf-6fdb46ba2796@collabora.com>
 <20201011122020.GA15925@zn.tnic>
 <107a6fb0-a667-2f30-d1f4-640e3fee193a@collabora.com>
 <20201011155754.GC15925@zn.tnic>
 <1dfdf163-9b54-ceae-b178-c566e6109263@collabora.com>
 <20201012035846.GB11282@1wt.eu>
 <b188f977-b11e-f570-599a-7bcf364be0fd@collabora.com>
 <20201012143212.GC22829@zn.tnic>
 <20201012144040.GB11614@1wt.eu>
 <a165781d-d1c8-04e2-0b60-8d776a21a625@collabora.com>
MIME-Version: 1.0
In-Reply-To: <a165781d-d1c8-04e2-0b60-8d776a21a625@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Willy Tarreau <w@1wt.eu>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, x86@kernel.org, Collabora Kernel ML <kernel@collabora.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Diego Elio =?utf-8?Q?Petten=C3=B2?= <flameeyes@flameeyes.com>, "H. Peter Anvin" <hpa@zytor.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Nathan Chancellor <natechancellor@gmail.com>, kernelci@groups.io

On Mon, Oct 12, 2020 at 04:10:45PM +0100, Guillaume Tucker wrote:
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

That sounds interesting, thanks for elaborating.

At the same time, you see how this setup is very hw-specific and not
really common and those options do not really belong in a defconfig but
in a kernelCI snippet, I'd say.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
