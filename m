Subject: Re: [kernelci-members] Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
 <bbeeb467-1571-5404-7408-9b112d64e928@redhat.com>
 <CACT4Y+a1t-9sT7xz7d=Wmesnn_QoUqfipmoZXBu40_B+GQy=nQ@mail.gmail.com>
 <031d1941-2842-fc79-2a21-66bccb17f91c@redhat.com>
 <adb7924d-b524-2f86-05fd-dc0233004652@redhat.com>
 <CACT4Y+beU9XoOt5XXLEarKyWvkhyRKC5aJRc6djmHsUqO+AbJA@mail.gmail.com>
 <8d422dcf-d4ef-8e74-be82-f52272d9a966@redhat.com>
 <CACT4Y+a5spdA8TZNeaXFYj4QEw_=howfhu9YGsNm3rC8XPAJnA@mail.gmail.com>
 <d9919812-9763-9c02-3e5d-978fac8fe1f7@redhat.com>
 <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
 <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
 <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com>
 <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com>
 <CACT4Y+biFKO-Bauixm_DtEGTAUzHXTf0iXuFx1A=WTLmBhvSDg@mail.gmail.com>
 <1ff4a09c-4529-017c-5b0b-43712575771b@redhat.com>
 <16397F50C12D08DD.21243@groups.io>
 <CACT4Y+aqdTZ7r-tvFcajqcX5n7gO1RJ+9_vsbsYJPsypeYH3vQ@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <521cc33e-62fc-55c1-aeb2-682007243d97@redhat.com>
Date: Thu, 1 Oct 2020 13:48:42 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aqdTZ7r-tvFcajqcX5n7gO1RJ+9_vsbsYJPsypeYH3vQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>, kernelci@groups.io
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

On 9/30/20 7:07 PM, Dmitry Vyukov wrote:
 > So we are alive!
 > https://staging.kernelci.org:3000/d/home/home?orgId=1&refresh=30m&var-origin=syzbot&var-git_repository_url=All&var-dataset=playground_kernelci04&from=now-90d&to=now

Woo-hoo!

 > Here is syzkaller PR (will be merged as soon as CI passes):
 > https://github.com/google/syzkaller/pull/2150

Awesome, and I see it's merged already :)

 > Please check if the data it uploads look sane.

Alright, there are a few things to improve, which is fine, but you did an
awesome job setting up automatic submission so quickly! None of those things
should prevent you switching to production, and I already added the necessary
permissions to your account.

Just switch to submitting to the "kernelci_new" topic when you're ready.

Here are the things which could be improved:

* To be able to correlate Git repos across submitters, and to make subscribing
   easier, we have to normalize repo URLs. That's why in the schema docs we're
   asking to use https:// repo URLs, and only use git:// in the rare case
   https:// is not available (we only have one so far).

   E.g. you're sending the stable repo URL as:

     git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

   and we'd prefer it sent as:

     https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

   This is also the reason we didn't get e-mail reports for your
   submissions - the PoC stable tree subscription expects https://

   Ah, that, and we also weren't subscribed to stable/linux-stable.git, just
   sashal/linux-stable.git, but it should be fixed soon :)

* Could you move the "dashboard" link out of test's "output_files", and into
   a "misc" field? It won't be presented as a link in Grafana unfortunately,
   but "output_files" is for something which could be useful when downloaded
   (and e.g. re-hosted by KCIDB), and the linked HTML doesn't seem to be.
   Let's deal with the dashboard link issue in
   https://github.com/kernelci/kcidb/issues/93

* Could you add `"waived": false` field to the tests? This way the system will
   know to take your test results seriously, and Grafana will color the status
   fields nicely and not display that question mark in them.

   We can adjust the subscriptions to ignore syzbot tests and not send failure
   reports until we get the issue/incident system figured out.

* Could you submit a PR adding syzkaller to
   https://github.com/kernelci/kcidb/blob/master/tests.yaml
   so its canonical name is registered?

We can, of course, use more fields filled in, such as build logs and output
files, or environment descriptions, but that can be done later.
Thank you for your awesome contribution!

 > Also please check for server errors. There may be few produced with
 > earlier versions of the code, but the latest code uploaded the
 > majority of data.

Nope, couldn't find anything caused by your submissions :)

 > You may skim through the syzkaller bits to check how we fill data,
 > this is the most interesting part:
 > https://github.com/google/syzkaller/pull/2150/commits/766714e5dcf6ceb6bab69754173f6f8f314d78c6
 >
 > Build errors and runtime errors are handled slightly differently, we
 > also add some info into the misc objects (Report-by tag, bisection
 > result, userspace arch).
 >
 > Re contributing Go support to Kcidb.
 > The main thing that is useful is the schema converted to Go types, see
 > the same link above. It was produced automatically with
 > github.com/a-h/generate, but then slightly modified by hand.

