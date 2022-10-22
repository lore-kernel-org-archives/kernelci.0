Message-ID: <f737cc25e353f13ea43f5e149c4fda6783d33ee6.camel@collabora.com>
Subject: Re: can't access kernelci results
From: "Denys Fedoryshchenko" <denys.f@collabora.com>
Date: Sat, 22 Oct 2022 10:00:44 +0300
In-Reply-To: <CAHRSSEy=nx4+MDz7ofOsJgeoTYE2Khp_XRSWcysUPw_mtiBG5g@mail.gmail.com>
References: 
	<CAHRSSEzUpY+7Lhb40B_v9cSc1KQOcztZ=WiV+1-+ocdcsNUGFQ@mail.gmail.com>
	 <CABXOdTeirbF1KRdFsmuRKHJ+p+7s9ZOZAW2S64MsPFajUjdqow@mail.gmail.com>
	 <2a6d7691-b8a5-da92-865c-8cdf5efb673f@collabora.com>
	 <CAHRSSEwnBrT0wnc+-dA2FXvu1udstwArFRYtHu+f-79fZgd2JQ@mail.gmail.com>
	 <CAHRSSEwtCOjxp4-GVRD+31bASw3k+isZbguABmUX_V82tu8T=Q@mail.gmail.com>
	 <285b11ad-40dc-eb88-427e-f32c4a422c85@collabora.com>
	 <CAHRSSEy6nOgPG8LVcMh9e-rxkWpAZNOeC5B=L2KKuE66Qynv3Q@mail.gmail.com>
	 <b12def92-d4cc-ec89-9e6d-d3e710970ccd@collabora.com>
	 <CAHRSSEyvTz9BhenBec79ieXdURYKOMaqk78uKjeZciHNSeSKag@mail.gmail.com>
	 <CAHRSSEzAsiLrrJ_XjmykMjn96JcN+-F3iugSfFaG124UhS3W8w@mail.gmail.com>
	 <CAHRSSExEexitM-NNR4DWMcQObDOBpGk8AcC4-PMZCjHwctJ8og@mail.gmail.com>
	 <CAHRSSExaOps1V6gvqmyi=Zy0hh+R3Xpcge0tzGfoCBfNAbFOnQ@mail.gmail.com>
	 <803b89a9-9141-636f-8fd3-f519b0440075@collabora.com>
	 <CAHRSSEwB_L-i0UZH01s424vPog7ArU=uSutsqmexMSO92JtTNA@mail.gmail.com>
	 <2059d7b9-2ae1-af0e-5231-1e8c9803f027@collabora.com>
	 <ab497ba9-dd75-d89b-1feb-1f79ccb2bd4b@collabora.com>
	 <CAHRSSEx6tz-+SsooCZNCozCKns9rCkBKTzMco8AbOaS9h5aKqg@mail.gmail.com>
	 <17187305E642C450.18151@groups.io>
	 <4fb452486cc177348cfbe50ae905705aa71f6ada.camel@collabora.com>
	 <CAHRSSEzFqwUFxmW5yqkn03Qewq5t=DwfBstSJQzpw+p0b3Ad4g@mail.gmail.com>
	 <CAHRSSEzOvvXkGKR6DREvHKMLaRD_SnL3Y5YG-7-t3Ev9=2Upag@mail.gmail.com>
	 <b5529b0298af8de1c7d85c784489664305ac309d.camel@collabora.com>
	 <CAHRSSExho+0=LJHxzqoUpX3aZOerE9BOi3cyjgFR+zvdnAOecw@mail.gmail.com>
	 <CAHRSSEy=nx4+MDz7ofOsJgeoTYE2Khp_XRSWcysUPw_mtiBG5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, tkjos@google.com
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, =?UTF-8?Q?Micha=C5=82_Ga=C5=82ka?= <michal.galka@collabora.com>, Guenter Roeck <groeck@google.com>, Kevin Hilman <khilman@baylibre.com>

Hello,

Issue found and fixed.=C2=A0
Thanks!

P.S. Also i opened github issue where i will document stability issues
and taken actions, as some of persisting problems require allocation of
additional resources and additional investigation:
https://github.com/kernelci/kernelci-project/issues/133


