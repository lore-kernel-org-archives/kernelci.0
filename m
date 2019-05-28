MIME-Version: 1.0
References: <299272045.11819252.1554465036421.JavaMail.zimbra@redhat.com>
 <457016061.11846096.1554475313006.JavaMail.zimbra@redhat.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF977191AE@USCULXMSG01.am.sony.com>
 <20190515203334.lbhpqpdyulqztr5c@xps.therub.org> <A0783550-C80A-4037-9B18-256AEA3CDAA7@linaro.org>
 <1070842434.21130927.1558366329557.JavaMail.zimbra@redhat.com>
In-Reply-To: <1070842434.21130927.1558366329557.JavaMail.zimbra@redhat.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Tue, 28 May 2019 09:24:44 +0100
Message-ID: <CAH1_8nAazaXOuuPjoh9qg9Yt+Q7wpPN8uZWa-ehqvGMnKp3W8w@mail.gmail.com>
Subject: Re: A common place for CI results?
Content-Type: multipart/alternative; boundary="00000000000060e9fd0589ee66b3"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, vkabatov@redhat.com
Cc: Tom Gall <tom.gall@linaro.org>, Dan Rue <dan.rue@linaro.org>, Tim Bird <Tim.Bird@sony.com>, automated-testing@yoctoproject.org, info@kernelci.org

--00000000000060e9fd0589ee66b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, May 20, 2019 at 4:38 PM Veronika Kabatova <vkabatov@redhat.com>
wrote:

