MIME-Version: 1.0
References: <CACT4Y+YbNNyvoYD7E1Rczt_OmkEuYTs6fDHoaUPFEygYYr_Oyg@mail.gmail.com>
In-Reply-To: <CACT4Y+YbNNyvoYD7E1Rczt_OmkEuYTs6fDHoaUPFEygYYr_Oyg@mail.gmail.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Thu, 9 Apr 2020 09:31:25 +0200
Message-ID: <CACT4Y+bDt_QJ8emH81qcSjFFC75u=cEz6Pc-PTNpoOELNfdBvQ@mail.gmail.com>
Subject: Re: KernelCI and KUnit
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Brendan Higgins <brendanhiggins@google.com>
Cc: kasan-dev <kasan-dev@googlegroups.com>, Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>

On Thu, Apr 9, 2020 at 9:16 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Hi,
>
> I remember subj was discussed last year. What's the status?
> Has KernelCI started running KUnit tests during builds? How are tests
> selected? Does this use only UML?
>
> Thanks

+kasan-dev

For more context: we would like to get some testing for
KASAN/KCSAN/KMSAN/KFENCE. KASAN tests are being converted to KUnit and
KASAN is being ported to UML. Tests for other tools are in process.
I am trying to understand if KernelCI is something we could rely here.

Thanks
