Return-Path: <dan.rue@linaro.org>
Date: Thu, 11 Oct 2018 10:24:29 -0500
From: "Dan Rue" <dan.rue@linaro.org>
Subject: LKFT + KernelCI
Message-ID: <20181011152429.l2q6d43zzzqoc3df@xps.therub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi All,

This is probably overdue, but I wanted to write out and get feedback on
the plans that I've been working on with regard to linux kernel
functional testing (LKFT).

LKFT consists of the following components:
- jenkins
- openembedded
- lava
- squad

It uses the following boards:
- hikey
- x15
- juno-r2
- dragonboard 410c
- qemu
- x86

This model has been successful for us so far, and allowed us to meet the
requirements that we've had. I think the gaps that we have currently are
related to test coverage, reporting, and visualization.

However, instead of continuing to improve LKFT, what we'd prefer to do
is work hand in hand with kernelci. Then the question becomes, how do we
do that without throwing away everything that we already have (and that
we have to keep running)?

So I've been considering how we can start to move LKFT towards kernelci,
so that at some point in the future it is indistinguishable from
and a part of kernelci.

Milosz is looking at the front end and database pieces - see his earlier
email on that topic with subject "KernelCI NG master plan".

My interest is to start by changing the way LKFT does builds to be more
compatible with kernelci. We would like to stick with openembedded for a
variety of reasons, and I think that it would be good if kernelci
supported multiple user spaces.

Right now our OE build uses a series of recipes and builds a complete
kernel and user space for every build, every time. This is problematic
for a couple reasons:
- Kernel config consists of defconfig plus some extra configs, all
  coming from OE recipes. This makes the kernel builds hard to reproduce
  outside of OE.
- OE rebuilds userspace every time. My understanding is this is best
  practice from an OE perspective, but I don't think it's desirable from
  a kernelci or testing perspective.

If, however, we had a kernel config fragment upstream, then we could use
a well-defined kernel config that is easily reproducible by anyone. This
is something that Anders Roxell and Mark Brown are working on.

The second part is to be able to actually consume a kernelci built
kernel, rather than re-building the kernel every time. I think it would
be best to be able to take an existing OE userspace and combine it with
an existing kernelci built kernel. Some people are already doing this or
similar, but it would be best if this was supported in OE upstream.

So our short term plans are something like:
- Get a config fragment upstreamed and backported, that can be used for
  testing
- Get kernelci building said fragment
- Determine how to produce OE images from an existing kernel and
  existing OE build in an OE-supportable way.

Once we have that, we think we can start submitting test results into
kernelci - making the data more widely available to the community. After
that, it gets exciting because we would be working on top of the same
reporting and analytics stack. This may also bring opportunities here,
for example, to support boot testing on fastboot devices.

Please let me know what you think -

Dan
