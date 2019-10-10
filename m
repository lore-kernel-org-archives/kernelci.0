MIME-Version: 1.0
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <20191010142744.GA10083@rei.lan>
In-Reply-To: <20191010142744.GA10083@rei.lan>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Thu, 10 Oct 2019 16:30:27 +0200
Message-ID: <CACT4Y+ZiC_m-U1+Zxs3hhOM7j2seKKjX=H9eabUAGCctm1+8OQ@mail.gmail.com>
Subject: Re: [Automated-testing] syzkaller reproducers
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Cyril Hrubis <chrubis@suse.cz>
Cc: Shuah Khan <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io, syzkaller <syzkaller@googlegroups.com>

On Thu, Oct 10, 2019 at 4:27 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > We discussed collecting and uploading all syzkaller reproducers
> > somewhere. You wanted to see how they look. I've uploaded all current
> > reproducers here:
> > https://github.com/dvyukov/syzkaller-repros
> > Minimalistic build/run scripts are included.
>
> What is the reason behind statically linking the reproducers?
>
> The difference between static and dynamic binary is a bit less than 4MB,
> which gives difference of several gigabytes for the whole repo. This
> amount of binary data would complicate and slow down any CI
> significantly...

Simply being able to run programs on a different machine. Dynamic
binaries generally don't run on a different linux machine. If you can
build dynamic binaries so that they run on test machine, feel free to
drop -static.
