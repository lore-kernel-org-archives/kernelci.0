MIME-Version: 1.0
References: <CAKwvOd=um1y=Ax2hK5YYQBxbxLK4kiQuDs9fZsr77YyNR5r=Ww@mail.gmail.com>
In-Reply-To: <CAKwvOd=um1y=Ax2hK5YYQBxbxLK4kiQuDs9fZsr77YyNR5r=Ww@mail.gmail.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Sat, 1 Aug 2020 20:53:17 -0700
Message-ID: <CAKwvOdm-KYMq=-FHG9tN9S5Bz6RF_rwmAkDcjLPOVYoF5b01jA@mail.gmail.com>
Subject: Re: plumbers session on CI and LLVM
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>, Chen Rong <rong.a.chen@intel.com>, Philip Li <philip.li@intel.com>, Dan Rue <dan.rue@linaro.org>, Mathieu Acher <mathieu.acher@irisa.fr>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Cc: kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>, Behan Webster <behanw@converseincode.com>

On Wed, Jul 8, 2020 at 12:24 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Hi Kevin and folks,
> I'm trying to put together a Micro Conference for plumbers focused on
> LLVM.  In particular, I'd like to have a session that focuses on
> Continuous Integration (KernelCI, 0day bot, tuxbuild, kernel
> configuration space, and LLVM buildbots).

Thanks for the positive feedback folks. We just got the notice that
the LLVM MC got approved for plumbers.
https://www.linuxplumbersconf.org/blog/2020/llvm-microconference-accepted-into-2020-linux-plumbers-conference/
https://www.linuxplumbersconf.org/event/7/page/80-accepted-microconferences
So reminder to buy your tickets for the conf if you have not done so already.
https://www.linuxplumbersconf.org/event/7/page/47-attend

I plan to host this subject in our MC.  We don't have a lot of the
details finalized quite yet, but the timing of the overall MC is going
to be tight.  I don't know yet which day our MC will be on yet and
will let you know as soon as I do, but in a rough sketch of the
proposed talks we can carve out 30 minutes to the subject.  I'm sure
that's not enough time for the subject material, but we don't plan on
having any other talks take longer since we're trying to fit quite a
few talks in.

I plan on hosting a small status update on what arch's build with
Clang, what's missing where, and what we're trying to do in the future
(hint: `make LLVM=1`).  Then we'll save the rest for open discussion.
--
Thanks,
~Nick Desaulniers
