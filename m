MIME-Version: 1.0
References: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org>
In-Reply-To: <20200420163628.wmbc7f7vuvqsbdhw@xps.therub.org>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 21 Apr 2020 16:46:34 +0100
Message-ID: <CAH1_8nBL+YSnmWyEkV336+wkq4YP=pHs1srUNxUZ_zhGxOe45Q@mail.gmail.com>
Subject: Re: kci_build proposal
Content-Type: multipart/alternative; boundary="0000000000003bece505a3ceec21"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Dan Rue <dan.rue@linaro.org>

--0000000000003bece505a3ceec21
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 20, 2020 at 5:36 PM Dan Rue <dan.rue@linaro.org> wrote:

> Hey Everyone!
>

Nice to have you back on the mailing list :)


> I've been working on a kernel building service/api that's designed to
> perform
> massive numbers of builds. The actual kernel build implementation reuses
> kernelci's kci_build script.
>

Out of interest, how do you manage the builders?

We're looking into Kubernetes now so we might find issues similar
to those in your use-case.


> So far we have not had to modify kernelci-core's kci_build, but we're
> approaching a point where we think we're going to have to modify it
> fundamentally to meet our needs. I would really like to continue sharing a
> build implementation with kernelci, but some of the changes needed are
> architectural in nature, and so I'd like to share a brief proposal for
> consideration:
>
> Standalone python-based kernel builder with the following properties:
> - Independent python package (library and cli) that only does a local
> kernel
>   build
>

Yes - see my more detailed reply further down.


> - Takes as arguments things like architecture, toolchain, kernel config,
> etc.
> - Dockerzed toolchain environments are supported directly (e.g. it will run
>   "docker run make")
> - Builds are done within the context of an existing kernel tree (doing git
>   checkout, git fetch, etc are out of scope)
> - Artifacts go to some named or default directory path. Uploading them
>   elsewhere is out of scope.
> - Exception handling is built in and makes it usable as a python library
> - Logging is built in with flexibility in mind (log to console, verbose or
>   silent, log to file, etc.)
> - Simple, one-line dockerized reproducers are given as a build artifact,
> for
>   reproducing builds locally.
> - Partial build failure support - e.g. what if kselftest fails but the
> rest of
>   the build passes?
>

Another "out of interest" question: have you modified kci_build
already to cover kselftest?

We have an open PR for that, if you're already using something in
production then it would be worth comparing what you've come up
with.


> - Rigorous unit testing
> - Implementation is modular enough to support things like a documentation
> build
>   and other targets in the tree such as various tools/, sparse checker,
>   coccinelle, etc.
>

Yes, however we need to draw the line somewhere.  I guess that
would be, anything that can already be built from a plain kernel
source tree.


> - Support for kernel fragement files or urls in addition to supporting
>   individual kernel config arguments
>
> Use Case Examples:
> - Install using pip, build using the cli interface
>   - "pip install --user kernel-builder; cd linux; kernel-builder --arch
> arm64 --toolchain clang-9"
> - Run using a published docker container. This example would need
> permission to
>   launch additional docker containers to perform the build steps.
>   - "docker run kernel-builder --arch arm64 --toolchain clang-9"
> - Install using pip, and use it from python as a library
>   - "import kernel-builder"
>
> In the example above, "kernel-builder" is a placeholder for whatever the
> name
> would be.
>
> The artifacts produced would be similar to the set of artifacts kci_build
> produces today, with the addition of a build reproducer script and probably
> some differences in metadata files.
>
> Docker support would be optional (you could use a locally installed
> toolchain),
> but allows for arbitrary toolchains to be available and perfect
> reproducibility.
>

I agree that we need to have a way to fully reproduce builds and
that includes having control over the environment, typically a
Docker image.  However, I'm a bit skeptical about making the tool
call Docker rather than have a wrapper to call it.  I think it's
more a matter of hierarchy in the stack, I see it as:

  docker -> kernel-builder -> make -> gcc

