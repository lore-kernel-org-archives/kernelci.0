Date: Thu, 10 Oct 2019 16:27:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
Subject: Re: [Automated-testing] syzkaller reproducers
Message-ID: <20191010142744.GA10083@rei.lan>
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Shuah Khan <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io, syzkaller <syzkaller@googlegroups.com>

Hi!
> We discussed collecting and uploading all syzkaller reproducers
> somewhere. You wanted to see how they look. I've uploaded all current
> reproducers here:
> https://github.com/dvyukov/syzkaller-repros
> Minimalistic build/run scripts are included.

What is the reason behind statically linking the reproducers?

The difference between static and dynamic binary is a bit less than 4MB,
which gives difference of several gigabytes for the whole repo. This
amount of binary data would complicate and slow down any CI
significantly...

-- 
Cyril Hrubis
chrubis@suse.cz
