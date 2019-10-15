Subject: Re: [Automated-testing] syzkaller reproducers
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
 <876a2abe-41ab-5819-4ae8-ad26186d0d1c@kernel.org>
 <226099bc-9763-3a73-e26a-b292f601494c@kernel.org>
 <20191011180248.GA24089@rei.lan>
 <b715f3d7-547f-9a43-dc41-2e46ec3bfd51@kernel.org>
 <20191014085414.GB31760@rei.lan>
 <CACT4Y+aKbgT=i8C5aZvp8ZV52PamGm=GdnR6kQecczLQOQSGqA@mail.gmail.com>
From: George Kennedy <george.kennedy@oracle.com>
Message-ID: <62903a33-8ffc-56b6-de1a-539f10b5de2a@oracle.com>
Date: Tue, 15 Oct 2019 09:04:01 -0400
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aKbgT=i8C5aZvp8ZV52PamGm=GdnR6kQecczLQOQSGqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>, Cyril Hrubis <chrubis@suse.cz>
Cc: shuah <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io, Dhaval Giani <dhaval.giani@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Setje-Eilers <jan.setjeeilers@oracle.com>, syzkaller <syzkaller@googlegroups.com>



On 10/14/2019 7:19 AM, Dmitry Vyukov wrote:
> On Mon, Oct 14, 2019 at 10:54 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>> Hi!
>>>> You are suposed to run the run.sh script in the bin directory.
>>> Yeah that does work.
>>>
>>> Would be helpful to have usage instructions instead of failing. :)
>> I do not think that these scripts are ever supposed to be the used in
>> production testing, you need much more than this to produce results
>> reliably. I would expect that they are supposed to be a form of very
>> minimal documentation.
> Yes, I just added them as quick hints: some repros are 32-bits; each
> needs a new dir; some external timeout is needed for each test.
Thank you again for the collection of repro C programs!

Hitting a lot more crashes with the collection of repro C programs than 
in all the hours of running Syzkaller. Wonder why? Any idea? This is 
with the same kernel and VM that Syzkaller is run on.

George


