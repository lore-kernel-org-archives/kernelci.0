Subject: Re: can't access kernelci results
References: <CAHRSSEzUpY+7Lhb40B_v9cSc1KQOcztZ=WiV+1-+ocdcsNUGFQ@mail.gmail.com>
 <CABXOdTeirbF1KRdFsmuRKHJ+p+7s9ZOZAW2S64MsPFajUjdqow@mail.gmail.com>
 <2a6d7691-b8a5-da92-865c-8cdf5efb673f@collabora.com>
 <CAHRSSEwnBrT0wnc+-dA2FXvu1udstwArFRYtHu+f-79fZgd2JQ@mail.gmail.com>
 <CAHRSSEwtCOjxp4-GVRD+31bASw3k+isZbguABmUX_V82tu8T=Q@mail.gmail.com>
 <285b11ad-40dc-eb88-427e-f32c4a422c85@collabora.com>
 <CAHRSSEy6nOgPG8LVcMh9e-rxkWpAZNOeC5B=L2KKuE66Qynv3Q@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <b12def92-d4cc-ec89-9e6d-d3e710970ccd@collabora.com>
Date: Tue, 22 Jun 2021 16:16:56 +0100
MIME-Version: 1.0
In-Reply-To: <CAHRSSEy6nOgPG8LVcMh9e-rxkWpAZNOeC5B=L2KKuE66Qynv3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Todd Kjos <tkjos@google.com>, =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>
Cc: kernelci@groups.io, Guenter Roeck <groeck@google.com>, Kevin Hilman <khilman@baylibre.com>

On 22/06/2021 16:07, Todd Kjos wrote:
> Hmm, it's still=C2=A0not working for me -- did it break again?

Yes there was an OOM issue:

[4316410.416514] Killed process 20620 (mongod) total-vm:20171340kB, anon-r=
ss:18654740kB, file-rss:0kB, shmem-rss:0kB
[4316412.060511] oom_reaper: reaped process 20620 (mongod), now anon-rss:0=
kB, file-rss:0kB, shmem-rss:0kB

We're looking into moving the Mongo DB instance to the cloud in
Azure.  Hopefully that will save us fixing this kind of
maintenance issues.  Meanwhile, we should take a look and see if
there's some config option to limit the amount of RAM used by
Mongo DB to work around the problem.

Best wishes,
Guillaume


> On Tue, Jun 22, 2021 at 2:43 AM Micha=C5=82 Ga=C5=82ka <michal.galka@col=
labora.com <mailto:michal.galka@collabora.com>> wrote:
>=20
>     On 21.06.2021 21:59, Todd Kjos via groups.io <http://groups.io> wrot=
e:
>     > I'm having this issue again (can't access kernelci results
>     > at=C2=A0https://linux.kernelci.org/job/android/
>     > <https://linux.kernelci.org/job/android/>). Is the mongod service =
borked
>     > again?
>     >
>=20
>     Yes, there was an issue with mongod service again. It's working now,
>     celery processed pending tasks and everything seems responsive.
>=20
>     Thanks,
>     Micha=C5=82
>=20

