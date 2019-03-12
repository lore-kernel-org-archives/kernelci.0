Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Weekly Meeting 2019-03-11 #minutes
In-Reply-To: <20190311194149.v6albgr7hmtvh25m@xps.therub.org>
References: <20190311194149.v6albgr7hmtvh25m@xps.therub.org>
Date: Mon, 11 Mar 2019 17:27:25 -0700
Message-ID: <7h1s3dvswi.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dan.rue@linaro.org, kernelci@groups.io

"Dan Rue" <dan.rue@linaro.org> writes:

> - Attendees: Amro, Anders, Charles, Daniel, Guenter, Guillaume, Mark,
>   Matt, Michal, Milosz, Dan, Kevin
>
> - Matt
>   - How to get clang(-8) builds running on production?
>     - Must fix email report issue discovered with
>       https://github.com/kernelci/kernelci-core-staging/pull/106
>     - Start doing arm64 on production?
>       - Arm64_defconfig fine once patch lands to clean it up
>     - For armv7, support different email recipients? Or remove a lot of
>       the email report verbosity and just send all reports to the same
>       recipients?
>       - Fix email issue above
>       - Arm7 when arch-complete can differentiate between environments
>       - Frontend show compiler
>     - Email reports
>       - Warning counts limited to 10
>       - Remove warnings from per-defconfig
>       - Keep errors
>   - Moving this meeting or having alternative times, to get Kevin in
>     more regularly

Thanks, I'd really like to be able to join more often.

I was able to join today because the US has already switched DST, so the
meeting was 1h later (7am for me) which is quite workable for me.

>     - Broonie to run a new doodle
>
> - Charles
>   - Kernelci ELK dashboards
>   - [mark] one of the things that kernelci.org does really well is
>     individual boot page
>   - [amro] a bit difficult to consume some of the nested data
>   - [amro] can filter by lab, arch, config, platform and show boot
>     result metrics
>   - [gtucker] have you looked at test results (not just boot results)?
>     - [amro] because results are nested, it=E2=80=99s hard to index them.=
 Need
>       to bring data to the root of the document
>     - [charles] we can create a table for this, it=E2=80=99s just a matte=
r of
>       what we want to show to developers. Very doable.

The indexing / nesting all relates how the raw data is
ingested/structured via the logstash config.  In the end, I think the
logstash config is just as important to get right as the initial
dashboards, so it would be nice to see that config, and hear the
rationale behind how/why it was done, and how it relates to the
limitations above.

I look forward to seeing the demo another time.  Sorry I missed it.

Kevin
