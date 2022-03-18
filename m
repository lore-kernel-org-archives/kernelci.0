Message-ID: <ab497ba9-dd75-d89b-1feb-1f79ccb2bd4b@collabora.com>
Date: Fri, 18 Mar 2022 17:26:46 +0000
MIME-Version: 1.0
Subject: Re: can't access kernelci results
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
References: <CAHRSSEzUpY+7Lhb40B_v9cSc1KQOcztZ=WiV+1-+ocdcsNUGFQ@mail.gmail.com>
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
In-Reply-To: <2059d7b9-2ae1-af0e-5231-1e8c9803f027@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Todd Kjos <tkjos@google.com>
Cc: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>, kernelci@groups.io, Guenter Roeck <groeck@google.com>, Kevin Hilman <khilman@baylibre.com>

On 18/03/2022 17:19, Guillaume Tucker wrote:
> On 18/03/2022 15:47, Todd Kjos wrote:
>> Is the MongoDB server down again? I don't get results at=C2=A0https://li=
nux.kernelci.org/job/android/.
>
> It's not that, unfortunately there's some persisting issue which seems to=
 have started yesterday. We're investigating now, please bear with us. Than=
k you for reporting the problem.
>
Alright, there was a problem with background processing tasks on the server=
. That's resolved now, although a number of kernel builds need to be restar=
ted which is why so many trees appear to be "in progress" on the web dashbo=
ard. Things will start picking up again gradually, it might take a few hour=
s to get back to normal. Sorry for the inconvenience.

Best wishes,
Guillaume

>>
>> On Wed, Dec 1, 2021 at 1:49 AM Guillaume Tucker <guillaume.tucker@collab=
ora.com> wrote:
>>
>>     Hi Todd,
>>
>>     On 30/11/2021 16:54, Todd Kjos wrote:
>>     > ...and now it's working again. Sorry about the noise if the issue =
was
>>     > on my side.
>>
>>     The MongoDB server did crash but it was restarted a few minutes
>>     later.=C2=A0 There's some kind of watchdog to do that automatically,
>>     maybe you were out of luck and checked the website during that
>>     window.=C2=A0 Thanks for reporting the issue in any case.
>>
>>     Best wishes,
>>     Guillaume
>>
>>     > On Tue, Nov 30, 2021 at 8:35 AM Todd Kjos <tkjos@google.com> wrote=
:
>>     >>
>>     >> I can't load the data from https://linux.kernelci.org/job/android=
/
>>     >> ("Error loading build data."). Is mongod "borked" again?
>>     >>
>>     >> On Thu, Sep 2, 2021 at 12:28 PM Todd Kjos <tkjos@google.com> wrot=
e:
>>     >>>
>>     >>> It's working again. Thanks.
>>     >>>
>>     >>> On Thu, Sep 2, 2021 at 8:58 AM Todd Kjos <tkjos@google.com> wrot=
e:
>>     >>>>
>>     >>>> I'm getting errors again when attempting to access
>>     >>>> https://linux.kernelci.org/job/android/. mongod issues again?
>>     >>>>
>>     >>>> "Error while loading data from the server (error code: 500). Pl=
ease
>>     >>>> contact the website administrator"
>>     >>>>
>>     >>>> On Tue, Jun 22, 2021 at 8:17 AM Guillaume Tucker
>>     >>>> <guillaume.tucker@collabora.com> wrote:
>>     >>>>>
>>     >>>>> On 22/06/2021 16:07, Todd Kjos wrote:
>>     >>>>>> Hmm, it's still not working for me -- did it break again?
>>     >>>>>
>>     >>>>> Yes there was an OOM issue:
>>     >>>>>
>>     >>>>> [4316410.416514] Killed process 20620 (mongod) total-vm:201713=
40kB, anon-rss:18654740kB, file-rss:0kB, shmem-rss:0kB
>>     >>>>> [4316412.060511] oom_reaper: reaped process 20620 (mongod), no=
w anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
>>     >>>>>
>>     >>>>> We're looking into moving the Mongo DB instance to the cloud i=
n
>>     >>>>> Azure.=C2=A0 Hopefully that will save us fixing this kind of
>>     >>>>> maintenance issues.=C2=A0 Meanwhile, we should take a look and=
 see if
>>     >>>>> there's some config option to limit the amount of RAM used by
>>     >>>>> Mongo DB to work around the problem.
>>     >>>>>
>>     >>>>> Best wishes,
>>     >>>>> Guillaume
>>     >>>>>
>>     >>>>>
>>     >>>>>> On Tue, Jun 22, 2021 at 2:43 AM Micha=C5=82 Ga=C5=82ka <micha=
l.galka@collabora.com <mailto:michal.galka@collabora.com>> wrote:
>>     >>>>>>
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0On 21.06.2021 21:59, Todd Kjos via groups.=
io <http://groups.io> <http://groups.io> wrote:
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0> I'm having this issue again (can't acces=
s kernelci results
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0> at https://linux.kernelci.org/job/androi=
d/
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0> <https://linux.kernelci.org/job/android/=
>). Is the mongod service borked
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0> again?
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0>
>>     >>>>>>
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0Yes, there was an issue with mongod servic=
e again. It's working now,
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0celery processed pending tasks and everyth=
ing seems responsive.
>>     >>>>>>
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0Thanks,
>>     >>>>>>=C2=A0 =C2=A0 =C2=A0Micha=C5=82
>>     >>>>>>
>>     >>>>>
>>
>
