Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [kernelci] Meeting Minutes for 2018-08-20
References: <20180820162851.saybq7xfvkz7m2v2@xps.therub.org>
	<7hh8jori5m.fsf@baylibre.com>
	<CAH1_8nBS6YtRAt9gKCTGBSgxqZ=29dYWgB9cNe_-n_Kh+HHqMg@mail.gmail.com>
	<7hsh38lhnv.fsf@baylibre.com>
	<c1c6e626-7920-dc5f-bee9-36e88caa2eb7@collabora.com>
	<20180822172018.vl4u6ajkdjo54vfv@xps.therub.org>
	<7hk1oh68sb.fsf@baylibre.com>
	<CAH1_8nBKSwYDetOTJR-a3Nzv-La9=SiqMbENoVVn9D0hhSTQ4A@mail.gmail.com>
Date: Fri, 24 Aug 2018 09:43:14 -0700
In-Reply-To: <CAH1_8nBKSwYDetOTJR-a3Nzv-La9=SiqMbENoVVn9D0hhSTQ4A@mail.gmail.com>
	(Guillaume Tucker's message of "Thu, 23 Aug 2018 08:35:33 +0100")
Message-ID: <7hzhxb4swt.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: dan.rue@linaro.org, tomeu.vizoso@collabora.com, kernelci@groups.io

Guillaume Tucker <guillaume.tucker@gmail.com> writes:

[...]

> I like Kevin's suggestion of having sets in sets, in fact that's
> something we were discussing yesterday with Ana.  Here's a
> pseudo-schema I think would work well:
>
> TestCase:
>   * name
>   * result
>   * meta-data
>
> TestGroup:
>   * name
>   * meta-data
>   * list of test cases
>   * list of test groups
>
> Think of it a bit like a file system, with groups being
> directories and cases files.  You can have groups within
> groups...  This can scale both ways, to have sets within suites,
> and also suites within a collection of suites or whatever we want
> to do with this.  Then we can have a way of calling them with
> some kind of path like suite/set/case, or suite.set.case, or just
> suite.case, or super-plan.suite.case or whatever it takes to
> store the test suite results.
>
> I believe the changes should be relatively simple, and should
> result in a simpler database schema than what we have now with
> suites & sets mixed up.

I like it!  Can support relatively flat (like we have today) or
arbitrary scaling.  

Kevin

