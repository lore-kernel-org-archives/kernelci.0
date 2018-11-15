MIME-Version: 1.0
References: <419a4e9b-4b03-d717-688b-bbc409369a97@collabora.com>
 <a69dc0ac-2108-ab30-ab50-2d27b5378fa6@collabora.com> <20181031102654.GC1761@sirena.org.uk>
 <CAH1_8nBApbn08CozDTvpWZJvWGcf8RnvbdVXpyAB3sE+EnQO0g@mail.gmail.com> <66E010CF-FD91-4632-99B7-20FCA93D58A3@gmail.com>
In-Reply-To: <66E010CF-FD91-4632-99B7-20FCA93D58A3@gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 15 Nov 2018 15:43:20 +0000
Message-ID: <CAH1_8nAdTOEiD5UA5M69DSD30Fu41JJ645X0BJQdPDRG4jjoXw@mail.gmail.com>
Subject: Re: [kernelci] Bisection email recipients
Content-Type: multipart/alternative; boundary="000000000000b21920057ab5e983"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: tomeu.vizoso@collabora.com

--000000000000b21920057ab5e983
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 9, 2018 at 8:38 PM Mark Brown <broonie@gmail.com> wrote:

>
>
> On 9 Nov 2018, at 16:59, Guillaume Tucker <guillaume.tucker@gmail.com>
> wrote:
>
>
> On Wed, Oct 31, 2018 at 10:26 AM Mark Brown <broonie@kernel.org> wrote:
>
>> On Wed, Oct 31, 2018 at 08:37:13AM +0100, Tomeu Vizoso wrote:
>> > On 10/30/18 6:08 PM, Guillaume Tucker wrote:
>>
>> > > * author of the commit
>> > > * committer
>> > > * Signed-off-by
>> > > * Acked-by
>> > > * Reported-by
>>
>> I'd just include any e-mail address in the tags for the mail - tested-by
>>
>
> Do you mean, to get the same as what "git send-email" would give?
> I had a look and it doesn't seem easy to extract this
> information, maybe you have a tip for that.  Otherwise, I've
> added a simple Python function with a regex to the script I have
> that triggers the bisection email (PR coming soon with details).
>
>
> Yes, roughly - a good first step would be something like ^.*: .*@ (ie,
> anything with a colon/space sequence followed by an @).
>

Got delayed while chasing up other issues, but here's the PR:

    https://github.com/kernelci/kernelci-core-staging/pull/47

[...]

> If you're using get_maintainer I'd make sure to use --nogit so that you
>> don't get false positives for people doing cleanup patches.  You can
>> probably just format the patch with git format-patch and then use
>> get_maintainer normally.
>>
>
> Great tip, I'm using it with "--nogit" on the output of "git
> show" and that seems to be doing a good job.
>
> > > I also think it would be worth sending an email to the stable
>> > > mailing list, and probably also lkml to explain what we're doing
>> > > and warn people that we're turning this on.
>>
>> Seems sensible.  It's a shame that we can't turn this on for -next yet,
>> but obviously the way that's built isn't super helpful.
>>
>
> Bisections on linux-next are coming soon, we just have to get the
> basics all sorted out for mainline and stable first.
>
> There's also a PR to add a "disclaimer" paragraph in the email
report:

    https://github.com/kernelci/kernelci-backend/pull/89

Guillaume

>

--000000000000b21920057ab5e983
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Fri, Nov 9, 2018 at 8:38 PM Mark Brown &lt;<a href=
=3D"mailto:broonie@gmail.com">broonie@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=
=3D"ltr"></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br>On 9 Nov 201=
8, at 16:59, Guillaume Tucker &lt;<a href=3D"mailto:guillaume.tucker@gmail.=
com" target=3D"_blank">guillaume.tucker@gmail.com</a>&gt; wrote:<br><br></d=
iv><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"=
ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br><div class=3D"g=
mail_quote"><div dir=3D"ltr">On Wed, Oct 31, 2018 at 10:26 AM Mark Brown &l=
t;<a href=3D"mailto:broonie@kernel.org" target=3D"_blank">broonie@kernel.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, Oct 31, 2018 at 08:37:13AM +0100, Tomeu Vizoso wrote:<br>
&gt; On 10/30/18 6:08 PM, Guillaume Tucker wrote:<br>
<br>
&gt; &gt; * author of the commit<br>
&gt; &gt; * committer<br>
&gt; &gt; * Signed-off-by<br>
&gt; &gt; * Acked-by<br>
&gt; &gt; * Reported-by<br>
<br>
I&#39;d just include any e-mail address in the tags for the mail - tested-b=
y<br></blockquote><div><br></div><div><div>Do you mean, to get the same as =
what &quot;git send-email&quot; would give?</div><div>I had a look and it d=
oesn&#39;t seem easy to extract this</div><div>information, maybe you have =
a tip for that.=C2=A0 Otherwise, I&#39;ve</div><div>added a simple Python f=
unction with a regex to the script I have</div><div>that triggers the bisec=
tion email (PR coming soon with details).</div></div></div></div></div></di=
v></div></div></div></blockquote><div><br></div><div>Yes, roughly - a good =
first step would be something like ^.*: .*@ (ie, anything with a colon/spac=
e sequence followed by an @).</div></div></blockquote><div><br></div><div><=
div>Got delayed while chasing up other issues, but here&#39;s the PR:</div>=
<div><br></div><div>=C2=A0 =C2=A0 <a href=3D"https://github.com/kernelci/ke=
rnelci-core-staging/pull/47">https://github.com/kernelci/kernelci-core-stag=
ing/pull/47</a></div></div><div><br></div><div>[...]=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><blockquote type=
=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">

If you&#39;re using get_maintainer I&#39;d make sure to use --nogit so that=
 you<br>
don&#39;t get false positives for people doing cleanup patches.=C2=A0 You c=
an<br>
probably just format the patch with git format-patch and then use<br>
get_maintainer normally.<br></blockquote><div>=C2=A0</div><div><div>Great t=
ip, I&#39;m using it with &quot;--nogit&quot; on the output of &quot;git</d=
iv><div>show&quot; and that seems to be doing a good job.</div></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; I also think it would be worth sending an email to the stable<br>
&gt; &gt; mailing list, and probably also lkml to explain what we&#39;re do=
ing<br>
&gt; &gt; and warn people that we&#39;re turning this on.<br>
<br>
Seems sensible.=C2=A0 It&#39;s a shame that we can&#39;t turn this on for -=
next yet,<br>
but obviously the way that&#39;s built isn&#39;t super helpful.<br></blockq=
uote><div><br></div><div>Bisections on linux-next are coming soon, we just =
have to get the<br></div><div>basics all sorted out for mainline and stable=
 first.=C2=A0</div></div></div></div></div></div></div></div></blockquote><=
/div></blockquote><div>There&#39;s also a PR to add a &quot;disclaimer&quot=
; paragraph in the email</div><div>report:</div><div><br></div><div>=C2=A0 =
=C2=A0 <a href=3D"https://github.com/kernelci/kernelci-backend/pull/89">htt=
ps://github.com/kernelci/kernelci-backend/pull/89</a></div><div><br></div><=
div>Guillaume<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

<p></p><p></p></blockquote></div></div></div></div>

--000000000000b21920057ab5e983--
