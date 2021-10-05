Message-ID: <405b7acc-3b85-145f-eaf9-50bb432bacab@collabora.com>
Date: Tue, 5 Oct 2021 10:07:59 -0300
MIME-Version: 1.0
Subject: Re: Using kernelci.org for testing Linux NFSD
References: <13C9FF88-C1F6-4127-AAA1-E38A1D59AB96@oracle.com>
From: "Gustavo Padovan" <gustavo.padovan@collabora.com>
In-Reply-To: <13C9FF88-C1F6-4127-AAA1-E38A1D59AB96@oracle.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, chuck.lever@oracle.com, "info@kernelci.org" <info@kernelci.org>
Cc: Bruce Fields <bfields@redhat.com>

Hi Chuck,

Thanks for your message and interest in KernelCI.

On 10/1/21 16:01, Chuck Lever III wrote:
> Hi-
>
> As co-maintainers of NFSD, we're interested in bringing up a
> CI platform for automating a lot of the tests we do before
> requesting a pull into the Linux kernel. The kernelci.org
> platform caught my eye last week during the talk at LPC.

Nice!

>
> We have some questions about what can be supported on
> kernelci.org. For example, the tests we need to run involve
> at least two hosts (an NFS client and an NFS server). How
> easy is it to set up that kind of test?

We don't have support right now for testing across two different hosts. 
Can you share more the details of what you want to achieve? Do you have 
some scripts or tests code somewhere that you can share with us? eg. are 
both the client and server subject of the tests at the same time or do 
you test changes one side against a fixed version of the other side 
(when it is possible).

Also, is there any kind of simple/smoke tests that we can run with only 
one host (eg as part of kselftests or LTP)? That helps us enables the 
most basic stuff more easily, as the above will need some design and 
discussion between the KernelCI team.

>
> If we want to test features that involve Kerberos, is there
> a KDC available, or would we need to provide a KDC image
> that can be used for our tests?

We don't have any provision for that yet (because no one ever needed 
it!). It might be easier if you just provide an image that serves you 
the best. I'd need to check with the team the details to make it 
available to your tests.

Best Regards,

Gustavo

