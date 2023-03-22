Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47628FC
	for <kernelci@lists.linux.dev>; Wed, 22 Mar 2023 13:06:51 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:862f:b51c:3d6a:85e9] (unknown [IPv6:2001:861:4a40:8620:862f:b51c:3d6a:85e9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 32DA966030AF;
	Wed, 22 Mar 2023 13:06:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679490410;
	bh=VeevHIxJMrvzi0I7B3q1YCRxEAJS+r1/9mQjEluGoRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f4YufrA0OilGExgiMGilh7MRg9d+BWywYZXAs85t38IK0dAfKuDcScoSOJtgQ0BL9
	 x71bJY74HMXzzavrqM7liFdzp4AV1miut+zpfWBUP2hbVSkwVzGPqTEtQ/9SJEgFks
	 a9KKYw2RkhA4ANvND4bEObBVRWVg94DgMCDtausYQyEF5aGey0whEIA07cfhNssVNB
	 PFtkfgS/Yu9S6wJo8XADhlFGJSk/BvAmVfYz+grNIvszQ9D0lKMJbeIVMurRM/s7rp
	 gSGFxxV+hmARSN9rGmUwnYERJnmZqzxy9D/NnuXYyn2RE8G3HbUyS+V8vYOXaPgHrN
	 ak27iEqIorUiQ==
Message-ID: <6192485a-0229-7469-0c2d-856cdea35fbe@collabora.com>
Date: Wed, 22 Mar 2023 14:07:40 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Contributing Linux on Power test results to KCIDB
To: spbnick@gmail.com, sachinp@linux.ibm.com
Cc: misbahanjumn@ibm.com, "kernelci@lists.linux.dev"
 <kernelci@lists.linux.dev>
References: <26F2B8E1-8A69-42E9-B3DF-A7E7E847756E@linux.ibm.com>
 <aaaa8f94-d901-500f-338d-a39ea8e350eb@gmail.com>
Content-Language: en-US
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <aaaa8f94-d901-500f-338d-a39ea8e350eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+kernelci@lists.linux.dev

Please use the new list, kernelci@groups.io is now closed.

Guillaume

On 21/03/2023 20:10, Nikolai Kondrashov wrote:
> Hello Sachin,
> 
> We would love to have your data in KCIDB!
> 
> You can start with reading our Submitter Guide:
> 
> https://kernelci.org/docs/kcidb/submitter_guide/
> 
> Then decide and tell us what the "origin" of your CI system should be, so that we could identify it in the database, dashboards, and notifications.
> 
> After that I'll send you credentials with permissions to submit to our "playground" database, so that you could experiment and build up your data and submission system iteratively and interactively. Once that is done, we would give you permissions to submit to our "production" database.
> 
> Don't hesitate to send any question you might have to this maillist, or to our #kernelci IRC channel on libera.chat. If you need more help, we could arrange a video call as well.
> 
> Welcome!
> Nick
> 
> On 3/21/23 17:57, Sachin Sant wrote:
>> Hello List,
>>
>> I am part of Linux on Power team at IBM. Me and my team has developed
>> an automated framework to test various Linux kernel git based repositories
>> on IBM Power servers using avocado [1] based automated tests.
>>
>> These regression and functional tests are executed against
>> - mainline
>> - linux-next
>> - linuxppc tree [2]
>>
>> I am interested in contributing the results (boot and test) to KCIDB project.
>> Let me know how can I get started on this.
>>
>> Thanks
>> - Sachin
>>
>> [1] https://github.com/avocado-framework-tests/avocado-misc-tests
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
>>
>>
>>
>>
>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#1656): https://groups.io/g/kernelci/message/1656
> Mute This Topic: https://groups.io/mt/97759547/924702
> Group Owner: kernelci+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci/leave/2088106/924702/1865905899/xyzzy [guillaume.tucker@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

