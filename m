MIME-Version: 1.0
From: ndesaulniers@google.com
Date: Wed, 19 Jun 2019 11:04:34 -0700
Message-ID: <CAKwvOd=VBORyjtbqijM8FGAQUV6r6qy3ADQRGrxnKHY_ke=iPw@mail.gmail.com>
Subject: kernel tree support matrix for Clang
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Matt Hart <matthew.hart@linaro.org>
Cc: Dan Rue <dan.rue@linaro.org>, Anmar Oueja <anmar.oueja@linaro.org>, kernelci@groups.io, clang-built-linux <clang-built-linux@googlegroups.com>, Todd Kjos <tkjos@google.com>, Sandeep Patil <sspatil@google.com>, Alistair Delva <adelva@google.com>, Stephen Hines <srhines@google.com>

Following up with Matt from this past week's meeting.

For building kernels with Clang, I'm running a bare bones CI I setup
on TravisCI; I would like to transition all of this to kernelCI.
Because we're using TravisCI's free tier, the build boxes are dual
core and builds timeout after 50 minutes.  This causes us to rely
heavily on ccache (last night's builds all were cold because of the
nightly compiler uprev; build 792 has some hot cache timings), and
limits our coverage to basically defconfigs.

In terms of what trees/branches/ISAs are important, let's look at last
night's build as an example:
https://travis-ci.com/ClangBuiltLinux/continuous-integration/builds/116089229

Currently 40 targets.  They're not partitioned in the UI, but here's
how I view them:
794.1-794.7 are builds of mainline (torvalds/linux) various archs and
LLD enabled if supported
794.8-794.14 are builds of the master branch of linux-next tree.
794.15-794.18 are builds of the 4.19.y branch of the stable tree.
794.19-794.22 are builds of the 4.14.y branch of the stable tree.
794.23-794.25 are builds of the 4.9.y branch of the stable tree.
794.26-794.27 are builds of the 4.4.y branch of the stable tree.
794.28-794.33 are builds of various branches of the android-common tree.
794.34-794.40 are builds of mainline with the latest released version
of clang, clang-8. All of the above use ToT clang from the Clang
Debian package maintainer in a docker image we build nightly.

linux-next coverage is important to us for observing regressions ASAP
and hopefully before they hit mainline.
mainline coverage is important to us so that clang "just works" for
anyone who clones linux and tries clang.
stable coverage is important to us because Android and CrOS base their
device kernels off of stable.
android-common trees are downstream of the stable trees, and are
important that we don't regress them.
clang-8 tests are important to us so that users who don't build their
own compiler can use a released version of clang and it "just works".

Today KernelCI is covering builds of linux-next with Clang, which is a
great first step.  I think the above list of trees & branches listed
above for the reasons above are good next steps for KernelCI coverage.

What do you all think?
-- 
Thanks,
~Nick Desaulniers
