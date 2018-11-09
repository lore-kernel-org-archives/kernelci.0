Return-Path: <broonie@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [kernelci] Bisection email recipients
From: "Mark Brown" <broonie@gmail.com>
In-Reply-To: <CAH1_8nBApbn08CozDTvpWZJvWGcf8RnvbdVXpyAB3sE+EnQO0g@mail.gmail.com>
Date: Fri, 9 Nov 2018 20:38:53 +0000
Message-Id: <66E010CF-FD91-4632-99B7-20FCA93D58A3@gmail.com>
References: <419a4e9b-4b03-d717-688b-bbc409369a97@collabora.com> <a69dc0ac-2108-ab30-ab50-2d27b5378fa6@collabora.com> <20181031102654.GC1761@sirena.org.uk> <CAH1_8nBApbn08CozDTvpWZJvWGcf8RnvbdVXpyAB3sE+EnQO0g@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-2D4159CD-D7CE-4517-B9DB-FEAB7644B1FF
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: tomeu.vizoso@collabora.com

--Apple-Mail-2D4159CD-D7CE-4517-B9DB-FEAB7644B1FF
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On 9 Nov 2018, at 16:59, Guillaume Tucker <guillaume.tucker@gmail.com> w=
rote:
>=20
>=20
>> On Wed, Oct 31, 2018 at 10:26 AM Mark Brown <broonie@kernel.org> wrote:
>> On Wed, Oct 31, 2018 at 08:37:13AM +0100, Tomeu Vizoso wrote:
>> > On 10/30/18 6:08 PM, Guillaume Tucker wrote:
>>=20
>> > > * author of the commit
>> > > * committer
>> > > * Signed-off-by
>> > > * Acked-by
>> > > * Reported-by
>>=20
>> I'd just include any e-mail address in the tags for the mail - tested-b=
y
>=20
> Do you mean, to get the same as what "git send-email" would give?
> I had a look and it doesn't seem easy to extract this
> information, maybe you have a tip for that.  Otherwise, I've
> added a simple Python function with a regex to the script I have
> that triggers the bisection email (PR coming soon with details).

Yes, roughly - a good first step would be something like ^.*: .*@ (ie, any=
thing with a colon/space sequence followed by an @).

>  
>> is definitely fair game (there's a decent chance they'll want to be
>> involved in testing further fixes), and it's a fairly common practice
>> for other kinds of reporting to just include everyone rather than
>> explicitly learning all the random tags different maintainers use.
>>=20
>> > > * mailing list associated with the tree (like for test reports)
>> > > * maintainers of the parts of the code touched (using
>> > >    scripts/get_maintainer.pl and diff stat)
>>=20
>> If you're using get_maintainer I'd make sure to use --nogit so that you
>> don't get false positives for people doing cleanup patches.  You can
>> probably just format the patch with git format-patch and then use
>> get_maintainer normally.
>  
> Great tip, I'm using it with "--nogit" on the output of "git
> show" and that seems to be doing a good job.
>=20
>> > > I also think it would be worth sending an email to the stable
>> > > mailing list, and probably also lkml to explain what we're doing
>> > > and warn people that we're turning this on.
>>=20
>> Seems sensible.  It's a shame that we can't turn this on for -next yet,
>> but obviously the way that's built isn't super helpful.
>=20
> Bisections on linux-next are coming soon, we just have to get the
> basics all sorted out for mainline and stable first.=20
>=20
>> > I think that regardless of how well it's working already, it could ma=
ke
>> > sense to increase the list of recipients incrementally, starting with=
 those
>> > most likely to appreciate the email, and growing towards those less l=
ikely.
>> > Maybe I'm being overly cautious, but from past experiences I don't th=
ink we
>> > want to risk too much antagonizing people.
>>=20
>> > Once we have a feeling that the recipients in a stage are happy with =
getting
>> > the emails, we can expand to other recipients in the next stage.
>>=20
>> > So, to illustrate the point, we could start with the author and
>> > kernel-build-reports@lists.linaro.org, then include ackers, reviewers=
,
>> > reporter and sobers, then mailing lists.
>>=20
>> Not copying enough people can also cause issues as people will expect
>> other relevant people to be copied in and be annoyed about having to do
>> it themselves or possibly even just miss handling the report if they
>> expect someone has been CCed who hasn't - for example if we only send t=
o
>> the patch author then maintainers might be annoyed if they later find
>> out there was a problem we didn't tell them about.  People will
>> definitely get annoyed about reports being off list because then the
>> discussion of the problem doesn't get archived for other people who
>> might benefit from it in future.
>>=20
>> It is already common practice for people doing testing to copy fairly
>> widely so it shouldn't be that much of a surprise.
>  
> As we're only bisecting boot on mainline and stable, the number
> of emails is actually pretty low at the moment.  There's a valid
> result only about once a month.  That will definitely change as
> we start bisecting -next and other tests than plain boot, which I
> think should give us a natural progressive ramp-up.  We'll also
> have a chance to tune things along the way.
>=20
> Guillaume
>=20

