MIME-Version: 1.0
References: <131709e8-f804-5623-448d-7c3607be00e0@quicinc.com>
In-Reply-To: <131709e8-f804-5623-448d-7c3607be00e0@quicinc.com>
From: Todd Kjos <tkjos@google.com>
Date: Wed, 17 Aug 2022 11:05:14 -0700
Message-ID: <CAHRSSExm0P0kBF00R9Ft7-GVMcf0A9190mjeOWU4umKA3PL93A@mail.gmail.com>
Subject: Re: UM-Linux compilation on Android Common Kernels
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: kernelci@groups.io

On Wed, Aug 17, 2022 at 10:51 AM Elliot Berman <quic_eberman@quicinc.com>
wrote:

> Hello there,
>
> Qualcomm recently caught some build errors in UM-Linux on Android Common
> Kernel. Todd suggested that these errors might be catchable by 0day. Can


I think in this context, I meant "catchable by kernelci".


>
> UM-Linux compilation be enabled for Android Common Kernels?
>
> ARCH=um SUBARCH=x86_64
>

I support this, can we add this test for android kernels? (could limit to
5.10 an higher).


>
> Thanks,
> Elliot
>
