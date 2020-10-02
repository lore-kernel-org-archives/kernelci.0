Subject: Re: [kernelci-members] Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
 <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
 <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
 <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com>
 <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com>
 <CACT4Y+biFKO-Bauixm_DtEGTAUzHXTf0iXuFx1A=WTLmBhvSDg@mail.gmail.com>
 <1ff4a09c-4529-017c-5b0b-43712575771b@redhat.com>
 <16397F50C12D08DD.21243@groups.io>
 <CACT4Y+aqdTZ7r-tvFcajqcX5n7gO1RJ+9_vsbsYJPsypeYH3vQ@mail.gmail.com>
 <521cc33e-62fc-55c1-aeb2-682007243d97@redhat.com>
 <ff5139e8-b8e5-93dc-9654-d53e4888c2bc@redhat.com>
 <CACT4Y+Y561P7oJYYNn7XuqieTS-dJmaFH+NTS7OzRi=X_STD3w@mail.gmail.com>
 <ac531987-4600-f48c-4fe6-8a1abd8ccf51@gmail.com>
 <8c580a6a-e24e-4c67-5202-ec35612094f3@redhat.com>
 <CACT4Y+bO_FZsDkrBh2LtxQ+QyxXP5S7e+szO-HYxuj=GyKjUMA@mail.gmail.com>
 <9123a571-721b-5c1b-367e-e028acec4096@redhat.com>
 <CACT4Y+Z=ipTEY1VHkwZcnoegU1VOTJN2G6rzZTpPqnPS_ze5CA@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <802e465b-8578-adea-1107-75da5383fe0c@redhat.com>
Date: Fri, 2 Oct 2020 11:12:10 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+Z=ipTEY1VHkwZcnoegU1VOTJN2G6rzZTpPqnPS_ze5CA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>, kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

Hi Dmitry,

On 10/1/20 8:02 PM, Dmitry Vyukov wrote:
 > On Thu, Oct 1, 2020 at 6:34 PM Nikolai Kondrashov
 > <Nikolai.Kondrashov@redhat.com> wrote:
 >> I think it's OK that you have some duplication, and certainly OK for the
 >> start. Let's get on with sending the data and see how much actual duplication
 >> we get, how it affects performance, and how the de-duplication implementation
 >> goes :)
 >
 > The new format is now published by syzbot itself:
 > https://staging.kernelci.org:3000/d/test/test?orgId=1&var-dataset=playground_kernelci04&var-id=syzbot:60b38542a0dfb2e0f746

Awesome!

 > So, do we switch to prod instance?

Yes :)!

 > Do you receive notifications now?

No, more on that below.

 > Do we need to fix anything else before the switch?

No, let's go ahead with the switch. We can figure out the problems as we go if
we see any. Our "production" instance is not much of a "production" yet.

 > I don't see anything from syzbot at:
 > https://groups.io/g/kernelci-results-staging/topics

Yes, I'm trying to investigate that currently. We have a few issues working
together it seems. We're facing database query limit issues, plus whatever
messages are generated are not getting delivered. You're already having an
impact :D!

I'll work through that and will notify you once notifications for syzbot
results are coming through.

 > How can I see/subscribe to these notifications?

You can subscribe to that maillist. Please note, however, even though e-mails
have real recipients, such as maillists, only this maillist is on their
envelope. This way we can see they're generated correctly, but don't send them
anywhere yet.

 > Since syzbot database now memorizes what was published to kcidb to
 > avoid dups, the switch will require some manual database surgery to
 > make it re-publish bugs. So I want to make sure we did not miss
 > something simple that we could do before the switch.

Sure.

 > The switch involves just changing the topic to "kernelci_new", right?

Yes.

Nick

