MIME-Version: 1.0
From: dvyukov@google.com
Date: Tue, 8 Oct 2019 13:46:52 +0200
Message-ID: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
Subject: syzkaller reproducers
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Shuah Khan <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io
Cc: syzkaller <syzkaller@googlegroups.com>

Hi Shuah,

We discussed collecting and uploading all syzkaller reproducers
somewhere. You wanted to see how they look. I've uploaded all current
reproducers here:
https://github.com/dvyukov/syzkaller-repros
Minimalistic build/run scripts are included.
+some testing mailing lists too as this can be used as a test suite
If you have any potential uses for this, you are welcome to use it.
But then we probably need to find some more official and shared place
for them than my private github.
The test programs can also be bulk updated if necessary, because all
of this is auto-generated.

Thanks
