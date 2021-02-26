Subject: Re: 5.10 LTS Kernel: 2 or 6 years?
References: <ef30af4d-2081-305d-cd63-cb74da819a6d@broadcom.com>
 <YA/E1bHRmZb50MlS@kroah.com>
 <595affb4-36e8-0a63-ebb3-a4fd0e3c243a@huawei.com>
 <2a7ff382-1d35-0eeb-6fb6-bad37aa4c1d7@redhat.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <4abea94d-5232-19ab-3139-569e485403b3@huawei.com>
Date: Fri, 26 Feb 2021 16:03:19 +0800
MIME-Version: 1.0
In-Reply-To: <2a7ff382-1d35-0eeb-6fb6-bad37aa4c1d7@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Scott Branden <scott.branden@broadcom.com>
Cc: Huxinwei <huxinwei@huawei.com>, LKML <linux-kernel@vger.kernel.org>, Yanjin <yanjin.yan@huawei.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Zhaohongjiang <zhaohongjiang@huawei.com>, "Zhangdianfang (Dianfang, OS Lab)" <zhangdianfang@huawei.com>, PEIXIN HOU <PEIXIN.HOU@huawei.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, kernelci@groups.io, Wei Yongjun <weiyongjun1@huawei.com>, Lijinyue <lijinyue@huawei.com>

Hi Nick,

Sorry for taking so long to reply you, we had discussions on how to
corporate with KCIDB, please see my comments inline.

On 2021/2/19 22:45, Nikolai Kondrashov wrote:
> Hi Hanjun,
> 
> On 2/19/21 10:54 AM, Hanjun Guo wrote:
>  > In specific, we will start from the testing work, using HULK robot
>  > (reports lots of bugs to mainline kernel) testing framework to test
>  > compile, reboot, functional testing, and will extend to basic
>  > performance regression testing in the future.
> 
> I heard about Huawei ramping up kernel testing from someone at FOSDEM
> 2019. I wonder if it was you :) Nice to see your progress and the company
> stepping up to help with testing!

I Cced Yongjun and Jinyue, they are the key persons :)

> 
> Would you be interested in working with the Linux Foundation KernelCI 
> project
> on submitting your build and test results to the common database - KCIDB?

Yes, we are willing to sent the test results to KCIDB.

For now, all the tests are inside the company, which blocks us to
directly sent the test results out of the test machine due to the
security policy, it takes us sometime to discuss how to send out
the test results, and we may need do the test in a public cloud.

> 
> We are working on aggregating results from various testing systems so we 
> can
> provide a dashboard, and a single, aggregated e-mail report to subscribed
> maintainers and developers.
> 
> We have a prototype dashboard at https://staging.kernelci.org:3000/ and are
> working hard on making the e-mail reports good enough to start reaching 
> out to
> maintainers.
> 
> We already have ARM, Google Syzbot, Gentoo GKernelCI, Red Hat CKI, and, of
> course, KernelCI native tests sending data to the database. Linaro 
> Tuxsuite is
> starting sending today. We could use your data, and of course any 
> development
> help you could spare :)

How can we connect to the KCIDB? Can we send the test data out by email
first?

> 
> I wish I could show you my today's KCIDB presentation at DevConf.cz, but 
> the
> recording is not out yet. Meanwhile you can take a look at our 
> presentation at
> last year's Linux Plumbers: https://youtu.be/y9Glc90WUN0?t=10739
> 
> Or see our intro in an older blog post:
> https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/ 
> 
> 
> Anyone wishing to contribute to KCIDB gets credentials and permissions to
> submit to our "playground" setup where they can send their data, see it 
> in a
> dashboard, experiment without worrying about breaking anything, and 
> decide if
> they like it or n >
> If you're interested, take a look at our Submission HOWTO:
> https://github.com/kernelci/kcidb/blob/v8/SUBMISSION_HOWTO.md
> and send an email to kernelci@groups.io (CC'd), or come over to the 
> #kernelci
> channel on freenode.net!

Thanks!
Hanjun
