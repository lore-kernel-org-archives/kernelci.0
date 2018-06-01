Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] New pipeline to build images with the test suites
References: <20180528115539.GA14389@delenn>
Date: Thu, 31 May 2018 17:30:34 -0700
In-Reply-To: <20180528115539.GA14389@delenn> (Ana Guerrero Lopez's message of
	"Mon, 28 May 2018 13:55:40 +0200")
Message-ID: <7h8t7znyad.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Ana Guerrero Lopez <ana.guerrero@collabora.com>
Cc: kernelci@groups.io

"Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:

> Hi!
>
> In a previous email, I said:
>
>> On 05/16/2018 06:46 PM, Ana Guerrero Lopez wrote:
>>>
>>> I'm fine having a single image with these two test suites, if eventually
>>> this not convenient we can always change it. However, now we have more
>>> or less agreed on a job creating the "basic" images, how do you envisage
>>> we should be creating the images with the test suites?
>>>
>>> My proposal is installing the build and run dependencies via extra_packages
>>> in the Jenkinsfile and then building the test suite directly against the
>>> new created image with script run by debos directly. This will avoid
>>> the merge step, although the strip/crush might need a bit of work
>>> for making sure the resulting ramdisk is still small.
>>> The advantage is adding/modifying the test suites doesn't require a lot
>>> of knowledge of jenkins or even debos. 
>
> I have sent a pull request in this sense: 
> https://github.com/kernelci/kernelci-build-staging/pull/28/
>
> If you have any comments related to code, please comment directly in
> github, for other discussion, I think it's easier to use the list.

My only question is what does "squeeze" mean here?  With all the debian
context it's confusing as the first thing to come to mind is the debian
6.0 release.

I assume you're trying to capture that it's a rootfs for running tests,
but it's been minimized (squeezed) down?

> I tried building this new pipeline in staging but it seems to be some 
> problems with loading the kvm module in the docker slaves:
>
> [Build image for x86_64] + debos -t architecture:amd64 -t basename:20180528.0/x86_64 -t extra_packages:bash jenkins/debian/debos/stretch.yaml
> [Build image for x86_64] Could not access KVM kernel module: Permission denied
> [Build image for x86_64] failed to initialize KVM: Permission denied
> [Build image for x86_64] open /tmp/fakemachine-777615409/result: no such file or directory
>
> Maybe it's missing the nest parameter when loading the module?

No, the builders need to be updated to expose /dev/kvm to the
'buildslave' user.  I updated the ansible config to do this a couple
weeks ago, and I thought I ran it on all the builders, but builder10
didn't seem to get this change.  I've re-run it so now builder10 is
updated.

Anyways, after that, I re-ran your "Debian testsuites rootfs builder"
and worked well, so I merged your PR.

I still don't like the name "squeezetests" but I don't want that kind of
bikeshedding to stop this from getting merged, but IMO that needs a
different name.

Maybe tests_min? 

Kevin
