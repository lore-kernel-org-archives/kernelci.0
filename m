MIME-Version: 1.0
References: <5c6702da.1c69fb81.12a14.4ece@mx.google.com> <20190215104325.039dbbd9c3bfb35b95f9247b@linux-foundation.org>
 <20190215185151.GG7897@sirena.org.uk> <20190226155948.299aa894a5576e61dda3e5aa@linux-foundation.org>
 <CAPcyv4ivjC8fNkfjdFyaYCAjGh7wtvFQnoPpOcR=VNZ=c6d6Rg@mail.gmail.com> <20190228151438.fc44921e66f2f5d393c8d7b4@linux-foundation.org>
In-Reply-To: <20190228151438.fc44921e66f2f5d393c8d7b4@linux-foundation.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 28 Feb 2019 15:55:57 -0800
Message-ID: <CAPcyv4hDmmK-L=0txw7L9O8YgvAQxZfVFiSoB4LARRnGQ3UC7Q@mail.gmail.com>
Subject: Re: next/master boot bisection: next-20190215 on beaglebone-black
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, "kernelci.org bot" <bot@kernelci.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, guillaume.tucker@collabora.com, Matt Hart <matthew.hart@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, khilman@baylibre.com, enric.balletbo@collabora.com, Nicholas Piggin <npiggin@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Adrian Reber <adrian@lisas.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Linux MM <linux-mm@kvack.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michal Hocko <mhocko@suse.com>, Richard Guy Briggs <rgb@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, info@kernelci.org

On Thu, Feb 28, 2019 at 3:14 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 26 Feb 2019 16:04:04 -0800 Dan Williams <dan.j.williams@intel.com> wrote:
>
> > On Tue, Feb 26, 2019 at 4:00 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > On Fri, 15 Feb 2019 18:51:51 +0000 Mark Brown <broonie@kernel.org> wrote:
> > >
> > > > On Fri, Feb 15, 2019 at 10:43:25AM -0800, Andrew Morton wrote:
> > > > > On Fri, 15 Feb 2019 10:20:10 -0800 (PST) "kernelci.org bot" <bot@kernelci.org> wrote:
> > > >
> > > > > >   Details:    https://kernelci.org/boot/id/5c666ea959b514b017fe6017
> > > > > >   Plain log:  https://storage.kernelci.org//next/master/next-20190215/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-7/lab-collabora/boot-am335x-boneblack.txt
> > > > > >   HTML log:   https://storage.kernelci.org//next/master/next-20190215/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-7/lab-collabora/boot-am335x-boneblack.html
> > > >
> > > > > Thanks.
> > > >
> > > > > But what actually went wrong?  Kernel doesn't boot?
> > > >
> > > > The linked logs show the kernel dying early in boot before the console
> > > > comes up so yeah.  There should be kernel output at the bottom of the
> > > > logs.
> > >
> > > I assume Dan is distracted - I'll keep this patchset on hold until we
> > > can get to the bottom of this.
> >
> > Michal had asked if the free space accounting fix up addressed this
> > boot regression? I was awaiting word on that.
>
> hm, does bot@kernelci.org actually read emails?  Let's try info@ as well..

Thanks, yes. The logs don't give much to go on, so I can only iterate
on this as fast as I can drum up feedback.

>
> Is it possible to determine whether this regression is still present in
> current linux-next?
>
> > I assume you're not willing to entertain a "depends
> > NOT_THIS_ARM_BOARD" hack in the meantime?
>
> We'd probably never be able to remove it.  And we don't know whether
> other systems might be affected.

Right, and agree. I was just grasping at straws because I know of
users that want to take advantage of this and was lamenting the
upcoming apology tour saying, "sorry, maybe v5.2". I had always
expected that platforms outside of x86-servers would need to do their
own validation / evaluation before recommending this, and the
regression concern is why it defaulted to disabled... but boot
regressions are boot regressions.
