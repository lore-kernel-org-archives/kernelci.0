Return-Path: <axboe@kernel.dk>
Subject: Re: [PATCH 06/14] block: store elevator state in request
References: <20211017013748.76461-1-axboe@kernel.dk>
 <20211017013748.76461-7-axboe@kernel.dk>
 <1a08141a-407f-0fda-4b27-e9dd350c6e79@collabora.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <8654edbf-0161-5dc1-5133-2d0623628229@kernel.dk>
Date: Tue, 19 Oct 2021 16:26:06 -0600
MIME-Version: 1.0
In-Reply-To: <1a08141a-407f-0fda-4b27-e9dd350c6e79@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernelci@groups.io" <kernelci@groups.io>

On 10/19/21 4:21 PM, Guillaume Tucker wrote:
> Hi Jens,
> 
> On 17/10/2021 02:37, Jens Axboe wrote:
>> Add an rq private RQF_ELV flag, which tells the block layer that this
>> request was initialized on a queue that has an IO scheduler attached.
>> This allows for faster checking in the fast path, rather than having to
>> deference rq->q later on.
>>
>> Elevator switching does full quiesce of the queue before detaching an
>> IO scheduler, so it's safe to cache this in the request itself.
> 
> A kernelci.org automated bisection found that this patch
> introduced a regression in next-20211019 with a NULL pointer
> dereference, which only seems to be affecting QEMU but across all
> architectures.
> 
> More details about the regression can be found here:
> 
>   https://linux.kernelci.org/test/job/next/branch/master/kernel/next-20211019/plan/baseline/
>   https://linux.kernelci.org/test/case/id/616ea20eb7104071c43358ea/
> 
> See also all the test jobs involved in the automated bisection:
> 
>   https://lava.collabora.co.uk/scheduler/device_type/qemu?dt_search=bisection-287
> 
> If you do send a fix, please include this trailer:
> 
>   Reported-by: "kernelci.org bot" <bot@kernelci.org>
> 
> 
> Please let us know if this seems like a valid bisection result
> and if you need any help to debug the issue or try a fix.

This got fixed yesterday, current tree is fine.

-- 
Jens Axboe

