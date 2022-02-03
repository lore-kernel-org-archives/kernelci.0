MIME-Version: 1.0
References: <61fb39e3.1c69fb81.549c9.14a2@mx.google.com> <CAOMZO5C4KPeRGdOVu_N-Cp98zi20j+L+o7v9na2y3PzujKmbGg@mail.gmail.com>
 <92e86248-c8ad-757a-a5b7-7b515790aa50@collabora.com>
In-Reply-To: <92e86248-c8ad-757a-a5b7-7b515790aa50@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Feb 2022 08:02:29 -0300
Message-ID: <CAOMZO5Cgod_-UBjAMW-VP1gTcGgE_V4dDDZX1d379CamK+DHow@mail.gmail.com>
Subject: Re: mainline/master baseline: 832 runs, 27 regressions (v5.17-rc2-60-g88808fbbead4)
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, kernelci-results@groups.io, "kernelci@groups.io" <kernelci@groups.io>

Hi Guillaume,

On Thu, Feb 3, 2022 at 6:15 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:

> Yes, well the automated bisection worked:
>
> https://groups.io/g/kernelci-results/message/22701
>
> Feel free to report this result, if you have the time.  Ideally
> that's done with a reply to the original email thread for the
> commit found by the bisection (not yet automated).  Or let me
> know if you prefer that I do it instead.

Just realized that the offending commit has already been reverted in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=a407f26bdf789e1c309694bfe342b78857c08182

This should hit mainline soon.

Thanks