>
>
> ----- Original Message -----
> > From: "Tom Gall" <tom.gall@linaro.org>
> > To: kernelci@groups.io, "Dan Rue" <dan.rue@linaro.org>
> > Cc: "Tim Bird" <Tim.Bird@sony.com>, vkabatov@redhat.com,
> automated-testing@yoctoproject.org, info@kernelci.org
> > Sent: Wednesday, May 15, 2019 11:06:33 PM
> > Subject: Re: A common place for CI results?
> >
> >
> >
> > > On May 15, 2019, at 3:33 PM, Dan Rue <dan.rue@linaro.org> wrote:
> > >
> > > On Tue, May 14, 2019 at 11:01:35PM +0000, Tim.Bird@sony.com wrote:
> > >>
> > >>
> > >>> -----Original Message-----
> > >>> From: Veronika Kabatova
> > >>>
> > >>> Hi,
> > >>>
> > >>> as we know from this list, there's plenty CI systems doing some
> testing
> > >>> on
> > >>> the
> > >>> upstream kernels (and maybe some others we don't know about).
> > >>>
> > >>> It would be great if there was a single common place where all the =
CI
> > >>> systems
> > >>> can put their results. This would make it much easier for the kerne=
l
> > >>> maintainers and developers to see testing status since they only
> need to
> > >>> check one place instead of having a list of sites/mailing lists whe=
re
> > >>> each CI
> > >>> posts their contributions.
> > >>>
> > >>>
> > >>> A few weeks ago, with some people we've been talking about
> kernelci.org
> > >>> being
> > >>> in a good place to act as the central upstream kernel CI piece that
> most
> > >>> maintainers already know about. So I'm wondering if it would be
> possible
> > >>> for
> > >>> kernelci to also act as an aggregator of all results? There's
> already an
> > >>> API
> > >>> for publishing a report [0] so it shouldn't be too hard to adjust i=
t
> to
> > >>> handle and show more information. I also found the beta version for
> test
> > >>> results [1] so actually, most of the needed functionality seems to =
be
> > >>> already
> > >>> there. Since there will be multiple CI systems, the source and
> contact
> > >>> point
> > >>> for the contributor (so maintainers know whom to ask about results =
if
> > >>> needed)
> > >>> would likely be the only missing essential data point.
> > >>>
> > >>>
> > >>> The common place for results would also make it easier for new CI
> systems
> > >>> to
> > >>> get involved with upstream. There are likely other companies out
> there
> > >>> running
> > >>> some tests on kernel internally but don't publish the results
> anywhere.
> > >>> Only
> > >>> adding some API calls into their code (with the data they are
> allowed to
> > >>> publish) would make it very simple for them to start contributing.
> If we
> > >>> want
> > >>> to make them interested, the starting point needs to be trivial.
> > >>> Different
> > >>> companies have different setups and policies and they might not be
> able
> > >>> to
> > >>> fulfill arbitrary requirements so they opt to not get involved at
> all,
> > >>> which
> > >>> is a shame because their results can be useful. After the initial
> > >>> "onboarding"
> > >>> step they might be willing to contribute more and more too.
> > >>>
> > >>>
> > >>> Please let me know if the idea makes sense or if something similar =
is
> > >>> already
> > >>> in plans. I'd be happy to contribute to the effort because I believ=
e
> it
> > >>> would
> > >>> make everyone's life easier and we'd all benefit from it (and maybe
> > >>> someone
> > >>> else from my team would be willing to help out too if needed).
> > >>
> > >> I never responded to this,
> > >
> > > yea, you did. ;)
> > >
> > >> but this sounds like a really good idea to me. I don't care much whi=
ch
> > >> backend we aggregate to, but it would be good as a community to star=
t
> > >> using one service to start with.  It would help to find issues with
> > >> the API, or the results schema, if multiple people started using it.
> > >>
> > >> I know that people using Fuego are sending data to their own instanc=
es
> > >> of KernelCI.  But I don't know what the issues are for sending this
> > >> data to a shared KernelCI service.
> > >>
> > >> I would be interested in hooking up my lab to send Fuego results to
> > >> KernelCI.  This would be a good exercise.  I'm not sure what the nex=
t
> > >> steps would be, but maybe we could discuss this on the next automate=
d
> > >> testing conference call.
> > >
> > > OK here's my idea.
> > >
> > > I don't personally think kernelci (or LKFT) are set up to aggregate
> > > results currently. We have too many assumptions about where tests are
> > > coming from, how things are built, etc. In other words, dealing with
> > > noisy data is going to be non-trivial in any existing project.
> >
> > I completely agree.
> >
>
> This is a good point. I'm totally fine with having a separate independent
> place for aggregation.
>
> > > I would propose aggregating data into something like google's BigQuer=
y.
> > > This has a few benefits:
> > > - Non-opinionated place to hold structured data
> > > - Allows many downstream use-cases
> > > - Managed hosting, and data is publicly available
> > > - Storage is sponsored by google as a part of
> > >  https://cloud.google.com/bigquery/public-data/
> > > - First 1TB of query per 'project' is free, and users pay for more
> > >  queries than that
> >
> > I very much like this idea. I do lots of android kernel testing
> > and being able to work with / compare / contribute to what
> > is essentially a pile of data in BQ would be great. As an
> > end user working with the data I=E2=80=99d also have lots of dash
> > board options to customize and share queries with others.
> >
> > > With storage taken care of, how do we get the data in?
> >
> > > First, we'll need some canonical data structure defined. I would
> > > approach defining the canonical structure in conjunction with the fir=
st
> > > few projects that are interested in contributing their results. Each
> > > project will have an ETL pipeline which will extract the test results
> > > from a given project (such as kernelci, lkft, etc), translate it into
> > > the canonical data structure, and load it into the google bigquery
> > > dataset at a regular interval or in real-time. The translation layer =
is
> > > where things like test names are handled.
> >
>
> +1, exactly how I imagined this part.
>
> > Exactly. I would hope that the various projects that are producing
> > data would be motived to plug in. After all, it makes the data
> > they are producing more useful and available to a larger group
> > of people.
> >
> > > The things this leaves me wanting are:
> > > - raw data storage. It would be nice if raw data were stored somewher=
e
> > >  permanent in some intermediary place so that later implementations
> > >  could happen, and for data that doesn't fit into whatever structure =
we
> > >  end up with.
> >
> > I agree.
>
> +1
>
> >
> > > - time, to actually try it and find the gaps. This is just an idea I'=
ve
> > >  been thinking about. Anyone with experience here that can help flesh
> > >  this out?
> >
> > I=E2=80=99m willing to lend a hand.
> >
>
> Thanks for starting up a specific proposal! I agree with everything that
> was
> brought up. I'll try to find time to participate in the implementation pa=
rt
> too (although my experience with data storage is.. limited, I should be
> able
> to help out with the structure prototyping and maybe other parts too).
>

