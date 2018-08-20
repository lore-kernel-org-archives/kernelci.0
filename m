MIME-Version: 1.0
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
 <7hh8jori5m.fsf@baylibre.com> <CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
In-Reply-To: <CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
From: "Mark Brown" <broonie@gmail.com>
Date: Mon, 20 Aug 2018 22:07:57 +0100
Message-ID: <CACNq6_banx0vehjN=9-Z5i=QX1emCNi7bNLHN6W-B_uOiDZVBA@mail.gmail.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
Content-Type: multipart/alternative; boundary="0000000000007b4d0e0573e44ebf"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: dan.rue@linaro.org

--0000000000007b4d0e0573e44ebf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Aug 2018 at 21:21 Guillaume Tucker <guillaume.tucker@gmail.com>
wrote:

> On Mon, Aug 20, 2018 at 7:45 PM Kevin Hilman <khilman@baylibre.com> wrote=
:
>
> > >        They are mostly a side effect of parsing LAVA callback data,
> >
> > Not sure I'd call it a side effect.  LAVA supports the notion of suite,
> > set and case, and we need to deal with that if we're handling LAVA data
> > (even if there are no current kernelCI tests using it.)
>
> Yes we need to be able to deal with the data sent by LAVA, but it
> doesn't mean we need to follow the way the data is formatted in
> the LAVA callbacks.
>

Like I said in the meeting it's not just a side effect of what LAVA's
doing, it's also a practical thing for large testsuites especially when
there's some risk of the job failing.


> So if we want to split big test suites across several jobs, test
> sets are not what we're after.
>

According to what the LAVA docs say but this isn't the LAVA data model,
it's the kernelci one! To be honest I'm not sure the LAVA documentation
reflects what users are actually doing with the feature anyway.


> Whether this should be visible at all from a user point of view,
> I don't think so.  Say, if we split a test suite arbitrarily to
> better spread the load, get more reliable test runs and run tests
> in parallel, would this need to be shown to the user?  I would
> have thought that we just need to present the list of all the
> test cases for that suite.
>

I tend to agree that it should be somewhat hidden from the user if it's
there. I don't think we can completely hide it as at some point users will
want to see things like the full job log.


>
> > >         - [broonie] The goal here is to both get faster runs when
> > >           there=E2=80=99s multiple boards and to improve robustness a=
gainst
> test
> > >           runs crashing and losing a lot of results on larger
> > >           testsuites.
> >
> > So in LKFT, the seprate LTP sub-sets are run on separate boots?  Seems
> > like an LKFT implementation decision, not somthing you would want to
> > force on test writers, nor assume in the data model.
>

I'd say it's definitely a useful feature for test writers to have available
to them - it's solving a real problem that some testsuites encounter.


> > >     - Decision: No objections to removing test sets
> >
> > I object.  (Can we please be careful about decision based on "no
> > objections" when not everyone is able to participate in the call.)
>
> You have the minutes (thanks Dan) to reply to here, and PR
> comments (if anything concrete lands on Github).  Maybe we can
> have another call in your timezone to discuss this further?
>

BTW, one thing I meant to bring up with moving things more to the list:
instead of putting things in the document for discussion it'd probably help
if we were to instead put them in mails to the list (I'll try to do this
the next time I have some topic).


> > Also, what about kselftest?  It has several suites (e.g. each subdir of
> > tools/testing/selftest) and within each suite can have sets
> > (e.g. net/forwarding, ftrace/test.d/*)
>

That seems like a good candidate for splitting up FWIW.

--0000000000007b4d0e0573e44ebf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 20 Aug=
 2018 at 21:21 Guillaume Tucker &lt;<a href=3D"mailto:guillaume.tucker@gmai=
l.com">guillaume.tucker@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Mon, Aug 20, 2018 at 7:45 PM Kevin Hilman &lt;<a href=3D"m=
ailto:khilman@baylibre.com" target=3D"_blank">khilman@baylibre.com</a>&gt; =
wrote:<br><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 They are mostly a side effect of parsi=
ng LAVA callback data,<br>
&gt;<br>
&gt; Not sure I&#39;d call it a side effect.=C2=A0 LAVA supports the notion=
 of suite,<br>
&gt; set and case, and we need to deal with that if we&#39;re handling LAVA=
 data<br>
&gt; (even if there are no current kernelCI tests using it.)<br>
<br>
Yes we need to be able to deal with the data sent by LAVA, but it<br>
doesn&#39;t mean we need to follow the way the data is formatted in<br>
the LAVA callbacks.<br></blockquote><div><br></div><div>Like I said in the =
meeting it&#39;s not just a side effect of what LAVA&#39;s doing, it&#39;s =
also a practical thing for large testsuites especially when there&#39;s som=
e risk of the job failing.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
So if we want to split big test suites across several jobs, test<br>
sets are not what we&#39;re after.<br></blockquote><div><br></div><div>Acco=
rding to what the LAVA docs say but this isn&#39;t the LAVA data model, it&=
#39;s the kernelci one! To be honest I&#39;m not sure the LAVA documentatio=
n reflects what users are actually doing with the feature anyway.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
Whether this should be visible at all from a user point of view,<br>
I don&#39;t think so.=C2=A0 Say, if we split a test suite arbitrarily to<br=
>
better spread the load, get more reliable test runs and run tests<br>
in parallel, would this need to be shown to the user?=C2=A0 I would<br>
have thought that we just need to present the list of all the<br>
test cases for that suite.<br></blockquote><div><br></div><div>I tend to ag=
ree that it should be somewhat hidden from the user if it&#39;s there. I do=
n&#39;t think we can completely hide it as at some point users will want to=
 see things like the full job log.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- [broonie] The goal here is to =
both get faster runs when<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0there=E2=80=99s multiple =
boards and to improve robustness against test<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runs crashing and losing =
a lot of results on larger<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testsuites.<br>
&gt;<br>
&gt; So in LKFT, the seprate LTP sub-sets are run on separate boots?=C2=A0 =
Seems<br>
&gt; like an LKFT implementation decision, not somthing you would want to<b=
r>
&gt; force on test writers, nor assume in the data model.<br></blockquote><=
div><br></div><div>I&#39;d say it&#39;s definitely a useful feature for tes=
t writers to have available to them - it&#39;s solving a real problem that =
some testsuites encounter.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
&gt; &gt;=C2=A0 =C2=A0 =C2=A0- Decision: No objections to removing test set=
s<br>
&gt;<br>
&gt; I object.=C2=A0 (Can we please be careful about decision based on &quo=
t;no<br>
&gt; objections&quot; when not everyone is able to participate in the call.=
)<br>
<br>
You have the minutes (thanks Dan) to reply to here, and PR<br>
comments (if anything concrete lands on Github).=C2=A0 Maybe we can<br>
have another call in your timezone to discuss this further?<br></blockquote=
><div><br></div><div>BTW, one thing I meant to bring up with moving things =
more to the list: instead of putting things in the document for discussion =
it&#39;d probably help if we were to instead put them in mails to the list =
(I&#39;ll try to do this the next time I have some topic).=C2=A0</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
&gt; Also, what about kselftest?=C2=A0 It has several suites (e.g. each sub=
dir of<br>
&gt; tools/testing/selftest) and within each suite can have sets<br>
&gt; (e.g. net/forwarding, ftrace/test.d/*)<br></blockquote><div><br></div>=
<div>That seems like a good candidate for splitting up FWIW.</div><div><br>=
</div></div></div>

--0000000000007b4d0e0573e44ebf--
