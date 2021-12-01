Subject: Re: can't access kernelci results
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
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <803b89a9-9141-636f-8fd3-f519b0440075@collabora.com>
Date: Wed, 1 Dec 2021 09:48:58 +0000
MIME-Version: 1.0
In-Reply-To: <CAHRSSExaOps1V6gvqmyi=Zy0hh+R3Xpcge0tzGfoCBfNAbFOnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Todd Kjos <tkjos@google.com>
Cc: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>, kernelci@groups.io, Guenter Roeck <groeck@google.com>, Kevin Hilman <khilman@baylibre.com>

Hi Todd,

On 30/11/2021 16:54, Todd Kjos wrote:
> ...and now it's working again. Sorry about the noise if the issue was
> on my side.

The MongoDB server did crash but it was restarted a few minutes
later.  There's some kind of watchdog to do that automatically,
maybe you were out of luck and checked the website during that
window.  Thanks for reporting the issue in any case.

Best wishes,
Guillaume

> On Tue, Nov 30, 2021 at 8:35 AM Todd Kjos <tkjos@google.com> wrote:
>>
>> I can't load the data from https://linux.kernelci.org/job/android/
>> ("Error loading build data."). Is mongod "borked" again?
>>
>> On Thu, Sep 2, 2021 at 12:28 PM Todd Kjos <tkjos@google.com> wrote:
>>>
>>> It's working again. Thanks.
>>>
>>> On Thu, Sep 2, 2021 at 8:58 AM Todd Kjos <tkjos@google.com> wrote:
>>>>
>>>> I'm getting errors again when attempting to access
>>>> https://linux.kernelci.org/job/android/. mongod issues again?
>>>>
>>>> "Error while loading data from the server (error code: 500). Please
>>>> contact the website administrator"
>>>>
>>>> On Tue, Jun 22, 2021 at 8:17 AM Guillaume Tucker
>>>> <guillaume.tucker@collabora.com> wrote:
>>>>>
>>>>> On 22/06/2021 16:07, Todd Kjos wrote:
>>>>>> Hmm, it's still not working for me -- did it break again?
>>>>>
>>>>> Yes there was an OOM issue:
>>>>>
>>>>> [4316410.416514] Killed process 20620 (mongod) total-vm:20171340kB, a=
non-rss:18654740kB, file-rss:0kB, shmem-rss:0kB
>>>>> [4316412.060511] oom_reaper: reaped process 20620 (mongod), now anon-=
rss:0kB, file-rss:0kB, shmem-rss:0kB
>>>>>
>>>>> We're looking into moving the Mongo DB instance to the cloud in
>>>>> Azure.  Hopefully that will save us fixing this kind of
>>>>> maintenance issues.  Meanwhile, we should take a look and see if
>>>>> there's some config option to limit the amount of RAM used by
>>>>> Mongo DB to work around the problem.
>>>>>
>>>>> Best wishes,
>>>>> Guillaume
>>>>>
>>>>>
>>>>>> On Tue, Jun 22, 2021 at 2:43 AM Micha=C5=82 Ga=C5=82ka <michal.galka=
@collabora.com <mailto:michal.galka@collabora.com>> wrote:
>>>>>>
>>>>>>     On 21.06.2021 21:59, Todd Kjos via groups.io <http://groups.io> =
wrote:
>>>>>>     > I'm having this issue again (can't access kernelci results
>>>>>>     > at https://linux.kernelci.org/job/android/
>>>>>>     > <https://linux.kernelci.org/job/android/>). Is the mongod serv=
ice borked
>>>>>>     > again?
>>>>>>     >
>>>>>>
>>>>>>     Yes, there was an issue with mongod service again. It's working =
now,
>>>>>>     celery processed pending tasks and everything seems responsive.
>>>>>>
>>>>>>     Thanks,
>>>>>>     Micha=C5=82
>>>>>>
>>>>>

