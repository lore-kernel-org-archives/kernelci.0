Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0EE2F3C
	for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 12:54:39 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:913a:fe5a:ffe8:c1ce] (unknown [IPv6:2001:861:4a40:8620:913a:fe5a:ffe8:c1ce])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B5F66602C48;
	Wed, 14 Dec 2022 12:54:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671022472;
	bh=Rjt8XWjmbJTJb8XzY+IorRSaJDy/ibEq/wfMFKJw0uw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WCudUlclkPzB5+8uKarjgHj8UFadXBxzUo+zKaqXynbuQ/DhsiaRXDqMNN2D6R3C5
	 jxHzm14rcq/W2BOKK9650+54oq3b3H5EKBMYR93e9FRj7/cge0Q4XrjaiS6UYgsv8Y
	 avrPh8CrkYPzsgGb3T2DErySjCqG5ZtrOej5oJu++p0x8ym2JNtSBQQbXUDl1T4rZ9
	 wXMhdA/lAf+JLmW3uUnndpr1+Cfni6u6ZbXGm0+i05Y0kveYSwFIb6gnLQ+PD5ufVH
	 Rtb2equ6dTzLJK6r7jImlf4rwPWy1ZYIjWBW5vzXO3rM5Ofmu4alQ0fvfO4SSCfsa/
	 AxN7sgk7OGXzA==
Message-ID: <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
Date: Wed, 14 Dec 2022 13:55:03 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mark Brown <broonie@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>, Sean Paul
 <seanpaul@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernelci@lists.linux.dev
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

Maybe you could retrieve the original thread and rely to it with
the report?  That's the ideal way of following up on a patch I
think.  You can get the mbox file this way:

./kci_bisect get_mbox \
  --commit ca871659ec1606d33b1e76de8d4cf924cf627e34 \
  --kdir ~/src/linux


On 14/12/2022 11:06, Geert Uytterhoeven wrote:
> Hi Mark,
> 
> Thanks for your report!
> 
> On Tue, Dec 13, 2022 at 5:58 PM Mark Brown <broonie@kernel.org> wrote:
>> On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
>> The KernelCI bisection bot found regressions in at least two KMS tests
>> in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
>> merged up mainline:
>>
>>    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
>>    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
>>
>> which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
>> PSR-exit to disable transition").  I'm not *100%* sure I trust the
>> bisection but it sure is suspicous that two separate bisects for related
>> issues landed on the same commit.
> 
> ... which is an old commit, added in v5.19-rc2, and which did not
> enter through the renesas tree at all?

Do you mean this report shouldn't have been sent to you?

FYI The renesas tree got rebased and inherited a regression which
got bisected.  The same thing probably happened to other trees.
Yes it would be good to have 2nd order regressions based on a
reference branch (e.g. mainline in this case) in KernelCI but
that's for next year.  Regardless, it found a commit and the
bisection looks legit.

>> Below is the full report for the bisect for the first test, the bisect
>> for the latter looks identical.  It's got links to full logs for the
>> test run and a Reported-by for the bot - I do see some backtraces from
>> userspace in the output, the first is:
>>
>> | IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux: 6.1.0 aarch64)
>> | <14>[   35.444448] [IGT] drm_read: starting subtest short-buffer-wakeup
>> | Starting subtest: short-buffer-wakeup
>> |
>> | (| drm_read:350) CRITICAL: Test assertion failure function generate_event, file ../tests/drm_read.c:65:
>> | (drm_read:350) CRITICAL: <14>[   36.155642] [IGT] drm_read: exiting, ret=98
>> | Failed assertion: kmstest_get_vblank(fd, pipe, DRM_VBLANK_EVENT)
>> |
>> | (drm_read:350) CRITICAL: Last errno: 22, Invalid argument
>> | Stack trace:
>> |
>> |   #0 ../lib/igt_core.c:1933 __igt_fail_assert()
>> |   #1 [<unknown>+0xd5362770]
>> |   #2 [<unknown>+0xd536193c]
>> |   #3 [__libc_start_main+0xe8]
>> |   #4 [<unknown>+0xd5361974]
>> |   #5 [<unknown<6>[   36.162851] Console: switching to colour frame buffer device 300x100>+0xd5361974]
>> | Subtest short-buffer-wakeup failed.
>>
>> Unfortunately we don't have current results from mainline or -next.

Thanks,
Guillaume
