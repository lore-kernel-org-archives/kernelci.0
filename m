MIME-Version: 1.0
References: <CAP245DXSaoGJ4STssCqa-Fr3eGE7Qu=BGGyNFgZnz+z0gAVXNw@mail.gmail.com>
 <CAH1_8nCuBHuGxgdPWWr0xLTXujeLv+S1obbdqqOJPZ45UZf8fg@mail.gmail.com>
 <CAP245DWZs+4MuSm4SEQLC==sk4F0K8NBMM-f_jc5pe9F8iszpA@mail.gmail.com>
 <CAH1_8nBoT9b3ZjZY=REestht6Z1W5hhA4YwOOvTGr-a19tA3cw@mail.gmail.com>
 <CAP245DWdaDFRX70YyZjtkPYhvWnRdYOHvFLT9HGDkYBJCgwRhg@mail.gmail.com>
 <CAH1_8nAjzQEBVTdQfO2ocHx8NN=oKffKGLyT5BdovSGnrM8evA@mail.gmail.com> <CAP245DU5k60D3Dx5ZLy7SgpiozEUsJemcqMmeomLWx8Q5sQtCg@mail.gmail.com>
In-Reply-To: <CAP245DU5k60D3Dx5ZLy7SgpiozEUsJemcqMmeomLWx8Q5sQtCg@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Fri, 12 Jul 2019 19:50:43 +0100
Message-ID: <CAH1_8nAWW=_hpWWoVy343W=iB83DeOB4yQxACZNQHmJuft+M_g@mail.gmail.com>
Subject: Re: New experimental branch for Linaro Qualcomm Landing Team
Content-Type: multipart/alternative; boundary="000000000000da1118058d80635f"
List-ID: <kernelci.groups.io>
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: kernelci@groups.io, info <info@kernelci.org>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>

--000000000000da1118058d80635f
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 12, 2019 at 4:50 PM Amit Kucheria <amit.kucheria@linaro.org>
wrote:

>
>
> On Wed, 10 Jul, 2019, 16:25 Guillaume Tucker, <guillaume.tucker@gmail.com>
> wrote:
>
>>
>> On Tue, Jul 9, 2019 at 2:24 PM Amit Kucheria <amit.kucheria@linaro.org>
>> wrote:
>>
>>> On Tue, Jul 9, 2019 at 6:32 PM Guillaume Tucker
>>> <guillaume.tucker@gmail.com> wrote:
>>> >
>>> > On Tue, Jul 9, 2019 at 12:09 PM Amit Kucheria <
>>> amit.kucheria@linaro.org> wrote:
>>> >>
>>> >> On Tue, Jul 9, 2019 at 4:27 PM Guillaume Tucker
>>> >> <guillaume.tucker@gmail.com> wrote:
>>> >> >
>>> >> >
>>> >> > On Tue, Jul 9, 2019 at 11:52 AM Amit Kucheria <
>>> amit.kucheria@linaro.org> wrote:
>>> >> >>
>>> >> >> Hi,
>>> >> >>
>>> >> >> I'd like to request a new branch to be tracked by kernelci.org to
>>> >> >> allow more experimental patches that could use much wider testing
>>> >> >> across boards and architectures.
>>> >> >>
>>> >> >> We currently use our 'integration' branch[1] for this but that
>>> causes
>>> >> >> disruption for people who depend on this branch to keep working.
>>>
>>
>> Ah sorry I missed the fact that the integration-linux-qcomlt
>> branch was already built and tested on kernelci.org:
>>
>>   https://kernelci.org/job/qcom-lt/branch/integration-linux-qcomlt/
>>
>> and it seems to be updated roughly once a week.
>>
>> >> >> This experimental branch shouldn't see too many updates and would
>>> >> >> likely only be used to get better testing for experimental series.
>>> >> >> Would you be ok to pick up such a branch[2] into kernelci?
>>> >> >
>>> >> >
>>> >> > The links you've provided don't seem to work, the page says
>>> >> > "No repositories found".
>>> >>
>>> >> Curious. Either I missed a space between the URL and branch name or
>>> >> gmail seems to have combined them in the link. Try
>>> >> https://git.linaro.org/landing-teams/working/qualcomm/kernel.git
>>> >
>>> >
>>> > Oh I see, there was a space between the URL and the branch name.
>>> > Yeah I guess that got mangled somewhere, that link works for me.
>>> >
>>> >>
>>> >> > Generally speaking I would say it's fine, as long as these aren't
>>> >> > downstream branches but experimental patches that are based on
>>> >> > current mainline and intended to be merged upstream.
>>> >>
>>> >> No, these will certainly be mainline-based branches.
>>> >
>>> >
>>> > Great, so yes these look like relevant branches to test on
>>> > kernelci.org.  Which configurations do you need to build?  The
>>> > full range means about 230 builds but if you only care about arm,
>>> > arm64 and x86_64 with just the defconfigs and maybe some qcom arm
>>> > defconfigs that should come down to a much smaller number.
>>> >
>>> > Doing fewer builds means faster turnaround between when you push
>>> > a change and when you get the results, and makes it possible to
>>> > have more development trees for a given build capacity.
>>>
>>> As mentioned earlier, I expect this branch to be used occassionally.
>>> IOW, we won't use it in an automated merge + CI loop. We want to use
>>> it to test instrusive features that might break on other
>>> platforms/architectures/configuration.
>>>
>>> So if it isn't too a huge stress on resources, I'd prefer this branch
>>> to be exposed to the full range of kernelci builds and boot testing.
>>>
>>
>> Right, this was mentioned during the weekly meeting yesterday and
>> yes we can add it on the basis that it doesn't get updated very
>> often.
>>
>> For developer trees like this one, I think the amount of builds
>> should be kept to a lower number than the main trees such as
>> mainline, next, stable, maintainers...  So if it's important to
>> build all the defconfigs, there should be a limit on how often it
>> gets built.  We don't have the ability to regulate this at the
>> moment, so please avoid pushing to these branches more than once
>> a week and it'll be fine.
>>
>> I've made a PR to add this branch:
>>
>>   https://github.com/kernelci/kernelci-core/pull/119
>>
>>
> I noticed this pull request was merged. How long before this becomes
> active? And who will get notifications?
>

