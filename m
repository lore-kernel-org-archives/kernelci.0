MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com> <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com>
In-Reply-To: <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Feb 2019 13:17:50 +0100
Message-ID: <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Matt Hart <matthew.hart@linaro.org>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>, Anders Roxell <anders.roxell@linaro.org>

On Thu, Jan 31, 2019 at 7:37 PM Matt Hart <matthew.hart@linaro.org> wrote:
> On Thu, 31 Jan 2019 at 18:28, Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:

> >> could the GPIO tree:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/
> >>
> >> Branches "devel", "fixes" and "for-next" (no others!) be added to
> >> the kernelci loop?
>
> How often are they updated?

Depends on my work schedule, I suppose weekly to biweekly
but when I focus on it they change several times the same
day.

The best would be that the tree be checked once per 24 hrs
at my nighttime for if any changes done during the day.
I think that would seldom amount to it running two days in
a row except during intense times (merge window).

Yours,
Linus Walleij
