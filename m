Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830B3A1DB
	for <kernelci@lists.linux.dev>; Tue, 25 Feb 2025 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740487216; cv=none; b=J37DvbN5tY3SGn+hFdWUn0IKzKOcyHm5axTNnp2+PZDU3wlGdTZ+9QU7jFotVtMX4OO87+HzsTh6E3CuFIGueyROe6spENDHf5iy3Hn1meOwH9eERrye71oZqNZEs0winh26cafKm36G3/fVnVUpGzN1bNBy/F2HVWa1WahtFC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740487216; c=relaxed/simple;
	bh=u4ihHFxiBr0INBwDJ6urJ5wL6TVVF9EiKMIkCv8bD4Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Tu3TSKeOauzIOoWEXZs/dtOrui7XMBtbctna6paSZ8B9XgZsmZ9nTPOIG05vfUJ+JG2nH/kt3RiB+IVvHp/4194jS0us/XXgUCgHF1T9tE2wjKPDmy7drznkq9xcGU/2FW30EdYDYtnW9XfhFvekVX9GFOmiFFiCbQp/Zwy4kTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b10Bbn3M; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b10Bbn3M"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f73e6ed7fso1982742f8f.0
        for <kernelci@lists.linux.dev>; Tue, 25 Feb 2025 04:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740487213; x=1741092013; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4ihHFxiBr0INBwDJ6urJ5wL6TVVF9EiKMIkCv8bD4Y=;
        b=b10Bbn3MobI6IS64CvVzreCI9x6sI2UfMm+p5IpVeLvTFlcuNZlWlfxOFzU/KIRaUY
         +707hdCxIJJlc1qe4sJf2OYkW2E5pwXwiQNNicOxldA1+0H9TwVyTTXJgrpgjzE6mR6F
         93y7rD152QjsGWRaLpWQ/9JrT6y92XfBBFA4iO/fxo3fBgKfQDLTxd2FMYu2o+DxOdco
         dY6vZfXzbIZQS40vTg00UN6VMTsQ/2rMloXZS2pft8OnA1d/jK1Tt4fux8r6pg3iMgkf
         lBiePma/V4aSUk4wHWbkhzo+fM9IlPaPby5CaG1/NXdzy6EK7Kcp2nF3KY5mX2X+fZje
         0zDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740487213; x=1741092013;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u4ihHFxiBr0INBwDJ6urJ5wL6TVVF9EiKMIkCv8bD4Y=;
        b=Y1NXoQoXCKSnMauo+FYsZGAlGX8AHQFF4/5/w6KxPskD3Bb5xt3UTZC9mF9LnU1IC7
         uywt0GLukPyJQNP1Gnz0MobKHcoIbz2hm1b4MvaSPaYFWaltz5sSYQdN37hNDUBF19Yl
         j6uvgBj06zfwcZVCzg1t+kSLajFzWt3ClplZhwEh+L566M11PusM6hXCn/rJV421bi06
         WN2yoHdbeyjhzYRdagANzMKGeQccCBgRE+Joet96Gy/djYjzpXh6zA4lzAhcec6GO+47
         kTB/d58YAUpvCgdSdVmft4sNTqwE0xqA2zlSLjde5tFhaeTjtKyVRmOgbgDOHjd7iqYG
         ctSg==
X-Forwarded-Encrypted: i=1; AJvYcCU7E/7PqD8SLRmGKrrawybgkJp9miIJk6I3g0UTchoyi90f5Ki4u6qyKhutgBumXXE8AGlTjuhX2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+SOiXbuzqCV+LrA11+Bf8fffb7I3UDMMa+WEZYHaR5mCy5BAz
	w161OMv57hT+WTnUDdm8wRsLwDmxXmPeenly28JShc8R95DOMPX0
X-Gm-Gg: ASbGncs6NNfplSEjomV7ts5zUVuD6b52dj/FOopuR9UwDKpehS3q3v1QRkPsx9ksiZC
	FoWuMHyfyEFB/tXLeD+wduqN1dwm6frMPobx0JzrSJyQ66/eFER2H6R0+Hjc37o1jQCxONJxwRY
	gc7xEPRl/OivZE3etePhxvLQgx/BcNxoXSBXB/z0adM0HEHxOmTgz4Tk6wLbv2o4dqwbc+2FNPa
	b/H3/H/1XRcblx5sqj+J+QTkBhUm9eQEURKef29PA+8OWsN7+plc+nfd7jR454TlzOXVs/ZzKnD
	NC63jFy+vFrwBHgbic2v1fkJ5zWifw7WX/SgqDMxJgAyHDtjyRY1MKJ4rn32vw==
X-Google-Smtp-Source: AGHT+IEgdbJsUdUkXfbr6q4qVne6bRr3lldL/Obx6pUp8n3vhs/I0cLqzx8xlsCU3QbqJBZBjmEAgw==
X-Received: by 2002:a05:6000:114b:b0:38e:90f3:475a with SMTP id ffacd0b85a97d-38f6f0acfbbmr12135809f8f.51.1740487213450;
        Tue, 25 Feb 2025 04:40:13 -0800 (PST)
Received: from [192.168.0.167] (h-185-57-5-149.na.cust.bahnhof.fi. [185.57.5.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86d1d5sm2184229f8f.39.2025.02.25.04.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 04:40:13 -0800 (PST)
Message-ID: <d477d55d-8e18-4b21-8c83-b4b0b38c1c46@gmail.com>
Date: Tue, 25 Feb 2025 14:40:12 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Exposing linux-arm.git over HTTPS?
To: linux@armlinux.org.uk
Cc: Arisu Tachibana <arisu.tachibana@miraclelinux.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Russel,

I'm working on KernelCI's KCIDB I/O and database schemas, which let us collect
and expose Linux testing result from multiple CI systems (see d.kernelci.org
and kcidb.kernelci.org).

We've been allowing git:// in repository URLs for a while just to accommodate
your repository (git://git.armlinux.org.uk/~rmk/linux-arm.git), but this makes
things somewhat more difficult for us and occasionally permits misalignment in
repo URLs, complicating aggregation.

We haven't really received any results for your repo in at least six months,
so it might be a non-issue. However, would you be open to also exposing your
repository over HTTPS? So we could drop git:// support, simplify things, and
be able to accept data for your repo at the same time, in the future?

Here's a bit more context: https://github.com/kernelci/kcidb/issues/622

Thank you!
Nick
KernelCI TSC chair

P.S. Retrying with a new address, since "webmaster" was invalid
