Subject: Re: [Automated-testing] syzkaller reproducers
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
 <876a2abe-41ab-5819-4ae8-ad26186d0d1c@kernel.org>
 <226099bc-9763-3a73-e26a-b292f601494c@kernel.org>
 <20191011180248.GA24089@rei.lan>
 <b715f3d7-547f-9a43-dc41-2e46ec3bfd51@kernel.org>
 <20191014085414.GB31760@rei.lan>
 <CACT4Y+aKbgT=i8C5aZvp8ZV52PamGm=GdnR6kQecczLQOQSGqA@mail.gmail.com>
 <62903a33-8ffc-56b6-de1a-539f10b5de2a@oracle.com>
 <86bde120-e5fe-4bb1-9b93-769a444500f9@oracle.com>
 <e8b11b09-37ac-6ae2-0908-b803b4160f7c@oracle.com>
 <CACT4Y+bShy-3vO3ifNKVcGGNf3X9XA7zL-Ja9-T+gZv5=QNe4w@mail.gmail.com>
 <8a4dbbb1-f8ba-00ba-41d2-d82a35fc0f81@oracle.com>
 <CACT4Y+aZ=rBZXdnrU0D-21QqSK0G3vqHU+iD=k0PhGgo3TL6rA@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <fe365a78-0768-ea1f-25b8-6bd05a57c751@kernel.org>
Date: Fri, 13 Mar 2020 09:59:29 -0600
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aZ=rBZXdnrU0D-21QqSK0G3vqHU+iD=k0PhGgo3TL6rA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>, George Kennedy <george.kennedy@oracle.com>
Cc: Cyril Hrubis <chrubis@suse.cz>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io, Dhaval Giani <dhaval.giani@gmail.com>, Jan Setje-Eilers <jan.setjeeilers@oracle.com>, syzkaller <syzkaller@googlegroups.com>, Dan Carpenter <dan.carpenter@oracle.com>, shuah <shuah@kernel.org>

On 3/3/20 1:45 AM, Dmitry Vyukov wrote:
> Shauh,
> 
> We've added more reproducers to:
> https://github.com/dvyukov/syzkaller-repros/tree/master/linux
> 
> It makes sense to pull in them to the kernel-arts repo. Not sure
> what's the most convenient way for you since it's not exactly a
> traditional "patch"? Perhaps you just copy linux/*.c files and commit?
> 

Thanks Dmitry. I will pull these in. I will pull these in.

thanks,
-- Shuah
