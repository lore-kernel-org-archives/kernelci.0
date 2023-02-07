Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350AC20E8
	for <kernelci@lists.linux.dev>; Tue,  7 Feb 2023 09:55:16 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:7b9f:2478:5d44:165f] (unknown [IPv6:2001:861:4a40:8620:7b9f:2478:5d44:165f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 38D1C660206E;
	Tue,  7 Feb 2023 09:55:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675763714;
	bh=JzQsl6gOBkfbLebTYjvwBWppR3o2Ze/bRrulmhwk5Ww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nqDwdAewRWJUTC62POUBCIHB+vC+W0hKqC8hhdMzUpsS7i07qfzL1GStnnWkLJm+T
	 skDzjdYHedzPmA8Bq2ZYc4jv1ncy3puVg6d87ONrIiT2I9/m3juQ8pJw6qX/IJSP30
	 g0VTLUWOFoU8jbLnU8vNnQ1Gaq1qI9cN5BGzq64hvLGdvpWB7YuEzpQf/WN5CeNaVc
	 xcjkQ0phEzvzcrhCDJdHVmp/jeNuPb5j1hCwsLKo3Yg7+7llVFHjKlEKhjuN4ixBQT
	 9O+AcGLBC9CJTiPO3pkFFj/cJ4BcFFv8ughwPMMrf4vRRBgEXF3uJ8ZPmuc5ieuK81
	 kK6bJtUUfPHvQ==
Message-ID: <c3cd3489-ca32-bdf5-4538-d95532bf9430@collabora.com>
Date: Tue, 7 Feb 2023 10:56:04 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: tip/master build: 205 builds: 5 failed, 200 passed, 9 errors, 22
 warnings (v6.2-rc7-273-gd67c17ddc899)
Content-Language: en-US
To: mingo@kernel.org
Cc: x86@kernel.org, "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 "kernelci-results@groups.io" <kernelci-results@groups.io>
References: <63e1f7e0.170a0220.7142.de7c@mx.google.com>
 <Y+IRiiRtXvUzXOGp@gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <Y+IRiiRtXvUzXOGp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ingo,

On 07/02/2023 09:53, Ingo Molnar wrote:
> 
> * kernelci.org bot <bot@kernelci.org> wrote:
> 
>> tip/master build: 205 builds: 5 failed, 200 passed, 9 errors, 22 warnings (v6.2-rc7-273-gd67c17ddc899)
>>
>> Full Build Summary: https://kernelci.org/build/tip/branch/master/kernel/v6.2-rc7-273-gd67c17ddc899/
>>
>> Tree: tip
>> Branch: master
> 
> Is anyone maintaining this CI build bot? Because it's either unmaintained, 
> or is blatantly lying about regressions.
> 
> Let's see one of the 'errors' it reported today:

Yes, it's being maintained.  However there's no way for the
KernelCI core team to manually verify all the errors reported.
So kernel developers following up on such errors is the best way
to handle them and get them resolved.  Thanks for replying to the
email report :)

>> Errors summary:
>>
>>     4    cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> 
> ... but this exact same error was 'reported' a year ago on January 22:
> 
>>    2    cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> 
> So these regression reports are useless in this form and they clutter 
> people's inboxes. Is any person reading them and acting on them to make 
> sure these emails are sensible?

They are not reported as regressions but as build errors.  So it
doesn't matter when it started failing or if this has always
failed, any build error will show up in the report.  It's
definitely something to improve, the runtime test reports
differentiate regressions or "new failures" and errors that have
always been there.  This will also apply to builds at some point,
it's on the roadmap for the next few months.  Please bear with us
in the meantime.

About the actual kernel build error, I guess it's a shame nobody
has fixed this yet.  I'll take a look what the root cause might
be.  If it's a KernelCI build configuration issue e.g. using
wrong compiler flags then we can fix that, otherwise it's
probably something to report more directly to some MIPS
maintainers.

Thanks,
Guillaume

