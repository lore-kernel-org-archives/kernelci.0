References: <3c2cba2849caa6ea0116611c1da3268b41432b76.camel@wdc.com>
 <7hsgeaixcl.fsf@baylibre.com>
 <fd8b97f2ec7f5ae72b1d96bbe698e40c5227b4f1.camel@wdc.com>
 <CAPSAq_xzT-O9rZm4ctcrS_y0=Xt4d2Pjb=OcWMezDXcmAqiZcw@mail.gmail.com>
 <CAPSAq_zLQrw-EK70fHj-Kz3Xp+WP4TzFBOOmYY7e3OB+JHnE6w@mail.gmail.com>
 <20200702145008.GA1155320@aurel32.net>
From: Colin Ian King <colin.king@canonical.com>
Subject: Re: Improve kernelci setup for RISC-V
Message-ID: <784f55db-2793-4a4d-c824-4f61e26979b4@canonical.com>
Date: Thu, 2 Jul 2020 15:55:52 +0100
MIME-Version: 1.0
In-Reply-To: <20200702145008.GA1155320@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Aurelien Jarno <aurelien@aurel32.net>, David Abdurachmanov <david.abdurachmanov@sifive.com>
Cc: Atish Patra <Atish.Patra@wdc.com>, "khilman@baylibre.com" <khilman@baylibre.com>, "drew@beagleboard.org" <drew@beagleboard.org>, Alistair Francis <Alistair.Francis@wdc.com>, "lakshmipathi.ganapathi@collabora.co.uk" <lakshmipathi.ganapathi@collabora.co.uk>, "kernelci@groups.io" <kernelci@groups.io>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, "clabbe@baylibre.com" <clabbe@baylibre.com>, Manuel Montecelo <mafm@debian.org>, Karsten Merker <merker@debian.org>

On 02/07/2020 15:50, Aurelien Jarno wrote:
> On 2020-07-02 16:19, David Abdurachmanov wrote:
>> Almost forgot. I suggest we also run stress-ng for CI. It's a single
>> binary and it already found a number of kernel related issues on
>> Unleashed which usually result in board hanging.
>>
>> I have added Colin from Canonical who is the author of the stress tool.
> 
> stress-ng is already available as a package in the riscv64 port, so it
> should just be a matter of installing it:
> 
> https://packages.debian.org/unstable/stress-ng


.. I try to keep the debian package relatively fresh and close to the
development tip.  We use stress-ng for regression testing on Ubuntu, we
have some autotest wrapped tests that we regularly use:

Smoke tests - to see if we can break kernels:

https://kernel.ubuntu.com/git/ubuntu/autotest-client-tests.git/tree/ubuntu_stress_smoke_test

Performance regression tests:

https://kernel.ubuntu.com/git/ubuntu/autotest-client-tests.git/tree/ubuntu_performance_stress_ng

These may be a useful starting point for CI testing.

Colin

> 
> Aurelien
> 