--Apple-Mail-2D4159CD-D7CE-4517-B9DB-FEAB7644B1FF
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><div dir="ltr"></div><div dir="ltr"><br></div><div dir="ltr"><br>On 9 Nov 2018, at 16:59, Guillaume Tucker &lt;<a href="mailto:guillaume.tucker@gmail.com">guillaume.tucker@gmail.com</a>&gt; wrote:<br><br></div><blockquote type="cite"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><br><div class="gmail_quote"><div dir="ltr">On Wed, Oct 31, 2018 at 10:26 AM Mark Brown &lt;<a href="mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; wrote:<br></div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Oct 31, 2018 at 08:37:13AM +0100, Tomeu Vizoso wrote:<br>
&gt; On 10/30/18 6:08 PM, Guillaume Tucker wrote:<br>
<br>
&gt; &gt; * author of the commit<br>
&gt; &gt; * committer<br>
&gt; &gt; * Signed-off-by<br>
&gt; &gt; * Acked-by<br>
&gt; &gt; * Reported-by<br>
<br>
I'd just include any e-mail address in the tags for the mail - tested-by<br></blockquote><div><br></div><div><div>Do you mean, to get the same as what "git send-email" would give?</div><div>I had a look and it doesn't seem easy to extract this</div><div>information, maybe you have a tip for that.&nbsp; Otherwise, I've</div><div>added a simple Python function with a regex to the script I have</div><div>that triggers the bisection email (PR coming soon with details).</div></div></div></div></div></div></div></div></div></blockquote><div><br></div><div>Yes, roughly - a good first step would be something like ^.*: .*@ (ie, anything with a colon/space sequence followed by an @).</div><br><blockquote type="cite"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div class="gmail_quote"><div>&nbsp;</div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
is definitely fair game (there's a decent chance they'll want to be<br>
involved in testing further fixes), and it's a fairly common practice<br>
for other kinds of reporting to just include everyone rather than<br>
explicitly learning all the random tags different maintainers use.<br>
<br>
&gt; &gt; * mailing list associated with the tree (like for test reports)<br>
&gt; &gt; * maintainers of the parts of the code touched (using<br>
&gt; &gt;&nbsp; &nbsp; scripts/<a href="http://get_maintainer.pl" rel="noreferrer" target="_blank">get_maintainer.pl</a> and diff stat)<br>
<br>
If you're using get_maintainer I'd make sure to use --nogit so that you<br>
don't get false positives for people doing cleanup patches.&nbsp; You can<br>
probably just format the patch with git format-patch and then use<br>
get_maintainer normally.<br></blockquote><div>&nbsp;</div><div><div>Great tip, I'm using it with "--nogit" on the output of "git</div><div>show" and that seems to be doing a good job.</div></div><div><br></div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; I also think it would be worth sending an email to the stable<br>
&gt; &gt; mailing list, and probably also lkml to explain what we're doing<br>
&gt; &gt; and warn people that we're turning this on.<br>
<br>
Seems sensible.&nbsp; It's a shame that we can't turn this on for -next yet,<br>
but obviously the way that's built isn't super helpful.<br></blockquote><div><br></div><div>Bisections on linux-next are coming soon, we just have to get the<br></div><div>basics all sorted out for mainline and stable first.&nbsp;</div><div><br></div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; I think that regardless of how well it's working already, it could make<br>
&gt; sense to increase the list of recipients incrementally, starting with those<br>
&gt; most likely to appreciate the email, and growing towards those less likely.<br>
&gt; Maybe I'm being overly cautious, but from past experiences I don't think we<br>
&gt; want to risk too much antagonizing people.<br>
<br>
&gt; Once we have a feeling that the recipients in a stage are happy with getting<br>
&gt; the emails, we can expand to other recipients in the next stage.<br>
<br>
&gt; So, to illustrate the point, we could start with the author and<br>
&gt; <a href="mailto:kernel-build-reports@lists.linaro.org" target="_blank">kernel-build-reports@lists.linaro.org</a>, then include ackers, reviewers,<br>
&gt; reporter and sobers, then mailing lists.<br>
<br>
Not copying enough people can also cause issues as people will expect<br>
other relevant people to be copied in and be annoyed about having to do<br>
it themselves or possibly even just miss handling the report if they<br>
expect someone has been CCed who hasn't - for example if we only send to<br>
the patch author then maintainers might be annoyed if they later find<br>
out there was a problem we didn't tell them about.&nbsp; People will<br>
definitely get annoyed about reports being off list because then the<br>
discussion of the problem doesn't get archived for other people who<br>
might benefit from it in future.<br>
<br>
It is already common practice for people doing testing to copy fairly<br>
widely so it shouldn't be that much of a surprise.<br></blockquote><div>&nbsp;</div><div><div>As we're only bisecting boot on mainline and stable, the number</div><div>of emails is actually pretty low at the moment.&nbsp; There's a valid</div><div>result only about once a month.&nbsp; That will definitely change as</div><div>we start bisecting -next and other tests than plain boot, which I</div><div>think should give us a natural progressive ramp-up.&nbsp; We'll also</div><div>have a chance to tune things along the way.</div></div><div><br></div><div>Guillaume</div></div></div></div></div></div></div>



</div></blockquote></body></html>

--Apple-Mail-2D4159CD-D7CE-4517-B9DB-FEAB7644B1FF--
