MIME-Version: 1.0
References: <CACRpkdYeSLVFT14W4QP_dx_F6nVRNR8aNeZV+8wQkQA3rmMiiQ@mail.gmail.com>
 <CAH1_8nC2G1xkapA4qNnSa5_wMSBGjFgs1VmYFwAAJ9duWk9Ciw@mail.gmail.com>
 <CAH+k93GJE6oEVNYxwU4Qv_F9dgcSYycg=aEHDmGfHsPJL2ooWw@mail.gmail.com>
 <CACRpkdYEw_xqxEhM_egqeTUHhGCEkUTSyaYDQ0hAwgMdSU8fnw@mail.gmail.com>
 <CAH1_8nB4idAJ1VM_D6Bkis3T8V4zhTyatmmi1iSwS_MmL2j4Qg@mail.gmail.com>
 <CACRpkdaR3hbKkDf0DH9nBT7AgxJmMzWfu_mNjnq0wyL=KuqWPg@mail.gmail.com>
 <CAH1_8nAZZNE0_nGUrSQoOt-wxdcpKe+fmB8-qw9kmv1T1TeeOg@mail.gmail.com>
 <CACRpkdafj1mLML12EkJ9BNEfRvD5Mb=yjcMkmHV6Ux0+dsVUmA@mail.gmail.com>
 <CAH1_8nAnOJE5vO9YNxbrWZfwbHgMa8ScSNahbpqmjqw-k9cbzA@mail.gmail.com>
 <CACRpkdb_mfh=14rAgMSWPg7FXokQyDfAzMaEzYTr-7xGnY1p5w@mail.gmail.com> <CAH1_8nBA6NgEixrfZfN5qhyoByXDXeJqMnmfiJ3HHBw=_hcVjA@mail.gmail.com>
In-Reply-To: <CAH1_8nBA6NgEixrfZfN5qhyoByXDXeJqMnmfiJ3HHBw=_hcVjA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jul 2019 15:05:05 +0200
Message-ID: <CACRpkdaFBirW=W3q0gVJcarRZiLkrubH835nR60dsVo=qyH8kQ@mail.gmail.com>
Subject: Re: Adding tree to kernelci
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Matt Hart <matthew.hart@linaro.org>, kernelci@groups.io, Anders Roxell <anders.roxell@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

On Tue, Jul 9, 2019 at 2:44 PM Guillaume Tucker
<guillaume.tucker@gmail.com> wrote:
> On Tue, Jul 9, 2019 at 12:27 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Jul 9, 2019 at 12:52 PM Guillaume Tucker
>> <guillaume.tucker@gmail.com> wrote:

>> >   https://staging.kernelci.org/job/linusw/branch/devel/
>>
>> This isn't working right now the page is full of error messages.
>
> Oops, there was a broken change being tested there.  It should be
> back on track now.

Looks good!

>> Yes linux-gpio@vger.kernel.org should probably be added.
>
> OK I've added a path to the PR to add that, with just build and
> boot reports for now.  I guess it would be useful to run some
> GPIO tests at some point (libgpiod was mentioned earlier on this
> thread), and then enable email reports for that.

Yes Bartosz knows what is the proper approach here.
A set of whitebox tests from userspace is coming into place.

Yours,
Linus Walleij