This all sounds great: having a common location to store the
results that is scalable and definitions of test case names.

However, there is a whole layer of logic above and around this
which KernelCI does, and I'm sure other CI systems also do with
some degree of overlap.  So it seems to me that solving how to
deal with the results is only one piece in the puzzle to get a
common CI architecture for upstream kernel testing.  Sorry I'm a
bit late to the party so I'll add my 2=C2=A2 here...

Around the end of last year I made this document and mentioned it
on this list, about making KernelCI more modular:


https://docs.google.com/document/d/15F42HdHTO6NbSL53_iLl77lfe1XQKdWaHAf7XCN=
kKD8/edit?usp=3Dsharing
  https://groups.io/g/kernelci/topic/kernelci_modular_pipeline/29692355

The idea is to make it possible to have alternative components in
the KernelCI "pipeline".  Right now, KernelCI has these
components:

* Jenkins job to monitor git branches and build kernels
* LAVA to run tests
* Custom backend and storage server to keep binaries and data
* Custom web frontend to show the results

They could all be replaced or used in conjunction with
alternative build systems, database engines, test lab schedulers
and dashboards.  The key thing is the code orchestrating all
this, which is kept in the kernelci-core repository.

For example, when a change has been detected in a tree, rather
than triggering kernel builds on Jenkins there could be a request
sent to another build system to do that elsewhere.  Likewise,
when some builds are ready to be tested, jobs could be scheduled
in non-LAVA labs simply by sending another kind of HTTP request
than the ones we're currently sending to the LAVA APIs.  This
could be easily described in some config files, in fact we
already have one with the list of labs where to submit jobs to.
Builds and tests are configured in YAML files in KernelCI, which
could easily be extended too with new attributes.

The big advantage of having a central way to orchestrate all this
is that results are going to be consistent and higher-level
features can be enabled: each tree will be sampled at the same
commit, so we don't end up with one CI lab running a version of
mainline a few patches than another one etc...  It means we can
expand some KernelCI features to a larger ecosystem of CI labs,
such as:

