Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0B412B71
	for <kernelci@lists.linux.dev>; Mon, 25 Sep 2023 08:48:48 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:fcef:69b2:fccd:bd45] (unknown [IPv6:2001:861:4a40:8620:fcef:69b2:fccd:bd45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 28BBA6607314;
	Mon, 25 Sep 2023 09:48:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695631727;
	bh=LpX8llgnsYDr+aggtZcPMQGLBc/6RgGId0ISNWti1gs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Zf+YPxsv5FCNxj6pnTvIWt7Jwl+hfLDnu47TFAfz7ypd9fUYGspM9PaTo+5PxWFA8
	 /ndPI3S88K3T5t0KGQ5qW2dcAzCsGh+mG5aG6FzkZ61sbpeFJUUBVSF4bINShSXV+n
	 qH5FgDn1Mc/8pFUp0cJ3G+MbIq/Ec//TEOKaA56f4rBoSuOgUT/i3jyTgxRuqUkGEe
	 RT3m4zAzhGMUMbGVNMAUn6RRPOlG846Yrd+ysJcJyv/j7yagYCB1XCJpeQT5HdvDn2
	 efwOaCkM7U+qzLjfw2Pe+wYVrVjkYnsO6hHyvmjSUzAb8JTqlUn2NLP/pfYQl5xMkY
	 PtuYhuJvO5agw==
Message-ID: <c9edd342-c4eb-323a-f68e-1cce3d0cea66@collabora.com>
Date: Mon, 25 Sep 2023 10:50:05 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Reduced build and test coverage
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
To: kernelci@lists.linux.dev
Cc: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <84e-6509cf80-5-78984280@144048748>
In-Reply-To: <84e-6509cf80-5-78984280@144048748>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/09/2023 18:43, Guillaume Charles Tucker wrote:
> On Tuesday, September 19, 2023 18:12 CEST, Mark Brown <broonie@kernel.org> wrote:
> 
>> On Tue, Sep 19, 2023 at 04:44:06PM +0200, Ricardo Cañuelo wrote:
>>> On mar, sep 19 2023 at 15:31:31, Mark Brown <broonie@kernel.org> wrote:
>>>> If we're doing this -next would be very helpful too.
>>
>>> Does it make sense to bisect -next, though? Considering that it's
>>> constantly rebased, so I don't think it has a coherent and "linear" log
>>> like mainline. That means that bisections aren't guaranteed to work on
>>> it. Is that right?
>>
>> When bisecting -next you should generally bisect it against the mainline
>> it was based on.
> 
> Yes that's how the KernelCI bisection works. It's the most useful branch to bisect automatically precisely because it's rebased every day with thousands of commits, so a bisection takes between 10 and 15 iterations and it's painful to do manually. And that's where most of the bugs are.  Then mainline, stable and stable-rc are the other critical trees to cover so it makes sense to enable them first.
> 
> We've discussed enabling bisections again with sysadmins and I think we can have this done in a week or two.  Other issues are about measuring costs empirically for different parts of the system and adding a filter in the legacy back end to avoid flooding Jenkins with jobs that won't get run (they still use up all the RAM).

We've now re-enabled the full functional test coverage which can
result in roughly twice the amount of test results coming from
LAVA labs.  We'll be monitoring the additional costs incurred as
a result this week and compare with previous weeks.

Then the plan is to prepare everything to have bisections enabled
again next Monday but with only mainline, linux-next, stable-rc
and stable as discussed previously.  These are the trees that
benefit the most from automated bisection.  We'll be able to
measure the added costs for that again in the following weeks
although we already have an estimate.

In October, the current plan is to enable some more builds such
as allmodconfig on a couple more trees such as mainline (right
now only linux-next has allmodconfig builds enabled) and continue
measuring the related costs.

This exercise aims at:

* knowing more accurately the cost of each area KernelCI's
  coverage to better secure its long-term funding

* streamlining the overall config to maximise the value of the
  results produced by KernelCI

* review the whole configuration in preparation for migrating to
  the new API with a fresh implementation

As mentioned before, if the current coverage is missing parts
that are critical to any use-case in the community then please
raise the issue here and we can address it.  For example, we're
looking into Android builds and bisections on more trees based on
feedback from users.

Thanks,
Guillaume

