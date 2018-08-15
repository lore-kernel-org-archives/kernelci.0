MIME-Version: 1.0
In-Reply-To: <CACNq6_a4fBc3Q8H4rDZwOSNsWLCZ9tJ-_oi+iKs_=gkkZHGf+A@mail.gmail.com>
References: <CAH+k93God7SdCeet-S=n4iUmLvyJr4+hORa=W852N_tKWFo8Qw@mail.gmail.com>
 <7hefezlkoi.fsf@baylibre.com> <CACNq6_a4fBc3Q8H4rDZwOSNsWLCZ9tJ-_oi+iKs_=gkkZHGf+A@mail.gmail.com>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Wed, 15 Aug 2018 17:05:01 +0100
Message-ID: <CAH+k93F_04KY43aUDaOuen8heG6-UVVgpbrgcW6DGXtNSEyLQw@mail.gmail.com>
Subject: Re: [kernelci] Compilers from.. debian?
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io

On 15 August 2018 at 16:39, Mark Brown <broonie@kernel.org> wrote:
>
>
> On Wed, 15 Aug 2018, 4:21 pm Kevin Hilman, <khilman@baylibre.com> wrote:
>>
>> "Matt Hart" <matthew.hart@linaro.org> writes:
>>
>> > Does anyone have a strong opinion about where we get our compiler
>> > releases from?
>>
>> I think the current tarball way is a hack and not scalable, so...
>>
>> > Currently it's a mash up of Linaro for ARM(32/64), MIPS from unknown,
>> > and X86 from whatever ubuntu is installed on the builder
>> >
>> > As part of my work to start building with multiple compiler versions,
>> > I've been creating Dockerfiles for the builders with different
>> > compiler versions installed in them. As I've been doing this, it's
>> > been really easy to just install the various compilers packages from
>> > Debian. They also cover a lot of architectures we're hoping to add in
>> > the future.
>> >
>> > Anyone mind if we start using Debian toolchain releases in future?
>> > I'm no toolchain expert, so I'm looking for some opinions.
>>
>> It's better than what we're doing today, and has a much clearer
>> upgrade/migration path, so I say go for it!
>
>
> The only concern I can think of is that it's going to be a bit harder for
> those not fortunate enough to run Debian to get the toolchains if there's
> some reason to reproduce things. On the other hand that's a rare occurrence
> and with moving the builders more to Docker there's always the option of
> using the container to get the compilers on other OSs.

I've been thinking about adding a section to the build page of "repeat
this build" and a link to either a dockerfile or image which runs the
identical steps in the same environment, it could be a really nice
feature to add.

>
>>
>> Kevin
>>
>> 
>>
>