* redundancy checks when the same test / hardware is tested in
  multiple places (say, if a RPi fails to boot in a LAVA lab but
  not in CKI's lab...)

* regression tracking across the whole spectrum of CI labs

* common reports for each single kernel revision being tested

* bisections extended to non-LAVA labs

It feels like a diagram would be needed to really give an idea of
how this would work.  APIs and callback mechanisms would need to
be well defined to have clear entry points for the various
components in a modular system like this.  I think we would be
able to reuse some of the things currently used by KernelCI and
improve them, taking into account what other CI labs have been
doing (LKFT, CKI...).

I'm only scratching the surface here, but I wanted to raise this
point to see if others shared the same vision.  It would be
unfortunate if we came up with a great solution focused on
results, but then realised that it had big design limitations
when trying to add more abstract functionality across all the
contributing CI labs.

Well, I tried to keep it short - hope this makes any sense.

Cheers,
Guillaume

--00000000000060e9fd0589ee66b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, May 20, 2019 at 4:38 PM Veronika Kaba=
tova &lt;<a href=3D"mailto:vkabatov@redhat.com">vkabatov@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; From: &quot;Tom Gall&quot; &lt;<a href=3D"mailto:tom.gall@linaro.org" =
target=3D"_blank">tom.gall@linaro.org</a>&gt;<br>
&gt; To: <a href=3D"mailto:kernelci@groups.io" target=3D"_blank">kernelci@g=
roups.io</a>, &quot;Dan Rue&quot; &lt;<a href=3D"mailto:dan.rue@linaro.org"=
 target=3D"_blank">dan.rue@linaro.org</a>&gt;<br>
&gt; Cc: &quot;Tim Bird&quot; &lt;<a href=3D"mailto:Tim.Bird@sony.com" targ=
et=3D"_blank">Tim.Bird@sony.com</a>&gt;, <a href=3D"mailto:vkabatov@redhat.=
com" target=3D"_blank">vkabatov@redhat.com</a>, <a href=3D"mailto:automated=
-testing@yoctoproject.org" target=3D"_blank">automated-testing@yoctoproject=
.org</a>, <a href=3D"mailto:info@kernelci.org" target=3D"_blank">info@kerne=
lci.org</a><br>
&gt; Sent: Wednesday, May 15, 2019 11:06:33 PM<br>
&gt; Subject: Re: A common place for CI results?<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; On May 15, 2019, at 3:33 PM, Dan Rue &lt;<a href=3D"mailto:dan.ru=
e@linaro.org" target=3D"_blank">dan.rue@linaro.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On Tue, May 14, 2019 at 11:01:35PM +0000, <a href=3D"mailto:Tim.B=
ird@sony.com" target=3D"_blank">Tim.Bird@sony.com</a> wrote:<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;&gt; -----Original Message-----<br>
&gt; &gt;&gt;&gt; From: Veronika Kabatova<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; Hi,<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; as we know from this list, there&#39;s plenty CI systems =
doing some testing<br>
&gt; &gt;&gt;&gt; on<br>
&gt; &gt;&gt;&gt; the<br>
&gt; &gt;&gt;&gt; upstream kernels (and maybe some others we don&#39;t know=
 about).<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; It would be great if there was a single common place wher=
e all the CI<br>
&gt; &gt;&gt;&gt; systems<br>
&gt; &gt;&gt;&gt; can put their results. This would make it much easier for=
 the kernel<br>
&gt; &gt;&gt;&gt; maintainers and developers to see testing status since th=
ey only need to<br>
&gt; &gt;&gt;&gt; check one place instead of having a list of sites/mailing=
 lists where<br>
&gt; &gt;&gt;&gt; each CI<br>
&gt; &gt;&gt;&gt; posts their contributions.<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; A few weeks ago, with some people we&#39;ve been talking =
about <a href=3D"http://kernelci.org" rel=3D"noreferrer" target=3D"_blank">=
kernelci.org</a><br>
&gt; &gt;&gt;&gt; being<br>
&gt; &gt;&gt;&gt; in a good place to act as the central upstream kernel CI =
piece that most<br>
&gt; &gt;&gt;&gt; maintainers already know about. So I&#39;m wondering if i=
t would be possible<br>
&gt; &gt;&gt;&gt; for<br>
&gt; &gt;&gt;&gt; kernelci to also act as an aggregator of all results? The=
re&#39;s already an<br>
&gt; &gt;&gt;&gt; API<br>
&gt; &gt;&gt;&gt; for publishing a report [0] so it shouldn&#39;t be too ha=
rd to adjust it to<br>
&gt; &gt;&gt;&gt; handle and show more information. I also found the beta v=
ersion for test<br>
&gt; &gt;&gt;&gt; results [1] so actually, most of the needed functionality=
 seems to be<br>
&gt; &gt;&gt;&gt; already<br>
&gt; &gt;&gt;&gt; there. Since there will be multiple CI systems, the sourc=
e and contact<br>
&gt; &gt;&gt;&gt; point<br>
&gt; &gt;&gt;&gt; for the contributor (so maintainers know whom to ask abou=
t results if<br>
&gt; &gt;&gt;&gt; needed)<br>
&gt; &gt;&gt;&gt; would likely be the only missing essential data point.<br=
>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; The common place for results would also make it easier fo=
r new CI systems<br>
&gt; &gt;&gt;&gt; to<br>
&gt; &gt;&gt;&gt; get involved with upstream. There are likely other compan=
ies out there<br>
&gt; &gt;&gt;&gt; running<br>
&gt; &gt;&gt;&gt; some tests on kernel internally but don&#39;t publish the=
 results anywhere.<br>
&gt; &gt;&gt;&gt; Only<br>
&gt; &gt;&gt;&gt; adding some API calls into their code (with the data they=
 are allowed to<br>
&gt; &gt;&gt;&gt; publish) would make it very simple for them to start cont=
ributing. If we<br>
&gt; &gt;&gt;&gt; want<br>
&gt; &gt;&gt;&gt; to make them interested, the starting point needs to be t=
rivial.<br>
&gt; &gt;&gt;&gt; Different<br>
&gt; &gt;&gt;&gt; companies have different setups and policies and they mig=
ht not be able<br>
&gt; &gt;&gt;&gt; to<br>
&gt; &gt;&gt;&gt; fulfill arbitrary requirements so they opt to not get inv=
olved at all,<br>
&gt; &gt;&gt;&gt; which<br>
&gt; &gt;&gt;&gt; is a shame because their results can be useful. After the=
 initial<br>
&gt; &gt;&gt;&gt; &quot;onboarding&quot;<br>
&gt; &gt;&gt;&gt; step they might be willing to contribute more and more to=
o.<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; Please let me know if the idea makes sense or if somethin=
g similar is<br>
&gt; &gt;&gt;&gt; already<br>
&gt; &gt;&gt;&gt; in plans. I&#39;d be happy to contribute to the effort be=
cause I believe it<br>
&gt; &gt;&gt;&gt; would<br>
&gt; &gt;&gt;&gt; make everyone&#39;s life easier and we&#39;d all benefit =
from it (and maybe<br>
&gt; &gt;&gt;&gt; someone<br>
&gt; &gt;&gt;&gt; else from my team would be willing to help out too if nee=
ded).<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; I never responded to this,<br>
&gt; &gt; <br>
&gt; &gt; yea, you did. ;)<br>
&gt; &gt; <br>
&gt; &gt;&gt; but this sounds like a really good idea to me. I don&#39;t ca=
re much which<br>
&gt; &gt;&gt; backend we aggregate to, but it would be good as a community =
to start<br>
&gt; &gt;&gt; using one service to start with.=C2=A0 It would help to find =
issues with<br>
&gt; &gt;&gt; the API, or the results schema, if multiple people started us=
ing it.<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; I know that people using Fuego are sending data to their own =
instances<br>
&gt; &gt;&gt; of KernelCI.=C2=A0 But I don&#39;t know what the issues are f=
or sending this<br>
&gt; &gt;&gt; data to a shared KernelCI service.<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; I would be interested in hooking up my lab to send Fuego resu=
lts to<br>
&gt; &gt;&gt; KernelCI.=C2=A0 This would be a good exercise.=C2=A0 I&#39;m =
not sure what the next<br>
&gt; &gt;&gt; steps would be, but maybe we could discuss this on the next a=
utomated<br>
&gt; &gt;&gt; testing conference call.<br>
&gt; &gt; <br>
&gt; &gt; OK here&#39;s my idea.<br>
&gt; &gt; <br>
&gt; &gt; I don&#39;t personally think kernelci (or LKFT) are set up to agg=
regate<br>
&gt; &gt; results currently. We have too many assumptions about where tests=
 are<br>
