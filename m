From: <Tim.Bird@sony.com>
Subject: Re: A common place for CI results?
Date: Tue, 14 May 2019 23:01:35 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF977191AE@USCULXMSG01.am.sony.com>
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
>=20
> Hi,
>=20
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
>=20
>=20
> A few weeks ago, with some people we've been talking about kernelci.org
> being
> in a good place to act as the central upstream kernel CI piece that most
> maintainers already know about. So I'm wondering if it would be possible =
for
> kernelci to also act as an aggregator of all results? There's already an =
API
> for publishing a report [0] so it shouldn't be too hard to adjust it to
> handle and show more information. I also found the beta version for test
> results [1] so actually, most of the needed functionality seems to be alr=
eady
> there. Since there will be multiple CI systems, the source and contact po=
int
> for the contributor (so maintainers know whom to ask about results if
> needed)
> would likely be the only missing essential data point.
>=20
>=20
> The common place for results would also make it easier for new CI systems
> to
> get involved with upstream. There are likely other companies out there
> running
> some tests on kernel internally but don't publish the results anywhere. O=
nly
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
>=20
> Please let me know if the idea makes sense or if something similar is alr=
eady
> in plans. I'd be happy to contribute to the effort because I believe it w=
ould
> make everyone's life easier and we'd all benefit from it (and maybe
> someone
> else from my team would be willing to help out too if needed).

I never responded to this, but this sounds like a really good idea to me.
I don't care much which backend we aggregate to, but it would be good
as a community to start using one service to start with.  It would help
to find issues with the API, or the results schema, if multiple people
started using it.

I know that people using Fuego are sending data to their own instances
of KernelCI.  But I don't know what the issues are for sending this
data to a shared KernelCI service.

I would be interested in hooking up my lab to send Fuego results to
KernelCI.  This would be a good exercise.  I'm not sure what the next
steps would be, but maybe we could discuss this on the next automated
testing conference call.
 -- Tim

