MIME-Version: 1.0
References: <CAOi56cX+13EOOC-COoxaJ6P981cqzU8xDxyn-t=5DB9y6Q+Lqw@mail.gmail.com>
In-Reply-To: <CAOi56cX+13EOOC-COoxaJ6P981cqzU8xDxyn-t=5DB9y6Q+Lqw@mail.gmail.com>
From: Milo Casagrande <milo@foundries.io>
Date: Fri, 7 Sep 2018 09:50:42 +0200
Message-ID: <CAEFW_ihUV+Cs_jHH3vmzaxjN5dOY1h05bSzqHuxR_Fxa+m1Cag@mail.gmail.com>
Subject: Re: kernelci-frontend: limitation on X days of data
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: khilman@baylibre.com
Cc: kernelci@groups.io

On Fri, Sep 7, 2018 at 12:36 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hi Milo,
>
> I have some questions on the front-end limitation we have around a max
> number of days we load data from the backend (default: 14 days, using
> the `date_range` option when querying the backend.)
>
> From my primitive understanding of the current javascript, this is
> primarily because current tables basically pre-load all the data. IOW,
> even if it's configured to only show the first 25 elements, the
> javascript will actually load all the data on the first load, then
> when paging, it's just showing already loaded data.  Obviously, if
> there is lots of data to load, this would be very slow for the first
> view if/when there is lots of data.

True.
For the "big" views (/build/ and /boot/) the results are loaded in
batch (I think 1024 at the time), but it's not leveraging dataTables
server side logic to do so.
It's sort of a "hack" around the dataTables logic in order to keep the
client side search function.

> However, I was recently pointed to dataTables.net and told that if we
> switched to a recent version of dataTables, we could easily configure
> it to only query/load the backend for the visible values (e.g. first
> 25 elements of table) and load the others on demand only when clicking
> on the next page.
>
> First, is that true?

It's true, and it should be possible to use that even with the
dataTables version running on kernelci.

I didn't check the new/updated features in the latest dataTables, but
there was a drawback with the version currently in use: you would have
to do everything server side [1].

That means you have to handle the pagination logic (that should be
already done, although it might have to be tweaked, IIRC dataTables
had a special way of doing it), but you also have to handle the
"search" part.
To support that, we need to have a text index to perform searches on.
mongodb support text indexes, but it's not optimal (it's nowhere near
Lucene/Elastic) and you might not find exactly everything you are
looking for (or you have to be very explicit with your search terms).
mongodb text indexes tends to be "expensive" as well.

At that time, not to complicate the architecture/deployment, I decided
to leverage the client side search limiting the results shown.

Ideally, has was also my initial idea, text searches should be handled
by something like Lucene/Elastic exposing them through
api.kernelci.org and to the web UI.

> Second, would it be a big project to migrate the current tables to a
> recent dataTables?

It depends on what we really want to do. :-)
What's more important? Show more results, but with a potentially
limited search logic [2], or be able to perform searches "quickly"?

It could be a big project...

[1] Quick check on dataTables web site: the latest version is 1.10.18,
we are using 1.10.11, so it should be easy to just switch to that
version, as there shouldn't be major API changes.
[2] It could also be just OK for our use cases, but we still need to
measure the impact on server side.

-- 
Milo Casagrande <milo@foundries.io>
