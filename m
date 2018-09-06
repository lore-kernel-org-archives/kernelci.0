MIME-Version: 1.0
From: "Kevin Hilman" <khilman@baylibre.com>
Date: Thu, 6 Sep 2018 15:36:03 -0700
Message-ID: <CAOi56cX+13EOOC-COoxaJ6P981cqzU8xDxyn-t=5DB9y6Q+Lqw@mail.gmail.com>
Subject: kernelci-frontend: limitation on X days of data
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Milo Casagrande <milo@foundries.io>
Cc: kernelci@groups.io

Hi Milo,

I have some questions on the front-end limitation we have around a max
number of days we load data from the backend (default: 14 days, using
the `date_range` option when querying the backend.)

>From my primitive understanding of the current javascript, this is
primarily because current tables basically pre-load all the data. IOW,
even if it's configured to only show the first 25 elements, the
javascript will actually load all the data on the first load, then
when paging, it's just showing already loaded data.  Obviously, if
there is lots of data to load, this would be very slow for the first
view if/when there is lots of data.

However, I was recently pointed to dataTables.net and told that if we
switched to a recent version of dataTables, we could easily configure
it to only query/load the backend for the visible values (e.g. first
25 elements of table) and load the others on demand only when clicking
on the next page.

First, is that true?
Second, would it be a big project to migrate the current tables to a
recent dataTables?

Kevin
