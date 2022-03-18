MIME-Version: 1.0
References: <CAHRSSEzUpY+7Lhb40B_v9cSc1KQOcztZ=WiV+1-+ocdcsNUGFQ@mail.gmail.com>
 <CABXOdTeirbF1KRdFsmuRKHJ+p+7s9ZOZAW2S64MsPFajUjdqow@mail.gmail.com>
 <2a6d7691-b8a5-da92-865c-8cdf5efb673f@collabora.com> <CAHRSSEwnBrT0wnc+-dA2FXvu1udstwArFRYtHu+f-79fZgd2JQ@mail.gmail.com>
 <CAHRSSEwtCOjxp4-GVRD+31bASw3k+isZbguABmUX_V82tu8T=Q@mail.gmail.com>
 <285b11ad-40dc-eb88-427e-f32c4a422c85@collabora.com> <CAHRSSEy6nOgPG8LVcMh9e-rxkWpAZNOeC5B=L2KKuE66Qynv3Q@mail.gmail.com>
 <b12def92-d4cc-ec89-9e6d-d3e710970ccd@collabora.com> <CAHRSSEyvTz9BhenBec79ieXdURYKOMaqk78uKjeZciHNSeSKag@mail.gmail.com>
 <CAHRSSEzAsiLrrJ_XjmykMjn96JcN+-F3iugSfFaG124UhS3W8w@mail.gmail.com>
 <CAHRSSExEexitM-NNR4DWMcQObDOBpGk8AcC4-PMZCjHwctJ8og@mail.gmail.com>
 <CAHRSSExaOps1V6gvqmyi=Zy0hh+R3Xpcge0tzGfoCBfNAbFOnQ@mail.gmail.com> <803b89a9-9141-636f-8fd3-f519b0440075@collabora.com>
In-Reply-To: <803b89a9-9141-636f-8fd3-f519b0440075@collabora.com>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 18 Mar 2022 08:47:22 -0700
Message-ID: <CAHRSSEwB_L-i0UZH01s424vPog7ArU=uSutsqmexMSO92JtTNA@mail.gmail.com>
Subject: Re: can't access kernelci results
Content-Type: multipart/alternative; boundary="000000000000bfaf5405da801043"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>, kernelci@groups.io, Guenter Roeck <groeck@google.com>, Kevin Hilman <khilman@baylibre.com>

--000000000000bfaf5405da801043
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is the MongoDB server down again? I don't get results at
https://linux.kernelci.org/job/android/.

On Wed, Dec 1, 2021 at 1:49 AM Guillaume Tucker <
guillaume.tucker@collabora.com> wrote:

> Hi Todd,
>
> On 30/11/2021 16:54, Todd Kjos wrote:
> > ...and now it's working again. Sorry about the noise if the issue was
> > on my side.
>
> The MongoDB server did crash but it was restarted a few minutes
> later.  There's some kind of watchdog to do that automatically,
> maybe you were out of luck and checked the website during that
> window.  Thanks for reporting the issue in any case.
>
> Best wishes,
> Guillaume
>
> > On Tue, Nov 30, 2021 at 8:35 AM Todd Kjos <tkjos@google.com> wrote:
> >>
> >> I can't load the data from https://linux.kernelci.org/job/android/
> >> ("Error loading build data."). Is mongod "borked" again?
> >>
> >> On Thu, Sep 2, 2021 at 12:28 PM Todd Kjos <tkjos@google.com> wrote:
> >>>
> >>> It's working again. Thanks.
> >>>
> >>> On Thu, Sep 2, 2021 at 8:58 AM Todd Kjos <tkjos@google.com> wrote:
> >>>>
> >>>> I'm getting errors again when attempting to access
> >>>> https://linux.kernelci.org/job/android/. mongod issues again?
> >>>>
> >>>> "Error while loading data from the server (error code: 500). Please
> >>>> contact the website administrator"
> >>>>
> >>>> On Tue, Jun 22, 2021 at 8:17 AM Guillaume Tucker
> >>>> <guillaume.tucker@collabora.com> wrote:
> >>>>>
> >>>>> On 22/06/2021 16:07, Todd Kjos wrote:
> >>>>>> Hmm, it's still not working for me -- did it break again?
> >>>>>
> >>>>> Yes there was an OOM issue:
> >>>>>
> >>>>> [4316410.416514] Killed process 20620 (mongod) total-vm:20171340kB,
> anon-rss:18654740kB, file-rss:0kB, shmem-rss:0kB
> >>>>> [4316412.060511] oom_reaper: reaped process 20620 (mongod), now
> anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
> >>>>>
> >>>>> We're looking into moving the Mongo DB instance to the cloud in
> >>>>> Azure.  Hopefully that will save us fixing this kind of
> >>>>> maintenance issues.  Meanwhile, we should take a look and see if
> >>>>> there's some config option to limit the amount of RAM used by
> >>>>> Mongo DB to work around the problem.
> >>>>>
> >>>>> Best wishes,
> >>>>> Guillaume
> >>>>>
> >>>>>
> >>>>>> On Tue, Jun 22, 2021 at 2:43 AM Micha=C5=82 Ga=C5=82ka <
> michal.galka@collabora.com <mailto:michal.galka@collabora.com>> wrote:
> >>>>>>
> >>>>>>     On 21.06.2021 21:59, Todd Kjos via groups.io <http://groups.io=
>
> wrote:
> >>>>>>     > I'm having this issue again (can't access kernelci results
> >>>>>>     > at https://linux.kernelci.org/job/android/ <
> https://linux.kernelci.org/job/android/>
> >>>>>>     > <https://linux.kernelci.org/job/android/ <
> https://linux.kernelci.org/job/android/>>). Is the mongod service borked
> >>>>>>     > again?
> >>>>>>     >
> >>>>>>
> >>>>>>     Yes, there was an issue with mongod service again. It's workin=
g
> now,
> >>>>>>     celery processed pending tasks and everything seems responsive=
.
> >>>>>>
> >>>>>>     Thanks,
> >>>>>>     Micha=C5=82
> >>>>>>
> >>>>>
>
>

