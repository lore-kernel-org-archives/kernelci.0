MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com>
 <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com>
 <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com> <CAH1_8nB4idAJ1VM_D6Bkis3T8V4zhTyatmmi1iSwS_MmL2j4Qg@mail.gmail.com>
In-Reply-To: <CAH1_8nB4idAJ1VM_D6Bkis3T8V4zhTyatmmi1iSwS_MmL2j4Qg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Feb 2019 16:15:12 +0100
Message-ID: <CACRpkdaR3hbKkDf0DH9nBT7AgxJmMzWfu_mNjnq0wyL=KuqWPg@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Matt Hart <matthew.hart@linaro.org>, kernelci@groups.io, Anders Roxell <anders.roxell@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Mon, Feb 25, 2019 at 2:04 PM Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:
> On Fri, Feb 1, 2019 at 12:18 PM Linus Walleij <linus.walleij@linaro.org> wrote:

>> The best would be that the tree be checked once per 24 hrs
>> at my nighttime for if any changes done during the day.
>> I think that would seldom amount to it running two days in
>> a row except during intense times (merge window).
>
> I see there's now a PR to add these branches:
>
>   https://github.com/kernelci/kernelci-core-staging/pull/100

Sweet!

> I've added a comment about the number of builds, as at the moment
> we can't easily configure to only check these branches every 24h
> when all the other branches are being checked every hour.

Fair enough, I don't think it will stress the system too much.

Thanks a lot!
Linus Walleij
