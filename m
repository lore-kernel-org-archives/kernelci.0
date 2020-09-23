MIME-Version: 1.0
References: <107c1572-ffc5-8797-6ae3-10fbe4e91eee@collabora.com>
In-Reply-To: <107c1572-ffc5-8797-6ae3-10fbe4e91eee@collabora.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Wed, 23 Sep 2020 14:08:47 -0700
Message-ID: <CAKwvOdkHiRAxCrrqRTq=k09zW-X9cHogyq+7fTuM_aJyntXs4Q@mail.gmail.com>
Subject: Re: kernelci.org update - 2020-09-23 #minutes
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>

On Wed, Sep 23, 2020 at 7:50 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Summary of changes going into production
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * fix branch names with slash characters "/"
> * enable stable-rc queue/* branches
> * enable stable 5.8 branches
> * enable soc arm/fixes branch
> * build linux-next with clang-10, drop clang-9
> * use Linaro test-definitions for kselftest
> * enable kselftest to run on a few initial devices
> * add direct links to regressions on web dashboard
> * improve log filtering to remove more LAVA messages
>
>
> Technical Steering Committee minutes - 2020-09-08
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> * LAVA test-definitions repository and version control
>
>   * No new tags upstream since =E2=80=9C2019.11=E2=80=9D, should we ask =
Linaro about restarting
>     that?
>   * Should we make a fork in kernelci GitHub with kernelci.org branch an=
d
>     kernelci tags?
>   * Show we accept to use the head of upstream master branch, even if th=
is
>     means hard-to-reproduce issues and unexpected change in results if n=
ew
>     commits are pushed at any time?
>
>   -> create fork for staging initially, and try to use upstream in produ=
ction
>
> * Finally fixed support for slashes in branch names, useful for stable-r=
c queue
>   branches in particular
>
> * LLVM/CLang: still waiting for v11 to be released
>
> * LAVA log filtering: tested on staging - seems to work fine
>
> * Login test case fix: implemented more thorough testing needed
>
> * preempt-rt: Linaro test-definitions repo getting updates from Daniel W=
agner
>
> * KCIDB
>
>   JSON stream parsing is implemented and tested in jq.py, upstreaming is=
 in
>   progress. Still takes four times as long and uses twice the memory as =
the
>   stock JSON parser, but does streams and should be good enough for now.
>   Starting implementing report stream parsing in KCIDB.
>
> * Notes: rework test email reports to show number of regressions in tabl=
e
>   -> https://github.com/kernelci/kernelci-backend/issues/257
>
>
> Technical Steering Committee minutes - 2020-09-15
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> * LLVM/Clang
>
>   LLVM people not super interested in older clang versions or even clang=
-10.

clang-10 is the minimally supported version of Clang for building
Linux kernels; we do very much care about it:
https://lore.kernel.org/lkml/20200902225911.209899-1-ndesaulniers@google.c=
om/T/#m61957eaada46dc8c51fdf2010859eb1976227005

>   Once clang-9 is out, when Mark updates to clang-11 he=E2=80=99ll send =
something also
>   dropping the older clang versions once clang-11 is live. Can reevaluat=
e this
>   policy once there are stable distros with clang.
>
>   Nick maintains a clang-latest docker image, we should into integrating=
 that
>   for potential inclusion in linux-next coverage - will need some evalua=
tion to
>   see for example how noisy it is and if we need to do something about
>   segregating results for the bleeding edge compiler.

Nathan maintains it more than I do:
https://github.com/ClangBuiltLinux/dockerimage

>
>   LLVM 11 release:
>   * Status tracked at https://bugs.llvm.org/show_bug.cgi?id=3D46725
>   * Several pending bugs need fixing, some look relevant

Fixed! (oh boy, we were on the "chase list")

>
>   Android LLVM versions: Mark to ping Todd and ask him about using those=
 for
>   Android branches.

android-mainline
android12-5.4
android-4.19-stable

are the 3 newest branches that I know of.

>
>   Testing with clang-12: could take a short cut and deploy on staging ra=
ther
>   than sorting out fancier reporting
>
> * KCIDB
>
>   Half of JSON stream parsing is merged into jq.py. Another half remains=
,
>   pending on the maintainer's attention.
>
>   KCIDB input stream parsing implemented locally, to be tested, and wait=
ing on
>   the jq.py PR above.
>
>   KCIDB output splitting next.
>
> * Web dashboard
>
>   Improving web UI to differentiate skips and tests that have always fai=
led
>   See on https://staging.kernelci.org
>   (pie charts and small things left to tweak)
>
> * Using Linaro test-definitions for LAVA jobs
>
>   Created test-definitions fork for kernelci.org and staging.kernelci.or=
g
>   kernelci.org branch updated weekly with prod update
>   staging.kernelci.org branch updated with open PRs like other projects
>
> * kselftests: build errors mixed with main kernel build
>
>   Long-term solution would be to have separate stages (kernel build, kse=
lftest
>   build, runtime) with dependencies and pass/fail status
>
>   Short-term solution and necessary step is to build kselftests as a sep=
arate
>   =E2=80=9Cmake=E2=80=9D command and keep the output in a separate log f=
ile (like tuxmake does)
>
> * login test case false-positives:
>
>   On LAVA 2020.08 kernel panic is detected, test case status marked as f=
ailed
>   LAVA job Incomplete
>
>
> Technical Steering Committee minutes - 2020-09-22
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> * KCIDB
>
>   The jq.py maintainer is slow to respond and keeps making requests, off=
icial
>   streaming support doesn't seem close anymore, so I made a release for
>   temporary use in my personal fork.
>
>   JSON streaming support is merged into KCIDB - integration work can be
>   started!  You can now write reports one after another into any tool ac=
cepting
>   reports.  Submitting 1000 reports containing 8000 objects through
>   kcidb-submit takes about 35 seconds now.
>
>   Kcidb-query, kcidb-db-query, and kcidb-db-dump now accept the
>   '-o/--objects-per-report' option specifying how many objects should be=
 put
>   into each output JSON report. When that option is used, they can outpu=
t
>   multiple reports.
>
>   All tools outputting JSON can be asked to not pretty-print it (with
>   '--indent=3D0'), outputting single-line, or to prepend each report wit=
h the RS
>   character (with '--seq'), complying with RFC 7464, either of which cou=
ld be
>   easier to process with command-line tools.
>
>   Next KCIDB release soon. Theme: JSON streaming support.
>
>   Cristian Marussi from ARM is setting up sending their CI results, and =
managed
>   to push a bunch to the playground setup - looks great!
>
> * Plumbers 2020 KernelCI blog post: ready to get published this week
>
> * KernelCI TSC plan: Starting to make plan for 2020-Q4
>
> * E-mail regression reports: fixing formatting when more than one regres=
sion
>
> * User experience:
>
>   KernelCI LF board starting to brainstorm around next-gen dashboard /
>   visualization / analytics to potentially fund a 3rd party to develop w=
eb
>   tooling
>
> * "unknown" failures on web UI
>
>   https://groups.io/g/kernelci/topic/user_interface_issues_with/76927781=
?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,76927781
>
>   -> Yes this looks very much like the web frontend issue described befo=
re,
>      being fixed right now (separating regressions, always-fail and skip=
s)
>      https://github.com/kernelci/kernelci-frontend/pull/125
>
> * EFI on QEMU
>
>   u-boot with EFI extensions on arm/arm64 to get coverage for the EFI bo=
ot
>   paths in the kernel - Might just do this via the FVP.
>
> * clang-11
>
>   Can merge the docker update, will need to rebuild when the final LLVM =
11
>   release lands (hopefully RSN, the tracking bug looks to have mostly no
>   dependencies).
>
>
> Advisory Board minutes - 2020-09-16
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * LPC recorded talks are now on YouTube, time to tweet about them
>
> * Discussing priorities for 2020-Q4 TSC plan:
>
>   Native tests: kselftest, LTP, KUnit, device tree validation
>   KCIDB with production data from kernelci.org
>   =E2=80=9CPolishing=E2=80=9D: Improving docs, fixing long-standing bugs=
, LF project PDFs=E2=80=A6
>   Metrics: discussed many times, now we should start implementing it
>   CIP KernelCI instance: already discussed, also needs some action now
>
> * Discussing next important topics, for 2021
>
>   Define some work packages / RFQs
>   Testing patches from mailing lists
>   Improve regressions tracking for native KernelCI tests
>
>
> Best wishes,
> Guillaume
>
>
>=20
>
>


--=20
Thanks,
~Nick Desaulniers
