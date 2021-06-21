MIME-Version: 1.0
References: <CAHRSSEzUpY+7Lhb40B_v9cSc1KQOcztZ=WiV+1-+ocdcsNUGFQ@mail.gmail.com>
 <CABXOdTeirbF1KRdFsmuRKHJ+p+7s9ZOZAW2S64MsPFajUjdqow@mail.gmail.com>
 <2a6d7691-b8a5-da92-865c-8cdf5efb673f@collabora.com> <CAHRSSEwnBrT0wnc+-dA2FXvu1udstwArFRYtHu+f-79fZgd2JQ@mail.gmail.com>
In-Reply-To: <CAHRSSEwnBrT0wnc+-dA2FXvu1udstwArFRYtHu+f-79fZgd2JQ@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 21 Jun 2021 12:59:21 -0700
Message-ID: <CAHRSSEwtCOjxp4-GVRD+31bASw3k+isZbguABmUX_V82tu8T=Q@mail.gmail.com>
Subject: Re: can't access kernelci results
Content-Type: multipart/alternative; boundary="000000000000a77c3705c54c1ca9"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io, Guenter Roeck <groeck@google.com>, Kevin Hilman <khilman@baylibre.com>

--000000000000a77c3705c54c1ca9
Content-Type: text/plain; charset="UTF-8"

I'm having this issue again (can't access kernelci results at
https://linux.kernelci.org/job/android/). Is the mongod service borked
again?

On Mon, Apr 5, 2021 at 4:14 PM Todd Kjos <tkjos@google.com> wrote:

> Working again. Thanks Guillaume.
>
> On Mon, Apr 5, 2021 at 1:58 PM Guillaume Tucker <
> guillaume.tucker@collabora.com> wrote:
>
>> On 05/04/2021 21:39, Guenter Roeck via groups.io wrote:
>> > On Mon, Apr 5, 2021 at 12:30 PM Todd Kjos via groups.io
>> > <tkjos=google.com@groups.io> wrote:
>> >>
>> >> I get errors when attempting to access
>> https://linux.kernelci.org/job/android/. Is this a known issue? Any ETA
>> for a fix?
>> >>
>> > Looks like the problem is not limited to android. I get error 500 for
>> > jobs and build results.
>>
>> That was another case of the mongod service stopping, it's pretty
>> rare but has happened a couple of times before.  Things are now
>> back to normal, but we've missed a few results while it was down.
>> Sorry for the disruption.
>>
>> We've deployed a monitoring tool on some servers but not yet on
>> this one, it should happen soon so this kind of issues would be
>> detected much quicker.  We've also started looking into using a
>> Mongo database in Azure rather than a manual install to reduce
>> maintenance work.
>>
>> Best wishes,
>> Guillaume
>>
>

--000000000000a77c3705c54c1ca9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m having this issue again (can&#39;t access kernelci=
 results at=C2=A0<a href=3D"https://linux.kernelci.org/job/android/">https:=
//linux.kernelci.org/job/android/</a>). Is the mongod service borked again?=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Apr 5, 2021 at 4:14 PM Todd Kjos &lt;<a href=3D"mailto:tkjos@google=
.com">tkjos@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div>Working again. Thanks Guillaume=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, Apr 5, 2021 at 1:58 PM Guillaume Tucker &lt;<a href=3D"mailto:guil=
laume.tucker@collabora.com" target=3D"_blank">guillaume.tucker@collabora.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 05/04/2021 21:39, Guenter Roeck via <a href=3D"http://groups.io" rel=3D=
"noreferrer" target=3D"_blank">groups.io</a> wrote:<br>
&gt; On Mon, Apr 5, 2021 at 12:30 PM Todd Kjos via <a href=3D"http://groups=
.io" rel=3D"noreferrer" target=3D"_blank">groups.io</a><br>
&gt; &lt;tkjos=3D<a href=3D"mailto:google.com@groups.io" target=3D"_blank">=
google.com@groups.io</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I get errors when attempting to access <a href=3D"https://linux.ke=
rnelci.org/job/android/" rel=3D"noreferrer" target=3D"_blank">https://linux=
.kernelci.org/job/android/</a>. Is this a known issue? Any ETA for a fix?<b=
r>
&gt;&gt;<br>
&gt; Looks like the problem is not limited to android. I get error 500 for<=
br>
&gt; jobs and build results.<br>
<br>
That was another case of the mongod service stopping, it&#39;s pretty<br>
rare but has happened a couple of times before.=C2=A0 Things are now<br>
back to normal, but we&#39;ve missed a few results while it was down.<br>
Sorry for the disruption.<br>
<br>
We&#39;ve deployed a monitoring tool on some servers but not yet on<br>
this one, it should happen soon so this kind of issues would be<br>
detected much quicker.=C2=A0 We&#39;ve also started looking into using a<br=
>
Mongo database in Azure rather than a manual install to reduce<br>
maintenance work.<br>
<br>
Best wishes,<br>
Guillaume<br>
</blockquote></div></div>
</blockquote></div>

--000000000000a77c3705c54c1ca9--
