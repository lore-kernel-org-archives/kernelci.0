MIME-Version: 1.0
References: <f0fc5d80-acd6-416d-ef9a-811e6f353a59@collabora.com>
In-Reply-To: <f0fc5d80-acd6-416d-ef9a-811e6f353a59@collabora.com>
From: Jesse Barnes <jsbarnes@google.com>
Date: Fri, 30 Apr 2021 07:46:32 -0700
Message-ID: <CAJmaN==zp8fCcK1in6XXvwOc-rqbMvy72oQpH=ojH=EfcVHH5g@mail.gmail.com>
Subject: Re: Chrome OS and KernelCI
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: "kernelci@groups.io" <kernelci@groups.io>, kernelci-members@groups.io, automated-testing@lists.yoctoproject.org

On Thu, Apr 29, 2021 at 11:35 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> As you all know, KernelCI is dedicated to testing the upstream kernel.  This is
> what the results on linux.kernelci.org are all about.  Still, there are many
> products out there running Linux with many downstream changes, such as distros
> for desktop and enterprise applications, mobile devices etc...  Several of the
> KernelCI Linux Foundation members make Linux-based products, and testing
> upstream is valuable to them because every issue caught there is something they
> won't have to fix in their product.  In fact, it brings products closer to
> upstream kernels over time.
>
> One such member is Google, with Chrome OS products.  There are an increasing
> number of Chromebook devices in KernelCI (mostly in Collabora's lab) which can
> be used to test that upstream kernels and in particular stable ones are working
> well on this hardware.  They're currently running all the regular tests like
> other platforms: LTP, kselftest, igt, v4l2-compliance...  Now, as a member
> company, Google would like to extend coverage with additional tests that are
> only currently available within Chrome OS.  This is exploring a new avenue for
> KernelCI, and it's important to ensure all aspects and decisions are well
> discussed openly with the community.

[wow this turned into a big reply; short version is I think we have
some really valuable tests that people will want to see results from,
and I definitely think we shouldn't limit ourselves to traditional
distros]

Thanks Guillaume for starting this discussion; summarizing your points
as I understand them:
1) non-traditional userspace required
2) some higher level tests
3) may be harder to reproduce by some developers
4) higher level tests may be harder to isolate as kernel issues

I think 1 and 3 are related since they both create barriers to
developers running traditional distros to reproduce problems.
Similarly, if a problem only occurs on a Chromebook, developers may
have a hard time reproducing (I expect this to happen in the audio
stack sometimes for example).  Some alternatives we've talked about
include containerizing the tests instead of having a full rootfs; this
may allow external developers to simply pull an image and run it,
simplifying that aspect of testing.  That introduces its own issues
though in terms of device access and fidelity to the original test
intent, so would require some effort to get right (but might be a good
thing to invest in for the long term).

2 and 4 are also related, and are real challenges.  That said, I don't
think we should give up easily here!  One of my big motivations for
pushing our tests into KernelCI is to provide upstream developers with
test results they can't get today.  In particular, I want to push at
least a couple of categories of test:
- desktop style memory pressure tests
- tests that measure input latency in web apps while running mixed
workloads including video conferencing

In both cases, the results of our tests report user visible metrics
like tab switch times and input latency as seen by the user (e.g.
keypress to glyph on screen), in addition to several more common
metrics like CPU usage, framerate, etc.  I think several upstream
developers are interested in this type of feedback, and I think they
close a gap in upstream testing we've had for some time.  If one of
these tests regress, it will involve some work to figure out, and
there's definitely a statistical element to the results, but if we
keep the userspace and test images fixed while only changing the
kernel, I think we can be fairly confident that about kernel
responsibility if enough runs show a change (though clearly there are
exceptions here).

One obvious advantage of having these high level tests is that they
represent common workloads and measure user visible behavior, and big
regressions especially would be something the broader community would
want to avoid, if only for selfish reasons!  And over time, we could
add additional tests that correlate to higher level behaviors but that
are easier to reproduce and debug (though for mm and scheduling in
particular, I don't think there's a good substitute for comprehensive
high level tests).

I think if we can figure out an approach on the
userspace/reproducibility issues, we have an opportunity to make Linux
a lot better for the wide variety of userspace stacks out there; imo
we shouldn't limit ourselves to traditional distros, especially as
things have evolved so far from those early days (e.g. packages to
congtainers & VMs, moving away from X, development of new approaches
like io_uring with implications for app & distro architecture, etc).

And I think the high level tests are just a starting point; I'm hoping
KernelCI over time ingests a large body of tests, from low level to
high level, providing the broader community with a variety of metrics
to make releases even higher quality than they are today.

Thanks,
Jesse
