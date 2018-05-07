Return-Path: <khilman@baylibre.com>
From: khilman@baylibre.com
Subject: Re: [kernelci] proposal to build Debian images for every test suite (pull #24/kernelci-build-staging)
References: <99070f63-f2df-ae30-7885-a6e4ceb8c21a@collabora.com>
Date: Mon, 07 May 2018 16:09:33 -0700
In-Reply-To: <99070f63-f2df-ae30-7885-a6e4ceb8c21a@collabora.com> (Ana
	Guerrero Lopez's message of "Mon, 7 May 2018 13:06:05 +0200")
Message-ID: <7h4ljjhxle.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Ana Guerrero Lopez <ana.guerrero@collabora.com>
Cc: kernelci@groups.io

"Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:

> Hi everybody,
>
> I'll add the information from this email in the README.md of the pull
> request but it's difficult to discuss over GitHub, so I thought a mail
> could make things easier.
>
> At https://github.com/kernelci/kernelci-build-staging/pull/24I have
> sent a proposal to build easily Debian images for every test suite
> in arm64, armhf, x86 and x86_64.
>
> The code has two parts, on one side, jenkins shared libraries that
> are not included in the pull request:
> https://github.com/ana/kernelci-jenkins-libs

The code in the actual PR is intimately linked with the shared libs, so
IMO, there needs to be agreement on the shared libs before we can merge
this PR.

Also, at first glance, the shared libs need some review.  The first
thing that looks strange is the arch mappings:

    def debian_arch =3D  ["arm64": "armhf",
                        "armel": "arm64",
                        "x86": "i386",
                        "x86_64": "amd64"]

It looks to me like the arm64 and armhf are swapped.  The same looks
true for 'toolchain_arch'.

For example, the Jenkins log shows that the 'armel' build is passing
architecture:arm64 to debos:

   [Build image for armel] + debos -t architecture:arm64 -t basename:201805=
07.2/armel -t extra_packages:initramfs-tools jenkins/debian/debos/stretch.y=
aml

(I'm not super familiar with Jenkins pipelines, so I took a bit of time
to setup a local Jenkins pipeline so I could test this and have a better
idea what's actually happening.)

> And on the other side, what's in the pull request: three small Jenkinsfil=
es
> with the parameters for every job and the files to create the debian
> image with debos.
>
> While the shared libraries could be in the same repository that the
> Jenkinsfile, I have created a separate repository for several reasons:
>
> =C2=A0=C2=A0=C2=A0 * shared libraries must follow this directory structure
> https://jenkins.io/doc/book/pipeline/shared-libraries/#directory-structure
>
> =C2=A0=C2=A0=C2=A0 * if there are more shared libraries used in kernelci,=
 it's good to
> =C2=A0=C2=A0=C2=A0 have all of them in a separate repository, so they can=
 be used
> =C2=A0=C2=A0=C2=A0 from different git repositories or even from different=
 branches
> =C2=A0=C2=A0=C2=A0 *=C2=A0 You can add the shared library directly to the=
 jenkins server
> configuration=C2=A0 and use the in the pipeline syntax checker directly
> =C2=A0=C2=A0=C2=A0 when playing/testing with the pipelines.
>
> However, if the plan is to have all the Jenkinsfile in the same git
> repository, then having an external repository for the shared libraries
> is probably a bad idea.

I'm not sure what Jenkins best practices are here, but for kernelCI,
keeping them separate (at least in the long term) sounds like a good
idea.  However, in order to get the structure of the first few jobs
agreed upon and merged, it might make sense to keep them all in the same
repo for ease of review.

Also, Tomeu seems to have separate project for building a tiny
ramdisk/initramfs that doesn't use the shared libs at all.

IMO, what I think would be very helpful at least for initial review and
discussion, is to see an initial PR that only has the "basic" build, and
ideally also generates a minimal, tiny ramdisk from the same build
(e.g. with 'update-initramfs -c -k min' )

> The pull requests includes three things: three jenkinsfiles, debos files
> and two Dockerfiles.
>
> The jenkinsfiles are the smallest possible since all the code creating
> the pipeline is in the shared library. There are two parts: one with the
> job name - that will be used by the resulting images, the destination arc=
hes
> and the run-time dependencies that need to be added to the image.
> There is also the debos file name but this should be removed if we always
> use the same debos configuration.
> The second part "build_test_suite" is for building the test suite code.
> This is on purpose a shell script that must create a cpio.gz tarball
> with the name rootfs-built-${NAME}-${ARCH}.cpio.gz
> The idea is to be able to add and modify quickly test suites without
> knowing too much about jenkins.

I'm not sure about the "build_test_suite" approach.

AFAICT, both the _igt and _v4l2 jobs are basically doing the same thing
as "basic", and then essentially installing a bunch more files on top.

Instead of all the rootfs duplication, couldn't the exact same thing be
accomplished by just having one "basic" rootfs image, and then passing
overlay tarballs to LAVA for IGT and V4L2?

IOW, I'm not sure I'm fully understanding the need for completely
separate rootfs for IGT and V4L2.

> The debos files are under the debos directory. I'm not going to enter into
> details here, as said in the pull request: debos is a wrapper using
> debootstrap and qemu that makes easier to create images and to tweak them
> with a set of pre-defined actions [0] following the list of actions
> specified listed in a YAML file (debos/stretch.yaml).
> debos is the standard tool in collabora for creating images, it's still
> young and we're adding new features and fixing bugs as they appear in
> our projects.

debos seems easy enough to understand so far.

One question/request for debos: in addition to creating a .cpio.gz,
could it also create filesystem images (e.g. ext2/3/4), and optionally
compress them?

One reason for this is if we want to use security attributes on the
rootfs, we can't use .cpio.gz, or NFS mounts.  We have to create a
"real" filesystem and use it as a ramdisk, or over the network with NBD.

> About the two dockerfiles: Dockerfile_debos that's a debian
> base image with debos installed and Dockerfile_debian that provides
> a debian container with the build dependencies to build the test suites.
> As mentioned in the pull request, this second dockerfile should be updated
> to have the container installing the required build dependencies for every
> test suite.
>
> Combining all the elements above, every jenkinsfile creates a pipeline
> with 3 stages for every one of the arches where it runs:
> 1) debos creates a stripped down debian image installing the runtime
> dependencies for running the test suite (listed in extra_packages)
> 2) build the test suites (shell script build_test_suite)
> 3) merge the results of the two previous stages and create the final imag=
e.

Again, I question the need for this "merge" step.  I think this should
just create another tarball that can be passed to LAVA as an (optional)
overlay when the specific test jobs require it.

Another reason to avoid the merge is if/when we want the base rootfs to
be have security attributes.  If that's the case, I don't think a simple
unpack/repack is going to work.

> In the case of Jenkinsfile_basic, given that build_test_suite is empty,
> it only runs the stage 1. There is a missing stage 4 that would be
> uploading
> the final images to kerneci.org

Tomeu's nfsroot Jenkinsfile has an example of how to do that using
the 'push-source.py' tool:
https://github.com/tomeuv/kernelci-build-staging/blob/nfsroot/jenkins/debia=
n/Jenkinsfile

> I hope this helps to understand my pull request, especially for those
> less familiar with jenkins pipelines.

Yes, thanks for the detaile explanation.

I'm a little more familiar with pipelines now after I setup my own
Jenkins in order to test this PR locally.

Kevin
