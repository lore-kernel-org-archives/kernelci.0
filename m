MIME-Version: 1.0
References: <CAHRSSEzTMcNTiPAa3-U20z0C0KnHRjNgA0+DMwySXsPKSPX5Gw@mail.gmail.com>
In-Reply-To: <CAHRSSEzTMcNTiPAa3-U20z0C0KnHRjNgA0+DMwySXsPKSPX5Gw@mail.gmail.com>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Wed, 10 Apr 2019 16:09:36 +0100
Message-ID: <CAH+k93HEAmn_Y1fCcFQWpPwLVC7ZTvCyFGFNpea+C1cV2KCSjg@mail.gmail.com>
Subject: Re: please add android-4.X-q common kernels to kernelci
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, info@kernelci.org
Cc: Alistair Strachan <astrachan@google.com>, Greg Kroah-Hartman <gregkh@google.com>, Sandeep Patil <sspatil@google.com>

On Tue, 9 Apr 2019 at 06:48, 'Todd Kjos' via info <info@kernelci.org> wrote:
>
> We just created the "dessert" kernels for the Android Q release, please add them to
> kernelci testing:
>
> repo: https://android.googlesource.com/kernel/common
> branches:
>   android-4.9-q
>   android-4.14-q
>   android-4.19-q
>
> These will get updated weekly with LTS merges but have very little action otherwise.

I'll get these added. If there's any concern about build capacity I
will add GCE builders as required.

>
> Thanks.
>
> -Todd
>
> 
