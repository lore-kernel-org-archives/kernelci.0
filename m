From: Chuck Lever III <chuck.lever@oracle.com>
Subject: Re: Using kernelci.org for testing Linux NFSD
Date: Tue, 26 Oct 2021 16:51:56 +0000
Message-ID: <F1355468-FAD8-454D-A2B5-94F28967653D@oracle.com>
References: <13C9FF88-C1F6-4127-AAA1-E38A1D59AB96@oracle.com>
 <405b7acc-3b85-145f-eaf9-50bb432bacab@collabora.com>
 <CAPL3RVHKUVxiqqkQZ_8+fVnsaX=3kMRLE7h2U7S3cskb9TnHdg@mail.gmail.com>
 <520658CE-09F2-4FC6-9FBB-A46A8852CA7B@oracle.com>
In-Reply-To: <520658CE-09F2-4FC6-9FBB-A46A8852CA7B@oracle.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1944C72C22865B4F89103B80E7F0436C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Bruce Fields <bfields@redhat.com>, "kernelci@groups.io" <kernelci@groups.io>, "info@kernelci.org" <info@kernelci.org>



> On Oct 5, 2021, at 10:33 AM, Chuck Lever III <chuck.lever@oracle.com> wro=
te:
>=20
> Hello Gustavo, good to meet you. More inline.
>=20
>=20
>> On Oct 5, 2021, at 9:47 AM, Bruce Fields <bfields@redhat.com> wrote:
>>=20
>> On Tue, Oct 5, 2021 at 9:18 AM Gustavo Padovan
>> <gustavo.padovan@collabora.com> wrote:
>>> On 10/1/21 16:01, Chuck Lever III wrote:
>>>> We have some questions about what can be supported on
>>>> kernelci.org. For example, the tests we need to run involve
>>>> at least two hosts (an NFS client and an NFS server). How
>>>> easy is it to set up that kind of test?
>>>=20
>>> We don't have support right now for testing across two different hosts.
>=20
> Other network filesystems and block storage subsystems might
> also be interested in a two-host arrangement, fwiw.
>=20
>=20
>>> Can you share more the details of what you want to achieve?
>>=20
>> Personally for basic regression testing I use two VMs, one configured
>> as an NFS client and one as an NFS server, and I have bash scripts
>> that ssh into the client and do things like mount the server with
>> various options and run xfstests.
>>=20
>>> Do you have
>>> some scripts or tests code somewhere that you can share with us?
>>=20
>> I don't know if my thicket of test scripts will make much sense to
>> anyone but me, but for what it's worth, I keep them all here:
>>=20
>> http://git.linux-nfs.org/?p=3Dbfields/testd.git;a=3Dtree;hb=3DHEAD
>>=20
>> The thing I usually run before submitting is in bin/do-all.
>>=20
>>> eg. are
>>> both the client and server subject of the tests at the same time or do
>>> you test changes one side against a fixed version of the other side
>>> (when it is possible).
>>=20
>> I normally boot both client and server to the kernel under test.
>> However it's useful to have the option to vary the kernel on just one
>> side or the other, as that occasionally helps pin down which side is
>> at fault for a regression.
>=20
> I agree, two hosts is best. A loopback NFS mount could be used,
> but that is generally a fraught and uncommon configuration. For
> one thing, the memory needs of the client and server can often
> interact, and sometimes that results in system deadlock.
>=20
>=20
>>> Also, is there any kind of simple/smoke tests that we can run with only
>>> one host (eg as part of kselftests or LTP)?
>>=20
>> I like using two hosts:  It's a more realistic setup.  When there's a
>> crash or other problem, it makes it more obvious which side was at
>> fault.  Etc.
>>=20
>> But, sure, as a basic smoke test, we could do something like (untested
>> for now, off the top of my head):
>>=20
>> git clone git://git.linux-nfs.org/projects/steved/cthon04.git
>> cd cthon04
>> make
>> mkdir /export
>> chmod a+rwx /export
>> echo "/export *(lo)" >/etc/exports
>> systemctl start nfs-server
>> mount localhost:/export /mnt/
>> NFSTESTDIR=3D/mnt/TMP ./runtests -a -f
>>=20
>> That cthon04 test hardly ever changes, so it really only needs to be
>> downloaded once. Better would probably be to put /export on a separate
>> filesystem.  And more tests would be better, but cthon04 is something
>> that will basically always pass unless something is extremely wrong.
>=20
> cthon04 is simple to set up, and hits enough of the basic NFS
> functionality that it is a commonly used smoke test.
>=20
> Typically you want to exercise all versions of NFS (2, 3, 4.0,
> 4.1, and 4.2), which requires a separate cthon run for each
> NFS version.=20
>=20
> We'd like to get some code coverage analysis of any tests that
> are run, and that should be simple for you to enable from the
> start?
>=20
> Single-host testing is not useful for us outside of the usual
> source code analysis tools (does it build on all platforms, are
> there new warnings or build problems, and so on). But that stuff
> is already covered by 0-day bots.

A member of the Linux NFS community built some Jenkins infrastructure
several years ago to provide continuous integration testing.

http://git.linux-nfs.org/?p=3Danna/nfs-ordeal.git;a=3Dsummary

The README describes what's in the repository. It includes the
aforementioned cthon04 and also xfstests.

It looks like one host is booted, and a pair of guests on that
host act as the systems under test. The host drives the testing
by ssh'ing into the client guest.

I hope this is helpful to explain what we're looking for.


>>> That helps us enables the
>>> most basic stuff more easily, as the above will need some design and
>>> discussion between the KernelCI team.
>>=20
>> Understood.
>>=20
>> Thanks for your interest.
>>=20
>> --b.
>>=20
>>>> If we want to test features that involve Kerberos, is there
>>>> a KDC available, or would we need to provide a KDC image
>>>> that can be used for our tests?
>>>=20
>>> We don't have any provision for that yet (because no one ever needed
>>> it!). It might be easier if you just provide an image that serves you
>>> the best. I'd need to check with the team the details to make it
>>> available to your tests.
>=20
> Kerberos can be a stretch goal. Certainly not something we
> require on day one.
>=20
> --
> Chuck Lever

--
Chuck Lever



