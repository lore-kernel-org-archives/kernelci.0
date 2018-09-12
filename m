Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: kernelci-frontend: limitation on X days of data
References: <CAOi56cX+13EOOC-COoxaJ6P981cqzU8xDxyn-t=5DB9y6Q+Lqw@mail.gmail.com>
	<CAEFW_ihUV+Cs_jHH3vmzaxjN5dOY1h05bSzqHuxR_Fxa+m1Cag@mail.gmail.com>
Date: Wed, 12 Sep 2018 13:20:50 -0700
In-Reply-To: <CAEFW_ihUV+Cs_jHH3vmzaxjN5dOY1h05bSzqHuxR_Fxa+m1Cag@mail.gmail.com>
	(Milo Casagrande's message of "Fri, 7 Sep 2018 09:50:42 +0200")
Message-ID: <7htvmuxyal.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Milo Casagrande <milo@foundries.io>
Cc: kernelci@groups.io

Milo Casagrande <milo@foundries.io> writes:

> On Fri, Sep 7, 2018 at 12:36 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Hi Milo,
>>
>> I have some questions on the front-end limitation we have around a max
>> number of days we load data from the backend (default: 14 days, using
>> the `date_range` option when querying the backend.)
>>
>> From my primitive understanding of the current javascript, this is
>> primarily because current tables basically pre-load all the data. IOW,
>> even if it's configured to only show the first 25 elements, the
>> javascript will actually load all the data on the first load, then
>> when paging, it's just showing already loaded data.  Obviously, if
>> there is lots of data to load, this would be very slow for the first
>> view if/when there is lots of data.
>
> True.
> For the "big" views (/build/ and /boot/) the results are loaded in
> batch (I think 1024 at the time), but it's not leveraging dataTables
> server side logic to do so.
> It's sort of a "hack" around the dataTables logic in order to keep the
> client side search function.

Aha, this is the part I was missing.

I'd forgotten about the client-side search functionality, so now it
makes sense why it's done this way.

So IIUC, there's basically a trade off to be made with having
client-side search and how much data to (pre)load.

To fix this correctly, we really need to implement search server side,
and that's a much bigger change indeed.

Anyways, thanks again for clarifying,

Kevin
