MIME-Version: 1.0
References: <CAHRSSEwYiK2+hsCoKrBtUwHRHKLk2xzVq2-3aQG94g7QZWQDvA@mail.gmail.com>
 <CAKwvOd=_DqRf0Ex3Huo7n4sBvZqxMwtw7yCzR_oKYDO-Wzh0DQ@mail.gmail.com> <CAHRSSEwQDtqh13+jdxSRr019bmBcCaesV2w2HSNHGmyh9AkWUw@mail.gmail.com>
In-Reply-To: <CAHRSSEwQDtqh13+jdxSRr019bmBcCaesV2w2HSNHGmyh9AkWUw@mail.gmail.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Wed, 2 Feb 2022 12:13:11 -0800
Message-ID: <CAKwvOdkL+1oZNuzbz7_ni0XsmX65NyzEMvKfp=6V3DQN1Prv6A@mail.gmail.com>
Subject: Re: errors due to clang-14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Todd Kjos <tkjos@google.com>
Cc: kernelci@groups.io, Steve Muckle <smuckle@google.com>

On Wed, Feb 2, 2022 at 8:45 AM Todd Kjos <tkjos@google.com> wrote:
>
>
>
> On Tue, Feb 1, 2022 at 7:47 PM Nick Desaulniers <ndesaulniers@google.com>=
 wrote:
>>
>> On Tue, Feb 1, 2022 at 5:15 PM Todd Kjos via groups.io
>> <tkjos=3Dgoogle.com@groups.io> wrote:
>> >
>> > We're seeing quite a few errors that appear to be related to clang-14 =
build tools building android kernels (esp arm32 builds). Example: android13=
-5.15 kernel.
>> >
>> > I talked to our clang-built-kernel folks and they don't have any bandw=
idth to help with this right now, so would it be possible to switch those b=
uilds to whatever is used for builds of stable (currently gcc-10)? We do ou=
r product builds with clang, but the larger benefit for us in kernelci is t=
o be able to compare our android kernel builds with the stable kernel build=
s to quickly find issues introduced via android-specific code or backports.
>>
>> I'd rather builds of at91_dt_defconfig be turned off for the Android
>> tree. Android doesn't support ARMv4, and there's warning spew from
>> https://github.com/ClangBuiltLinux/linux/issues/964.  Regarding
>> bandwidth, that issue is no higher priority than any of the other open
>> issues in that issue tracker.
>>
>> That doesn't mean we should move CI of Android trees off clang in genera=
l.
>
>
> How about we move the arm32 builds off of clang-14 until they are fixed.

It is a linker bug; clang compiles these just fine.  KernelCI can
fallback to ld.bfd for ARMv4 configs if the linker warnings are too
annoying.

$ ARCH=3Darm make LLVM=3D1 LD=3Darm-linux-gnueabihf-ld

> It makes it harder to manage the branch when there are so many failures t=
hat force us to always click in to see what is wrong

KernelCI has an email report that's faster to read than to click
through to the warnings.  I do think there's more UI work that can be
done to expedite triage though. Filed
https://github.com/kernelci/kernelci-frontend/issues/145.

>  -- we need the builds to be all green (or at least non-red), so let's di=
sable arm32 clang-14 builds until they are fixed -- then we can turn them b=
ack on.

That's throwing the baby out with the bath water. ARMv4 is arm32, but
arm32 is ARMv4, ARMv5, ARMv6, and ARMv7 (I think technically ARMv8 and
ARMv9, too, though I don't know if those added anything to Aarch32).
Android requires ARMv7 and newer to run.  Why would we want to give up
compiler coverage of actual ARM versions Android uses due to linker
warnings in ARM versions Android can't even run on?

>
> If you are willing to treat these as urgent issues and fix them quickly, =
I'm fine with leaving clang-14 on, but I didn't get the impression you cons=
idered this to be important when we swapped mail on this.

With my Android hat on, Android cares as much about ARMv4 as it does
PPC and S390.  ARMv4 predates Android itself by ~15 years.  The builds
of those configs are pure noise, zero signal.  Maybe even a waste of
resources.  ARMv7 (and newer) is pretty much the only thing that will
still run Android today.  Android doesn't run on PPC or s390; we don't
have KernelCI test those architectures for the ACK tree.  Why should
KernelCI even test ARMv4 for the ACK tree?

Without my android hat on, we'd like to be able to link ARMv4 in a way
that will actually work at runtime, but it's not a higher priority
than any of the other tens of bugs that we currently have on our
plate.  That doesn't mean we should give up CI coverage of working and
important configs because you disagree with the priority I've
assigned.

>
>>
>>
>> >
>> > So the request is: please use the same build tools for android kernels=
 as are used for the corresponding stable kernels.
>> >
>> > -Todd
>> >
>> >=20
>>
>>
>>
>> --
>> Thanks,
>> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
