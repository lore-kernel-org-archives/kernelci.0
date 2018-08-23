MIME-Version: 1.0
In-Reply-To: <7hsh35699g.fsf@baylibre.com>
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
 <7hh8jori5m.fsf@baylibre.com> <CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
 <7hsh38lhnv.fsf@baylibre.com> <c1c6e626-7920-dc5f-bee9-36e88caa2eb7@collabora.com>
 <7hsh35699g.fsf@baylibre.com>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Thu, 23 Aug 2018 08:35:17 +0100
Message-ID: <CAJrz+7Lntwnsrbzh6Tc7KWQKA0tVc-v6-dQ+j3kVjfLVZ1zvug@mail.gmail.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Guillaume Tucker <guillaume.tucker@gmail.com>, Dan Rue <dan.rue@linaro.org>

On 23 August 2018 at 04:40, Kevin Hilman <khilman@baylibre.com> wrote:
> "Tomeu Vizoso" <tomeu.vizoso@collabora.com> writes:
>
>> Hi Kevin,
>>
>> On 08/21/2018 01:52 AM, Kevin Hilman wrote:
>>> "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:
>>>
>>>> On Mon, Aug 20, 2018 at 7:45 PM Kevin Hilman <khilman@baylibre.com> wr=
ote:
>>>>>
>>>>> Dan, thanks again for the minutes!
>>>>>
>>>>> "Dan Rue" <dan.rue@linaro.org> writes:
>>>>>
>>>>>> - Attendees: Ana, Guillaume, Matt, Milosz, Rafael, Dan, Mark
>>>>>>
>>>>>> - Guillaume
>>>>>>    - Dealing with test results:
>>>>>>      - We currently have test suites/sets/cases, but test sets aren=
=E2=80=99t
>>>>>>        used and their implementation is broken.
>>>>>
>>>>> What is broken in the implementation?  LAVA? backend? frontend?
>>>>
>>>> The way we currently deal with test sets in the backend does not
>>>> add any value with the short test plans we currently have.  As I
>>>> explained in my previous email thread, both the test suite and
>>>> test set entries have a list of test cases, making test sets
>>>> effectively redundant.
>>>
>>> For the test plans we have, I see how that is redundant, but for test
>>> plans that actually include test sets, is it still redunant?
>>>
>>> My understanding was that test suites contain test sets (at least one
>>> "default" if no others are defined), and that test sets contain test
>>> cases.
>>
>> Can you explain what do you think KernelCI should do with the
>> hierarchy information? That would allow me to understand the need for
>> storing tests within a multiple level hierarchy.
>
> For me, it's just about reporting an visualization (something we are not
> currently doing great at).  IMO, even a test suite with > 20 test cases
> really needs to be broken up a bit for ease of making reports that are
> easy to understand.

I'm not sure you realize what you're asking for. Let's take the
example of LTP syscalls. It contains ~1000 test cases. If you break
them down to contain fewer than 20 you'll get 50+ groups (sets). This
doesn't solve any problem, just moves it one level up. Test suites
will contain a lot of tests. This is a fact of life that just needs to
be accepted.

milosz
