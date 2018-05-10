Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] proposal to build Debian images for every test suite (pull #24/kernelci-build-staging)
References: <99070f63-f2df-ae30-7885-a6e4ceb8c21a@collabora.com>
	<7h4ljjhxle.fsf@baylibre.com>
	<7087cdfb-5577-eec1-7d3d-9408db4d240f@collabora.com>
	<7h603wxqvn.fsf@baylibre.com>
	<4d04dcdb-dd9b-3c59-5391-378e4e4f28b9@collabora.com>
Date: Thu, 10 May 2018 08:41:53 -0700
Message-ID: <7hlgcr34ce.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: kernelci@groups.io

Tomeu Vizoso <tomeu.vizoso@collabora.com> writes:

> On 05/10/2018 03:04 AM, Kevin Hilman wrote:
>> "Tomeu Vizoso" <tomeu.vizoso@collabora.com> writes:
>>
>>> Hi,
>>>
>>> below I give my opinion on a few comments, but it's Ana who is leading
>>> now this work.
>>>
>>> On 05/08/2018 01:09 AM, Kevin Hilman wrote:
>>>> "Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:
>>>
>>>> IMO, what I think would be very helpful at least for initial review and
>>>> discussion, is to see an initial PR that only has the "basic" build, and
>>>> ideally also generates a minimal, tiny ramdisk from the same build
>>>> (e.g. with 'update-initramfs -c -k min' )
>>>>
>>>>> The pull requests includes three things: three jenkinsfiles, debos files
>>>>> and two Dockerfiles.
>>>>>
>>>>> The jenkinsfiles are the smallest possible since all the code creating
>>>>> the pipeline is in the shared library. There are two parts: one with the
>>>>> job name - that will be used by the resulting images, the
>>>>> destination
>>> arches
>>>>> and the run-time dependencies that need to be added to the image.
>>>>> There is also the debos file name but this should be removed if we always
>>>>> use the same debos configuration.
>>>>> The second part "build_test_suite" is for building the test suite code.
>>>>> This is on purpose a shell script that must create a cpio.gz tarball
>>>>> with the name rootfs-built-${NAME}-${ARCH}.cpio.gz
>>>>> The idea is to be able to add and modify quickly test suites without
>>>>> knowing too much about jenkins.
>>>>
>>>> I'm not sure about the "build_test_suite" approach.
>>>>
>>>> AFAICT, both the _igt and _v4l2 jobs are basically doing the same thing
>>>> as "basic", and then essentially installing a bunch more files on top.
>>>
>>> The difference is only in the dependencies. Both test suites are in
>>> the fat side and have several dependencies that otherwise aren't
>>> needed. That said, a basic image that contains all of them might still
>>> not be too big.
>>
>> IMO, it's better to go for a single, shared base image with
>> dependencies.  Building a new rootfs for every test suite sounds like a
>> scalability problem to me.
>
> Well, only the fatter test suites would need their own rootfs. So far
> only IGT and V4L2 have a fair amount of dependencies. But still we
> could probably build a single image for both that isn't too big to be
> used as a ramdisk.

OK, I think we should start with that.

>>>> Instead of all the rootfs duplication, couldn't the exact same thing be
>>>> accomplished by just having one "basic" rootfs image, and then passing
>>>> overlay tarballs to LAVA for IGT and V4L2?
>>>
>>> TTBOMK, with the move to LAVA v2 we lost the ability to apply random
>>> overlays to the initramfs, other than modules and the LAVA test
>>> helpers.
>>>
>>>> IOW, I'm not sure I'm fully understanding the need for completely
>>>> separate rootfs for IGT and V4L2.
>>>
>>> It's just that priority was given to come up with the smallest
>>> possible images for each test suite. I'm concerned that some
>>> subsystems may have gone with for example python for their test suite
>>> and that could make it more difficult to have a single base image.
>>
>> I'm not sure to understand the priority of the smallest possible rootfs
>> image for each test suite.  Why not the smallest possible initrd that
>> can pivot to a "real", and possibly large, rootfs on MMC/NFS whatever
>> than has the dependencies for some set of tests?
>
> The main problem with NFS is that we should be testing that subsystems
> keep working properly across suspend/resume cycles, and often the
> network device will go away when the machine resumes. When the network
> device comes back and userspace tries to setup the network device, it
> finds out that the files it needs to do so aren't available. A second
> problem is that at some point we'll want to use the network for
> functional and performance testing.
>
> The problems with secondary storage are:
>
> - it would greatly increase the test duration,
> - we cannot use it when running destructive tests such as those in fio,
> - it would greatly increase lab admin costs specially for devices
> without internal storage in which SD cards or USB devices have to be
> used instead of MMC, and
> - because of the above, we would be getting false positives when media
> starts failing.
>
> Memory is basically the only medium that is:
>
> - fast to deploy,
> - always there,
> - reliable,
> - tests will never interfere with.
>
> The biggest downside is that it's a more scarce resource, thus the
> priority given to reducing the sizes of the ramdisks.

Well summarized, and I agree.

One other downside is that production systems don't (generally) have
their primary rootfs in memory, but usually on secondary storage, so
you don't end up testing how production systems actually work. 

But I agree, for scalability, secondary storage is a major PITA.
However, maybe for a subset of devices that we want to test that way, we
should make it easy.

So, what about this: From a single base debian image, we create

1) minimal (~2M) initramfs

This should have pivot capabilities, and this is what Ana is doing today
with 'update-initramfs -c -k min'

2) small "basic" ramdisk

This is the base image *after* the strip/crush steps.  Basically, the
"basic" that Ana is building today.

3) full rootfs for secondary storage (e.g. MMC, NFS, NBD)

The base image without all the strip/crush removed, so it still has the
ability to install packages etc.

This should be available in a few formats: .cpio.gz, .tar.xz, .ext4.xz

This would also be the pivot destination when using an initramfs.

>> Then, using LAVA test shell, you write the test jobs in a way that
>> LAVA will fetch/install the test-specific bits that are in the test
>> definiton.  LAVA test shell can fetch stuff from git, download arbitrary
>> tarballs, etc. and either overlay them on the rootfs (default), or make
>> them available for the target to fetch (e.g. wget) in the case where the
>> rootfs has security attributes.
>
> For scalability reasons I think we should move as much work as
> possible to happen outside the DUTs. We're going to have a very
> limited time budget to test as much as possible in the DUTs and if we
> do anything else we're going to hit limits very fast and I'm afraid
> the coverage will be greatly reduced.

In general, I agree.  For speed/scalability, this defniitely slows
things down.  However, I want to make sure it remains in the realm of
usecases for our rootfs images.

For example, there are cases where you want to test a production (or
product-like) rootfs that may not have all the test dependencies on it.
The additional catch is the rootfs may have secure attributes, so you
can't just let LAVA do overlays on it.  In these cases, the DUT has to
do fetch the test overlay and unpack it *after* mounting the rootfs.

Again, this may not be the normal case that scales up well, but we
should allow it.  It also makes it easy to write tests that actually
install their own dependencies before running.

Kevin
