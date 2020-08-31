Subject: Re: issues reading results
References: <CAHRSSEzW_f=i4G2rtXxnX-iPgq2A4XfAatxTGpzpO-Pwv-jCvg@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <1d236833-5aa5-a373-15ea-54eae1308478@collabora.com>
Date: Mon, 31 Aug 2020 17:19:47 +0100
MIME-Version: 1.0
In-Reply-To: <CAHRSSEzW_f=i4G2rtXxnX-iPgq2A4XfAatxTGpzpO-Pwv-jCvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: tkjos@google.com
Cc: kernelci@groups.io

On 31/08/2020 16:11, Todd Kjos via groups.io wrote:
> I'm trying to look at results at=C2=A0https://kernelci.org/job/android/ =
but it seems to time out and all the metrics have the infinity symbol. Is t=
his a known issue?

A service to process API requests on the kernelci.org server
stopped on Friday, it's back now.

Thanks for reporting the problem.  It wasn't really a known issue
other than it happens on some rare occasions.

I've opened a GitHub issue to keep track of it:

  https://github.com/kernelci/kernelci-backend/issues/252

Best wishes,
Guillaume
