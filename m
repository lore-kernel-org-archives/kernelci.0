Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: KernelCI modular pipeline design document
In-Reply-To: <CAJrz+7Kpsq6u7CVQsfa57XiWTqEw4tAUcDXfsRUJmms9zZF-Jg@mail.gmail.com>
References: <c7f519e5-1945-bbf6-69b3-6ded932ceb50@collabora.com> <trinity-797bf1b5-df32-4a98-acc4-60a007157e7d-1549642801182@3c-app-gmx-bs20> <CAJrz+7L=iiJuhdYFU6YTytEGTpd_13E+BKYEqf1JEGq=7bmSSw@mail.gmail.com> <7h1s4egozv.fsf@baylibre.com> <CAJrz+7Kpsq6u7CVQsfa57XiWTqEw4tAUcDXfsRUJmms9zZF-Jg@mail.gmail.com>
Date: Mon, 11 Feb 2019 17:14:19 -0800
Message-ID: <7h4l99g650.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Milosz Wasilewski <milosz.wasilewski@linaro.org>
Cc: kernelci@groups.io, JanSimon.Moeller@gmx.de, Guillaume Tucker <guillaume.tucker@gmail.com>

Milosz Wasilewski <milosz.wasilewski@linaro.org> writes:

> On Mon, 11 Feb 2019 at 18:27, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> "Milosz Wasilewski" <milosz.wasilewski@linaro.org> writes:
>>
>> > On Fri, 8 Feb 2019 at 16:33, "Jan-Simon M=C3=B6ller" <JanSimon.Moeller=
@gmx.de> wrote:
>> >>
>> >> Please do not just think of 'building the kernel' - ppl also want to =
test and record/visualize userspace tests (aka custom-built kernel+filesyst=
em).
>> >> Yes, the linux kernel is the main focus for kernelci.org . But let's =
keep the other possible use-cases in mind.
>> >>
>> >
>> > I don't think this is a good idea. Having other use cases in mind
>> > takes you down a very deep rabbit hole. Creating a general purpose
>> > result reporting tool is hard. Kernelci reports on kernel results and
>> > (as I understand) does it right. You can use these tools for other
>> > purposes but that's a different story.
>>
>> Yes, we're focused on kernel-focused testing, but there are multiple
>> ways to test the kernel, most of which require a combination of kernel +
>> userspace/distro.
>>
>> I think Jan-Simon's point is that as we evolve, while we might focus on
>> buildroot/debian, we chould not design things in a way that prohibit
>> using the kernelCI code (and infra) for other types of kernel-focused
>> testing (e.g. Yocto, other distros, etc.)
>
> I guess 'kernel focused' is the key here. I read 'other possible use
> cases' as a request to build a general purpose reporting tool.
>
>>
>> Stated differently, the current *service* provided by kernelCI.org is
>> kernel-focused testing.  But, we could (and should, IMO) write the
>> *software* behind that service in a way that it could be used more
>> generically if desired.
>
> I've been trying to do that for last couple of years with no major
> success. It might be just me or the fact that it's really hard. Once
> you try to start reporting on android runtime or openstack things get
> really complicated.
>
> So if you consider running tests that exercise different parts of
> kernel (like graphics, scheduler...) as 'other use cases' than yes,
> KCI software should be able to do that. But I don't think going the
> route of 'general purpose reporting tool' is the right decision.

Agreed.  We should stay focused on *kernel* CI.

But, we don't want to (artificially) limit the types of
tools/distros/stacks we use to beat up on the kernel.

Kevin
