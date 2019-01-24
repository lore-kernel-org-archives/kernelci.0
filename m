Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Tests view in kernelci-frontend
In-Reply-To: <ea54a553-c76a-7c8d-7247-a0fd0bdfff88@collabora.com>
References: <ea54a553-c76a-7c8d-7247-a0fd0bdfff88@collabora.com>
Date: Thu, 24 Jan 2019 02:53:27 -0800
Message-ID: <7h7eeuz5qw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@gmail.com, kernelci@groups.io

"Guillaume Tucker" <guillaume.tucker@gmail.com> writes:

> The Tests view in kernelci-frontend is currently a bit behind:
>
>     https://kernelci.org/test/
>
> As discussed previously, while it was interesting to try a new
> design, it turns out to be somewhat confusing to have results
> sorted by platforms instead of kernel revisions like for builds
> and boots.  Also, since we've introduced recursive sub-groups in
> the backend, the views haven't been updated to properly show the
> results.  All the groups are shown in a flat list regardless of
> their hierarchy.
>
> While alternatives are being investigated using Elasticsearch and
> Kibana, we should probably do something about the current
> frontend as that's what's currently online.  It doesn't seem like
> anyone is actively working on fixing it right now, so I would
> suggest to remove the link from the navigation bar so visitors
> are not encouraged to see this page until it's in a better shape.
> Others agreed during this Monday's meeting.
>
> If you need the Tests link to remain visible, or if you know
> someone will have a fix for it in the coming days, then please
> let us know.  Otherwise I think we could hide the link next week.

Removing the link from the navigation bar is fine, but I assume this
means leaving the /test route and code in place so we can use it
manually if needed?

When working on email reporting, even though the views aren't terribly
useful, it's useful at least to see that (new) data has arrived.

Kevin
