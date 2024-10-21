Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6EA1F6694
	for <kernelci@lists.linux.dev>; Mon, 21 Oct 2024 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729507705; cv=none; b=ijHLVZILrrNGdnOGZHqlYtVsb2tNiJUQdlRwOTm0/FYBJ1Gi/4GbmlnX0yveI8w1I2chih50FLp0u18OjiDCmFwBDwbsJtT0JuQyHm00jWNuqAxv3WnaviQb+a8n+FRVmfyE9F9I/wO1MOCiwV7EtHuzaaHIm+obAsU/3V+RGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729507705; c=relaxed/simple;
	bh=DpWuvMQVVM1ftFeKiK/U/EyUqDrGlP1j6YHxqx+rESM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=E/XwXFtftTbvf04igP1NqIJAMgpG4QLHnTrCIP3cqvWbUMa+i84H0TbMxbc1G4SJK5kMjjAS5klACZ6L/Y2i2EPQqkzCyZTo7JqhiXBGj+eo8AeMGxhfVi4rylmHVgq8r2aJQ5KWQZTn+sQXEyTNph4KHsh2VtuzgM6xdaq5FlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxjDTRrH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxjDTRrH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so22755985e9.1
        for <kernelci@lists.linux.dev>; Mon, 21 Oct 2024 03:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729507701; x=1730112501; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpWuvMQVVM1ftFeKiK/U/EyUqDrGlP1j6YHxqx+rESM=;
        b=LxjDTRrHu0MjOVpU2eskgWpYL3DWdzwNdupdiKE048o2w2xFMhur0MyDtkoTWPsShD
         ZpxffQ57PvzczGLOHcKGfq9Dc4xkJ1vBWeu+zc0EokWteg1bS8JYt4kaLl0RuPTSfM+S
         D0VW9EJZhGItOGEai262I8jI+IyKSqTydcEcYneeI3JGuxj8hjq5fMkaW0mn227bFgud
         xDir5uEJFbz4P2jEWcFP75BHYy8u8RCzfQXV/vkzpmiXajvfVj8uHFhLqs8UN2rjLX7s
         KrvcKVaXEVNWt0cRpMnXQmCKiAAwBVRcaHtodvlUAGBRmBXyr0fuNWwGKkjSBHK/4Piu
         3ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507701; x=1730112501;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DpWuvMQVVM1ftFeKiK/U/EyUqDrGlP1j6YHxqx+rESM=;
        b=q+s7yQ6xf92m7MZzluqT++JBa2PVagwwFe85yKQeW2DcxI+xOPeURx/mVwv7VXe+hJ
         3MAyDLQycul4Xa4CSwkALYgZZJJC0sUuVTjT4LCgTjqK//c2H2Gok57o+n26Hq61YnJQ
         mT8z0C6biqTRjeJqA8Wl8rDszXlC04wL6xJooC/4oZNvATZT+24MLdqoU4fBpJMg3tM5
         wc/IyEUQQPie+TF1lI+GjckhZTthtTo2ZwcilBY9qk9h9KlHb82IR0HbdKtzZRsCt8cA
         Vl/vlX+HioKEy3clNfCfKrtarxtipAqLxGkKfEFTMPqanLGGtoXLq2D1msWQQoX71Z2G
         J7OA==
X-Gm-Message-State: AOJu0YyiLLh0qyCO3e94zt3UQl3JE5xZRYlwQVO+LqezxXWTi73imZ0u
	IcwYXZZF6EVvkEsRVCSvZKJ31UasmlaorsF/BBDY14AGQ8AkNUNEm26kr+J7
X-Google-Smtp-Source: AGHT+IGfQ52m0Wu7cVB073KvN6cX75HmK3l/OD7dLuSHip7dKipzlY9bzEpIfwkttpT5pWqbyu5VIw==
X-Received: by 2002:a05:600c:1d01:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-4316168ff01mr89164025e9.32.1729507701376;
        Mon, 21 Oct 2024 03:48:21 -0700 (PDT)
Received: from [192.168.0.166] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5709efsm54125375e9.10.2024.10.21.03.48.20
        for <kernelci@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 03:48:20 -0700 (PDT)
Message-ID: <e84eac0b-f5de-47e1-9a1e-cb4ae1947b0d@gmail.com>
Date: Mon, 21 Oct 2024 13:48:20 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: TSC Votes on Chat Choice
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi everyone,

We've had a back-and-forth over the choice of a chat system for KernelCI for a
while now, and it's time to move on.

Right now we use free-tier Slack for most internal communication, and IRC for
engaging with the kernel development community. We don't have a bridge between
them.

It seems that the majority would prefer moving to Discord, and have a bridge
with IRC. Although there are "Matrix and IRC bridge" advocates too.

I'll start the vote on the technical steering committee shortly, but I wanted
to give a shout to the general community for the last chance to sway our choice.

Please respond if you have a particular preference and practical reasons
behind it.

Thank you!
Nick
