Date: Thu, 11 Apr 2019 23:49:46 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: next/master boot bisection: next-20190215 on beaglebone-black
References: <3fafb552-ae75-6f63-453c-0d0e57d818f3@collabora.com>
 <CAPcyv4hMNiiM11ULjbOnOf=9N=yCABCRsAYLpjXs+98bRoRpCA@mail.gmail.com>
 <36faea07-139c-b97d-3585-f7d6d362abc3@collabora.com>
 <20190306140529.GG3549@rapoport-lnx>
 <21d138a5-13e4-9e83-d7fe-e0639a8d180a@collabora.com>
 <CAPcyv4jBjUScKExK09VkL8XKibNcbw11ET4WNUWUWbPXeT9DFQ@mail.gmail.com>
 <CAGXu5jLAPKBE-EdfXkg2AK5P=qZktW6ow4kN5Yzc0WU2rtG8LQ@mail.gmail.com>
 <CABXOdTdVvFn=Nbd_Anhz7zR1H-9QeGByF3HFg4ZFt58R8=H6zA@mail.gmail.com>
 <CAGXu5j+Sw2FyMc8L+8hTpEKbOsySFGrCmFtVP5gt9y2pJhYVUw@mail.gmail.com>
 <CABXOdTcXWf9iReoocaj9rZ7z17zt-62iPDuvQQSrQRtMeeZNiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABXOdTcXWf9iReoocaj9rZ7z17zt-62iPDuvQQSrQRtMeeZNiA@mail.gmail.com>
Message-Id: <20190411204945.GA26085@rapoport-lnx>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guenter Roeck <groeck@google.com>
Cc: Kees Cook <keescook@chromium.org>, kernelci@groups.io, Dan Williams <dan.j.williams@intel.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Mark Brown <broonie@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Matt Hart <matthew.hart@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kevin Hilman <khilman@baylibre.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Nicholas Piggin <npiggin@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Adrian Reber <adrian@lisas.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Linux MM <linux-mm@kvack.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Guy Briggs <rgb@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, info@kernelci.org

On Thu, Apr 11, 2019 at 01:08:15PM -0700, Guenter Roeck wrote:
> On Thu, Apr 11, 2019 at 10:35 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Apr 11, 2019 at 9:42 AM Guenter Roeck <groeck@google.com> wrote:
> > >
> > > On Thu, Apr 11, 2019 at 9:19 AM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > On Thu, Mar 7, 2019 at 7:43 AM Dan Williams <dan.j.williams@intel.com> wrote:
> > > > > I went ahead and acquired one of these boards to see if I can can
> > > > > debug this locally.
> > > >
> > > > Hi! Any progress on this? Might it be possible to unblock this series
> > > > for v5.2 by adding a temporary "not on ARM" flag?
> > > >
> > >
> > > Can someone send me a pointer to the series in question ? I would like
> > > to run it through my testbed.
> >
> > It's already in -mm and linux-next (",mm: shuffle initial free memory
> > to improve memory-side-cache utilization") but it gets enabled with
> > CONFIG_SHUFFLE_PAGE_ALLOCATOR=y (which was made the default briefly in
> > -mm which triggered problems on ARM as was reverted).
> >
> 
> Boot tests report
> 
> Qemu test results:
>     total: 345 pass: 345 fail: 0
> 
> This is on top of next-20190410 with CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
> and the known crashes fixed.
> 
> $ git log --oneline next-20190410..
> 3367c36ce744 Set SHUFFLE_PAGE_ALLOCATOR=y for testing.
> d2aee8b3cd5d Revert "crypto: scompress - Use per-CPU struct instead
> multiple variables"
> 4bc9f5bc9a84 Fix: rhashtable: use bit_spin_locks to protect hash bucket.
> 
> Boot tests on arm are:
> 
> Building arm:versatilepb:versatile_defconfig:aeabi:pci:scsi:mem128:versatile-pb:rootfs
> ... running ........ passed
> Building arm:versatilepb:versatile_defconfig:aeabi:pci:mem128:versatile-pb:initrd
> ... running ........ passed

...

> Building arm:witherspoon-bmc:aspeed_g5_defconfig:notests:aspeed-bmc-opp-witherspoon:initrd
> ... running ........... passed
> Building arm:ast2500-evb:aspeed_g5_defconfig:notests:aspeed-ast2500-evb:initrd
> ... running ................ passed
> Building arm:romulus-bmc:aspeed_g5_defconfig:notests:aspeed-bmc-opp-romulus:initrd
> ... running ......................... passed
> Building arm:mps2-an385:mps2_defconfig:mps2-an385:initrd ... running
> ...... passed

The issue was with an omap2 board and, AFAIK, qemu does not simulate those.

-- 
Sincerely yours,
Mike.

