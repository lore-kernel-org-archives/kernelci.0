Return-Path: <spbnick@gmail.com>
Subject: Re: Syzbot sends URLs in config names to KCIDB
References: <73b0f3cd-a382-4f77-1d2e-e081e4e05cc2@redhat.com>
 <CACT4Y+YKgm63c8idp0o=3y1SZKOWzx4nqYduCcz78p1W5L8iew@mail.gmail.com>
From: "Nikolai Kondrashov" <spbnick@gmail.com>
Message-ID: <4295a09c-17b9-1ba6-947b-c6695e564052@gmail.com>
Date: Fri, 17 Sep 2021 18:58:08 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YKgm63c8idp0o=3y1SZKOWzx4nqYduCcz78p1W5L8iew@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, tuxsuite@linaro.org
Cc: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, kernelci@groups.io

On 9/17/21 6:49 PM, Dmitry Vyukov via groups.io wrote:
> On Fri, 17 Sept 2021 at 17:45, Nikolai Kondrashov
> <Nikolai.Kondrashov@redhat.com> wrote:
>>
>> Hi Dmitry,
>>
>> I've just noticed, but Syzbot has been sending URLs in build "config_name"
>> fields for a while (see attached example), whereas the field is intended for a
>> descriptive, human-readable name instead.
>>
>> Do you think you could fix that?
>>
>> Thank you.
>> Nick
> 
> Hi Nick,
> 
> The attached info does not look like info from syzbot. It does not use
> tuxbuild. That's somebody else.

My bad, Friday evening got the best of me, sorry 🤦‍♂️

That's coming from Tuxsuite.

Whoever is responsible for Tuxsuite at Linaro now,
could you please take a look?

Thank you.
Nick
