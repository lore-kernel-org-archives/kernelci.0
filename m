Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861F22AE47
	for <kernelci@lists.linux.dev>; Mon, 13 Jan 2025 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767414; cv=none; b=BqwX5tROfsfsZLt5455OqjTq1W63AZUwu/tlEOzLNVG3/B3zylYvxOT1nNF5NTzdUoQsQSNWz0GhhRA8KF01dCkwZhA6HhTsjXh1nkXTg7O66WuEZEDSez0DzmbizjE1hWZFMgeX7H/MeSWfz/28jpLjiDoloSoreR5tpFd3hdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767414; c=relaxed/simple;
	bh=wJVQkGsNsxPgZTiYmzS0U2TPljrWQkFM9RRwjSqI+SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=faG2PsZ4dLOC6rhc2CGWyQ+qldEf2HiQVVGl7JfTAej2+LHcwPEYM0uLfUPMt9Ys2ldKiHBt/wT7KqKeadPSGIksojY17oLohV2WJUBJqw2bh4bdvnKDY+V2yZU8zPC8wsRI5LiYZOW2jdQgN4PcPWWUPzh+g/e1DZcWm9Ej/u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ac0J1Mvp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ac0J1Mvp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43621d27adeso28504245e9.2
        for <kernelci@lists.linux.dev>; Mon, 13 Jan 2025 03:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767411; x=1737372211; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPaYTJtZWzySmAX9K3Cb5jhdpjSmgZt0BPZdxxSNpqQ=;
        b=ac0J1MvpIJzC93wHW9GV2XjT9Zgrl0CACv1dBDi9II5OBVeGoM10tPsYMjRwiH3vxb
         F3iM0+Wk+5JtDxm6yMsg5/ftq27oJR9OqTy2PDxYY8oadcLWd36KHWnGtbuAzmCMbHlp
         IeyWO91DA3Edq6fj2r2GvUI3PmXlx6pQxfGUe1GfsHB8wL2j1XvGR5nfgvCPuMOwv7uO
         R3GLSdR1KMHP9pHHB4XKvzQq9V1usg1z2F90Gniaiw7Uoidvhh4k81y2SCA7vumHnOU7
         9ejwAtcTX7XIUJAcwtP0MdMTU5jwJQvr8FhYE0Gebrku8LXoHoVdLu5NW5UxSwij22sf
         MfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767411; x=1737372211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MPaYTJtZWzySmAX9K3Cb5jhdpjSmgZt0BPZdxxSNpqQ=;
        b=BI0XCOSXTZtaBi+jzwInBYEMcHdyfT11/3WPvT5TNQU7KB4+w/5NWf+9JbKINCWqdc
         GqlrdLNb8jIx0l+LVR6h+6t+mKaZKGOVtqaLW1CnFwKTU487rcyil2vKvcJ/y278OI1Q
         uU9csWs7McGX/beJz7HH25a1oUejm9eBiQhNMbROMp7Cc9DoV7BRt6jwn7qqJMoA8nGJ
         jCjDL4pe/n63VlXV48shGy5gNF0iFMKYpwd1i6HhCjtkC1eGoOCg+4f2yNju05DZ7vbi
         s5uOrbai2glat5dc9qmD7GhFpD/IWvMBjSj8em112z409YJ5yxJG7dMMoIKXACyXChMI
         RTYw==
X-Forwarded-Encrypted: i=1; AJvYcCUnhWfbgIp/EjG05xi5ReI+1itE/DjphwO9L86wECYEmIkGoRUqyOoZUSYQdAqfaNFvd/cYzRRODw==@lists.linux.dev
X-Gm-Message-State: AOJu0YydcXCj4IjiK75yTrBfn0bnezKwCWA/OYt6nSZpIsPQmQCWgwJ4
	mt7nhKIwQ269g1Bzbaq5R6fBdi3s4RL7D2vXBlKBxClPsukK/mZ3JkVyYg==
X-Gm-Gg: ASbGncu5NbMF5jeQgI/EzoNaLrINVJ1wLYA9nud3J9LHrq6VdVpkzqkym1fFt3RUgDO
	/0eSkjyqLveK5drgD5tCnJl9eOzDs7zva2m3shr4fI3ocv6Bcv4xfyVgQQh467WcKAIcZMOzQjN
	ouLbhM9xL1DoL0BOos4wNQrYjUU+0DnxXVmR/kkVJtmcCcVa6pbde2w38LmKxvc/tCJQRiOrC8a
	FBiN7/w4guoQ+JVmNVQR/vFRggagNfF0DNiqKtptIuwG+pfWn4KNHTlgwiRj+L8+p1q1lMMLu7j
	W2eIb9T9QMX+uWUB
X-Google-Smtp-Source: AGHT+IEkswJr5cPNV4wX5+5xmc1+ClxNgV9OLZzZPScBsU/V/xQGZIh40m/P2pji3ynrzWfVOSJ1uw==
X-Received: by 2002:a05:600c:3b99:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-436e266dfe9mr160755075e9.6.1736767410437;
        Mon, 13 Jan 2025 03:23:30 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc14ebsm173001555e9.17.2025.01.13.03.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 03:23:29 -0800 (PST)
Message-ID: <962b6b41-3f21-4149-8869-562e11225681@gmail.com>
Date: Mon, 13 Jan 2025 13:23:29 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KernelCI Weekly Newsletter (Week 2)
To: Denys Fedoryshchenko <denys.f@collabora.com>, kernelci@lists.linux.dev
References: <8a2c4f7da3df1d3cd0e52c3bcc49f7fee9475b0c.camel@collabora.com>
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <8a2c4f7da3df1d3cd0e52c3bcc49f7fee9475b0c.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Denys,

Thank you for keeping posting these updates!

On 1/8/25 4:51 PM, Denys Fedoryshchenko wrote:
> 2. **KernelCI Development Roadmap**  
>    Through discussions with the community, we've identified a list of
> features and improvements for KernelCI.  
>    Please share your ideas or indicate if you'd like to contribute to
> any of these items. 
>    This is initial draft, and we will continue to refine the list.

Is there perhaps a doc or an issue where these are fleshed out with more details?

Nick
