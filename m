MIME-Version: 1.0
References: <20181011152429.l2q6d43zzzqoc3df@xps.therub.org>
In-Reply-To: <20181011152429.l2q6d43zzzqoc3df@xps.therub.org>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Fri, 12 Oct 2018 09:57:31 -0500
Message-ID: <CA+_AqivsE3FKx2MFaUy+xGL7y0Pz7drooLr4zz_RQNTVdZhMXA@mail.gmail.com>
Subject: Re: [kernelci] LKFT + KernelCI
Content-Type: multipart/alternative; boundary="0000000000003cb9860578094fa4"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Fathi Boudra <fathi.boudra@linaro.org>, Dan Rue <dan.rue@linaro.org>

--0000000000003cb9860578094fa4
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Oct 2018 at 10:24, Dan Rue <dan.rue@linaro.org> wrote:

> Hi All,
>
> This is probably overdue, but I wanted to write out and get feedback on
> the plans that I've been working on with regard to linux kernel
> functional testing (LKFT).
>
> LKFT consists of the following components:
> - jenkins
> - openembedded
> - lava
> - squad
>
> It uses the following boards:
> - hikey
> - x15
> - juno-r2
> - dragonboard 410c
> - qemu
> - x86
>
> This model has been successful for us so far, and allowed us to meet the
> requirements that we've had. I think the gaps that we have currently are
> related to test coverage, reporting, and visualization.
>
> However, instead of continuing to improve LKFT, what we'd prefer to do
> is work hand in hand with kernelci. Then the question becomes, how do we
> do that without throwing away everything that we already have (and that
> we have to keep running)?
>
> So I've been considering how we can start to move LKFT towards kernelci,
> so that at some point in the future it is indistinguishable from
> and a part of kernelci.
>
> Milosz is looking at the front end and database pieces - see his earlier
> email on that topic with subject "KernelCI NG master plan".
>
> My interest is to start by changing the way LKFT does builds to be more
> compatible with kernelci. We would like to stick with openembedded for a
> variety of reasons, and I think that it would be good if kernelci
> supported multiple user spaces.
>
> Right now our OE build uses a series of recipes and builds a complete
> kernel and user space for every build, every time. This is problematic
> for a couple reasons:
> - Kernel config consists of defconfig plus some extra configs, all
>   coming from OE recipes. This makes the kernel builds hard to reproduce
>   outside of OE.
> - OE rebuilds userspace every time. My understanding is this is best
>   practice from an OE perspective, but I don't think it's desirable from
>   a kernelci or testing perspective.


> If, however, we had a kernel config fragment upstream, then we could use
> a well-defined kernel config that is easily reproducible by anyone. This
> is something that Anders Roxell and Mark Brown are working on.
>
> The second part is to be able to actually consume a kernelci built
> kernel, rather than re-building the kernel every time. I think it would
> be best to be able to take an existing OE userspace and combine it with
> an existing kernelci built kernel. Some people are already doing this or
> similar, but it would be best if this was supported in OE upstream.
>

Right, in Linaro QCLT we have this approach, We use OE to generate a
ramdisk and publish in Linaro snapshots and then pull the OE ramdisk and
the Kernel, Modules, DTB from
KernelCI in our case we build an Android boot Image for
Dragonboard{410,820}c. This implies,

- The OE userspace ramdisk is generated only when a change is made to the
userspace.
- The Kernel binaries are taken from KernelCI that has a consolidated
kernel configuration.

Currently We have a LinaroCI job that does this task (last build [1]),
talking with Fathi and Nico suggested to implement this logic inside OE
RPB, so further work is needed to scale if we want to support more boards.

[1] https://ci.linaro.org/job/lt-qcom-linux-integration/134/


> So our short term plans are something like:
> - Get a config fragment upstreamed and backported, that can be used for
>   testing
> - Get kernelci building said fragment
> - Determine how to produce OE images from an existing kernel and
>   existing OE build in an OE-supportable way.
>
> Once we have that, we think we can start submitting test results into
> kernelci - making the data more widely available to the community. After
> that, it gets exciting because we would be working on top of the same
> reporting and analytics stack. This may also bring opportunities here,
> for example, to support boot testing on fastboot devices.
>
> Please let me know what you think -
>
> Dan
>
> 
>
>

