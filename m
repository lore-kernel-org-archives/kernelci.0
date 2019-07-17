Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: next/master baseline: 7 runs, 0 regressions (next-20190717)
In-Reply-To: <1ab642a0-0157-84c6-a3a8-da3ead6f55b1@collabora.com>
References: <5d2f063d.1c69fb81.64f72.9c8e@mx.google.com> <1ab642a0-0157-84c6-a3a8-da3ead6f55b1@collabora.com>
Date: Wed, 17 Jul 2019 10:43:55 -0500
Message-ID: <7ha7dcy8ck.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@gmail.com, kernel-build-reports@lists.linaro.org, kernelci@groups.io
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>

"Guillaume Tucker" <guillaume.tucker@gmail.com> writes:

> On 17/07/2019 12:27, kernelci.org bot wrote:
>> next/master baseline: 7 runs, 0 regressions (next-20190717)
>> 
>> Test results summary
>> --------------------
>> 
>> run | platform                 | arch   | lab                      | compiler | defconfig          | errors
>> ----+--------------------------+--------+--------------------------+----------+--------------------+-------
>>   1 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig | 1/61
>>   2 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig | 1/61
>>   3 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig | 1/61
>>   4 | rk3399-gru-kevin         | arm64  | lab-collabora            | clang-8  | defconfig          | 0/78
>>   5 | rk3399-gru-kevin         | arm64  | lab-collabora            | clang-8  | defconfig          | 0/78
>>   6 | rk3399-gru-kevin         | arm64  | lab-collabora            | gcc-8    | defconfig          | 0/78
>>   7 | rk3399-gru-kevin         | arm64  | lab-collabora            | gcc-8    | defconfig          | 0/78
>
> There's still an issue with this summary table as the "full"
> defconfig is not shown, so there's no way to tell the difference
> between runs 1, 2 or 3.  In the detailed sections, you can see
> that they have CONFIG_ARM_LPAE=y, CONFIG_EFI=y and CONFIG_SMP=n
> on top of the defconfig.
>
> So it could be reformatted this way:
>
>
> run | platform                 | arch   | lab                      | compiler | defconfig                                         | errors
> ----+--------------------------+--------+--------------------------+----------+---------------------------------------------------+-------
>   1 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y | 1/61
>   2 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig+CONFIG_SMP=n                   | 1/61
>   3 | rk3288-veyron-jaq        | arm    | lab-collabora            | gcc-8    | multi_v7_defconfig                                | 1/61
>
>
> which obviously makes the table quite a bit wider.
>
> The width of each column is currently fixed but it could be
> dynamically computed based on the results to avoid superfluous
> spaces:
>
> run | platform          | arch | lab           | compiler | defconfig                                         | errors
> ----+-------------------+------+---------------+----------+---------------------------------------------------+-------
>   1 | rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y | 1/61
>   2 | rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig+CONFIG_SMP=n                   | 1/61
>   3 | rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defconfig                                | 1/61
>
>
> Is that still readable enough, or does it get so wide that it's
> becoming too hard to read?

IMO, that's readable, but any more columns, and were going to soon be in
the realm of "not useful to view in email"

Kevin