Say, what if someone wanted to use another environment than
Docker?  Rather than make it an optional feature, I think it may
be better to keep it one level higher if we can still generate
reproducers like you're suggesting.


> It's hard to change kci_build to be anything like this because it's tightly
> coupled with the kernelci-core repo, and kernelci itself. The design above
> also
> fundamentally changes how the builder interfaces with docker, such that it
> becomes supported directly rather than something that's implemented
> outside the
> scope of the builder.
>
> It's important that docker is supported directly because it makes the
> reproducible build use-case a one-liner, it solves the problem of having
> to get
> python and the builder into the build containers, and it allows for more
> granular control of the build.
>
> So, thoughts? How close or how far is this from the roadmap for kci_build
> as it
> stands today? We are likely to start working on this soon, and would really
> like to work together on it if possible.
>

Above all, thanks for the detailed proposal and for collaborating
on a common kernel build utility to share with KernelCI.  What
you're suggesting makes a lot of sense to me, and it's broadly in
line with where kernelci-core is going.

The initial goal of kernelci-core was to decouple the KernelCI
steps from Jenkins or any other execution environment.  It has
succeeded in this respect as it's now possible to do everything
on the command line or in other systems such as Gitlab CI, and
you've been able to reuse kci_build too.  I think it is important
that we keep a central repository with the KernelCI specific
orchestration logic and tools to handle configuration.  That
should become a proper "kernelci" Python package at some point,
when the repository has completed its transition.

Now, this kernelci package should ideally be a very thin layer to
just link components together and create pipeline steps.  What I
think we should have next is a toolbox of low-level stand-alone
packages that specialise in only one task, and I believe this is
where it would meet your use-case.  For example, I started
working on the "scalpel" tool last year to do bisections with the
aim of making it independent of KernelCI.  Now I guess we need
another tool to do kernel builds following the same approach,
maybe call it "spanner" or something constructive like that :)

That way, we may even keep kci_build with its current cli but
rather than have all the build steps in kernelci/build.py it
would be importing a common module (say, toolbox.spanner for the
sake of the argument) and your build service would be doing that
too.  Or there would also be some command line tool provided with
the package to run a build directly.

Basically, rather than adapting kci_build for other purposes, I'm
suggesting to create a generic tool that can be used by kci_build
as well as any other kernel CI system.

I don't know how to call this toolbox and where to host it, but
it would seem wise imho to keep it separate from KernelCI, LKFT
or any other CI system that would be using it.  It would probably
also make sense to at least keep it kernel-centric to focus on a
group of use-cases.  How does that sound?

If you agree with this approach, the next steps would be to find
the least common denominator between the use-cases that we
already know about, which I guess are KernelCI and LKFT.  I think
it's largely doable, with probably some compromises on all parts
and some built-in flexibility to make this a truly generic tool.
The details of how to build each artifact, how to use containers,
and the format of the meta-data are probably areas where we may
need some custom code to do slightly different things.  But this
is like any software library, and it can be done iteratively.

Best wishes,
Guillaume

--0000000000003bece505a3ceec21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Apr 20, 2020 at 5:36 PM Dan Rue &=
lt;<a href=3D"mailto:dan.rue@linaro.org">dan.rue@linaro.org</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hey Everyone!<br></blockquote><div><br></div><div>Nice to have y=
ou back on the mailing list :)<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
I&#39;ve been working on a kernel building service/api that&#39;s designed =
to perform<br>
massive numbers of builds. The actual kernel build implementation reuses<br=
>
kernelci&#39;s kci_build script.<br></blockquote><div><br></div>Out of inte=
rest, how do you manage the builders?<br><br>We&#39;re looking into Kuberne=
tes now so we might find issues similar<br><div>to those in your use-case.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
So far we have not had to modify kernelci-core&#39;s kci_build, but we&#39;=
re<br>
approaching a point where we think we&#39;re going to have to modify it<br>
fundamentally to meet our needs. I would really like to continue sharing a<=
br>
build implementation with kernelci, but some of the changes needed are<br>
architectural in nature, and so I&#39;d like to share a brief proposal for<=
br>
consideration:<br>
<br>
Standalone python-based kernel builder with the following properties:<br>
- Independent python package (library and cli) that only does a local kerne=
l<br>
=C2=A0 build<br></blockquote><div><br></div><div>Yes - see my more detailed=
 reply further down.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
