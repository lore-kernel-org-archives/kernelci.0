Subject: Re: can't access kernelci results
References: <CAHRSSEzUpY+7Lhb40B_v9cSc1KQOcztZ=WiV+1-+ocdcsNUGFQ@mail.gmail.com>
 <CABXOdTeirbF1KRdFsmuRKHJ+p+7s9ZOZAW2S64MsPFajUjdqow@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <2a6d7691-b8a5-da92-865c-8cdf5efb673f@collabora.com>
Date: Mon, 5 Apr 2021 21:58:33 +0100
MIME-Version: 1.0
In-Reply-To: <CABXOdTeirbF1KRdFsmuRKHJ+p+7s9ZOZAW2S64MsPFajUjdqow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, groeck@google.com, Todd Kjos <tkjos@google.com>
Cc: Kevin Hilman <khilman@baylibre.com>

On 05/04/2021 21:39, Guenter Roeck via groups.io wrote:
> On Mon, Apr 5, 2021 at 12:30 PM Todd Kjos via groups.io
> <tkjos=google.com@groups.io> wrote:
>>
>> I get errors when attempting to access https://linux.kernelci.org/job/android/. Is this a known issue? Any ETA for a fix?
>>
> Looks like the problem is not limited to android. I get error 500 for
> jobs and build results.

That was another case of the mongod service stopping, it's pretty
rare but has happened a couple of times before.  Things are now
back to normal, but we've missed a few results while it was down.
Sorry for the disruption.

We've deployed a monitoring tool on some servers but not yet on
this one, it should happen soon so this kind of issues would be
detected much quicker.  We've also started looking into using a
Mongo database in Azure rather than a manual install to reduce
maintenance work.

Best wishes,
Guillaume
