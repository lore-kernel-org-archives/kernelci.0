MIME-Version: 1.0
References: <13C9FF88-C1F6-4127-AAA1-E38A1D59AB96@oracle.com> <405b7acc-3b85-145f-eaf9-50bb432bacab@collabora.com>
In-Reply-To: <405b7acc-3b85-145f-eaf9-50bb432bacab@collabora.com>
From: Bruce Fields <bfields@redhat.com>
Date: Tue, 5 Oct 2021 09:47:46 -0400
Message-ID: <CAPL3RVHKUVxiqqkQZ_8+fVnsaX=3kMRLE7h2U7S3cskb9TnHdg@mail.gmail.com>
Subject: Re: Using kernelci.org for testing Linux NFSD
List-ID: <info.kernelci.org>
List-Post: <https://groups.google.com/a/kernelci.org/group/info/post>, <mailto:info@kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
List-Archive: <https://groups.google.com/a/kernelci.org/group/info/>
List-Unsubscribe: <mailto:googlegroups-manage+1098402462627+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/kernelci.org/group/info/subscribe>
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: kernelci@groups.io, Chuck Lever <chuck.lever@oracle.com>, "info@kernelci.org" <info@kernelci.org>

On Tue, Oct 5, 2021 at 9:18 AM Gustavo Padovan
<gustavo.padovan@collabora.com> wrote:
> On 10/1/21 16:01, Chuck Lever III wrote:
> > We have some questions about what can be supported on
> > kernelci.org. For example, the tests we need to run involve
> > at least two hosts (an NFS client and an NFS server). How
> > easy is it to set up that kind of test?
>
> We don't have support right now for testing across two different hosts.
> Can you share more the details of what you want to achieve?

Personally for basic regression testing I use two VMs, one configured
as an NFS client and one as an NFS server, and I have bash scripts
that ssh into the client and do things like mount the server with
various options and run xfstests.

> Do you have
> some scripts or tests code somewhere that you can share with us?

I don't know if my thicket of test scripts will make much sense to
anyone but me, but for what it's worth, I keep them all here:

  http://git.linux-nfs.org/?p=bfields/testd.git;a=tree;hb=HEAD

The thing I usually run before submitting is in bin/do-all.

> eg. are
> both the client and server subject of the tests at the same time or do
> you test changes one side against a fixed version of the other side
> (when it is possible).

I normally boot both client and server to the kernel under test.
However it's useful to have the option to vary the kernel on just one
side or the other, as that occasionally helps pin down which side is
at fault for a regression.

> Also, is there any kind of simple/smoke tests that we can run with only
> one host (eg as part of kselftests or LTP)?

I like using two hosts:  It's a more realistic setup.  When there's a
crash or other problem, it makes it more obvious which side was at
fault.  Etc.

But, sure, as a basic smoke test, we could do something like (untested
for now, off the top of my head):

  git clone git://git.linux-nfs.org/projects/steved/cthon04.git
  cd cthon04
  make
  mkdir /export
  chmod a+rwx /export
  echo "/export *(lo)" >/etc/exports
  systemctl start nfs-server
  mount localhost:/export /mnt/
  NFSTESTDIR=/mnt/TMP ./runtests -a -f

That cthon04 test hardly ever changes, so it really only needs to be
downloaded once. Better would probably be to put /export on a separate
filesystem.  And more tests would be better, but cthon04 is something
that will basically always pass unless something is extremely wrong.

> That helps us enables the
> most basic stuff more easily, as the above will need some design and
> discussion between the KernelCI team.

Understood.

Thanks for your interest.

--b.

> > If we want to test features that involve Kerberos, is there
> > a KDC available, or would we need to provide a KDC image
> > that can be used for our tests?
>
> We don't have any provision for that yet (because no one ever needed
> it!). It might be easier if you just provide an image that serves you
> the best. I'd need to check with the team the details to make it
> available to your tests.