It was deployed in production today, I've just sent the notes on
the mailing list.

Recipients are defined here:


https://github.com/kernelci/kernelci-core/blob/master/jenkins/kernel-arch-complete.sh#L106

Essentially, that's "qcomlt-patches@lists.linaro.org"

You should get the first report in a few hours, once the builds
have caught up with the backlog.

Guillaume

--000000000000da1118058d80635f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 12, 2019 at 4:50 PM Amit =
Kucheria &lt;<a href=3D"mailto:amit.kucheria@linaro.org">amit.kucheria@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Jul, 2019, 16:25 Guillaume Tu=
cker, &lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">g=
uillaume.tucker@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 9, 2=
019 at 2:24 PM Amit Kucheria &lt;<a href=3D"mailto:amit.kucheria@linaro.org=
" rel=3D"noreferrer" target=3D"_blank">amit.kucheria@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jul =
9, 2019 at 6:32 PM Guillaume Tucker<br>
&lt;<a href=3D"mailto:guillaume.tucker@gmail.com" rel=3D"noreferrer" target=
=3D"_blank">guillaume.tucker@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Jul 9, 2019 at 12:09 PM Amit Kucheria &lt;<a href=3D"mailto:am=
it.kucheria@linaro.org" rel=3D"noreferrer" target=3D"_blank">amit.kucheria@=
linaro.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jul 9, 2019 at 4:27 PM Guillaume Tucker<br>
&gt;&gt; &lt;<a href=3D"mailto:guillaume.tucker@gmail.com" rel=3D"noreferre=
r" target=3D"_blank">guillaume.tucker@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, Jul 9, 2019 at 11:52 AM Amit Kucheria &lt;<a href=3D"=
mailto:amit.kucheria@linaro.org" rel=3D"noreferrer" target=3D"_blank">amit.=
kucheria@linaro.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I&#39;d like to request a new branch to be tracked by <a =
href=3D"http://kernelci.org" rel=3D"noreferrer noreferrer" target=3D"_blank=
">kernelci.org</a> to<br>
&gt;&gt; &gt;&gt; allow more experimental patches that could use much wider=
 testing<br>
&gt;&gt; &gt;&gt; across boards and architectures.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; We currently use our &#39;integration&#39; branch[1] for =
this but that causes<br>
&gt;&gt; &gt;&gt; disruption for people who depend on this branch to keep w=
orking.<br></blockquote><div><br></div><div>Ah sorry I missed the fact that=
 the integration-linux-qcomlt<br>branch was already built and tested on <a =
