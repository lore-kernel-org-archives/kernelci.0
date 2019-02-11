MIME-Version: 1.0
References: <c7f519e5-1945-bbf6-69b3-6ded932ceb50@collabora.com> <trinity-797bf1b5-df32-4a98-acc4-60a007157e7d-1549642801182@3c-app-gmx-bs20>
In-Reply-To: <trinity-797bf1b5-df32-4a98-acc4-60a007157e7d-1549642801182@3c-app-gmx-bs20>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Mon, 11 Feb 2019 12:41:55 +0000
Message-ID: <CAJrz+7L=iiJuhdYFU6YTytEGTpd_13E+BKYEqf1JEGq=7bmSSw@mail.gmail.com>
Subject: Re: KernelCI modular pipeline design document
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, JanSimon.Moeller@gmx.de
Cc: Guillaume Tucker <guillaume.tucker@gmail.com>

On Fri, 8 Feb 2019 at 16:33, "Jan-Simon M=C3=B6ller" <JanSimon.Moeller@gmx.=
de> wrote:
>
> Please do not just think of 'building the kernel' - ppl also want to test=
 and record/visualize userspace tests (aka custom-built kernel+filesystem).
> Yes, the linux kernel is the main focus for kernelci.org . But let's keep=
 the other possible use-cases in mind.
>

I don't think this is a good idea. Having other use cases in mind
takes you down a very deep rabbit hole. Creating a general purpose
result reporting tool is hard. Kernelci reports on kernel results and
(as I understand) does it right. You can use these tools for other
purposes but that's a different story.

milosz