--0000000000003cb9860578094fa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Thu, 11 Oct 2018 at 10:24, Dan Rue &lt;<a hr=
ef=3D"mailto:dan.rue@linaro.org">dan.rue@linaro.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hi All,<br>
<br>
This is probably overdue, but I wanted to write out and get feedback on<br=
>
the plans that I&#39;ve been working on with regard to linux kernel<br>
functional testing (LKFT).<br>
<br>
LKFT consists of the following components:<br>
- jenkins<br>
- openembedded<br>
- lava<br>
- squad<br>
<br>
It uses the following boards:<br>
- hikey<br>
- x15<br>
- juno-r2<br>
- dragonboard 410c<br>
- qemu<br>
- x86<br>
<br>
This model has been successful for us so far, and allowed us to meet the<b=
r>
requirements that we&#39;ve had. I think the gaps that we have currently a=
re<br>
related to test coverage, reporting, and visualization.<br>
<br>
However, instead of continuing to improve LKFT, what we&#39;d prefer to do=
<br>
is work hand in hand with kernelci. Then the question becomes, how do we<b=
r>
do that without throwing away everything that we already have (and that<br=
>
we have to keep running)?<br>
<br>
So I&#39;ve been considering how we can start to move LKFT towards kernelc=
i,<br>
so that at some point in the future it is indistinguishable from<br>
and a part of kernelci.<br>
<br>
Milosz is looking at the front end and database pieces - see his earlier<b=
r>
email on that topic with subject &quot;KernelCI NG master plan&quot;.<br>
<br>
My interest is to start by changing the way LKFT does builds to be more<br=
>
compatible with kernelci. We would like to stick with openembedded for a<b=
r>
variety of reasons, and I think that it would be good if kernelci<br>
supported multiple user spaces.<br>
<br>
Right now our OE build uses a series of recipes and builds a complete<br>
kernel and user space for every build, every time. This is problematic<br>
for a couple reasons:<br>
- Kernel config consists of defconfig plus some extra configs, all<br>
=C2=A0 coming from OE recipes. This makes the kernel builds hard to reprod=
uce<br>
=C2=A0 outside of OE.<br>
- OE rebuilds userspace every time. My understanding is this is best<br>
=C2=A0 practice from an OE perspective, but I don&#39;t think it&#39;s des=
irable from<br>
=C2=A0 a kernelci or testing perspective.</blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
If, however, we had a kernel config fragment upstream, then we could use<b=
r>
a well-defined kernel config that is easily reproducible by anyone. This<b=
r>
is something that Anders Roxell and Mark Brown are working on.<br>
<br>
The second part is to be able to actually consume a kernelci built<br>
kernel, rather than re-building the kernel every time. I think it would<br=
>
be best to be able to take an existing OE userspace and combine it with<br=
>
an existing kernelci built kernel. Some people are already doing this or<b=
r>
similar, but it would be best if this was supported in OE upstream.<br></b=
lockquote><div><br></div><div><div style=3D"font-size:small;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial">Right, in Linaro QCLT we have this approach, We use OE to generate a r=
amdisk and publish in Linaro snapshots and then pull the OE ramdisk and the=
 Kernel, Modules, DTB from</div><div style=3D"font-size:small;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial">KernelCI in our case we build an Android boot Image for Dragonboard{=
410,820}c. This implies,</div><div style=3D"font-size:small;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><br></div><div style=3D"font-size:small;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial">- The OE u=
serspace ramdisk is generated only when a change is made to the userspace.<=
/div><div style=3D"font-size:small;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial">- The Kernel binarie=
s are taken from KernelCI that has a consolidated kernel configuration.</di=
v><br></div><div>Currently We have a LinaroCI job that does this task (last=
 build [1]), talking with Fathi and Nico suggested to implement this logic =
inside OE RPB, so further work is needed to scale if we want to support mor=
e boards.</div><div><br></div><div>[1]=C2=A0<a href=3D"https://ci.linaro.or=
g/job/lt-qcom-linux-integration/134/">https://ci.linaro.org/job/lt-qcom-lin=
ux-integration/134/</a></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
So our short term plans are something like:<br>
- Get a config fragment upstreamed and backported, that can be used for<br=
>
=C2=A0 testing<br>
- Get kernelci building said fragment<br>
- Determine how to produce OE images from an existing kernel and<br>
=C2=A0 existing OE build in an OE-supportable way.<br>
<br>
Once we have that, we think we can start submitting test results into<br>
kernelci - making the data more widely available to the community. After<b=
r>
that, it gets exciting because we would be working on top of the same<br>
reporting and analytics stack. This may also bring opportunities here,<br>
for example, to support boot testing on fastboot devices.<br>
<br>
Please let me know what you think -<br>
<br>
Dan<br>
<br>
<br>
<br>
</blockquote></div></div></div></div>

--0000000000003cb9860578094fa4--