href=3D"http://kernelci.org" rel=3D"noreferrer" target=3D"_blank">kernelci.=
org</a>:<br></div><div><br></div><div>=C2=A0 <a href=3D"https://kernelci.or=
g/job/qcom-lt/branch/integration-linux-qcomlt/" rel=3D"noreferrer" target=
=3D"_blank">https://kernelci.org/job/qcom-lt/branch/integration-linux-qcoml=
t/</a><br><br>and it seems to be updated roughly once a week.<br></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; &gt;&gt; This experimental branch shouldn&#39;t see too many updat=
es and would<br>
&gt;&gt; &gt;&gt; likely only be used to get better testing for experimenta=
l series.<br>
&gt;&gt; &gt;&gt; Would you be ok to pick up such a branch[2] into kernelci=
?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The links you&#39;ve provided don&#39;t seem to work, the pag=
e says<br>
&gt;&gt; &gt; &quot;No repositories found&quot;.<br>
&gt;&gt;<br>
&gt;&gt; Curious. Either I missed a space between the URL and branch name o=
r<br>
&gt;&gt; gmail seems to have combined them in the link. Try<br>
&gt;&gt; <a href=3D"https://git.linaro.org/landing-teams/working/qualcomm/k=
ernel.git" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git.lina=
ro.org/landing-teams/working/qualcomm/kernel.git</a><br>
&gt;<br>
&gt;<br>
&gt; Oh I see, there was a space between the URL and the branch name.<br>
&gt; Yeah I guess that got mangled somewhere, that link works for me.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; Generally speaking I would say it&#39;s fine, as long as thes=
e aren&#39;t<br>
&gt;&gt; &gt; downstream branches but experimental patches that are based o=
n<br>
&gt;&gt; &gt; current mainline and intended to be merged upstream.<br>
&gt;&gt;<br>
&gt;&gt; No, these will certainly be mainline-based branches.<br>
&gt;<br>
&gt;<br>
&gt; Great, so yes these look like relevant branches to test on<br>
&gt; <a href=3D"http://kernelci.org" rel=3D"noreferrer noreferrer" target=
=3D"_blank">kernelci.org</a>.=C2=A0 Which configurations do you need to bui=
ld?=C2=A0 The<br>
&gt; full range means about 230 builds but if you only care about arm,<br>
&gt; arm64 and x86_64 with just the defconfigs and maybe some qcom arm<br>
&gt; defconfigs that should come down to a much smaller number.<br>
&gt;<br>
&gt; Doing fewer builds means faster turnaround between when you push<br>
&gt; a change and when you get the results, and makes it possible to<br>
&gt; have more development trees for a given build capacity.<br>
<br>
As mentioned earlier, I expect this branch to be used occassionally.<br>
IOW, we won&#39;t use it in an automated merge + CI loop. We want to use<br=
>
it to test instrusive features that might break on other<br>
platforms/architectures/configuration.<br>
<br>
So if it isn&#39;t too a huge stress on resources, I&#39;d prefer this bran=
ch<br>
to be exposed to the full range of kernelci builds and boot testing.<br></b=
lockquote><div>=C2=A0</div><div>Right, this was mentioned during the weekly=
 meeting yesterday and<br>yes we can add it on the basis that it doesn&#39;=
t get updated very<br>often.<br><br>For developer trees like this one, I th=
ink the amount of builds<br>should be kept to a lower number than the main =
trees such as<br>mainline, next, stable, maintainers...=C2=A0 So if it&#39;=
s important to<br>build all the defconfigs, there should be a limit on how =
often it<br>gets built.=C2=A0 We don&#39;t have the ability to regulate thi=
s at the<br>moment, so please avoid pushing to these branches more than onc=
e<br>a week and it&#39;ll be fine.<br></div><div><br></div><div>I&#39;ve ma=
de a PR to add this branch:<br><br>=C2=A0 <a href=3D"https://github.com/ker=
nelci/kernelci-core/pull/119" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/kernelci/kernelci-core/pull/119</a><br></div><div><br></div><div=
></div></div></div></blockquote></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I noticed this pull request was merged. How long before this beco=
mes active? And who will get notifications?</div></div></blockquote><div><b=
r></div><div>It was deployed in production today, I&#39;ve just sent the no=
tes on<br>the mailing list.<br><br>Recipients are defined here:<br><br>=C2=
=A0 <a href=3D"https://github.com/kernelci/kernelci-core/blob/master/jenkin=
s/kernel-arch-complete.sh#L106">https://github.com/kernelci/kernelci-core/b=
lob/master/jenkins/kernel-arch-complete.sh#L106</a><br><br>Essentially, tha=
t&#39;s &quot;<a href=3D"mailto:qcomlt-patches@lists.linaro.org">qcomlt-pat=
ches@lists.linaro.org</a>&quot;<br></div><div><br></div><div>You should get=
 the first report in a few hours, once the builds<br>have caught up with th=
e backlog.<br></div><div><br></div><div>Guillaume</div></div></div>

--000000000000da1118058d80635f--
