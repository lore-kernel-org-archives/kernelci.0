MIME-Version: 1.0
In-Reply-To: <CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
 <7hh8jori5m.fsf@baylibre.com> <CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
From: "Milosz Wasilewski" <milosz.wasilewski@linaro.org>
Date: Tue, 21 Aug 2018 11:20:06 +0100
Message-ID: <CAJrz+7K2vWaYeby1hHi03T3DVQdz7Vrtc--h0=40-pewTukKfw@mail.gmail.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

On 20 August 2018 at 21:20, Guillaume Tucker <guillaume.tucker@gmail.com> wrote:

>> >     - Suggestion: Remove test sets to simplify things.  If we need a
>> >       better backend solution, we should consider SQUAD and rethink this
>> >       from a global point of view.
>>
>> Not sure how squad helps here.  Seems it was designed with this same
>> limitation.  IMO we need the raw data to be coherent, and cleanly broken
>> down, and the frontend/UI used to view needs to be independent from
>> that.
>
> It's important to consider what SQUAD can bring to KernelCI -
> with what it can do now or what can be done with some changes.
> It may turn out to not be a good fit, but we can't ignore the
> fact that it was designed for a very similar use-case: storing
> results from multiple platforms running tests, and presenting
> these results.  Maybe SQUAD can provide a coherent data model
> that works perfectly well for KernelCI, maybe we need to mix it
> or merge it with our current backend solution somehow.
>
> We now have the KernelCI folks learning about SQUAD and the SQUAD
> folks learning about KernelCI, we'll see where that leads us.
>

Guillaume,
Maybe we can speed up this learning process a bit by arranging a f2f
meeting some time this/next week in Cambridge? I'm free all day on
Thursday and I can visit you or we can meet at Makespace.

milosz
