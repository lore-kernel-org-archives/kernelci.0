Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] proposal to build Debian images for every test suite (pull #24/kernelci-build-staging)
References: <99070f63-f2df-ae30-7885-a6e4ceb8c21a@collabora.com>
	<7h4ljjhxle.fsf@baylibre.com>
	<8b6f78ca-17bb-45bf-91c7-0a52a8e5d875@collabora.com>
Date: Wed, 09 May 2018 18:15:44 -0700
In-Reply-To: <8b6f78ca-17bb-45bf-91c7-0a52a8e5d875@collabora.com> (Ana
	Guerrero Lopez's message of "Wed, 9 May 2018 02:00:37 +0200")
Message-ID: <7hmux8wbsv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Ana Guerrero Lopez <ana.guerrero@collabora.com>
Cc: kernelci@groups.io

"Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:

> I have made a new pull request (PR#25), more details below.

Thanks, I've made a few comments there.

> On 08/05/18 01:09, Kevin Hilman wrote:
>> "Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:
>
>> Also, at first glance, the shared libs need some review.=C2=A0 The first
>> thing that looks strange is the arch mappings:
>>
>>=C2=A0=C2=A0=C2=A0=C2=A0 def debian_arch =3D=C2=A0 ["arm64": "armhf",
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "a=
rmel": "arm64",
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "x=
86": "i386",
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "x=
86_64": "amd64"]
>>
>> It looks to me like the arm64 and armhf are swapped.=C2=A0 The same looks
>> true for 'toolchain_arch'.
>
> My bad, I had this fixed locally this but I never pushed the commit.
>
> I have changed armel to arm to be more consistent with the linux/arch/XX
> naming. If you happen to be using already armel in kernelci, please tell
> me and I'll rename it back to armel.

We're already using armel in kernelCI on purpose, because we still have
a handful of ARMv5 boards.  As I suggested on your PR, maybe we could
build armel and armhf so both are available.

>>> However, if the plan is to have all the Jenkinsfile in the same git
>>> repository, then having an external repository for the shared libraries
>>> is probably a bad idea.
>>
>> I'm not sure what Jenkins best practices are here, but for kernelCI,
>> keeping them separate (at least in the long term) sounds like a good
>> idea.=C2=A0 However, in order to get the structure of the first few jobs
>> agreed upon and merged, it might make sense to keep them all in the same
>> repo for ease of review.
>
> Yeah, I agree. It's everything in the same repository now.
>
>> Also, Tomeu seems to have separate project for building a tiny
>> ramdisk/initramfs that doesn't use the shared libs at all.
>
> For only one job it makes sense to have it all in the same Jenkinsfile.
> But soon I'm expecting to have very similar jobs and we'll end up
> copy-pasting the same blocks of code.
>
> Anyway, for making things easier, right now there is only a function
> (buildImage.groovy) and I have merged there the code from
> getDockerArgs.groovy
> and setPipelineVersion.groovy
> We'll see later when we add more pipelines which functions can be reused
> and need to be split in different files for re-use.

Thanks, that makes it easier to review all together, and doesn't have a
dependency on an external repo for the libs.

> You can see I kept the 3 lines in the top of Jenkinsfile_basic importing
> the library from the same repository. This step is necessary unless
> we declare the library in Jenkins (globally or when creating the pipeline=
).
> This article has a example very similar to what we're doing and
> explain how to do it:
> https://dev.to/jalogut/centralise-jenkins-pipelines-configuration-using-s=
hared-libraries
> We don't need to do it now, but I wanted to mention it because most
> of the examples you'll find use this method and use the call @Library..
> in the Jenkinsfile.

OK, when we start doing it that way, please include that in link in the
changelog as background.

And, while you're fixing the changelog, s/var/vars/.  (I couldn't figure
out how to comment on the changelog in github.)

>> IMO, what I think would be very helpful at least for initial review and
>> discussion, is to see an initial PR that only has the "basic" build, and
>> ideally also generates a minimal, tiny ramdisk from the same build
>> (e.g. with 'update-initramfs -c -k min' )
>
> The new pull request has only the basic build. I have modified the debos
> files to create the tiny ramdisk and the Jenkinsfile to store it.

Very nice, thank you.

Kevin
