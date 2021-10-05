Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 5 Oct 2021 09:57:11 -0700
From: "Bjorn Andersson" <bjorn.andersson@linaro.org>
Subject: Re: Using kernelci.org for testing Linux NFSD
Message-ID: <YVyD59X4yXPh2KzX@ripper>
References: <13C9FF88-C1F6-4127-AAA1-E38A1D59AB96@oracle.com>
MIME-Version: 1.0
In-Reply-To: <13C9FF88-C1F6-4127-AAA1-E38A1D59AB96@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, chuck.lever@oracle.com
Cc: "info@kernelci.org" <info@kernelci.org>, Bruce Fields <bfields@redhat.com>

On Fri 01 Oct 12:01 PDT 2021, Chuck Lever III wrote:

> Hi-
> 

Hi Chuck,

> As co-maintainers of NFSD, we're interested in bringing up a
> CI platform for automating a lot of the tests we do before
> requesting a pull into the Linux kernel. The kernelci.org
> platform caught my eye last week during the talk at LPC.
> 
> We have some questions about what can be supported on
> kernelci.org. For example, the tests we need to run involve
> at least two hosts (an NFS client and an NFS server). How
> easy is it to set up that kind of test?
> 
> If we want to test features that involve Kerberos, is there
> a KDC available, or would we need to provide a KDC image
> that can be used for our tests?
> 
> Thanks for any guidance!
> 

In my view, kernelci.org provides two things:

1) A platform that provide build artifacts (i.e kernel images) of
various trees and collects test results from labs booting these builds,
running tests and reporting back results.

2) A set of labs, with pretty much standardized way of running these
tests on artifacts coming from the builder and reporting the results
back.


Given that your testing setup and test cases do differ quite a bit from
what's today seem to happen in the existing labs ("boot a kernel on one
board, run common tests, gather results") my suggestion is that you
automate the process done by these labs on your end and use the common
infrastructure.

I.e. build something that takes a kernel image, boots this on your
machines and runs your test and generate test results in a structured
form.

Then you can plug this in with kernelci (#1 above) using the available
REST API, to get the kernel images and to report the results.


This is what I do for the Qualcomm boards in my lab, where I'm not able
to run the standard lab setup (not sure if that even was a thing when I
started) and it allows me to run more board specific tests - with all
the results reported back to a single place.

Regards,
Bjorn
