Subject: Re: [kernelci] proposal to build Debian images for every test suite (pull #24/kernelci-build-staging)
References: <99070f63-f2df-ae30-7885-a6e4ceb8c21a@collabora.com>
 <7h4ljjhxle.fsf@baylibre.com>
From: tomeu.vizoso@collabora.com
Message-ID: <7087cdfb-5577-eec1-7d3d-9408db4d240f@collabora.com>
Date: Tue, 8 May 2018 08:11:40 +0200
MIME-Version: 1.0
In-Reply-To: <7h4ljjhxle.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi,

below I give my opinion on a few comments, but it's Ana who is leading 
now this work.

On 05/08/2018 01:09 AM, Kevin Hilman wrote:
 > "Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:
 >> And on the other side, what's in the pull request: three small 
Jenkinsfiles
 >> with the parameters for every job and the files to create the debian
 >> image with debos.
 >>
 >> While the shared libraries could be in the same repository that the
 >> Jenkinsfile, I have created a separate repository for several reasons:
 >>
 >>      * shared libraries must follow this directory structure
 >> 
https://jenkins.io/doc/book/pipeline/shared-libraries/#directory-structure
 >>
 >>      * if there are more shared libraries used in kernelci, it's good to
 >>      have all of them in a separate repository, so they can be used
 >>      from different git repositories or even from different branches
 >>      *  You can add the shared library directly to the jenkins server
 >> configuration  and use the in the pipeline syntax checker directly
 >>      when playing/testing with the pipelines.
 >>
 >> However, if the plan is to have all the Jenkinsfile in the same git
 >> repository, then having an external repository for the shared libraries
 >> is probably a bad idea.
 >
 > I'm not sure what Jenkins best practices are here, but for kernelCI,
 > keeping them separate (at least in the long term) sounds like a good
 > idea.  However, in order to get the structure of the first few jobs
 > agreed upon and merged, it might make sense to keep them all in the same
 > repo for ease of review.
 >
 > Also, Tomeu seems to have separate project for building a tiny
 > ramdisk/initramfs that doesn't use the shared libs at all.

Yes, but there was a massive amount of pipeline definition that would 
have to be duplicated between jobs.

 > IMO, what I think would be very helpful at least for initial review and
 > discussion, is to see an initial PR that only has the "basic" build, and
 > ideally also generates a minimal, tiny ramdisk from the same build
 > (e.g. with 'update-initramfs -c -k min' )
 >
 >> The pull requests includes three things: three jenkinsfiles, debos files
 >> and two Dockerfiles.
 >>
 >> The jenkinsfiles are the smallest possible since all the code creating
 >> the pipeline is in the shared library. There are two parts: one with the
 >> job name - that will be used by the resulting images, the destination 
arches
 >> and the run-time dependencies that need to be added to the image.
 >> There is also the debos file name but this should be removed if we always
 >> use the same debos configuration.
 >> The second part "build_test_suite" is for building the test suite code.
 >> This is on purpose a shell script that must create a cpio.gz tarball
 >> with the name rootfs-built-${NAME}-${ARCH}.cpio.gz
 >> The idea is to be able to add and modify quickly test suites without
 >> knowing too much about jenkins.
 >
 > I'm not sure about the "build_test_suite" approach.
 >
 > AFAICT, both the _igt and _v4l2 jobs are basically doing the same thing
 > as "basic", and then essentially installing a bunch more files on top.

The difference is only in the dependencies. Both test suites are in the 
fat side and have several dependencies that otherwise aren't needed. That 
said, a basic image that contains all of them might still not be too big.

 > Instead of all the rootfs duplication, couldn't the exact same thing be
 > accomplished by just having one "basic" rootfs image, and then passing
 > overlay tarballs to LAVA for IGT and V4L2?

TTBOMK, with the move to LAVA v2 we lost the ability to apply random 
overlays to the initramfs, other than modules and the LAVA test helpers.

 > IOW, I'm not sure I'm fully understanding the need for completely
 > separate rootfs for IGT and V4L2.

It's just that priority was given to come up with the smallest possible 
images for each test suite. I'm concerned that some subsystems may have 
gone with for example python for their test suite and that could make it 
more difficult to have a single base image.

 >> The debos files are under the debos directory. I'm not going to enter 
into
 >> details here, as said in the pull request: debos is a wrapper using
 >> debootstrap and qemu that makes easier to create images and to tweak them
 >> with a set of pre-defined actions [0] following the list of actions
 >> specified listed in a YAML file (debos/stretch.yaml).
 >> debos is the standard tool in collabora for creating images, it's still
 >> young and we're adding new features and fixing bugs as they appear in
 >> our projects.
 >
 > debos seems easy enough to understand so far.
 >
 > One question/request for debos: in addition to creating a .cpio.gz,
 > could it also create filesystem images (e.g. ext2/3/4), and optionally
 > compress them?

Yep, that's the usual scenario.

 > One reason for this is if we want to use security attributes on the
 > rootfs, we can't use .cpio.gz, or NFS mounts.  We have to create a
 > "real" filesystem and use it as a ramdisk, or over the network with NBD.
 >
 >> About the two dockerfiles: Dockerfile_debos that's a debian
 >> base image with debos installed and Dockerfile_debian that provides
 >> a debian container with the build dependencies to build the test suites.
 >> As mentioned in the pull request, this second dockerfile should be 
updated
 >> to have the container installing the required build dependencies for 
every
 >> test suite.
 >>
 >> Combining all the elements above, every jenkinsfile creates a pipeline
 >> with 3 stages for every one of the arches where it runs:
 >> 1) debos creates a stripped down debian image installing the runtime
 >> dependencies for running the test suite (listed in extra_packages)
 >> 2) build the test suites (shell script build_test_suite)
 >> 3) merge the results of the two previous stages and create the final 
image.
 >
 > Again, I question the need for this "merge" step.  I think this should
 > just create another tarball that can be passed to LAVA as an (optional)
 > overlay when the specific test jobs require it.
 >
 > Another reason to avoid the merge is if/when we want the base rootfs to
 > be have security attributes.  If that's the case, I don't think a simple
 > unpack/repack is going to work.

Why wouldn't that work, ooi?

 >> In the case of Jenkinsfile_basic, given that build_test_suite is empty,
 >> it only runs the stage 1. There is a missing stage 4 that would be
 >> uploading
 >> the final images to kerneci.org
 >
 > Tomeu's nfsroot Jenkinsfile has an example of how to do that using
 > the 'push-source.py' tool:
 > 
https://github.com/tomeuv/kernelci-build-staging/blob/nfsroot/jenkins/debian/Jenkinsfile
 >
 >> I hope this helps to understand my pull request, especially for those
 >> less familiar with jenkins pipelines.
 >
 > Yes, thanks for the detaile explanation.
 >
 > I'm a little more familiar with pipelines now after I setup my own
 > Jenkins in order to test this PR locally.

Thanks for looking at this!

Tomeu
