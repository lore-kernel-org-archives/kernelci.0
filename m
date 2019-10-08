Subject: Re: syzkaller reproducers
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <876a2abe-41ab-5819-4ae8-ad26186d0d1c@kernel.org>
Date: Tue, 8 Oct 2019 09:00:11 -0600
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, automated-testing@yoctoproject.org, kernelci@groups.io, George Kennedy <george.kennedy@oracle.com>, Dhaval Giani <dhaval.giani@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Setje-Eilers <jan.setjeeilers@oracle.com>
Cc: syzkaller <syzkaller@googlegroups.com>, shuah <shuah@kernel.org>

On 10/8/19 6:16 AM, Dmitry Vyukov wrote:
> On Tue, Oct 8, 2019 at 1:46 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>>
>> Hi Shuah,
>>
>> We discussed collecting and uploading all syzkaller reproducers
>> somewhere. You wanted to see how they look. I've uploaded all current
>> reproducers here:
>> https://github.com/dvyukov/syzkaller-repros
>> Minimalistic build/run scripts are included.
>> +some testing mailing lists too as this can be used as a test suite
>> If you have any potential uses for this, you are welcome to use it.
>> But then we probably need to find some more official and shared place
>> for them than my private github.
>> The test programs can also be bulk updated if necessary, because all
>> of this is auto-generated.
>>
>> Thanks
> 
> +more people who expressed interest in the test suite before
> 

Thanks for putting this together. I am going to create a repo on
kernel.org t host these and pull your private git content in.

I will work on it this week and set things up.

thanks,
-- Shuah
