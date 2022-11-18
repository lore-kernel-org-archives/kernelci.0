Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB742F45
	for <kernelci@lists.linux.dev>; Fri, 18 Nov 2022 10:05:57 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:b9e6:fe69:975c:4daa] (unknown [IPv6:2001:861:4a40:8620:b9e6:fe69:975c:4daa])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5186E660298A;
	Fri, 18 Nov 2022 10:05:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668765955;
	bh=Cn9jT7WNs6qjPXB5H60IPJDiSIJcTHx7LkaK2YTCrq8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=opmzdiWB9CyAsJTiaW6ZBTwioIbkwjq1Y3Bv+KTiqxt1q6FGrm05MLEVbOSLpYODO
	 sZj1wikG5BkpmyuAMgJhGA+SwMLnCBLWH+5j7jcsSyPZxs9as0NjJ2+1oeTeXg/GHU
	 Wjx4ckAIbDbrDPx3T7SamybKdnCQyR+xBiIRzK12fLxCp2LwI3ZZaGS+nj1azDXXC2
	 l2KH4PFzTCZGK9TJJE2TO/yhs0EMrMcn81EI0fuYq7hRI28vcjufNPJgfmZUcIMXuJ
	 JB2yOs5Qy5rYR+XxEB4RCqejJmLN5zYydibupDfjW/TNbjT0B14JlMGZsFQ1VXcIQo
	 DuQqp1E6KDcSQ==
Message-ID: <4849d0f0-a3f4-bc8d-8af4-53e799c699be@collabora.com>
Date: Fri, 18 Nov 2022 11:06:17 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: #KCIDB engagement report
Content-Language: en-US
To: Nikolai.Kondrashov@redhat.com, automated-testing@lists.yoctoproject.org,
 kernelci@lists.linux.dev
References: <8543af6d-28cf-6117-4dad-76aafea4b6f7@redhat.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <8543af6d-28cf-6117-4dad-76aafea4b6f7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

+kernelci@lists.linux.dev (new KernelCI mailing list)

On 17/11/2022 11:28, Nikolai Kondrashov wrote:
> Hi everyone,
> 
> Below is the monthly* report on KCIDB** engagement. It lists various CI
> systems and their status of engagement with KCIDB, as well as developer
> engagement.
> 
> Lines with updates are marked with "!".
> 
> Main news are: Intel's 0day CI has been sending their data to production for a
> while, and are looking to expand their contribution, Microsoft moving closer
> to sending their data, and the proposal for known-issue schema is going out
> soon, after preliminary implementation and testing is complete.
> 
> CI Engagement Status
> 
>     KernelCI native
>         Sending (a lot of) production build and test results.
>         https://kcidb.kernelci.org/?var-origin=kernelci
> 
>     Red Hat CKI
>         Sending production results.
>         https://kcidb.kernelci.org/?var-origin=redhat
> 
>     Google Syzbot
>         Sending a subset of production results (failures only).
>         https://kcidb.kernelci.org/?var-origin=syzbot
> 
>     ARM
>         Sending production results.
>         Full commit hashes are currently not available, are spoofed, and don't
>         match the ones reported by others. There's ongoing switch to using a
>         KernelCI instance setup, which should fix this.
>         https://kcidb.kernelci.org/?var-origin=arm
> 
>     Sony Fuego
>         Internal design in progress.
> 
>     Gentoo GKernelCI
>         Sending production results.
>         Only builds (a few architectures), no configs, no logs, and no tests
>         for now, but working on growing contributions.
>         https://kcidb.kernelci.org/?var-origin=gkernelci
> 
>     Intel 0day
> !       Sending production results.
> !       Mainline builds and kselftest results.
> !       https://kcidb.kernelci.org/?var-origin=0dayci
> 
>     Linaro
>         Sending (a lot of) Tuxsuite build results to "production" KCIDB.
>         https://kcidb.kernelci.org/?var-origin=tuxsuite
> 
>     TuxML
>         Initial contact in response to a report.
>         There's a plan to approach us and start work in the coming months.
> 
>     Yocto Project
>         Initial contact in response to a report.
>         Would like to start sending build and test results, particularly for
>         older kernels. Would like to separate upstream commits from project
>         patches first: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14196
> 
>     Huawei Compass CI
>         Sent a message to Fengguang Wu, who was presenting it at LVC 2021.
>         No response so far.
> 
>     Microsoft
>         Johnson George was filled in on the details of submission process.
> 
> Please respond with corrections or suggestions of other CI systems to contact.
> 
> Thank you!
> Nick
> 
> *More-or-less :)
> 
> **KCIDB is an effort to unify Linux Kernel CI reporting, maintained by Linux
>   Foundation's KernelCI project:
>   https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#1619): https://groups.io/g/kernelci/message/1619
> Mute This Topic: https://groups.io/mt/95087111/924702
> Mute #kcidb:https://groups.io/g/kernelci/mutehashtag/kcidb
> Group Owner: kernelci+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci/unsub [guillaume.tucker@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