Nice!

 > The rest is effectively 3 lines of code to push it:
 > client, err := pubsub.NewClient(ctx, project,
 > option.WithCredentialsJSON(credentials))
 > topic:  client.Topic(topic),
 > _, err = c.topic.Publish(c.ctx, &pubsub.Message{Data: data}).Get(c.ctx)
 >
 > I don't think these 3 lines of code are worth factoring out, but of
 > course we can point people to the syzkaller code as an example
 > implementation.

We need a module providing an abstract interface to submitting (at least), so
people who use Go don't have to rewrite their code (much) if we e.g. change
our cloud architecture, provider, or even move off-cloud. Something similar to
https://github.com/kernelci/kcidb/blob/master/kcidb/__init__.py#L36

 > The Go schema may be worth contributing if we decide to detach it from
 > the original source and keep maintaining manually. A better long term
 > solution may be to write/find a proper converter that produces working
 > code.

Yes, we need to maintain a single source for the schema and generate the rest
from that. We can switch to publishing the schema as a JSON file instead of
(more readable) Python code generating it, if it helps you to generate your
module. Actually, maybe a YAML file could be a good compromise of readability
vs accessibility.

Nick

On 9/30/20 7:07 PM, Dmitry Vyukov wrote:
 > On Wed, Sep 30, 2020 at 9:32 AM Dmitry Vyukov via groups.io
 > <dvyukov=google.com@groups.io> wrote:
 >>
 >> On Tue, Sep 29, 2020 at 7:13 PM Nikolai Kondrashov
 >> <Nikolai.Kondrashov@redhat.com> wrote:
 >>>   > 6. We have that tagged Reported-by line that we very much want
 >>>   > developers to use in the fixing commit to understand when bugs are
 >>>   > fixed.
 >>>   > If we detach them from info/reports available in KCIDB, then nobody
 >>>   > will use them in commits.
 >>>   > How can we pass it to KCIDB? Perhaps it's a useful feature for all
 >>>   > reports/test failures? If a bug is reported by Fuego and KCIDB
 >>>   > notifications/dashboard will ask to use "Reported-by: fuego", it will
 >>>   > give nice credits. We also found use of the hashes in the tag very
 >>>   > useful for statistics/tracking purposes. It makes it possible to link
 >>>   > failures to fixing commits and understand if a fix (1) exists in
 >>>   > general, (2) present in a particular tree, (3) or even if somebody
 >>>   > just mailed a proposed fix (useful to identify lost fixes that were
 >>>   > never merged, or avoid several people fixing the same bug if you can
 >>>   > show that somebody mailed a fix already).
 >>>
 >>> Hmm, yes, that could be very useful indeed, thank you.
 >>>
 >>> We would have to use an ID managed by KCIDB, though. This brings me to the
 >>> question what we're going to use for identifying issues. Perhaps use the
 >>> submitter-supplied ID, similarly to builds and tests right now, under the
 >>> assumption that, at least for the start, issues are not going to be reused
 >>> across CI systems. If that's so, then you would be able to map those IDs back
 >>> to your issues.
 >>
 >> If we report a failed test/issue with "id": "syzbot:d195fe572fb15368",
 >> then if the commit includes:
 >> Reported-by: syzbot:d195fe572fb15368
 >> I think it should work for us.
 >
 > So we are alive!
 > https://staging.kernelci.org:3000/d/home/home?orgId=1&refresh=30m&var-origin=syzbot&var-git_repository_url=All&var-dataset=playground_kernelci04&from=now-90d&to=now
 >
 > Here is syzkaller PR (will be merged as soon as CI passes):
 > https://github.com/google/syzkaller/pull/2150
 >
 > Please check if the data it uploads look sane.
 > Also please check for server errors. There may be few produced with
 > earlier versions of the code, but the latest code uploaded the
 > majority of data.
 >
 > You may skim through the syzkaller bits to check how we fill data,
 > this is the most interesting part:
 > https://github.com/google/syzkaller/pull/2150/commits/766714e5dcf6ceb6bab69754173f6f8f314d78c6
 > Build errors and runtime errors are handled slightly differently, we
 > also add some info into the misc objects (Report-by tag, bisection
 > result, userspace arch).
 >
 > Re contributing Go support to Kcidb.
 > The main thing that is useful is the schema converted to Go types, see
 > the same link above. It was produced automatically with
 > github.com/a-h/generate, but then slightly modified by hand.
 >
 > The rest is effectively 3 lines of code to push it:
 > client, err := pubsub.NewClient(ctx, project,
 > option.WithCredentialsJSON(credentials))
 > topic:  client.Topic(topic),
 > _, err = c.topic.Publish(c.ctx, &pubsub.Message{Data: data}).Get(c.ctx)
 >
 > I don't think these 3 lines of code are worth factoring out, but of
 > course we can point people to the syzkaller code as an example
 > implementation.
 > The Go schema may be worth contributing if we decide to detach it from
 > the original source and keep maintaining manually. A better long term
 > solution may be to write/find a proper converter that produces working
 > code.
 >

