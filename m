Return-Path: <spbnick@gmail.com>
Subject: Re: [kernelci-members] Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
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
 <521cc33e-62fc-55c1-aeb2-682007243d97@redhat.com>
 <CACT4Y+Zet9NdAZ_bwAoKgpf-socRfwCf=-QQNFdXhKDMLzyZ-Q@mail.gmail.com>
 <dbbd05dd-75aa-48ff-300d-1ed0b2f51341@redhat.com>
 <CACT4Y+aMcNECTka7WeYXp+izqPrewTpM2zOiMNw+sL0PPZcYMQ@mail.gmail.com>
From: "Nikolai Kondrashov" <spbnick@gmail.com>
Message-ID: <e85bbeb2-3ccb-4950-8171-3c48b3c1bff0@gmail.com>
Date: Thu, 1 Oct 2020 18:55:18 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aMcNECTka7WeYXp+izqPrewTpM2zOiMNw+sL0PPZcYMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dvyukov@google.com, Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

On 10/1/20 6:36 PM, Dmitry Vyukov via groups.io wrote:
 > On Thu, Oct 1, 2020 at 5:12 PM Nikolai Kondrashov
 > <Nikolai.Kondrashov@redhat.com> wrote:
 >>
 >> On 10/1/20 6:01 PM, Dmitry Vyukov wrote:
 >>   > On Thu, Oct 1, 2020 at 12:48 PM Nikolai Kondrashov
 >>   > <Nikolai.Kondrashov@redhat.com> wrote:
 >>   >> * Could you move the "dashboard" link out of test's "output_files", and into
 >>   >>     a "misc" field? It won't be presented as a link in Grafana unfortunately,
 >>   >>     but "output_files" is for something which could be useful when downloaded
 >>   >>     (and e.g. re-hosted by KCIDB), and the linked HTML doesn't seem to be.
 >>   >>     Let's deal with the dashboard link issue in
 >>   >>     https://github.com/kernelci/kcidb/issues/93
 >>   >
 >>   > Any suggestions/precedents for the name?
 >>   > dashboard_link? origin_link? master_link?
 >>
 >> There's a PR linked which adds "origin_url":
 >> https://github.com/kernelci/kcidb/pull/94
 >
 > I've implemented all suggested improvements, please check this one:
 > https://staging.kernelci.org:3000/d/test/test?orgId=1&var-dataset=playground_kernelci04&var-id=syzkcidb:0a89a7b56db04c21a656
 >
 > Here is top-level link, look for the "https:" one:
 > https://staging.kernelci.org:3000/d/home/home?orgId=1&refresh=30m&from=now-90d&to=now&var-origin=syzkcidb&var-git_repository_url=All&var-dataset=playground_kernelci04

Niice!

Although, can you use just the "syzbot" origin? It's going to be easier to
identify and remember for everyone, as it matches your branding.

 > Not sure why it's duplicate here, though:
 > https://staging.kernelci.org:3000/d/build/build?orgId=1&var-dataset=playground_kernelci04&var-id=syzkcidb:1861b29bc5d979149e290f78e331f38f022ab032
 > both have the same id. If they have the same id, shouldn't they be merged?

That's what I'm going to work on next, as part of support for the
submit-extra-fields-later mechanism I mentioned earlier. So far it hasn't been
a problem as everyone generally took care to not resubmit, but I agree, it
shouldn't be that way.

Nick
