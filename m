Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
 <7hh8jori5m.fsf@baylibre.com>
 <CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
 <7hsh38lhnv.fsf@baylibre.com>
From: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Message-ID: <c1c6e626-7920-dc5f-bee9-36e88caa2eb7@collabora.com>
Date: Wed, 22 Aug 2018 12:11:06 +0200
MIME-Version: 1.0
In-Reply-To: <7hsh38lhnv.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: dan.rue@linaro.org

Hi Kevin,

On 08/21/2018 01:52 AM, Kevin Hilman wrote:
> "Guillaume Tucker" <guillaume.tucker@gmail.com> writes:
>=20
>> On Mon, Aug 20, 2018 at 7:45 PM Kevin Hilman <khilman@baylibre.com> wr=
ote:
>>>
>>> Dan, thanks again for the minutes!
>>>
>>> "Dan Rue" <dan.rue@linaro.org> writes:
>>>
>>>> - Attendees: Ana, Guillaume, Matt, Milosz, Rafael, Dan, Mark
>>>>
>>>> - Guillaume
>>>>    - Dealing with test results:
>>>>      - We currently have test suites/sets/cases, but test sets aren=E2=
=80=99t
>>>>        used and their implementation is broken.
>>>
>>> What is broken in the implementation?  LAVA? backend? frontend?
>>
>> The way we currently deal with test sets in the backend does not
>> add any value with the short test plans we currently have.  As I
>> explained in my previous email thread, both the test suite and
>> test set entries have a list of test cases, making test sets
>> effectively redundant.
>=20
> For the test plans we have, I see how that is redundant, but for test
> plans that actually include test sets, is it still redunant?
>=20
> My understanding was that test suites contain test sets (at least one
> "default" if no others are defined), and that test sets contain test
> cases.

Can you explain what do you think KernelCI should do with the hierarchy=20
information? That would allow me to understand the need for storing tests=
=20
within a multiple level hierarchy.

For the use cases I currently care about, it's enough to have test plans=20
(corresponding to a kernel subsystem, so we know where to send regression=
=20
reports) containing tests.

Note that for big test suites, it's normal to have 6 levels or more, so=20
I'm a bit concerned that if we decide to go now with 4 levels, we may=20
need we need more in the future. But right now I'm having trouble=20
figuring out what kernelci would do with the hierarchy information.

Thanks,

Tomeu
