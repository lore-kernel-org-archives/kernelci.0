Subject: Re: [kernelci] proposal to build Debian images for every test suite (pull #24/kernelci-build-staging)
References: <99070f63-f2df-ae30-7885-a6e4ceb8c21a@collabora.com>
 <7h4ljjhxle.fsf@baylibre.com>
From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Message-ID: <8b6f78ca-17bb-45bf-91c7-0a52a8e5d875@collabora.com>
Date: Wed, 9 May 2018 02:00:37 +0200
MIME-Version: 1.0
In-Reply-To: <7h4ljjhxle.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi!

I have made a new pull request (PR#25), more details below.

On 08/05/18 01:09, Kevin Hilman wrote:
 > "Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:

 > Also, at first glance, the shared libs need some review.=C2=A0 The fir=
st
 > thing that looks strange is the arch mappings:
 >
 >=C2=A0=C2=A0=C2=A0=C2=A0 def debian_arch =3D=C2=A0 ["arm64": "armhf",
 >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"armel": "arm64",
 >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"x86": "i386",
 >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"x86_64": "amd64"]
 >
 > It looks to me like the arm64 and armhf are swapped.=C2=A0 The same lo=
oks
 > true for 'toolchain_arch'.

My bad, I had this fixed locally this but I never pushed the commit.

I have changed armel to arm to be more consistent with the linux/arch/XX
naming. If you happen to be using already armel in kernelci, please tell
me and I'll rename it back to armel.


 >> However, if the plan is to have all the Jenkinsfile in the same git
 >> repository, then having an external repository for the shared librari=
es
 >> is probably a bad idea.
 >
 > I'm not sure what Jenkins best practices are here, but for kernelCI,
 > keeping them separate (at least in the long term) sounds like a good
 > idea.=C2=A0 However, in order to get the structure of the first few jo=
bs
 > agreed upon and merged, it might make sense to keep them all in the sa=
me
 > repo for ease of review.

Yeah, I agree. It's everything in the same repository now.

 > Also, Tomeu seems to have separate project for building a tiny
 > ramdisk/initramfs that doesn't use the shared libs at all.

For only one job it makes sense to have it all in the same Jenkinsfile.
But soon I'm expecting to have very similar jobs and we'll end up
copy-pasting the same blocks of code.

Anyway, for making things easier, right now there is only a function
(buildImage.groovy) and I have merged there the code from=20
getDockerArgs.groovy
and setPipelineVersion.groovy
We'll see later when we add more pipelines which functions can be reused
and need to be split in different files for re-use.

You can see I kept the 3 lines in the top of Jenkinsfile_basic importing
the library from the same repository. This step is necessary unless
we declare the library in Jenkins (globally or when creating the pipeline=
).
This article has a example very similar to what we're doing and explain=20
how to do it:
https://dev.to/jalogut/centralise-jenkins-pipelines-configuration-using-s=
hared-libraries

We don't need to do it now, but I wanted to mention it because most
of the examples you'll find use this method and use the call @Library..
in the Jenkinsfile.

 > IMO, what I think would be very helpful at least for initial review an=
d
 > discussion, is to see an initial PR that only has the "basic" build, a=
nd
 > ideally also generates a minimal, tiny ramdisk from the same build
 > (e.g. with 'update-initramfs -c -k min' )

The new pull request has only the basic build. I have modified the debos
files to create the tiny ramdisk and the Jenkinsfile to store it.



 > I'm not sure about the "build_test_suite" approach.
 >
 > AFAICT, both the _igt and _v4l2 jobs are basically doing the same thin=
g
 > as "basic", and then essentially installing a bunch more files on top.
 >
 > Instead of all the rootfs duplication, couldn't the exact same thing b=
e
 > accomplished by just having one "basic" rootfs image, and then passing
 > overlay tarballs to LAVA for IGT and V4L2?
 >
 > IOW, I'm not sure I'm fully understanding the need for completely
 > separate rootfs for IGT and V4L2.

Besides what tomeu said in his mail, IGT and V4L2 were bad examples to
compare here because they have almost the same dependencies.

Cheers,

Ana