On Fri, 2022-10-21 at 09:25 -0700, Todd Kjos via groups.io wrote:
> Dashboard broken again (https://linux.kernelci.org/job/android/)?
> (Error
> while loading data from the server (error code: 500). Please contact
> the
> website administrator)
>=20
> On Fri, Oct 14, 2022 at 11:39 AM Todd Kjos <tkjos@google.com> wrote:
>=20
> > Thanks. It's working again.
> >=20
> > On Fri, Oct 14, 2022 at 11:17 AM Denys Fedoryshchenko <
> > denys.f@collabora.com> wrote:
> >=20
> > > Thanks for info, i am investigating issue and will fix problem
> > > shortly.
> > > Hopefully next week we will have monitoring system in place.
> > >=20
> > > On Fri, 2022-10-14 at 11:12 -0700, Todd Kjos wrote:
> > >=20
> > > The dashboard is broken again. Known issue?
> > >=20
> > > "Error while loading data from the server (error code: 500).
> > > Please
> > > contact the website administrator"
> > >=20
> > > On Mon, Sep 26, 2022 at 9:13 AM Todd Kjos <tkjos@google.com>
> > > wrote:
> > >=20
> > > Thanks for the quick response! It's working for me now.
> > >=20
> > > On Mon, Sep 26, 2022 at 9:06 AM Denys Fedoryshchenko <
> > > denys.f@collabora.com> wrote:
> > >=20
> > > Upd: dashboard should be fine now, but we are running update
> > > right now,
> > > so some glitches might happen.
> > >=20
> > > On Mon, 2022-09-26 at 18:35 +0300, Denys Fedoryshchenko wrote:
> > > > We are investingating right now and trying to solve the issue.
> > > >=20
> > > > On Mon, 2022-09-26 at 08:29 -0700, Todd Kjos via groups.io
> > > > wrote:
> > > > > Having trouble accessing
> > > > > https://linux.kernelci.org/job/android/=C2=A0today -
> > > > > server issues?
> > > > >=20
> > > > > On Fri, Mar 18, 2022 at 10:26 AM Guillaume Tucker <
> > > > > guillaume.tucker@collabora.com> wrote:
> > > > >=20
> > > > > > On 18/03/2022 17:19, Guillaume Tucker wrote:
> > > > > >=20
> > > > > > On 18/03/2022 15:47, Todd Kjos wrote:
> > > > > >=20
> > > > > > Is the MongoDB server down again? I don't get results at
> > > > > > https://linux.kernelci.org/job/android/.
> > > > > >=20
> > > > > > It's not that, unfortunately there's some persisting issue
> > > > > > which
> > > > > > seems to
> > > > > > have started yesterday. We're investigating now, please
> > > > > > bear with
> > > > > > us. Thank
> > > > > > you for reporting the problem.
> > > > > >=20
> > > > > > Alright, there was a problem with background processing
> > > > > > tasks on
> > > > > > the
> > > > > > server. That's resolved now, although a number of kernel
> > > > > > builds
> > > > > > need to be
> > > > > > restarted which is why so many trees appear to be "in
> > > > > > progress"
> > > > > > on
> > > > > > the web
> > > > > > dashboard. Things will start picking up again gradually, it
> > > > > > might
> > > > > > take a
> > > > > > few hours to get back to normal. Sorry for the
> > > > > > inconvenience.
> > > > > >=20
> > > > > > Best wishes,
> > > > > > Guillaume
> > > > > >=20
> > > > > >=20
> > > > > > On Wed, Dec 1, 2021 at 1:49 AM Guillaume Tucker <
> > > > > > guillaume.tucker@collabora.com> wrote:
> > > > > >=20
> > > > > > > Hi Todd,
> > > > > > >=20
> > > > > > > On 30/11/2021 16:54, Todd Kjos wrote:
> > > > > > > > ...and now it's working again. Sorry about the noise if
> > > > > > > > the
> > > > > > > > issue was
> > > > > > > > on my side.
> > > > > > >=20
> > > > > > > The MongoDB server did crash but it was restarted a few
> > > > > > > minutes
> > > > > > > later.=C2=A0 There's some kind of watchdog to do that
> > > > > > > automatically,
> > > > > > > maybe you were out of luck and checked the website during
> > > > > > > that
> > > > > > > window.=C2=A0 Thanks for reporting the issue in any case.
> > > > > > >=20
> > > > > > > Best wishes,
> > > > > > > Guillaume
> > > > > > >=20
> > > > > > > > On Tue, Nov 30, 2021 at 8:35 AM Todd Kjos
> > > > > > > > <tkjos@google.com>
> > > > > > > > wrote:
> > > > > > > > >=20
> > > > > > > > > I can't load the data from
> > > > > > > > > https://linux.kernelci.org/job/android/
> > > > > > > > > ("Error loading build data."). Is mongod "borked"
> > > > > > > > > again?
> > > > > > > > >=20
> > > > > > > > > On Thu, Sep 2, 2021 at 12:28 PM Todd Kjos
> > > > > > > > > <tkjos@google.com>
> > > > > > > > > wrote:
> > > > > > > > > >=20
> > > > > > > > > > It's working again. Thanks.
> > > > > > > > > >=20
> > > > > > > > > > On Thu, Sep 2, 2021 at 8:58 AM Todd Kjos
> > > > > > > > > > <tkjos@google.com>
> > > > > > > > > > wrote:
> > > > > > > > > > >=20
> > > > > > > > > > > I'm getting errors again when attempting to
> > > > > > > > > > > access
> > > > > > > > > > > https://linux.kernelci.org/job/android/. mongod
> > > > > > > > > > > issues
> > > > > > > > > > > again?
> > > > > > > > > > >=20
> > > > > > > > > > > "Error while loading data from the server (error
> > > > > > > > > > > code:
> > > > > > > > > > > 500). Please
> > > > > > > > > > > contact the website administrator"
> > > > > > > > > > >=20
> > > > > > > > > > > On Tue, Jun 22, 2021 at 8:17 AM Guillaume Tucker
> > > > > > > > > > > <guillaume.tucker@collabora.com> wrote:
> > > > > > > > > > > >=20
> > > > > > > > > > > > On 22/06/2021 16:07, Todd Kjos wrote:
> > > > > > > > > > > > > Hmm, it's still not working for me -- did it
> > > > > > > > > > > > > break
> > > > > > > > > > > > > again?
> > > > > > > > > > > >=20
> > > > > > > > > > > > Yes there was an OOM issue:
> > > > > > > > > > > >=20
> > > > > > > > > > > > [4316410.416514] Killed process 20620 (mongod)
> > > > > > > > > > > > total-
> > > > > > > > > > > > vm:20171340kB,
> > > > > > > anon-rss:18654740kB, file-rss:0kB, shmem-rss:0kB
> > > > > > > > > > > > [4316412.060511] oom_reaper: reaped process
> > > > > > > > > > > > 20620
> > > > > > > > > > > > (mongod), now
> > > > > > > anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
> > > > > > > > > > > >=20
> > > > > > > > > > > > We're looking into moving the Mongo DB instance
> > > > > > > > > > > > to
> > > > > > > > > > > > the
> > > > > > > > > > > > cloud in
> > > > > > > > > > > > Azure.=C2=A0 Hopefully that will save us fixing thi=
s
> > > > > > > > > > > > kind
> > > > > > > > > > > > of
> > > > > > > > > > > > maintenance issues.=C2=A0 Meanwhile, we should take
> > > > > > > > > > > > a look
> > > > > > > > > > > > and see if
> > > > > > > > > > > > there's some config option to limit the amount
> > > > > > > > > > > > of RAM
> > > > > > > > > > > > used by
> > > > > > > > > > > > Mongo DB to work around the problem.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Best wishes,
> > > > > > > > > > > > Guillaume
> > > > > > > > > > > >=20
> > > > > > > > > > > >=20
> > > > > > > > > > > > > On Tue, Jun 22, 2021 at 2:43 AM Micha=C5=82 Ga=C5=
=82ka
> > > > > > > > > > > > > <
> > > > > > > michal.galka@collabora.com=C2=A0<mailto:michal.galka@collabor=
a.com
> > > > > > > >>
> > > > > > > wrote:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 On 21.06.2021 21:59, Todd Kjos=
 via
> > > > > > > > > > > > > groups.io
> > > > > > > > > > > > > <http://groups.io>
> > > > > > > wrote:
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 > I'm having this issue again =
(can't
> > > > > > > > > > > > > access
> > > > > > > > > > > > > kernelci results
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 > at
> > > > > > > > > > > > > https://linux.kernelci.org/job/android/=C2=A0<
> > > > > > > https://linux.kernelci.org/job/android/>
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 >
> > > > > > > > > > > > > <https://linux.kernelci.org/job/android/=C2=A0<
> > > > > > > https://linux.kernelci.org/job/android/>>). Is the mongod
> > > > > > > service
> > > > > > > borked
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 > again?
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 >
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 Yes, there was an issue with m=
ongod
> > > > > > > > > > > > > service
> > > > > > > > > > > > > again. It's
> > > > > > > working now,
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 celery processed pending tasks=
 and
> > > > > > > > > > > > > everything
> > > > > > > > > > > > > seems responsive.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 Thanks,
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 Micha=C5=82
> > > > > > > > > > > > >=20
> > > > > > > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > >=20
> > >=20
> > >=20
> > >=20
>=20
>=20
>=20
>=20
>=20


