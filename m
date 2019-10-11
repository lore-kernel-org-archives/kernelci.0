Subject: Re: [Automated-testing] syzkaller reproducers
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
 <876a2abe-41ab-5819-4ae8-ad26186d0d1c@kernel.org>
 <226099bc-9763-3a73-e26a-b292f601494c@kernel.org>
 <20191011180248.GA24089@rei.lan>
From: shuah <shuah@kernel.org>
Message-ID: <b715f3d7-547f-9a43-dc41-2e46ec3bfd51@kernel.org>
Date: Fri, 11 Oct 2019 13:11:07 -0600
MIME-Version: 1.0
In-Reply-To: <20191011180248.GA24089@rei.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Cyril Hrubis <chrubis@suse.cz>
Cc: Dmitry Vyukov <dvyukov@google.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io, George Kennedy <george.kennedy@oracle.com>, Dhaval Giani <dhaval.giani@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Setje-Eilers <jan.setjeeilers@oracle.com>, syzkaller <syzkaller@googlegroups.com>, shuah <shuah@kernel.org>

On 10/11/19 12:02 PM, Cyril Hrubis wrote:
> Hi!
>> Playing with the git getting ready to host it on kernel.org git repo.
>> Build worked fine and I can't get the run.sh to work.
>>
>> I expected it to run what is in
>>
>> syzkaller-repros/bin
>>
>> It doesn't seem to do that. Looks like it wants to build. Here is what
>> I see. What am I doing wrong?
> 
> You are suposed to run the run.sh script in the bin directory.

Yeah that does work.

Would be helpful to have usage instructions instead of failing. :)

> 
>> I did a build which worked. There are some errors due to sys/cdefs.h
>> missing.
> 
> That is because you are missing 32bit gcc and devel libs.
> 

Yeah. I didn't think about that.

thanks,
-- Shuah
