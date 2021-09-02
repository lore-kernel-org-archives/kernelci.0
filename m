MIME-Version: 1.0
References: <CAHRSSEzUpY+7Lhb40B_v9cSc1KQOcztZ=WiV+1-+ocdcsNUGFQ@mail.gmail.com>
 <CABXOdTeirbF1KRdFsmuRKHJ+p+7s9ZOZAW2S64MsPFajUjdqow@mail.gmail.com>
 <2a6d7691-b8a5-da92-865c-8cdf5efb673f@collabora.com> <CAHRSSEwnBrT0wnc+-dA2FXvu1udstwArFRYtHu+f-79fZgd2JQ@mail.gmail.com>
 <CAHRSSEwtCOjxp4-GVRD+31bASw3k+isZbguABmUX_V82tu8T=Q@mail.gmail.com>
 <285b11ad-40dc-eb88-427e-f32c4a422c85@collabora.com> <CAHRSSEy6nOgPG8LVcMh9e-rxkWpAZNOeC5B=L2KKuE66Qynv3Q@mail.gmail.com>
 <b12def92-d4cc-ec89-9e6d-d3e710970ccd@collabora.com> <CAHRSSEyvTz9BhenBec79ieXdURYKOMaqk78uKjeZciHNSeSKag@mail.gmail.com>
In-Reply-To: <CAHRSSEyvTz9BhenBec79ieXdURYKOMaqk78uKjeZciHNSeSKag@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Thu, 2 Sep 2021 12:28:28 -0700
Message-ID: <CAHRSSEzAsiLrrJ_XjmykMjn96JcN+-F3iugSfFaG124UhS3W8w@mail.gmail.com>
Subject: Re: can't access kernelci results
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>, kernelci@groups.io, Guenter Roeck <groeck@google.com>, Kevin Hilman <khilman@baylibre.com>

It's working again. Thanks.

On Thu, Sep 2, 2021 at 8:58 AM Todd Kjos <tkjos@google.com> wrote:
>
> I'm getting errors again when attempting to access
> https://linux.kernelci.org/job/android/. mongod issues again?
>
> "Error while loading data from the server (error code: 500). Please
> contact the website administrator"
>
> On Tue, Jun 22, 2021 at 8:17 AM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> >
> > On 22/06/2021 16:07, Todd Kjos wrote:
> > > Hmm, it's still not working for me -- did it break again?
> >
> > Yes there was an OOM issue:
> >
> > [4316410.416514] Killed process 20620 (mongod) total-vm:20171340kB, ano=
n-rss:18654740kB, file-rss:0kB, shmem-rss:0kB
> > [4316412.060511] oom_reaper: reaped process 20620 (mongod), now anon-rs=
s:0kB, file-rss:0kB, shmem-rss:0kB
> >
> > We're looking into moving the Mongo DB instance to the cloud in
> > Azure.  Hopefully that will save us fixing this kind of
> > maintenance issues.  Meanwhile, we should take a look and see if
> > there's some config option to limit the amount of RAM used by
> > Mongo DB to work around the problem.
> >
> > Best wishes,
> > Guillaume
> >
> >
> > > On Tue, Jun 22, 2021 at 2:43 AM Micha=C5=82 Ga=C5=82ka <michal.galka@=
collabora.com <mailto:michal.galka@collabora.com>> wrote:
> > >
> > >     On 21.06.2021 21:59, Todd Kjos via groups.io <http://groups.io> w=
rote:
> > >     > I'm having this issue again (can't access kernelci results
> > >     > at https://linux.kernelci.org/job/android/ <https://linux.kerne=
lci.org/job/android/>
> > >     > <https://linux.kernelci.org/job/android/ <https://linux.kernelc=
i.org/job/android/>>). Is the mongod service borked
> > >     > again?
> > >     >
> > >
> > >     Yes, there was an issue with mongod service again. It's working n=
ow,
> > >     celery processed pending tasks and everything seems responsive.
> > >
> > >     Thanks,
> > >     Micha=C5=82
> > >
> >