&gt; &gt; coming from, how things are built, etc. In other words, dealing w=
ith<br>
&gt; &gt; noisy data is going to be non-trivial in any existing project.<br=
>
&gt; <br>
&gt; I completely agree.<br>
&gt; <br>
<br>
This is a good point. I&#39;m totally fine with having a separate independe=
nt<br>
place for aggregation.<br>
<br>
&gt; &gt; I would propose aggregating data into something like google&#39;s=
 BigQuery.<br>
&gt; &gt; This has a few benefits:<br>
&gt; &gt; - Non-opinionated place to hold structured data<br>
&gt; &gt; - Allows many downstream use-cases<br>
&gt; &gt; - Managed hosting, and data is publicly available<br>
&gt; &gt; - Storage is sponsored by google as a part of<br>
&gt; &gt;=C2=A0 <a href=3D"https://cloud.google.com/bigquery/public-data/" =
rel=3D"noreferrer" target=3D"_blank">https://cloud.google.com/bigquery/publ=
ic-data/</a><br>
&gt; &gt; - First 1TB of query per &#39;project&#39; is free, and users pay=
 for more<br>
&gt; &gt;=C2=A0 queries than that<br>
&gt; <br>
&gt; I very much like this idea. I do lots of android kernel testing<br>
&gt; and being able to work with / compare / contribute to what<br>
&gt; is essentially a pile of data in BQ would be great. As an<br>
&gt; end user working with the data I=E2=80=99d also have lots of dash<br>
&gt; board options to customize and share queries with others.<br>
&gt; <br>
&gt; &gt; With storage taken care of, how do we get the data in?<br>
&gt; <br>
&gt; &gt; First, we&#39;ll need some canonical data structure defined. I wo=
uld<br>
&gt; &gt; approach defining the canonical structure in conjunction with the=
 first<br>