- Takes as arguments things like architecture, toolchain, kernel config, et=
c.<br>
- Dockerzed toolchain environments are supported directly (e.g. it will run=
<br>
=C2=A0 &quot;docker run make&quot;)<br>
- Builds are done within the context of an existing kernel tree (doing git<=
br>
=C2=A0 checkout, git fetch, etc are out of scope)<br>
- Artifacts go to some named or default directory path. Uploading them<br>
=C2=A0 elsewhere is out of scope.<br>
- Exception handling is built in and makes it usable as a python library<br=
>
- Logging is built in with flexibility in mind (log to console, verbose or<=
br>
=C2=A0 silent, log to file, etc.)<br>
- Simple, one-line dockerized reproducers are given as a build artifact, fo=
r<br>
=C2=A0 reproducing builds locally.<br>
- Partial build failure support - e.g. what if kselftest fails but the rest=
 of<br>
=C2=A0 the build passes?<br></blockquote><div><br></div><div>Another &quot;=
out of interest&quot; question: have you modified kci_build<br>already to c=
over kselftest?</div><div><br></div>We have an open PR for that, if you&#39=
;re already using something in<br>production then it would be worth compari=
ng what you&#39;ve come up<br>with.<br><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
- Rigorous unit testing<br>
- Implementation is modular enough to support things like a documentation b=
uild<br>
=C2=A0 and other targets in the tree such as various tools/, sparse checker=
,<br>
=C2=A0 coccinelle, etc.<br></blockquote><div><br></div><div>Yes, however we=
 need to draw the line somewhere.=C2=A0 I guess that<br>would be, anything =
that can already be built from a plain kernel<br>source tree.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- Support for kernel fragement files or urls in addition to supporting<br>
=C2=A0 individual kernel config arguments<br>
<br>
Use Case Examples:<br>
- Install using pip, build using the cli interface<br>
=C2=A0 - &quot;pip install --user kernel-builder; cd linux; kernel-builder =
--arch arm64 --toolchain clang-9&quot;<br>
- Run using a published docker container. This example would need permissio=
n to<br>
=C2=A0 launch additional docker containers to perform the build steps.<br>
=C2=A0 - &quot;docker run kernel-builder --arch arm64 --toolchain clang-9&q=
uot;<br>
- Install using pip, and use it from python as a library<br>
=C2=A0 - &quot;import kernel-builder&quot;<br>
<br>
In the example above, &quot;kernel-builder&quot; is a placeholder for whate=
ver the name<br>
would be.<br>
<br>
The artifacts produced would be similar to the set of artifacts kci_build<b=
r>
produces today, with the addition of a build reproducer script and probably=
<br>
some differences in metadata files.<br>
<br>
Docker support would be optional (you could use a locally installed toolcha=
in),<br>
but allows for arbitrary toolchains to be available and perfect<br>
reproducibility.<br></blockquote><div><br></div>I agree that we need to hav=
e a way to fully reproduce builds and<br>that includes having control over =
the environment, typically a<br>Docker image.=C2=A0 However, I&#39;m a bit =
skeptical about making the tool<br>call Docker rather than have a wrapper t=
o call it.=C2=A0 I think it&#39;s<br>more a matter of hierarchy in the stac=
k, I see it as:<br><br>=C2=A0 docker -&gt; kernel-builder -&gt; make -&gt; =
gcc<br><br>Say, what if someone wanted to use another environment than<br>D=
ocker?=C2=A0 Rather than make it an optional feature, I think it may<br>be =
better to keep it one level higher if we can still generate<br><div>reprodu=
cers like you&#39;re suggesting.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
It&#39;s hard to change kci_build to be anything like this because it&#39;s=
 tightly<br>
