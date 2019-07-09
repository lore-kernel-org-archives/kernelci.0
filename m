MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com>
 <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com>
 <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com>
 <CAH1_8nB4idAJ1VM_D6Bkis3T8V4zhTyatmmi1iSwS_MmL2j4Qg@mail.gmail.com>
 <CACRpkdaR3hbKkDf0DH9nBT7AgxJmMzWfu_mNjnq0wyL=KuqWPg@mail.gmail.com>
 <CAH1_8nAZZNE0_nGUrSQoOt-wxdcpKe+fmB8-qw9kmv1T1TeeOg@mail.gmail.com>
 <CACRpkdafj1mLML12EkJ9BNEfRvD5Mb=yjcMkmHV6Ux0+dsVUmA@mail.gmail.com> <CAH1_8nAnOJE5vO9YNxbrWZfwbHgMa8ScSNahbpqmjqw-k9cbzA@mail.gmail.com>
In-Reply-To: <CAH1_8nAnOJE5vO9YNxbrWZfwbHgMa8ScSNahbpqmjqw-k9cbzA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jul 2019 13:27:22 +0200
Message-ID: <CACRpkdb_mfh=14rAgMSWPg7FXokQyDfAzMaEzYTr-7xGnY1p5w@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Matt Hart <matthew.hart@linaro.org>, kernelci@groups.io, Anders Roxell <anders.roxell@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Tue, Jul 9, 2019 at 12:52 PM Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:

> Sounds good, I've made a PR to only build the defconfig of each
> arch, which amounts to 6 builds:

Sounds good.

> Here are some results from a staging run with the devel branch:
>
>   https://staging.kernelci.org/job/linusw/branch/devel/

This isn't working right now the page is full of error messages.

> Also I've noticed there aren't any email reports associated with
> your tree, so they just get sent to a default alias instead.
> Maybe at least the linux-gpio list should be added?  Let me know
> and I can add that to the PR.

Yes linux-gpio@vger.kernel.org should probably be added.

Yours,
Linus Walleij