&gt; &gt; few projects that are interested in contributing their results. E=
ach<br>
&gt; &gt; project will have an ETL pipeline which will extract the test res=
ults<br>
&gt; &gt; from a given project (such as kernelci, lkft, etc), translate it =
into<br>
&gt; &gt; the canonical data structure, and load it into the google bigquer=
y<br>
&gt; &gt; dataset at a regular interval or in real-time. The translation la=
yer is<br>
&gt; &gt; where things like test names are handled.<br>
&gt; <br>
<br>
+1, exactly how I imagined this part.<br>
<br>
&gt; Exactly. I would hope that the various projects that are producing<br>
&gt; data would be motived to plug in. After all, it makes the data<br>
&gt; they are producing more useful and available to a larger group<br>
&gt; of people.<br>
&gt; <br>
&gt; &gt; The things this leaves me wanting are:<br>
&gt; &gt; - raw data storage. It would be nice if raw data were stored some=
where<br>
&gt; &gt;=C2=A0 permanent in some intermediary place so that later implemen=
tations<br>
&gt; &gt;=C2=A0 could happen, and for data that doesn&#39;t fit into whatev=
er structure we<br>
&gt; &gt;=C2=A0 end up with.<br>
&gt; <br>
&gt; I agree.<br>
<br>
+1<br>
<br>
&gt; <br>
&gt; &gt; - time, to actually try it and find the gaps. This is just an ide=
a I&#39;ve<br>
&gt; &gt;=C2=A0 been thinking about. Anyone with experience here that can h=
elp flesh<br>
&gt; &gt;=C2=A0 this out?<br>
&gt; <br>
&gt; I=E2=80=99m willing to lend a hand.<br>
&gt; <br>
<br>
Thanks for starting up a specific proposal! I agree with everything that wa=
s<br>
brought up. I&#39;ll try to find time to participate in the implementation =
part<br>
too (although my experience with data storage is.. limited, I should be abl=
e<br>
to help out with the structure prototyping and maybe other parts too).<br><=
/blockquote><div><br></div>This all sounds great: having a common location =
to store the<br>results that is scalable and definitions of test case names=
.<br><br>However, there is a whole layer of logic above and around this<br>=
which KernelCI does, and I&#39;m sure other CI systems also do with<br>some=
 degree of overlap.=C2=A0 So it seems to me that solving how to<br>deal wit=
h the results is only one piece in the puzzle to get a<br>common CI archite=
cture for upstream kernel testing.=C2=A0 Sorry I&#39;m a<br>bit late to the=
 party so I&#39;ll add my 2=C2=A2 here...<br><br>Around the end of last yea=
