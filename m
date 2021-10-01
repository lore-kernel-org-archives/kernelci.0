From: Chuck Lever III <chuck.lever@oracle.com>
Subject: Using kernelci.org for testing Linux NFSD
Date: Fri, 1 Oct 2021 19:01:05 +0000
Message-ID: <13C9FF88-C1F6-4127-AAA1-E38A1D59AB96@oracle.com>
MIME-Version: 1.0
List-ID: <info.kernelci.org>
List-Post: <https://groups.google.com/a/kernelci.org/group/info/post>, <mailto:info@kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
List-Archive: <https://groups.google.com/a/kernelci.org/group/info/>
List-Unsubscribe: <mailto:googlegroups-manage+1098402462627+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/kernelci.org/group/info/subscribe>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B107E9716FF6F740B5466049083E3EF2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: "info@kernelci.org" <info@kernelci.org>
Cc: Bruce Fields <bfields@redhat.com>

Hi-

As co-maintainers of NFSD, we're interested in bringing up a
CI platform for automating a lot of the tests we do before
requesting a pull into the Linux kernel. The kernelci.org
platform caught my eye last week during the talk at LPC.

We have some questions about what can be supported on
kernelci.org. For example, the tests we need to run involve
at least two hosts (an NFS client and an NFS server). How
easy is it to set up that kind of test?

If we want to test features that involve Kerberos, is there
a KDC available, or would we need to provide a KDC image
that can be used for our tests?

Thanks for any guidance!


--
Chuck Lever