--000000000000bfaf5405da801043
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is the MongoDB server down again? I don&#39;t get results =
at=C2=A0<a href=3D"https://linux.kernelci.org/job/android/">https://linux.k=
ernelci.org/job/android/</a>.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 1:49 AM Guillaume Tuck=
er &lt;<a href=3D"mailto:guillaume.tucker@collabora.com">guillaume.tucker@c=
ollabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi Todd,<br>
<br>
On 30/11/2021 16:54, Todd Kjos wrote:<br>
&gt; ...and now it&#39;s working again. Sorry about the noise if the issue =
was<br>
&gt; on my side.<br>
<br>
The MongoDB server did crash but it was restarted a few minutes<br>
later.=C2=A0 There&#39;s some kind of watchdog to do that automatically,<br=
>
maybe you were out of luck and checked the website during that<br>
window.=C2=A0 Thanks for reporting the issue in any case.<br>
<br>
Best wishes,<br>
Guillaume<br>
<br>
&gt; On Tue, Nov 30, 2021 at 8:35 AM Todd Kjos &lt;<a href=3D"mailto:tkjos@=
google.com" target=3D"_blank">tkjos@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I can&#39;t load the data from <a href=3D"https://linux.kernelci.o=
rg/job/android/" rel=3D"noreferrer" target=3D"_blank">https://linux.kernelc=
i.org/job/android/</a><br>
&gt;&gt; (&quot;Error loading build data.&quot;). Is mongod &quot;borked&qu=
ot; again?<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 2, 2021 at 12:28 PM Todd Kjos &lt;<a href=3D"mailto:tk=
jos@google.com" target=3D"_blank">tkjos@google.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It&#39;s working again. Thanks.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, Sep 2, 2021 at 8:58 AM Todd Kjos &lt;<a href=3D"mailto=
:tkjos@google.com" target=3D"_blank">tkjos@google.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;m getting errors again when attempting to access<br>
&gt;&gt;&gt;&gt; <a href=3D"https://linux.kernelci.org/job/android/" rel=3D=
"noreferrer" target=3D"_blank">https://linux.kernelci.org/job/android/</a>.=
 mongod issues again?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &quot;Error while loading data from the server (error code=
: 500). Please<br>
&gt;&gt;&gt;&gt; contact the website administrator&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, Jun 22, 2021 at 8:17 AM Guillaume Tucker<br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:guillaume.tucker@collabora.com" targ=
et=3D"_blank">guillaume.tucker@collabora.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 22/06/2021 16:07, Todd Kjos wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Hmm, it&#39;s still not working for me -- did it b=
reak again?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Yes there was an OOM issue:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; [4316410.416514] Killed process 20620 (mongod) total-v=
m:20171340kB, anon-rss:18654740kB, file-rss:0kB, shmem-rss:0kB<br>
&gt;&gt;&gt;&gt;&gt; [4316412.060511] oom_reaper: reaped process 20620 (mon=
god), now anon-rss:0kB, file-rss:0kB, shmem-rss:0kB<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; We&#39;re looking into moving the Mongo DB instance to=
 the cloud in<br>
&gt;&gt;&gt;&gt;&gt; Azure.=C2=A0 Hopefully that will save us fixing this k=
ind of<br>
&gt;&gt;&gt;&gt;&gt; maintenance issues.=C2=A0 Meanwhile, we should take a =
look and see if<br>
&gt;&gt;&gt;&gt;&gt; there&#39;s some config option to limit the amount of =
RAM used by<br>
&gt;&gt;&gt;&gt;&gt; Mongo DB to work around the problem.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Best wishes,<br>
&gt;&gt;&gt;&gt;&gt; Guillaume<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Tue, Jun 22, 2021 at 2:43 AM Micha=C5=82 Ga=C5=
=82ka &lt;<a href=3D"mailto:michal.galka@collabora.com" target=3D"_blank">m=
ichal.galka@collabora.com</a> &lt;mailto:<a href=3D"mailto:michal.galka@col=
labora.com" target=3D"_blank">michal.galka@collabora.com</a>&gt;&gt; wrote:=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0On 21.06.2021 21:59, Todd Kjos =
via <a href=3D"http://groups.io" rel=3D"noreferrer" target=3D"_blank">group=
s.io</a> &lt;<a href=3D"http://groups.io" rel=3D"noreferrer" target=3D"_bla=
nk">http://groups.io</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m having this issue =
again (can&#39;t access kernelci results<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; at <a href=3D"https://linu=
x.kernelci.org/job/android/" rel=3D"noreferrer" target=3D"_blank">https://l=
inux.kernelci.org/job/android/</a> &lt;<a href=3D"https://linux.kernelci.or=
g/job/android/" rel=3D"noreferrer" target=3D"_blank">https://linux.kernelci=
.org/job/android/</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"https://lin=
ux.kernelci.org/job/android/" rel=3D"noreferrer" target=3D"_blank">https://=
linux.kernelci.org/job/android/</a> &lt;<a href=3D"https://linux.kernelci.o=
rg/job/android/" rel=3D"noreferrer" target=3D"_blank">https://linux.kernelc=
i.org/job/android/</a>&gt;&gt;). Is the mongod service borked<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; again?<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Yes, there was an issue with mo=
ngod service again. It&#39;s working now,<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0celery processed pending tasks =
and everything seems responsive.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Micha=C5=82<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
<br>
</blockquote></div>

--000000000000bfaf5405da801043--
