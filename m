Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91B8F43
	for <kernelci@lists.linux.dev>; Thu,  2 Feb 2023 16:52:22 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:ec34:182a:e39:b011] (unknown [IPv6:2001:861:4a40:8620:ec34:182a:e39:b011])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9DE426602E72;
	Thu,  2 Feb 2023 16:52:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675356740;
	bh=rwj2/CimTANyCx0pnCeq+RrmY/zKZlVKILoegwWeSqU=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=PJrDVKKUGREHUvHA84KdP7VP2gS2hDrqMi/Dcm8rqmxL5TF0f8UVG7R8U/EhwIY0J
	 Qx3BYZpN5JFBNa5e7tjllQmX+7MPMTXD7LaYWiNiMKO1CBpn+vD0czOxU/Rgj8Ynfm
	 fkqjMrw/y4SlL3ROZTJl/fQXGke7i01tzlcEipvqClay6+q83e+TE9XSrMuzCEPGaR
	 TIUcjoqpL+bp446t7+yvINt6XZNl1FFMpExGg1Xz8bbc+zHKZzSb8lQ46X6oLVZcSB
	 w9d4eIajc5BC2ZxpXD4YTQedCiZSljfOMaYhmMQFf/XSo3DsWuFag8rA6GaXM0cjxD
	 3L4uVv9Y6NZvw==
Message-ID: <74ab6ee3-e8c3-d8a4-518f-fc7a85e4f0c9@collabora.com>
Date: Thu, 2 Feb 2023 17:53:07 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Please add android14-6.1
Content-Language: en-US
To: Todd Kjos <tkjos@google.com>
References: <CAHRSSEzfMO06w8cimnG9W_NnvnupxcF93tVVJOybUWjoQzNY3w@mail.gmail.com>
 <CAHRSSEw=t+jhbmHjZVL+mZTJii66pJnHfyNSGXFRt99=y7=6WA@mail.gmail.com>
Cc: kernelci@lists.linux.dev
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAHRSSEw=t+jhbmHjZVL+mZTJii66pJnHfyNSGXFRt99=y7=6WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Todd,

On 16/12/2022 21:17, Todd Kjos wrote:
> +kernelci@lists.linux.dev

Please only send emails to kernelci@lists.linux.dev as it
replaces kernelci@groups.io which will eventually be archived.

See the original thread about this:

  https://lore.kernel.org/kernelci/58297219-2f76-66b6-fc00-b2e85d1ca051@collabora.com/T/#t

And yes, like all kernel mailing lists, it's plain text only :)

Thanks,
Guillaume


> On Fri, Dec 16, 2022 at 11:45 AM Todd Kjos <tkjos@google.com> wrote:
>>
>> Please add android14-6.1 branch to kernelci testing.
>>
>> repo: https://android.googlesource.com/kernel/common
>> branches: android14-6.1
>>
>> Thanks,
>>
>> -Todd
> 

