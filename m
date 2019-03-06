MIME-Version: 1.0
References: <CAHRSSEzE-foFJaS4mmaosksXofwg8TaK=6ro8HFPGMV_d6=8sg@mail.gmail.com>
 <CABXOdTerkt85X856TDx9RGEymxm6yrqkkbyPUssJJp8Sm37J2A@mail.gmail.com>
In-Reply-To: <CABXOdTerkt85X856TDx9RGEymxm6yrqkkbyPUssJJp8Sm37J2A@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Wed, 6 Mar 2019 15:54:35 +0000
Message-ID: <CAH1_8nAkms+ioW2EJNo8=f+5d=tF3fQZRAsd1-mofvaiRYzXfA@mail.gmail.com>
Subject: Re: branches not building?
Content-Type: multipart/alternative; boundary="00000000000049de9705836f0269"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, groeck@google.com
Cc: info@kernelci.org

--00000000000049de9705836f0269
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 5, 2019 at 5:06 PM Guenter Roeck via Groups.Io <groeck=
google.com@groups.io> wrote:

> https://kernelci.org/job/ suggests that there have been several builds
> since yesterday. Maybe the build system was busy.
>
> Guenter
>
> On Tue, Mar 5, 2019 at 8:49 AM 'Todd Kjos' via info <info@kernelci.org>
> wrote:
>
>> A bunch of our Android branches were modified yesterday, but there were
>> no kernelci builds... are they no longer being tested? Here's a list of
>> branches that had changes yesterday and haven't been built:
>>
>> android-3.18-o-release
>> android-3.18-o-mr1
>> android-4.4-o-release
>> android-4.4-o-mr1
>> android-4.4-p-release
>> android-4.9-o-release
>> android-4.9-o-mr1
>> android-4.9-p-release
>> android-4.14-p-release
>>
>> They were changed at about 4pm PST yesterday (~16 hours ago) which is
>> normally plenty of time to get kernelci results...
>>
>
Err, I think these release branches might have been lost in
translation during the move from Jenkins Matrix job configuration
to the new YAML-based configuration.  I don't see them in the
file:


https://github.com/kernelci/kernelci-core/blob/5b8b00504e930d13645162a6e308e4ba0b1f0c51/build-configs.yaml#L188

Can you confirm you still don't have the build results you
expected?  In which case I can make a pull request to add them.
I have to say that's quite a large number of downstream branches
though...

Guillaume

>

--00000000000049de9705836f0269
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Mar 5, 2019 at 5:06 PM Guenter Roeck via Groups.Io &lt;groeck=3D<a hre=
f=3D"mailto:google.com@groups.io">google.com@groups.io</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div><a href=3D"https://kernelci.org/job/" ta=
rget=3D"_blank">https://kernelci.org/job/</a> suggests that there have been=
 several builds since yesterday. Maybe the build system was busy.<br></div>=
<div><br></div><div>Guenter</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Mar 5, 2019 at 8:49 AM &#39;Todd Kjos&#3=
9; via info &lt;<a href=3D"mailto:info@kernelci.org" target=3D"_blank">info=
@kernelci.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr">A bunch of our Android branches were modified=
 yesterday, but there were no kernelci builds... are they no longer being t=
ested? Here&#39;s a list of branches that had changes yesterday and haven&#=
39;t been built:<div><br></div><div>android-3.18-o-release</div><div>androi=
d-3.18-o-mr1</div><div>android-4.4-o-release</div><div>android-4.4-o-mr1</d=
iv><div>android-4.4-p-release</div><div>android-4.9-o-release</div><div>and=
roid-4.9-o-mr1</div><div>android-4.9-p-release</div><div>android-4.14-p-rel=
ease</div><div><br></div><div>They were changed at about 4pm PST yesterday =
(~16 hours ago) which is normally plenty of time to get kernelci results...=
</div></div></blockquote></div></div></div></div></blockquote><div><br></di=
v><div><div><div>Err, I think these release branches might have been lost i=
n</div><div>translation during the move from Jenkins Matrix job configurati=
on</div><div>to the new YAML-based configuration.=C2=A0 I don&#39;t see the=
m in the</div><div>file:</div></div><div><br></div><div>=C2=A0 <a href=3D"h=
ttps://github.com/kernelci/kernelci-core/blob/5b8b00504e930d13645162a6e308e=
4ba0b1f0c51/build-configs.yaml#L188">https://github.com/kernelci/kernelci-c=
ore/blob/5b8b00504e930d13645162a6e308e4ba0b1f0c51/build-configs.yaml#L188</=
a></div><div><br></div><div>Can you confirm you still don&#39;t have the bu=
ild results you</div><div>expected?=C2=A0 In which case I can make a pull r=
equest to add them.</div><div>I have to say that&#39;s quite a large number=
 of downstream branches</div><div>though...</div></div><div><br></div><div>=
Guillaume</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

<p></p><p></p></blockquote></div></div></div></div>

--00000000000049de9705836f0269--
