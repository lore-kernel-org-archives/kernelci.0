Date: Fri, 18 Dec 2020 14:00:18 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: next/master bisection: baseline.login on ox820-cloudengines-pogoplug-series-3
Message-ID: <20201218140018.GZ1551@shell.armlinux.org.uk>
References: <5fdc89c3.1c69fb81.c9707.68bb@mx.google.com>
 <3e1680ed-94b8-74c9-ffe6-c2bd71f2a705@collabora.com>
MIME-Version: 1.0
In-Reply-To: <3e1680ed-94b8-74c9-ffe6-c2bd71f2a705@collabora.com>
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci-results@groups.io, Linus Walleij <linus.walleij@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Ard Biesheuvel <ardb@kernel.org>, Kees Cook <keescook@chromium.org>, Abbott Liu <liuwenliang@huawei.com>, linux-kernel@vger.kernel.org, "kernelci@groups.io" <kernelci@groups.io>, Ingo Molnar <mingo@kernel.org>, linux-arm-kernel@lists.infradead.org

On Fri, Dec 18, 2020 at 01:48:09PM +0000, Guillaume Tucker wrote:
> Please see the bisection report below about a boot failure on
> ox820-cloudengines-pogoplug-series-3.  There was also a bisection
> yesterday with next-20201216 which landed on the same commit, on
> the same platform and also with oxnas_v6_defconfig.  I'm not
> aware of any other platform on kernelci.org showing the same
> regression.

Ah, I bet I know what's happening.

We test for the presence of VFP by issuing an instruction to read
FPSID. If VFP is not present, this will raise an undefined instruction
exception, and we expect to head into the vfp_testing_entry code.

I bet Pogoplug, being an ARM11 MPCore platform, either raises an
exception here.

We probably need to also rework the code in vfp_init() as well to
register a temporary hook when reading the FPSID.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
