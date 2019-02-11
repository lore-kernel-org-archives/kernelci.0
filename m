Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: KernelCI modular pipeline design document
In-Reply-To: <CAJrz+7L=iiJuhdYFU6YTytEGTpd_13E+BKYEqf1JEGq=7bmSSw@mail.gmail.com>
References: <c7f519e5-1945-bbf6-69b3-6ded932ceb50@collabora.com> <trinity-797bf1b5-df32-4a98-acc4-60a007157e7d-1549642801182@3c-app-gmx-bs20> <CAJrz+7L=iiJuhdYFU6YTytEGTpd_13E+BKYEqf1JEGq=7bmSSw@mail.gmail.com>
Date: Mon, 11 Feb 2019 10:27:00 -0800
Message-ID: <7h1s4egozv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, milosz.wasilewski@linaro.org, kernelci@groups.io, JanSimon.Moeller@gmx.de
Cc: Guillaume Tucker <guillaume.tucker@gmail.com>

"Milosz Wasilewski" <milosz.wasilewski@linaro.org> writes:

> On Fri, 8 Feb 2019 at 16:33, "Jan-Simon M=C3=B6ller" <JanSimon.Moeller@gm=
x.de> wrote:
>>
>> Please do not just think of 'building the kernel' - ppl also want to tes=
t and record/visualize userspace tests (aka custom-built kernel+filesystem).
>> Yes, the linux kernel is the main focus for kernelci.org . But let's kee=
p the other possible use-cases in mind.
>>
>
> I don't think this is a good idea. Having other use cases in mind
> takes you down a very deep rabbit hole. Creating a general purpose
> result reporting tool is hard. Kernelci reports on kernel results and
> (as I understand) does it right. You can use these tools for other
> purposes but that's a different story.

Yes, we're focused on kernel-focused testing, but there are multiple
ways to test the kernel, most of which require a combination of kernel +
userspace/distro.

I think Jan-Simon's point is that as we evolve, while we might focus on
buildroot/debian, we chould not design things in a way that prohibit
using the kernelCI code (and infra) for other types of kernel-focused
testing (e.g. Yocto, other distros, etc.)

Stated differently, the current *service* provided by kernelCI.org is
kernel-focused testing.  But, we could (and should, IMO) write the
*software* behind that service in a way that it could be used more
generically if desired.

Kevin
