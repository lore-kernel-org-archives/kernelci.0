MIME-Version: 1.0
From: "Brendan Higgins" <brendanhiggins@google.com>
Date: Mon, 4 Nov 2019 16:39:54 -0800
Message-ID: <CAFd5g44tCPhoe5UkEkbTAX+z5x9Dyt29+ZGAZBHp1XV5JxLWGQ@mail.gmail.com>
Subject: Investigating where to put KUnit in the KernelCI build pipeline
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, KUnit Development <kunit-dev@googlegroups.com>, Kevin Hilman <khilman@baylibre.com>

# Recapping discussion at OSS Europe:

At OSS Europe Kevin and I talked about how to integrate KUnit into KernelCI.

It sounded like there where two distinct cases to consider:

1) Including KUnit as a stage in the normal KernelCI build and test process.

2) Figuring out presubmit for KUnit/KernelCI.

As the latter case requires a lot more work/thought/discussion, I will
focus on just the first in this email.

For integrating KUnit into the KernelCI build and test process, Kevin
suggested that we should treat KUnit like a "static analysis step"
that would run within the build pipeline before the install/test
phase.

I know that "static analysis step/pipeline" doesn't exist yet, but
Kevin suggested that KUnit could be the first prototype "static
analysis" thing and could establish the pattern that subsequent static
analysis tools would implement.

# My initial idea on how to add KUnit to KernelCI

Based on my initial investigation, it seems that this KUnit step would
probably fit somewhere in-between the "build-trigger[1]" and
"build[2]" nodes. Does this make sense? (Forgive me, I am new to
Jenkins pipelines, and the KernelCI infrastructure in general.)

It seems like it might make sense to add a new pipeline file for
"static analysis" type things, does this seem reasonable?

Thanks!

[1] https://github.com/kernelci/kernelci-core/blob/master/jenkins/build-trigger.jpl
[2] https://github.com/kernelci/kernelci-core/blob/master/jenkins/build.jpl
