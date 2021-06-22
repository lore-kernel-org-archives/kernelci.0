Subject: Re: can't access kernelci results
References: <CAHRSSEzUpY+7Lhb40B_v9cSc1KQOcztZ=WiV+1-+ocdcsNUGFQ@mail.gmail.com>
 <CABXOdTeirbF1KRdFsmuRKHJ+p+7s9ZOZAW2S64MsPFajUjdqow@mail.gmail.com>
 <2a6d7691-b8a5-da92-865c-8cdf5efb673f@collabora.com>
 <CAHRSSEwnBrT0wnc+-dA2FXvu1udstwArFRYtHu+f-79fZgd2JQ@mail.gmail.com>
 <CAHRSSEwtCOjxp4-GVRD+31bASw3k+isZbguABmUX_V82tu8T=Q@mail.gmail.com>
From: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>
Message-ID: <285b11ad-40dc-eb88-427e-f32c4a422c85@collabora.com>
Date: Tue, 22 Jun 2021 11:43:36 +0200
MIME-Version: 1.0
In-Reply-To: <CAHRSSEwtCOjxp4-GVRD+31bASw3k+isZbguABmUX_V82tu8T=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, tkjos@google.com, Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Guenter Roeck <groeck@google.com>, Kevin Hilman <khilman@baylibre.com>

On 21.06.2021 21:59, Todd Kjos via groups.io wrote:
> I'm having this issue again (can't access kernelci results
> at=C2=A0https://linux.kernelci.org/job/android/
> <https://linux.kernelci.org/job/android/>). Is the mongod service borked
> again?
>=20

Yes, there was an issue with mongod service again. It's working now,
celery processed pending tasks and everything seems responsive.

Thanks,
Micha=C5=82
