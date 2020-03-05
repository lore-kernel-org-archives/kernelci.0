MIME-Version: 1.0
References: <CAHRSSEy0WwprMwvLP1ZUXpi66o5ObwD_zvrs_jjmNED_Sfi8gg@mail.gmail.com>
 <CAH1_8nBqa1Dy0pNJwGoSVjW--S2zBusf8H+tG=BXw+5zvHJBbw@mail.gmail.com>
In-Reply-To: <CAH1_8nBqa1Dy0pNJwGoSVjW--S2zBusf8H+tG=BXw+5zvHJBbw@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 5 Mar 2020 14:16:31 -0800
Message-ID: <CAHRSSEyHe6SjJiZ45hyKR=8P3jN+zQq5p+mZSmuiBK7qng41OQ@mail.gmail.com>
Subject: Re: dumb question regarding "x86_64_defconfig+kselftest"
Content-Type: multipart/alternative; boundary="00000000000049b41805a022e489"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>

--00000000000049b41805a022e489
Content-Type: text/plain; charset="UTF-8"

Thanks Guillaume. I guess I wasn't missing "something obvious" :).

On Thu, Mar 5, 2020 at 1:50 PM Guillaume Tucker <guillaume.tucker@gmail.com>
wrote:

> Hi Todd,
>
> On Thu, Mar 5, 2020 at 7:42 PM Todd Kjos via Groups.Io <tkjos=
> google.com@groups.io> wrote:
>
>> I'm probably missing something obvious, but I have a failure for the
>> "x86_64_defconfig+kselftest" build of the android-4.19 branch. There is no
>> failure with the "x86_64_defconfig" build.
>>
>> How do I reproduce the "+kselftest"? I don't see any "kselftest" string
>> in the build.log.
>>
>
> The +kselftest syntax is a KernelCI convention to show that a
> kselftest config fragment was added on top of the base defconfig.
> The code that generates the fragment can be found here:
>
>
> https://github.com/kernelci/kernelci-core/blob/master/kernelci/build.py#L249
>
> It can typically be run by the following command, using the
> kernelci-core tool kci_build:
>
>   ./kci_build generate_fragments --config=mainline --kdir=~/src/linux
>
> Please note that the --config option in this command is not the
> kernel config but the build config from build-configs.yaml to
> know which fragments need to be generated for each kernel branch.
>
> With kernelci.org builds, the fragments are first added to a
> kernel source tarball which is then used in all subsequent builds
> for a given revision.  If I pick the latest mainline one:
>
>
> https://storage.kernelci.org/mainline/master/v5.6-rc4-78-g9f65ed5fe41c/linux-src_mainline.tar.gz
>
> I can see it has this fragment:
>
>   kernel/configs/kselftest.config
>
> which I've copied here to save people's time:
>
>   https://people.collabora.com/~gtucker/kernelci/doc/kselftest.config
>
>
> There's a similar fragment for every kernel revision being built,
> including the android branches.
>
> Guillaume
>
>>

--00000000000049b41805a022e489
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Guillaume. I guess I wasn&#39;t missing &quot;=
something obvious&quot; :).</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Mar 5, 2020 at 1:50 PM Guillaume Tucker =
&lt;<a href=3D"mailto:guillaume.tucker@gmail.com" target=3D"_blank">guillau=
me.tucker@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div>Hi Todd,</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 5, 2020 at 7:4=
2 PM Todd Kjos via Groups.Io &lt;tkjos=3D<a href=3D"mailto:google.com@group=
s.io" target=3D"_blank">google.com@groups.io</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I&#39;m probab=
ly missing something obvious, but I have a failure for the &quot;x86_64_def=
config+kselftest&quot; build of the android-4.19 branch. There is no failur=
e with the &quot;x86_64_defconfig&quot; build.<div><br></div><div>How do I =
reproduce the &quot;+kselftest&quot;? I don&#39;t see any &quot;kselftest&q=
uot; string in the build.log.</div></div></blockquote><div><br></div><div>T=
he +kselftest syntax is a KernelCI convention to show that a<br>kselftest c=
onfig fragment was added on top of the base defconfig.<br>The code that gen=
erates the fragment can be found here:<br><br>=C2=A0 <a href=3D"https://git=
hub.com/kernelci/kernelci-core/blob/master/kernelci/build.py#L249" target=
=3D"_blank">https://github.com/kernelci/kernelci-core/blob/master/kernelci/=
build.py#L249</a><br><br>It can typically be run by the following command, =
using the<br>kernelci-core tool kci_build:<br><br>=C2=A0 ./kci_build genera=
te_fragments --config=3Dmainline --kdir=3D~/src/linux<br><br></div><div>Ple=
ase note that the --config option in this command is not the<br>kernel conf=
ig but the build config from build-configs.yaml to<br>know which fragments =
need to be generated for each kernel branch.</div><div><br>With <a href=3D"=
http://kernelci.org" target=3D"_blank">kernelci.org</a> builds, the fragmen=
ts are first added to a<br>kernel source tarball which is then used in all =
subsequent builds<br>for a given revision.=C2=A0 If I pick the latest mainl=
ine one:<br><br>=C2=A0 <a href=3D"https://storage.kernelci.org/mainline/mas=
ter/v5.6-rc4-78-g9f65ed5fe41c/linux-src_mainline.tar.gz" target=3D"_blank">=
https://storage.kernelci.org/mainline/master/v5.6-rc4-78-g9f65ed5fe41c/linu=
x-src_mainline.tar.gz</a><br><br>I can see it has this fragment:<br><br>=C2=
=A0 kernel/configs/kselftest.config<br><br>which I&#39;ve copied here to sa=
ve people&#39;s time:<br><br>=C2=A0 <a href=3D"https://people.collabora.com=
/~gtucker/kernelci/doc/kselftest.config" target=3D"_blank">https://people.c=
ollabora.com/~gtucker/kernelci/doc/kselftest.config</a><br><br><br>There&#3=
9;s a similar fragment for every kernel revision being built,<br>including =
the android branches.<br></div><div><br></div><div>Guillaume<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">

<p></p><p></p></blockquote></div></div>
</blockquote></div></div>

--00000000000049b41805a022e489--
