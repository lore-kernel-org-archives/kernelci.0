MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com>
 <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com>
 <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com>
 <CAH1_8nB4idAJ1VM_D6Bkis3T8V4zhTyatmmi1iSwS_MmL2j4Qg@mail.gmail.com>
 <CACRpkdaR3hbKkDf0DH9nBT7AgxJmMzWfu_mNjnq0wyL=KuqWPg@mail.gmail.com> <CAH1_8nAZZNE0_nGUrSQoOt-wxdcpKe+fmB8-qw9kmv1T1TeeOg@mail.gmail.com>
In-Reply-To: <CAH1_8nAZZNE0_nGUrSQoOt-wxdcpKe+fmB8-qw9kmv1T1TeeOg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2019 22:48:46 +0200
Message-ID: <CACRpkdafj1mLML12EkJ9BNEfRvD5Mb=yjcMkmHV6Ux0+dsVUmA@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Matt Hart <matthew.hart@linaro.org>, kernelci@groups.io, Anders Roxell <anders.roxell@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Wed, Jun 5, 2019 at 3:01 PM Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:

> While there is still some headroom in the build capacity, it
> seems worthwhile reviewing what each maintainer tree actually
> needs to build.  Some maintainers need to have full coverage, but
> often it's not necessary to build more than the defconfigs for
> all the architectures.
>
> By doing this, we can enable many more maintainer trees and also
> reduce the turnaround time.
>
> Could you please confirm which combinations of architectures,
> defconfigs and fragments you need for each branch in your
> linux-gpio tree?

I just need the defconfigs for sure, all architectures have GPIO
except UML and S390 so these two can be skipped. Also any
virtualization targets if there are such.

Yours,
Linus Walleij
