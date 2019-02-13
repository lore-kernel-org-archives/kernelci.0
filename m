Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: KernelCI modular pipeline design document
In-Reply-To: <CAH1_8nDnirNN8K=Du-tLgVo-GFnBSKoytnsRaKePwj8NGQ-sGQ@mail.gmail.com>
References: <c7f519e5-1945-bbf6-69b3-6ded932ceb50@collabora.com> <trinity-797bf1b5-df32-4a98-acc4-60a007157e7d-1549642801182@3c-app-gmx-bs20> <CAJrz+7L=iiJuhdYFU6YTytEGTpd_13E+BKYEqf1JEGq=7bmSSw@mail.gmail.com> <7h1s4egozv.fsf@baylibre.com> <CAJrz+7Kpsq6u7CVQsfa57XiWTqEw4tAUcDXfsRUJmms9zZF-Jg@mail.gmail.com> <7h4l99g650.fsf@baylibre.com> <CAH1_8nDnirNN8K=Du-tLgVo-GFnBSKoytnsRaKePwj8NGQ-sGQ@mail.gmail.com>
Date: Tue, 12 Feb 2019 16:44:01 -0800
Message-ID: <7hpnrwbjqm.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: Milosz Wasilewski <milosz.wasilewski@linaro.org>, kernelci@groups.io, JanSimon.Moeller@gmx.de

Guillaume Tucker <guillaume.tucker@gmail.com> writes:

> On Tue, Feb 12, 2019 at 1:14 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Milosz Wasilewski <milosz.wasilewski@linaro.org> writes:
>>
>> > On Mon, 11 Feb 2019 at 18:27, Kevin Hilman <khilman@baylibre.com> wrot=
e:
>> >>
>> >> "Milosz Wasilewski" <milosz.wasilewski@linaro.org> writes:
>> >>
>> >> > On Fri, 8 Feb 2019 at 16:33, "Jan-Simon M=C3=B6ller" <
>> JanSimon.Moeller@gmx.de> wrote:
>> >> >>
>> >> >> Please do not just think of 'building the kernel' - ppl also want =
to
>> test and record/visualize userspace tests (aka custom-built
>> kernel+filesystem).
>> >> >> Yes, the linux kernel is the main focus for kernelci.org . But
>> let's keep the other possible use-cases in mind.
>> >> >>
>> >> >
>> >> > I don't think this is a good idea. Having other use cases in mind
>> >> > takes you down a very deep rabbit hole. Creating a general purpose
>> >> > result reporting tool is hard. Kernelci reports on kernel results a=
nd
>> >> > (as I understand) does it right. You can use these tools for other
>> >> > purposes but that's a different story.
>> >>
>> >> Yes, we're focused on kernel-focused testing, but there are multiple
>> >> ways to test the kernel, most of which require a combination of kerne=
l +
>> >> userspace/distro.
>> >>
>> >> I think Jan-Simon's point is that as we evolve, while we might focus =
on
>> >> buildroot/debian, we chould not design things in a way that prohibit
>> >> using the kernelCI code (and infra) for other types of kernel-focused
>> >> testing (e.g. Yocto, other distros, etc.)
>> >
>> > I guess 'kernel focused' is the key here. I read 'other possible use
>> > cases' as a request to build a general purpose reporting tool.
>> >
>> >>
>> >> Stated differently, the current *service* provided by kernelCI.org is
>> >> kernel-focused testing.  But, we could (and should, IMO) write the
>> >> *software* behind that service in a way that it could be used more
>> >> generically if desired.
>> >
>> > I've been trying to do that for last couple of years with no major
>> > success. It might be just me or the fact that it's really hard. Once
>> > you try to start reporting on android runtime or openstack things get
>> > really complicated.
>> >
>> > So if you consider running tests that exercise different parts of
>> > kernel (like graphics, scheduler...) as 'other use cases' than yes,
>> > KCI software should be able to do that. But I don't think going the
>> > route of 'general purpose reporting tool' is the right decision.
>>
>> Agreed.  We should stay focused on *kernel* CI.
>>
>> But, we don't want to (artificially) limit the types of
>> tools/distros/stacks we use to beat up on the kernel.
>>
>
> So I think the key point is that root file systems may be coming
> from a dynamically generated URL on a per-job basis, and with the
> option to not include a ramdisk or a kernel image.  That would
> make it possible to replace the regular KernelCI build jobs with
> alternative ones that produce a full OS image or a Debian package
> or anything more than a plain kernel image, and then feed that
> into the reference implementation with LAVA etc...
>
> In fact, I think it would just mean adding some template blocks
> around the deploy definitions in the base template.  Then anyone
> could crate a "downstream" test plan with alternative URLs using
> variables such as the kernel revision to point to a rootfs.
>
> As far as the design document is concerned, it seems that we just
> need to state that we don't want to make it hard to achieve that.

We probably also need to flesh out a bit more of the metadata fields=20
that would help describe a initramfs+rootfs environment so that our
visualization and email reporting can show the basics of what was used.

Kevin
