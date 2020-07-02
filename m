Date: Thu, 2 Jul 2020 16:50:08 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: Improve kernelci setup for RISC-V
Message-ID: <20200702145008.GA1155320@aurel32.net>
References: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com>
 <7hsgeaixcl.fsf@baylibre.com>
 <fd8b97f2ec7f5ae72b1d96bbe698e40c5227b4f1.camel@wdc.com>
 <CAPSAq_xzT-O9rZm4ctcrS_y0=Xt4d2Pjb=OcWMezDXcmAqiZcw@mail.gmail.com>
 <CAPSAq_zLQrw-EK70fHj-Kz3Xp+WP4TzFBOOmYY7e3OB+JHnE6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPSAq_zLQrw-EK70fHj-Kz3Xp+WP4TzFBOOmYY7e3OB+JHnE6w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: David Abdurachmanov <david.abdurachmanov@sifive.com>
Cc: Atish Patra <Atish.Patra@wdc.com>, "khilman@baylibre.com" <khilman@baylibre.com>, "drew@beagleboard.org" <drew@beagleboard.org>, Alistair Francis <Alistair.Francis@wdc.com>, "lakshmipathi.ganapathi@collabora.co.uk" <lakshmipathi.ganapathi@collabora.co.uk>, "kernelci@groups.io" <kernelci@groups.io>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, "clabbe@baylibre.com" <clabbe@baylibre.com>, Manuel Montecelo <mafm@debian.org>, Karsten Merker <merker@debian.org>, Colin Ian King <colin.king@canonical.com>

On 2020-07-02 16:19, David Abdurachmanov wrote:
> Almost forgot. I suggest we also run stress-ng for CI. It's a single
> binary and it already found a number of kernel related issues on
> Unleashed which usually result in board hanging.
> 
> I have added Colin from Canonical who is the author of the stress tool.

stress-ng is already available as a package in the riscv64 port, so it
should just be a matter of installing it:

https://packages.debian.org/unstable/stress-ng

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
