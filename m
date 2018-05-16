Subject: Re: [kernelci] proposal to build Debian images for every test suite (pull #24/kernelci-build-staging)
References: <99070f63-f2df-ae30-7885-a6e4ceb8c21a@collabora.com>
 <7h4ljjhxle.fsf@baylibre.com>
 <8b6f78ca-17bb-45bf-91c7-0a52a8e5d875@collabora.com>
 <7hmux8wbsv.fsf@baylibre.com>
From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Message-ID: <0be798a8-c08d-868f-6d3e-ef51ea491fc4@collabora.com>
Date: Wed, 16 May 2018 17:56:38 +0200
MIME-Version: 1.0
In-Reply-To: <7hmux8wbsv.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io



On 10/05/18 03:15, Kevin Hilman wrote:
 > "Ana Guerrero Lopez" <ana.guerrero@collabora.com> writes:
 >
 >> I have made a new pull request (PR#25), more details below.

I updated the PR, a couple of comments below for those not following
closely in GitHub.

[...]
 >> I have changed armel to arm to be more consistent with the linux/arch=
/XX
 >> naming. If you happen to be using already armel in kernelci, please t=
ell
 >> me and I'll rename it back to armel.
 >
 > We're already using armel in kernelCI on purpose, because we still hav=
e
 > a handful of ARMv5 boards.=C2=A0 As I suggested on your PR, maybe we c=
ould
 > build armel and armhf so both are available.

We have now 5 architectures with the following mapping:

 =C2=A0=C2=A0=C2=A0 def debian_arch =3D=C2=A0 ["armhf": "armhf",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "armel=
": "armel",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "arm64=
": "arm64",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "x86":=
 "i386",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "x86_6=
4": "amd64"]

producing 5 different images for every arch!


[...]
 >> You can see I kept the 3 lines in the top of Jenkinsfile_basic import=
ing
 >> the library from the same repository. This step is necessary unless
 >> we declare the library in Jenkins (globally or when creating the=20
pipeline).
 >> This article has a example very similar to what we're doing and
 >> explain how to do it:
 >>=20
https://dev.to/jalogut/centralise-jenkins-pipelines-configuration-using-s=
hared-libraries
 >> We don't need to do it now, but I wanted to mention it because most
 >> of the examples you'll find use this method and use the call @Library=
..
 >> in the Jenkinsfile.
 >
 > OK, when we start doing it that way, please include that in link in th=
e
 > changelog as background.
 >
 > And, while you're fixing the changelog, s/var/vars/. (I couldn't figur=
e
 > out how to comment on the changelog in github.)

I fixed the typo in the changelog and updated var/README.md with the
information on how to use the shared libraries.


Finally, I've added a last commit with a new stage to upload the generate=
d
images to kernelci.org. Apart from any other problem that needs fixing,
I consider the pull request ready to be merged.

Cheers,
Ana

