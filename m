MIME-Version: 1.0
References: <419a4e9b-4b03-d717-688b-bbc409369a97@collabora.com>
 <a69dc0ac-2108-ab30-ab50-2d27b5378fa6@collabora.com> <20181031102654.GC1761@sirena.org.uk>
In-Reply-To: <20181031102654.GC1761@sirena.org.uk>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Fri, 9 Nov 2018 16:59:17 +0000
Message-ID: <CAH1_8nBApbn08CozDTvpWZJvWGcf8RnvbdVXpyAB3sE+EnQO0g@mail.gmail.com>
Subject: Re: [kernelci] Bisection email recipients
Content-Type: multipart/alternative; boundary="000000000000473911057a3e4674"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: tomeu.vizoso@collabora.com

--000000000000473911057a3e4674
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 31, 2018 at 10:26 AM Mark Brown <broonie@kernel.org> wrote:

> On Wed, Oct 31, 2018 at 08:37:13AM +0100, Tomeu Vizoso wrote:
> > On 10/30/18 6:08 PM, Guillaume Tucker wrote:
>
> > > * author of the commit
> > > * committer
> > > * Signed-off-by
> > > * Acked-by
> > > * Reported-by
>
> I'd just include any e-mail address in the tags for the mail - tested-by
>

Do you mean, to get the same as what "git send-email" would give?
I had a look and it doesn't seem easy to extract this
information, maybe you have a tip for that.  Otherwise, I've
added a simple Python function with a regex to the script I have
that triggers the bisection email (PR coming soon with details).


> is definitely fair game (there's a decent chance they'll want to be
> involved in testing further fixes), and it's a fairly common practice
> for other kinds of reporting to just include everyone rather than
> explicitly learning all the random tags different maintainers use.
>
> > > * mailing list associated with the tree (like for test reports)
> > > * maintainers of the parts of the code touched (using
> > >    scripts/get_maintainer.pl and diff stat)
>
> If you're using get_maintainer I'd make sure to use --nogit so that you
> don't get false positives for people doing cleanup patches.  You can
> probably just format the patch with git format-patch and then use
> get_maintainer normally.
>

Great tip, I'm using it with "--nogit" on the output of "git
show" and that seems to be doing a good job.

> > I also think it would be worth sending an email to the stable
> > > mailing list, and probably also lkml to explain what we're doing
> > > and warn people that we're turning this on.
>
> Seems sensible.  It's a shame that we can't turn this on for -next yet,
> but obviously the way that's built isn't super helpful.
>

Bisections on linux-next are coming soon, we just have to get the
basics all sorted out for mainline and stable first.

> I think that regardless of how well it's working already, it could make
> > sense to increase the list of recipients incrementally, starting with
> those
> > most likely to appreciate the email, and growing towards those less
> likely.
> > Maybe I'm being overly cautious, but from past experiences I don't think
> we
> > want to risk too much antagonizing people.
>
> > Once we have a feeling that the recipients in a stage are happy with
> getting
> > the emails, we can expand to other recipients in the next stage.
>
> > So, to illustrate the point, we could start with the author and
> > kernel-build-reports@lists.linaro.org, then include ackers, reviewers,
> > reporter and sobers, then mailing lists.
>
> Not copying enough people can also cause issues as people will expect
> other relevant people to be copied in and be annoyed about having to do
> it themselves or possibly even just miss handling the report if they
> expect someone has been CCed who hasn't - for example if we only send to
> the patch author then maintainers might be annoyed if they later find
> out there was a problem we didn't tell them about.  People will
> definitely get annoyed about reports being off list because then the
> discussion of the problem doesn't get archived for other people who
> might benefit from it in future.
>
> It is already common practice for people doing testing to copy fairly
> widely so it shouldn't be that much of a surprise.
>

As we're only bisecting boot on mainline and stable, the number
of emails is actually pretty low at the moment.  There's a valid
result only about once a month.  That will definitely change as
we start bisecting -next and other tests than plain boot, which I
think should give us a natural progressive ramp-up.  We'll also
have a chance to tune things along the way.

Guillaume

--000000000000473911057a3e4674
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 31, 2=
018 at 10:26 AM Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org">brooni=
e@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Wed, Oct 31, 2018 at 08:37:13AM +0100, Tomeu Vizoso wrote:<b=
r>
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
tion email (PR coming soon with details).</div></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
is definitely fair game (there&#39;s a decent chance they&#39;ll want to be=
<br>
involved in testing further fixes), and it&#39;s a fairly common practice<b=
r>
for other kinds of reporting to just include everyone rather than<br>
explicitly learning all the random tags different maintainers use.<br>
<br>
&gt; &gt; * mailing list associated with the tree (like for test reports)<b=
r>
&gt; &gt; * maintainers of the parts of the code touched (using<br>
&gt; &gt;=C2=A0 =C2=A0 scripts/<a href=3D"http://get_maintainer.pl" rel=3D"=
noreferrer" target=3D"_blank">get_maintainer.pl</a> and diff stat)<br>
<br>
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
 first.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; I think that regardless of how well it&#39;s working already, it could=
 make<br>
&gt; sense to increase the list of recipients incrementally, starting with =
those<br>
&gt; most likely to appreciate the email, and growing towards those less li=
kely.<br>
&gt; Maybe I&#39;m being overly cautious, but from past experiences I don&#=
39;t think we<br>
&gt; want to risk too much antagonizing people.<br>
<br>
&gt; Once we have a feeling that the recipients in a stage are happy with g=
etting<br>
&gt; the emails, we can expand to other recipients in the next stage.<br>
<br>
&gt; So, to illustrate the point, we could start with the author and<br>
&gt; <a href=3D"mailto:kernel-build-reports@lists.linaro.org" target=3D"_bl=
ank">kernel-build-reports@lists.linaro.org</a>, then include ackers, review=
ers,<br>
&gt; reporter and sobers, then mailing lists.<br>
<br>
Not copying enough people can also cause issues as people will expect<br>
other relevant people to be copied in and be annoyed about having to do<br>
it themselves or possibly even just miss handling the report if they<br>
expect someone has been CCed who hasn&#39;t - for example if we only send t=
o<br>
the patch author then maintainers might be annoyed if they later find<br>
out there was a problem we didn&#39;t tell them about.=C2=A0 People will<br=
>
definitely get annoyed about reports being off list because then the<br>
discussion of the problem doesn&#39;t get archived for other people who<br>
might benefit from it in future.<br>
<br>
It is already common practice for people doing testing to copy fairly<br>
widely so it shouldn&#39;t be that much of a surprise.<br></blockquote><div=
>=C2=A0</div><div><div>As we&#39;re only bisecting boot on mainline and sta=
ble, the number</div><div>of emails is actually pretty low at the moment.=
=C2=A0 There&#39;s a valid</div><div>result only about once a month.=C2=A0 =
That will definitely change as</div><div>we start bisecting -next and other=
 tests than plain boot, which I</div><div>think should give us a natural pr=
ogressive ramp-up.=C2=A0 We&#39;ll also</div><div>have a chance to tune thi=
ngs along the way.</div></div><div><br></div><div>Guillaume</div></div></di=
v></div></div></div></div>

--000000000000473911057a3e4674--
