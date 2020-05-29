Subject: Re: kci_build proposal
References: <7ho8q77i1t.fsf@baylibre.com>
 <18306.1590738124792037023@groups.io>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <8a6bf3c3-2568-1cda-fac1-60c521bfa7f7@collabora.com>
Date: Fri, 29 May 2020 15:27:53 +0100
MIME-Version: 1.0
In-Reply-To: <18306.1590738124792037023@groups.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: mathieu.acher@irisa.fr
Cc: kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>

Hi Mathieu,

On 29/05/2020 08:42, Mathieu Acher wrote:
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
> 
> In both cases, we need an infrastructure capable of compiling *any* configuration of the kernel.
> For measuring the size, we need to control all factors, like gcc version and so forth. Docker was helpful here to have a canonical environment. 
> One issue we found is to build the right Docker image: some configurations of the kernel require specific tools and anticipating all can be tricky, leading to some false-positive failures.
> Have you encountered this situation? 
> 
> In general, my colleagues at University of Rennes 1/Inria and I are really interested to be part of this new effort through discussions or technical contributions. 
> We plan to modernize TuxML with KernelCI toolchain, especially if it's possible to deploy it on several distributed machines. 

Thank you for getting in touch, your project sounds really
interesting.  To echo what Mark wrote in his email, it does seem
like we're all fighting for a common cause.

> Can I somehow participate in the next call? Mainly to learn and as a first step to contribute in this very nice project. 

As it turns out, we're now planning to have a meeting with Dan on
Tuesday 23rd June to focus on the tuxmake/tuxbuild topic he just
brought up.  Please feel free to join us then, as well as any of
the weekly Tuesday meetings so we can introduce ourselves.  I've
added you to the calendar invitation.

Out of interest, do you cover other compilers than gcc?  We're
working closely with the Clang-built Linux team and this may be
of interest to them too.

Best wishes,
Guillaume