coupled with the kernelci-core repo, and kernelci itself. The design above =
also<br>
fundamentally changes how the builder interfaces with docker, such that it<=
br>
becomes supported directly rather than something that&#39;s implemented out=
side the<br>
scope of the builder.<br>
<br>
It&#39;s important that docker is supported directly because it makes the<b=
r>
reproducible build use-case a one-liner, it solves the problem of having to=
 get<br>
python and the builder into the build containers, and it allows for more<br=
>
granular control of the build.<br>
<br>
So, thoughts? How close or how far is this from the roadmap for kci_build a=
s it<br>
stands today? We are likely to start working on this soon, and would really=
<br>
like to work together on it if possible.<br></blockquote><div><br></div><di=
v>Above all, thanks for the detailed proposal and for collaborating</div>on=
 a common kernel build utility to share with KernelCI.=C2=A0 What<br>you&#3=
9;re suggesting makes a lot of sense to me, and it&#39;s broadly in<br>line=
 with where kernelci-core is going.<br><br>The initial goal of kernelci-cor=
e was to decouple the KernelCI<br>steps from Jenkins or any other execution=
 environment.=C2=A0 It has<br>succeeded in this respect as it&#39;s now pos=
sible to do everything<br>on the command line or in other systems such as G=
itlab CI, and<br>you&#39;ve been able to reuse kci_build too.=C2=A0 I think=
 it is important<br>that we keep a central repository with the KernelCI spe=
cific<br>orchestration logic and tools to handle configuration.=C2=A0 That<=
br>should become a proper &quot;kernelci&quot; Python package at some point=
,<br>when the repository has completed its transition.<br><br>Now, this ker=
nelci package should ideally be a very thin layer to<br>just link component=
s together and create pipeline steps.=C2=A0 What I<br>think we should have =
next is a toolbox of low-level stand-alone<br>packages that specialise in o=
nly one task, and I believe this is<br>where it would meet your use-case.=
=C2=A0 For example, I started<br>working on the &quot;scalpel&quot; tool la=
st year to do bisections with the<br>aim of making it independent of Kernel=
CI.=C2=A0 Now I guess we need<br>another tool to do kernel builds following=
 the same approach,<br>maybe call it &quot;spanner&quot; or something const=
ructive like that :)<br><br>That way, we may even keep kci_build with its c=
urrent cli but<br>rather than have all the build steps in kernelci/build.py=
 it<br>would be importing a common module (say, toolbox.spanner for the<br>=
sake of the argument) and your build service would be doing that<br>too.=C2=
=A0 Or there would also be some command line tool provided with<br>the pack=
age to run a build directly.<br><br>Basically, rather than adapting kci_bui=
ld for other purposes, I&#39;m<br>suggesting to create a generic tool that =
can be used by kci_build<br>as well as any other kernel CI system.<br><br>I=
 don&#39;t know how to call this toolbox and where to host it, but<br>it wo=
uld seem wise imho to keep it separate from KernelCI, LKFT<br>or any other =
CI system that would be using it.=C2=A0 It would probably<br>also make sens=
e to at least keep it kernel-centric to focus on a<br>group of use-cases.=
=C2=A0 How does that sound?<br><br>If you agree with this approach, the nex=
t steps would be to find<br>the least common denominator between the use-ca=
ses that we<br>already know about, which I guess are KernelCI and LKFT.=C2=
=A0 I think<br>it&#39;s largely doable, with probably some compromises on a=
ll parts<br>and some built-in flexibility to make this a truly generic tool=
.<br>The details of how to build each artifact, how to use containers,<br>a=
nd the format of the meta-data are probably areas where we may<br>need some=
 custom code to do slightly different things.=C2=A0 But this<br>is like any=
 software library, and it can be done iteratively.<div><br></div><div>Best =
wishes,</div><div>Guillaume</div></div></div>

--0000000000003bece505a3ceec21--
