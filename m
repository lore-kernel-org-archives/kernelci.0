MIME-Version: 1.0
References: <CAH+k93Fy4sFGYMPVBuOcXwh4_ANt2qdCLMSCRzEjeEihJ1_Ekw@mail.gmail.com>
In-Reply-To: <CAH+k93Fy4sFGYMPVBuOcXwh4_ANt2qdCLMSCRzEjeEihJ1_Ekw@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Fri, 14 Dec 2018 15:01:04 +0000
Message-ID: <CAH1_8nAj1h9ooiAOdmSWdP9TAGA_QnYx_-2UM2YrXV+4ACqh5w@mail.gmail.com>
Subject: Re: [kernelci] Multiple compiler support in the backend
Content-Type: multipart/alternative; boundary="000000000000e45811057cfcb3cd"
List-ID: <kernelci.groups.io>
To: Matt Hart <matthew.hart@linaro.org>
Cc: kernelci@groups.io

--000000000000e45811057cfcb3cd
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 16, 2018 at 12:52 PM Matt Hart <matthew.hart@linaro.org> wrote:

> Hi all,
>
> Just wanted to clear up what my kernelci-backend PR [1] is for.
>
> It introduces a build-environment variable to the build document,
> which will allow the backend to distinguish between builds of the same
> defconfig, but in a different environment. This variable is required
> and requests without it will be dropped, to stop builds from
> overwriting each other on the storage filesystem.
>
> For kernelci.org usage, the environment difference will the compiler,
> allowing our builders to push builds from our different docker images,
> but as it's just a string, I'm hoping that the name build-environment
> will work for other use cases.
> There is already a compiler field which is populated by the backend
> from the build.json and some simple parsing.
>
> There is a matching PR [2] to kernelci-core-staging to add a
> build-environment string to our builds (example:
> docker-kernelci/build-gcc-7_arm64) but it has been suggested this
> could be shortened to 'gcc-7' which I'm happy to change.
>

It sounds like the 2 PRs work hand-in-hand, so they'll need to be
tested and merged together.

Potentially, we could have different flavours of the same
compiler version from different build environments.  Say, maybe
Linaro's GCC 8 will be different from Debian's etc...  Will the
build environment be shown in the email reports, or will there
still just be the compiler version as we do now?


> For the frontend, this change "just works", because build.py is now
> populating the file_server_resource field, all the URLs on the build
> information pages will be correct.
>

Great, let's take this opportunity to try and avoid having to
repeat the magic URL format everywhere.

Same question as with the email reports though, will the build
environment information be visible anywhere or will we solely
rely on the compiler version?

I would really like to get this deployed to staging for testing and
> then rolled out ASAP as it's a requirement for starting builds with
> compilers other than GCC, and multiple versions of GCC.
>

Sounds like something to look at next week now that all fixes
seem to be available in PRs.

I guess one extra change would be to iterate over several build
environments for each architecture, but that would probably rely
on proper build configurations (i.e. using a build-configs.yaml
like we do with test-configs.yaml).

Guillaume

[1] https://github.com/kernelci/kernelci-backend/pull/86
> [2] https://github.com/kernelci/kernelci-core-staging/pull/43
>
> 
>
>

--000000000000e45811057cfcb3cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 16, 2018 at 12:52 PM Matt =
Hart &lt;<a href=3D"mailto:matthew.hart@linaro.org">matthew.hart@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi all,<br>
<br>
Just wanted to clear up what my kernelci-backend PR [1] is for.<br>
<br>
It introduces a build-environment variable to the build document,<br>
which will allow the backend to distinguish between builds of the same<br>
defconfig, but in a different environment. This variable is required<br>
and requests without it will be dropped, to stop builds from<br>
overwriting each other on the storage filesystem.<br>
<br>
For <a href=3D"http://kernelci.org" rel=3D"noreferrer" target=3D"_blank">k=
ernelci.org</a> usage, the environment difference will the compiler,<br>
allowing our builders to push builds from our different docker images,<br>
but as it&#39;s just a string, I&#39;m hoping that the name build-environm=
ent<br>
will work for other use cases.<br>
There is already a compiler field which is populated by the backend<br>
from the build.json and some simple parsing.<br>
<br>
There is a matching PR [2] to kernelci-core-staging to add a<br>
build-environment string to our builds (example:<br>
docker-kernelci/build-gcc-7_arm64) but it has been suggested this<br>
could be shortened to &#39;gcc-7&#39; which I&#39;m happy to change.<br></=
blockquote><div><br></div><div><div>It sounds like the 2 PRs work hand-in-h=
and, so they&#39;ll need to be</div><div>tested and merged together.</div><=
div><br></div><div>Potentially, we could have different flavours of the sam=
e</div><div>compiler version from different build environments.=C2=A0 Say, =
maybe</div><div>Linaro&#39;s GCC 8 will be different from Debian&#39;s etc.=
..=C2=A0 Will the</div><div>build environment be shown in the email reports=
, or will there</div><div>still just be the compiler version as we do now?<=
/div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
For the frontend, this change &quot;just works&quot;, because build.py is =
now<br>
populating the file_server_resource field, all the URLs on the build<br>
information pages will be correct.<br></blockquote><div>=C2=A0</div><div><=
div>Great, let&#39;s take this opportunity to try and avoid having to</div>=
<div>repeat the magic URL format everywhere.</div><div><br></div><div>Same =
question as with the email reports though, will the build</div><div>environ=
ment information be visible anywhere or will we solely</div><div>rely on th=
e compiler version?</div></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
I would really like to get this deployed to staging for testing and<br>
then rolled out ASAP as it&#39;s a requirement for starting builds with<br=
>
compilers other than GCC, and multiple versions of GCC.<br></blockquote><d=
iv>=C2=A0</div><div><div>Sounds like something to look at next week now tha=
t all fixes</div><div>seem to be available in PRs.</div><div><br></div><div=
>I guess one extra change would be to iterate over several build</div><div>=
environments for each architecture, but that would probably rely</div><div>=
on proper build configurations (i.e. using a build-configs.yaml</div><div>l=
ike we do with test-configs.yaml).</div></div><div><br></div><div>Guillaume=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
[1] <a href=3D"https://github.com/kernelci/kernelci-backend/pull/86" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/kernelci/kernelci-bac=
kend/pull/86</a><br>
[2] <a href=3D"https://github.com/kernelci/kernelci-core-staging/pull/43" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/kernelci/kernelci-c=
ore-staging/pull/43</a><br>
<br>
<br>
<br>
</blockquote></div></div></div></div></div>

--000000000000e45811057cfcb3cd--
