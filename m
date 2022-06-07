MIME-Version: 1.0
References: <a707847a-73a3-af9a-96d1-070cd294dbe8@redhat.com>
In-Reply-To: <a707847a-73a3-af9a-96d1-070cd294dbe8@redhat.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Tue, 7 Jun 2022 08:11:20 +0200
Message-ID: <CACT4Y+ZKPRZmUhKpSzfH4qQX7EQrN_Nf4038K47PGRd1YM=D8Q@mail.gmail.com>
Subject: Re: #KCIDB v9 release
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai.Kondrashov@redhat.com
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, syzkaller <syzkaller@googlegroups.com>

On Wed, 1 Dec 2021 at 19:01, Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
>
> Hello everyone,
>
> I'm proud to announce the release and deployment of KCIDB v9.
>
> Please see the detailed list of changes at
> https://github.com/kernelci/kcidb/releases/tag/v9
>
> Most important changes are listed below.
>
> * Switch to using the new v4 I/O Schema, with following changes:
>      * rename "revisions" to "checkouts",
>        use origin-generated IDs for them, similar to other objects;
>      * add "patchset_hash" field to checkouts,
>        remove "publishing_time" field, and
>        rename "patch_mboxes" to "patchset_files";
>      * rename "description" fields to "comment" everywhere;
>      * add "log_url" field to tests;
>      * add "log_excerpt" field to all objects;
>    See complete schema at
>        https://github.com/kernelci/kcidb-io/releases/download/v3/kcidb.v4.schema.json

Hi Nikolai,

If we upload "log_excerpt" with crashes, does the dashboard allow
users to search for substrings in the "log_excerpt"?
Namely, if we upload whole kernel oops as "log_excerpt" (that would be
the intended use, right?), will it be possible to find all crashes
that contain a given function name?
