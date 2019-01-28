MIME-Version: 1.0
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Mon, 28 Jan 2019 17:54:21 +0000
Message-ID: <CAH+k93HvsXvfW_FW9QSAxZhvu3G_YAYNnuUYGAv7MA9UrZuBeQ@mail.gmail.com>
Subject: Frontend Slowdown
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

Hi all,

I've been investigating the javascript slowdown in the frontend and
believe I've discovered what's going on.
tl;dr: scaling issues.

For starters, when viewing /build, the JS requests the last 14 days
worth of build data, which in builds returns 75,000 results that are
kept in browser memory. We are doing more builds than ever before and
it's adding up.

Secondly, we recently merged a patch to show the compiler column, and
this means each result also stores this extra field to make it
searchable.

If you lower the requested days to 7 the situation improves but it's
still a laggy experience in Chrome (bareable in firefox). If you lower
it to 5 days it's pretty OK. However that's just on my machine, it
could be awful for a lower powered user.

Short fix would be to change the maximum date range for the queries
(PR incoming to do this), but the nicer fix would be to request a
maximum number of results (say 1000) and when the search field is
updated, make a new request, so the browser only has to hold the
results the user is interested in.

Matt
