MIME-Version: 1.0
References: <7ho8q77i1t.fsf@baylibre.com> <18306.1590738124792037023@groups.io>
In-Reply-To: <18306.1590738124792037023@groups.io>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Tue, 16 Jun 2020 09:33:20 -0700
Message-ID: <CAKwvOdnaoaZPLqcn6yiFEpEVx=HmpRe1ExhLZfzLhHs7e7Atww@mail.gmail.com>
Subject: Re: kci_build proposal
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: mathieu.acher@irisa.fr
Cc: Kevin Hilman <khilman@baylibre.com>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>

+ clang-built-linux

On Fri, May 29, 2020 at 12:42 AM Mathieu Acher <mathieu.acher@irisa.fr> wrote:
>
> Dear all,
>
> I'm glad to hear the ongoing effort about containerization (Docker + Python 3) of KernelCI.
> I didn't know the existence of tuxbuild and I'm as curious as Kevin for having more details.
>
> As an academic, we have some use cases that can further motivate the use of a "cloud-based solution".
> In 2017, we have developed TuxML (https://github.com/TuxML/ProjetIrma) which a solution with Docker and Python 3 for massively compiling kernel configurations.
> The "ml" part stands for statistical learning. So far, we have collected 200K+ configurations with a distributed computing infrastructure (a kind of cloud).
> Our focus is to explore the configuration space of the Linux kernel in the large; we fed several config files (mainly with randconfig and some pre-set options) and then perform some "tests" (in a broad sense).
>
> We have two major use cases:
>  * bug-finding related to configurations: we are able to locate faulty (combinations of) options and even prevent/fix some failures at the Kconfig level (more details here: https://hal.inria.fr/hal-02147012)
>  * size prediction of a configuration (without compiling it) and identificaton of options that influence size (more details here: https://hal.inria.fr/hal-02314830)

Hi Mathieu,
I'm focused on building the Linux kernel with Clang.  One of the
issues we're running into is long tail bug reports from configs beyond
defconfigs or the defconfigs from major Linux distros.  In particular,
randconfig builds tend to dig up all kinds of issues for us.  It can
also take time to differentiate whether this issue is
toolchain-agnostic or specific to Clang.

>From your presentation
https://static.sched.com/hosted_files/osseu19/ca/TuxML-OSS2019-v3.pdf
the slides on classification trees have me curious.  I suppose if you
had data from builds with GCC+Clang, you could help us spot what
configs are still problematic just for Clang and not for GCC?  That
kind of pattern analysis would be invaluable in trying to automate bug
finding.  Already the configuration space is unfathomable, and adding
yet another label (toolchain) doesn't help, but it is something that
could have a quantifiable impact and really help.

If it's something that you have capacity for, let's chat more?

>
> In both cases, we need an infrastructure capable of compiling *any* configuration of the kernel.
> For measuring the size, we need to control all factors, like gcc version and so forth. Docker was helpful here to have a canonical environment.
> One issue we found is to build the right Docker image: some configurations of the kernel require specific tools and anticipating all can be tricky, leading to some false-positive failures.
> Have you encountered this situation?
>
> In general, my colleagues at University of Rennes 1/Inria and I are really interested to be part of this new effort through discussions or technical contributions.
> We plan to modernize TuxML with KernelCI toolchain, especially if it's possible to deploy it on several distributed machines.
>
> Can I somehow participate in the next call? Mainly to learn and as a first step to contribute in this very nice project.
>
> Best,
>
> Mathieu Acher
>
>
>
> 
>


-- 
Thanks,
~Nick Desaulniers
