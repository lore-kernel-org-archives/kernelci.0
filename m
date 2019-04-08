From: <Tim.Bird@sony.com>
Subject: Re: A common place for CI results?
Date: Mon, 8 Apr 2019 22:16:33 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF976C1720@USCULXMSG01.am.sony.com>
References: <299272045.11819252.1554465036421.JavaMail.zimbra@redhat.com>
 <457016061.11846096.1554475313006.JavaMail.zimbra@redhat.com>
In-Reply-To: <457016061.11846096.1554475313006.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: vkabatov@redhat.com, automated-testing@yoctoproject.org, info@kernelci.org

> -----Original Message-----
> From: Veronika Kabatova
...
> as we know from this list, there's plenty CI systems doing some testing o=
n
> the
> upstream kernels (and maybe some others we don't know about).
>=20
> It would be great if there was a single common place where all the CI sys=
tems
> can put their results. This would make it much easier for the kernel
> maintainers and developers to see testing status since they only need to
> check one place instead of having a list of sites/mailing lists where eac=
h CI
> posts their contributions.

We've had discussions about this, and decided there are a few issues.
Some of these you identify below.

>=20
> A few weeks ago, with some people we've been talking about kernelci.org
> being
> in a good place to act as the central upstream kernel CI piece that most
> maintainers already know about. So I'm wondering if it would be possible =
for
> kernelci to also act as an aggregator of all results?

Right now, the kernelCI central server is (to my knowledge) maintained
by Kevin Hilman, on his own dime.  That may be changing with the Linux
Foundation possibly creating a testing project to provide support for this.
But in any event, at the scale we're talking about (with lots of test frame=
works
and potentially thousands of boards and hundreds of thousands of test
run results arriving daily), hosting this is costly.  So there's a question=
 of
who pays for this.

> There's already an API
> for publishing a report [0] so it shouldn't be too hard to adjust it to
> handle and show more information. I also found the beta version for test
> results [1] so actually, most of the needed functionality seems to be alr=
eady
> there. Since there will be multiple CI systems, the source and contact po=
int
> for the contributor (so maintainers know whom to ask about results if
> needed)
> would likely be the only missing essential data point.

One of the things on our action item list is to have discussions about a co=
mmon results format.
See https://elinux.org/ATS_2018_Minutes (towards the end right before "Deci=
sions from the summit")
I think this addresses the issue of what information is needed for a univer=
sal results format.
I think we should definitely add a 'contributor' field to a common definiti=
on, for the
reasons you mention.

Some other issues, are making it so that different test frameworks emit the=
 same testcase
names when they run the same test.  For example, in Fuego there is a testca=
se called
Functional.LTP.syscalls.abort07.  It's not required, but it seems like it w=
ould be valuable
if CKI, Linaro, Fuego and others decided on a canonical name for this parti=
cular testcase,
so they were the same in each run result.

I took an action item from our meetings at Linaro last week to look at this=
 issue
(testcase name harmonization).

>=20
> The common place for results would also make it easier for new CI systems
> to
> get involved with upstream. There are likely other companies out there
> running
> some tests on kernel internally but don't publish the results anywhere.

> Only
> adding some API calls into their code (with the data they are allowed to
> publish) would make it very simple for them to start contributing. If we =
want
> to make them interested, the starting point needs to be trivial. Differen=
t
> companies have different setups and policies and they might not be able t=
o
> fulfill arbitrary requirements so they opt to not get involved at all, wh=
ich
> is a shame because their results can be useful. After the initial "onboar=
ding"
> step they might be willing to contribute more and more too.
>=20
Indeed.  Probably most groups don't publish their test results, even
when they are using open source tests.  There are lots of reasons for this
(including there not being a place to publish them, as you mention).
It would be good to also address the other reasons that testing entities
don't publish, and try to remove as many obstacles (or to try to encourage
as much as possible) publishing of test results.
=20
> Please let me know if the idea makes sense or if something similar is alr=
eady
> in plans. I'd be happy to contribute to the effort because I believe it w=
ould
> make everyone's life easier and we'd all benefit from it (and maybe
> someone
> else from my team would be willing to help out too if needed).

I think it makes a lot of sense, and we'd like to take steps to make that p=
ossible.

The aspect of this that  I plan to work on myself is testcase name harmoniz=
ation.
That's one aspect of standardizing a common or universal results format.
But I've already got a lot of things I'm working on.  If someone else wants=
 to
volunteer to work on this, or head up a workgroup to work on this, let me k=
now.

Regards,
 -- Tim

