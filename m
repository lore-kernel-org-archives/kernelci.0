From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: Tests view in kernelci-frontend
Message-ID: <ea54a553-c76a-7c8d-7247-a0fd0bdfff88@collabora.com>
Date: Wed, 23 Jan 2019 08:05:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

The Tests view in kernelci-frontend is currently a bit behind:

    https://kernelci.org/test/

As discussed previously, while it was interesting to try a new
design, it turns out to be somewhat confusing to have results
sorted by platforms instead of kernel revisions like for builds
and boots.  Also, since we've introduced recursive sub-groups in
the backend, the views haven't been updated to properly show the
results.  All the groups are shown in a flat list regardless of
their hierarchy.

While alternatives are being investigated using Elasticsearch and
Kibana, we should probably do something about the current
frontend as that's what's currently online.  It doesn't seem like
anyone is actively working on fixing it right now, so I would
suggest to remove the link from the navigation bar so visitors
are not encouraged to see this page until it's in a better shape.
Others agreed during this Monday's meeting.

If you need the Tests link to remain visible, or if you know
someone will have a fix for it in the coming days, then please
let us know.  Otherwise I think we could hide the link next week.

Best wishes,
Guillaume
