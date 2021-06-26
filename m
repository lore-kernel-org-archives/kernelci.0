Return-Path: <keescook@chromium.org>
Date: Fri, 25 Jun 2021 23:12:46 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 0/9] LKDTM: Improvements for kernelci.org
Message-ID: <202106252311.14501F2F@keescook>
References: <20210623203936.3151093-1-keescook@chromium.org>
 <030c022b-985a-16eb-b9d7-73b6fed2d5a9@collabora.com>
MIME-Version: 1.0
In-Reply-To: <030c022b-985a-16eb-b9d7-73b6fed2d5a9@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, Collabora Kernel ML <kernel@collabora.com>

On Fri, Jun 25, 2021 at 07:22:01AM +0100, Guillaume Tucker wrote:
> On 23/06/2021 21:39, Kees Cook wrote:
> > This is a bunch of LKDTM clean-ups to improve and expand testing,
> > given feedback from testing at kernelci.org. Adds a few new tests as
> > well.
> > 
> > (If a pull-request is preferred, please let me know.)
> > 
> > Thanks!
> > 
> > -Kees
> > 
> > Kees Cook (9):
> >   selftests/lkdtm: Avoid needing explicit sub-shell
> >   selftests/lkdtm: Fix expected text for CR4 pinning
> >   selftests/lkdtm: Fix expected text for free poison
> >   lkdtm/bugs: XFAIL UNALIGNED_LOAD_STORE_WRITE
> >   lkdtm/heap: Add vmalloc linear overflow test
> >   lkdtm: Enable DOUBLE_FAULT on all architectures
> >   lkdtm: Add CONFIG hints in errors where possible
> >   selftests/lkdtm: Enable various testable CONFIGs
> >   lkdtm/heap: Add init_on_alloc tests
> 
> Tested-by: "kernelci.org bot" <bot@kernelci.org>
> 
> 
> This whole series was tested on top of next-20210623, here are a
> couple of sample results from KernelCI staging:
> 
> Clang 13 on AMD x86_64:
> https://staging.kernelci.org/test/plan/id/60d4a5ce3d2bc535d924bf25/
> 
> GCC 8 on Intel x86_64:
> https://staging.kernelci.org/test/plan/id/60d570711a3d6beefe24bf26/
> 
> And this is where the series was applied:
> https://github.com/kernelci/linux/commits/a9f4387015268e426c77fd51ed846c9756938828

Fantastic! Thanks; this looks great. :)

-- 
Kees Cook
