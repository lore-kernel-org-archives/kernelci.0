Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD68470
	for <kernelci@lists.linux.dev>; Wed, 14 Dec 2022 14:27:26 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:913a:fe5a:ffe8:c1ce] (unknown [IPv6:2001:861:4a40:8620:913a:fe5a:ffe8:c1ce])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 449736602C52;
	Wed, 14 Dec 2022 14:27:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671028044;
	bh=f1kA77pzfQIUsmkeWUo9uZVfzVlDsMu6p4aeCyI4jzo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RY2D6XWjwhAW5NKUVEajoOzxaG6zRo/dE74Dlzp2Z9+M6YqiJZqUOHDSwHU7Y7Bb7
	 s/Sx9h1kRrZ7cJILCmjFQ9rkwmY/pAjTCFq7TVN/c+B9Qb95v9WLJ1OuniMewkxA2m
	 qAvhjURwpZJX8pfIkBxKoPn8peEUHw5qtJsXvvN7xCa3oGRUpOOD7PZDUhOkElbFII
	 Xenlf7A7IW42rwikfK6GxwKLJmfUeMSI+eoREkQRy1lEpRGjEis208nL6rQ2ml+ucD
	 sndAqhtEUmNkBEqPATbuGoxUF5YolT7BlmUmynDnTJn5xrCq08EEDzYwFiGaWaskbi
	 vwgExSFGLquMw==
Message-ID: <5cd34471-08cd-b4b8-c814-dc120417f602@collabora.com>
Date: Wed, 14 Dec 2022 15:27:56 +0100
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
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Brian Norris <briannorris@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernelci@lists.linux.dev
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
 <Y5nUmJVmiOFfoMQl@sirena.org.uk>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <Y5nUmJVmiOFfoMQl@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2022 14:50, Mark Brown wrote:
> On Wed, Dec 14, 2022 at 01:55:03PM +0100, Guillaume Tucker wrote:
> 
>> Maybe you could retrieve the original thread and rely to it with
>> the report?  That's the ideal way of following up on a patch I
>> think.  You can get the mbox file this way:
> 
>> ./kci_bisect get_mbox \
>>   --commit ca871659ec1606d33b1e76de8d4cf924cf627e34 \
>>   --kdir ~/src/linux
> 
> As a developer I tend to find this unhelpful, it makes it much more
> likely that the mail will get missed.  As a reporter it means there's
> more information to copy into the report.


Well it's up to you or anyone reporting the bisection result.
Base on my personal experience, I always got very quick replies
when doing this.

I don't see your point about copying more information though, I
would just open the mbox in my mail client to reply and paste the
content of the bisection report.  With a bit more work this could
be fully automated but that should be part of the bisection
rework using the new API & pipeline so sometime later in 2023...

>>> ... which is an old commit, added in v5.19-rc2, and which did not
>>> enter through the renesas tree at all?
> 
>> Do you mean this report shouldn't have been sent to you?
> 
> I do notice that the Renesas tree tends to get a *lot* of the bisection
> reports generated for some reason (vastly more than any other tree
> including mainline or -next), however this wasn't sent based on the tree
> at all - I just looked at the people involved with the commit.

In the past month, there were 15 bisection reports on renesas, 7
on linux-next and 28 on mainline for a total of 79 so 29 in other
trees.  So it's true renesas is getting quite a lot of them, it's
not entirely clear to me why that's the case but it's worth
investigating a bit.

See my other email about "kci_bisect get_recipients".

Thanks,
Guillaume
