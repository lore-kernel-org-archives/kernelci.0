Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Contribute to KernelCI in Kubernetes or Cloud
In-Reply-To: <CAJMT-dGBCdkJnDNRYRRk9aVk=FmJkjGmpXCqsXc73v8hY+yi9w@mail.gmail.com>
References: <CAJMT-dGBCdkJnDNRYRRk9aVk=FmJkjGmpXCqsXc73v8hY+yi9w@mail.gmail.com>
Date: Mon, 06 Jul 2020 11:10:16 -0700
Message-ID: <7hwo3g4irb.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, adityasrivastava301199@gmail.com, kernelci@groups.io

Hello,

Aditya Srivastava <adityasrivastava301199@gmail.com> writes:

> Heard the talk on OSS by Kevin Hilman and khouloud touil , I would like to
> help to get KernelCI on K8S or any other help if needed for the same.

Thanks for contacting us.  What's your experience with k8s? and how do
you want to help?

As you may have learned in my talk, we do *lots* of kernel builds.

We have Docker images for each arch/toolchain combination[1], and these
are the containers we use in the k8s jobs.

Our pipeline is managed by Jenkins, and you can read a bit about the
Jenkins jobs in the README of the main kernelci-core repo[2].

Where k8s comes in is at the `jenkins/build.jpl` step.  When we get to
this phase, we're ready to do a build for a specific combination of:

- git tree
- git branch
- kernel defconfig
- arch
- compiler

The build step then generates a k8s job (from a jinja2 template) based
on these parameters, and sends it off to a pre-configure k8s cluster
using kubectl.

Here is the github PR[3] that has the jinja2 template and a python
script (gen.py) to generate the k8s job yaml.  There's also another
script (wait.py) which uses the k8s python API to wait for the job to
complete and then fetch the build logs.

I've been the one working on the k8s tooling, but I'm pretty new to it,
so I'm assuming that I made some newbie mistakes and that there are
probably better ways of doing things.

For now, this is already working pretty well and has allowed us to scale
up our build capacity (thanks to compute donations from gcloud and
azure), but any help in this area by experienced engineers would be very
helpful.

I'm particularily interested in your thoughts on improvements on how to
submit/wait for k8s jobs and then fetch the logs.  It's working OK now,
but occaisionaly get problems wher kubectl (or wait.py) gets random
failures, or "connection refused" errors from the k8s cluster.  I cannot
reliably reproduce these reliably but they happen every few thousand
builds.

Anyways, that's a bit of background.  If you have some time to help out,
please have a look at the current expirments and feel free to ask
questions.

It also might be worth your time to join our weekly call.  We meet at
16h UTC every Tuesday via a jitsi video call[4].

Thanks again for you interest and offer to help,

Kevin

[1] https://github.com/kernelci/kernelci-core/tree/master/jenkins/dockerfiles
[2] https://github.com/kernelci/kernelci-core
[3] https://github.com/kernelci/kernelci-core/pull/366/commits/b63da26abc216ad8bc8123d63010a485db2ae3a8
[4] https://meet.kernel.social/kernelci-dev
