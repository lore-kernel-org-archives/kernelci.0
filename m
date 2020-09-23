Subject: Re: kernelci.org update - 2020-09-23 #minutes
References: <107c1572-ffc5-8797-6ae3-10fbe4e91eee@collabora.com>
 <CAKwvOdkHiRAxCrrqRTq=k09zW-X9cHogyq+7fTuM_aJyntXs4Q@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <200d3c91-9906-01d6-2642-718fbd356d76@collabora.com>
Date: Wed, 23 Sep 2020 22:26:36 +0100
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkHiRAxCrrqRTq=k09zW-X9cHogyq+7fTuM_aJyntXs4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>

On 23/09/2020 22:08, Nick Desaulniers wrote:
> On Wed, Sep 23, 2020 at 7:50 AM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
>>
>> Summary of changes going into production
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> * fix branch names with slash characters "/"
>> * enable stable-rc queue/* branches
>> * enable stable 5.8 branches
>> * enable soc arm/fixes branch
>> * build linux-next with clang-10, drop clang-9

^ more on this below :)

>> * use Linaro test-definitions for kselftest
>> * enable kselftest to run on a few initial devices
>> * add direct links to regressions on web dashboard
>> * improve log filtering to remove more LAVA messages
>>
>>
>> Technical Steering Committee minutes - 2020-09-08
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>
>> * LAVA test-definitions repository and version control
>>
>>   * No new tags upstream since =E2=80=9C2019.11=E2=80=9D, should we ask=
 Linaro about restarting
>>     that?
>>   * Should we make a fork in kernelci GitHub with kernelci.org branch a=
nd
>>     kernelci tags?
>>   * Show we accept to use the head of upstream master branch, even if t=
his
>>     means hard-to-reproduce issues and unexpected change in results if =
new
>>     commits are pushed at any time?
>>
>>   -> create fork for staging initially, and try to use upstream in prod=
uction
>>
>> * Finally fixed support for slashes in branch names, useful for stable-=
rc queue
>>   branches in particular
>>
>> * LLVM/CLang: still waiting for v11 to be released
>>
>> * LAVA log filtering: tested on staging - seems to work fine
>>
>> * Login test case fix: implemented more thorough testing needed
>>
>> * preempt-rt: Linaro test-definitions repo getting updates from Daniel =
Wagner
>>
>> * KCIDB
>>
>>   JSON stream parsing is implemented and tested in jq.py, upstreaming i=
s in
>>   progress. Still takes four times as long and uses twice the memory as=
 the
>>   stock JSON parser, but does streams and should be good enough for now=
.
>>   Starting implementing report stream parsing in KCIDB.
>>
>> * Notes: rework test email reports to show number of regressions in tab=
le
>>   -> https://github.com/kernelci/kernelci-backend/issues/257
>>
>>
>> Technical Steering Committee minutes - 2020-09-15
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>
>> * LLVM/Clang
>>
>>   LLVM people not super interested in older clang versions or even clan=
g-10.
>=20
> clang-10 is the minimally supported version of Clang for building
> Linux kernels; we do very much care about it:
> https://lore.kernel.org/lkml/20200902225911.209899-1-ndesaulniers@google=
.com/T/#m61957eaada46dc8c51fdf2010859eb1976227005

Quite, we're now building linux-next with Clang 10 on
kernelci.org (production) and unreleased versions on
staging.kernelci.org.

>>   Once clang-9 is out, when Mark updates to clang-11 he=E2=80=99ll send=
 something also
>>   dropping the older clang versions once clang-11 is live. Can reevalua=
te this
>>   policy once there are stable distros with clang.
>>
>>   Nick maintains a clang-latest docker image, we should into integratin=
g that
>>   for potential inclusion in linux-next coverage - will need some evalu=
ation to
>>   see for example how noisy it is and if we need to do something about
>>   segregating results for the bleeding edge compiler.
>=20
> Nathan maintains it more than I do:
> https://github.com/ClangBuiltLinux/dockerimage

Great, I think Mark wanted to take a look into it.

At the moment we're building with snapshots of the next Clang
version on staging.kernelci.org (clang-11, soon clang-12).  It
would be nice to be able to use this container and test the very
latest instead.

>>   LLVM 11 release:
>>   * Status tracked at https://bugs.llvm.org/show_bug.cgi?id=3D46725
>>   * Several pending bugs need fixing, some look relevant
>=20
> Fixed! (oh boy, we were on the "chase list")

Nice!  Erm, I believe there's one last blocker:

  https://bugs.llvm.org/show_bug.cgi?id=3D47619

>>   Android LLVM versions: Mark to ping Todd and ask him about using thos=
e for
>>   Android branches.
>=20
> android-mainline
> android12-5.4
> android-4.19-stable
>=20
> are the 3 newest branches that I know of.

And which LLVM/Clang versions should be used to build those?


Thanks,
Guillaume
