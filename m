MIME-Version: 1.0
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
In-Reply-To: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Tue, 8 Oct 2019 14:16:24 +0200
Message-ID: <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
Subject: Re: syzkaller reproducers
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Shuah Khan <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io, George Kennedy <george.kennedy@oracle.com>, Dhaval Giani <dhaval.giani@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Setje-Eilers <jan.setjeeilers@oracle.com>
Cc: syzkaller <syzkaller@googlegroups.com>

On Tue, Oct 8, 2019 at 1:46 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Hi Shuah,
>
> We discussed collecting and uploading all syzkaller reproducers
> somewhere. You wanted to see how they look. I've uploaded all current
> reproducers here:
> https://github.com/dvyukov/syzkaller-repros
> Minimalistic build/run scripts are included.
> +some testing mailing lists too as this can be used as a test suite
> If you have any potential uses for this, you are welcome to use it.
> But then we probably need to find some more official and shared place
> for them than my private github.
> The test programs can also be bulk updated if necessary, because all
> of this is auto-generated.
>
> Thanks

+more people who expressed interest in the test suite before