r I made this document and mentioned it<br>on this list, about making Kerne=
lCI more modular:<br><br>=C2=A0 <a href=3D"https://docs.google.com/document=
/d/15F42HdHTO6NbSL53_iLl77lfe1XQKdWaHAf7XCNkKD8/edit?usp=3Dsharing">https:/=
/docs.google.com/document/d/15F42HdHTO6NbSL53_iLl77lfe1XQKdWaHAf7XCNkKD8/ed=
it?usp=3Dsharing</a><br>=C2=A0 <a href=3D"https://groups.io/g/kernelci/topi=
c/kernelci_modular_pipeline/29692355">https://groups.io/g/kernelci/topic/ke=
rnelci_modular_pipeline/29692355</a><br><br>The idea is to make it possible=
 to have alternative components in<br>the KernelCI &quot;pipeline&quot;.=C2=
=A0 Right now, KernelCI has these<br>components:<br><br>* Jenkins job to mo=
nitor git branches and build kernels<br>* LAVA to run tests<br>* Custom bac=
kend and storage server to keep binaries and data<br>* Custom web frontend =
to show the results<br><br>They could all be replaced or used in conjunctio=
n with<br>alternative build systems, database engines, test lab schedulers<=
br>and dashboards.=C2=A0 The key thing is the code orchestrating all<br>thi=
s, which is kept in the kernelci-core repository.<br><br>For example, when =
a change has been detected in a tree, rather<br>than triggering kernel buil=
ds on Jenkins there could be a request<br>sent to another build system to d=
o that elsewhere.=C2=A0 Likewise,<br>when some builds are ready to be teste=
d, jobs could be scheduled<br>in non-LAVA labs simply by sending another ki=
nd of HTTP request<br>than the ones we&#39;re currently sending to the LAVA=
 APIs.=C2=A0 This<br>could be easily described in some config files, in fac=
t we<br>already have one with the list of labs where to submit jobs to.<br>=
Builds and tests are configured in YAML files in KernelCI, which<br>could e=
asily be extended too with new attributes.<br><br>The big advantage of havi=
ng a central way to orchestrate all this<br>is that results are going to be=
 consistent and higher-level<br>features can be enabled: each tree will be =
sampled at the same<br>commit, so we don&#39;t end up with one CI lab runni=
ng a version of<br>mainline a few patches than another one etc...=C2=A0 It =
means we can<br>expand some KernelCI features to a larger ecosystem of CI l=
abs,<br>such as:<br><br>* redundancy checks when the same test / hardware i=
s tested in<br>=C2=A0 multiple places (say, if a RPi fails to boot in a LAV=
A lab but<br>=C2=A0 not in CKI&#39;s lab...)<br><br>* regression tracking a=
cross the whole spectrum of CI labs<br><br>* common reports for each single=
 kernel revision being tested<br><br>* bisections extended to non-LAVA labs=
<br><br>It feels like a diagram would be needed to really give an idea of<b=
r>how this would work.=C2=A0 APIs and callback mechanisms would need to<br>=
be well defined to have clear entry points for the various<br>components in=
 a modular system like this.=C2=A0 I think we would be<br>able to reuse som=
e of the things currently used by KernelCI and<br>improve them, taking into=
 account what other CI labs have been<br>doing (LKFT, CKI...).<br><br>I&#39=
;m only scratching the surface here, but I wanted to raise this<br>point to=
 see if others shared the same vision.=C2=A0 It would be<br>unfortunate if =
we came up with a great solution focused on<br>results, but then realised t=
hat it had big design limitations<br>when trying to add more abstract funct=
ionality across all the<br>contributing CI labs.<br><br><div>Well, I tried =
to keep it short - hope this makes any sense.=C2=A0</div><div><br></div><di=
v>Cheers,</div><div>Guillaume</div></div></div>

--00000000000060e9fd0589ee66b3--
