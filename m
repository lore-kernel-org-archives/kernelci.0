Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8B115380B
	for <kernelci@lists.linux.dev>; Mon,  5 Aug 2024 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722851770; cv=none; b=bZFRGx6VzT1+OgegwSRm2Yn+hz2uZ9QxP+pap1c5b5iO3bTLdwjY1Vy9ikqR9wky3iqinTGsb1Brnp9CARw+P+p4AYlyL+9OuqKeKN/88ItHZFGprm1+8DIuuOQMeuAA1pa28Ce7BwklUWEBzabAEgFL6aKc5KG9bpm/rFfjF9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722851770; c=relaxed/simple;
	bh=hoXemYgzVS3M6cRWeJva+lp0FAFLyeZ+vpb60Sbx8yY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=u3orHUFQowVAxSCy/5HhCrFy65FaZaPJNOcK3MHL3woIo5/FWMmRHb+X18y0WhaSTipuF4dW/g2yZ6gpMztfi2p6CIXjZ4XENKQ+pZasZhxbC6X5+6ntUZDblldYD7Uu1r7T6bsnBL80iULMI8pxQ7mL5uL/B5BmnZsNOFL2o2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHzDCyrI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHzDCyrI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso66030885e9.1
        for <kernelci@lists.linux.dev>; Mon, 05 Aug 2024 02:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722851767; x=1723456567; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKDTKw2STuHqkucAIcoqA5YQOtltnEvDzT+OM/beWJ8=;
        b=iHzDCyrI498R90cj7lV5gxOnab7vdA8OD9mcJxmp/svAVMtFEpUmh3kb0ZibjxP2KV
         0+6UY1EZ3y5nW8WwQupKPRv3Gu9tPEZ7inhFUkENnzqZtaq8xDbQLPiQ+/AXKyJUzcwo
         GYdQnlS1IfVlecZMB3qnwnCqAzyIMZI7q59SVm7TfW0t0weaCQqQXUATLBHJQ1gHspJk
         kx9DwJ1E2+qrySkqeglB6FOlyjS1VOWQzVsVQFCRKYFJQ70xK8+qmYcltZL0fMWr9aTf
         TLFjCVlfF8Vmh9tVmu92G9J5mtQRkjnY7/dcVk5p0SPXGCdm1g9One+6/j01ogvrX+no
         fi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722851767; x=1723456567;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKDTKw2STuHqkucAIcoqA5YQOtltnEvDzT+OM/beWJ8=;
        b=mEJJPSrDrJa5pI4nQJZgm6TSAZJ8izKI0XSzw/dzXebxe+OQICDIthS/Gy0bugjfUN
         IayIO7+jzj8vjKv5MQI8BDpWNfbUlxMDSLoCMNIlNi3jZkfWW745UJmo7/iENQeWrWtl
         KtpQxuErB53LmpuAi6aRjMCAS7BfLbBg8szCyVLO1kJOVDASknNtV/nhDXMVYjuwO8rT
         HNRAKdctAg7+NrHAWSD7cx47TPzh6LAA2xEifHja/vywqivVjr/MIII9av/NPXd8UskD
         D8/p/9KKd0A4u9RajVz1QwLfw30T1uSnulmkfswuevLE59VTWJcDD6AhBDGoZKLsNs+d
         WvaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTBQ/gsO+mdSFhXuk0W/YM6NKRhdlzeJpaYDg6UQ8DGbLXn6/QMr1M5QlYNmxvGtzJaV0vV/X/P9A4HadjOxsly/48NuO1etI=
X-Gm-Message-State: AOJu0YyWa/bujFYRKz8tzCAOzH/IGb5nBm/GFkV4Bb2CIs2FfxWb5VSO
	2QaFBNJKUA2kRiLEQZU8+TIKgOrfV+NlUnTvrNIdMd3Q9m2OWjkCei6HjB21
X-Google-Smtp-Source: AGHT+IFZcU+k3bI2QsS6Binok4GivqoN88ym2PK+9Q+HEGOi7wo1tZeoOC8QSDsA6I1v1+x1g5MQcQ==
X-Received: by 2002:a05:600c:4586:b0:428:1a48:d5cf with SMTP id 5b1f17b1804b1-428e6af83bamr75375415e9.9.1722851766877;
        Mon, 05 Aug 2024 02:56:06 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e9d234sm130933385e9.46.2024.08.05.02.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 02:56:06 -0700 (PDT)
Message-ID: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
Date: Mon, 5 Aug 2024 12:56:04 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: KCIDB: Test schema enhancements
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Mark Brown <broonie@kernel.org>,
 Philip Li <philip.li@intel.com>, Denys Fedoryshchenko
 <denys.f@collabora.com>, Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello everyone (potentially) involved with sending data to KCIDB,

We've been working hard at KernelCI to bring you a bunch of exciting changes,
to be presented at LPC in September, and in our news channels.

Meanwhile I'd like to propose two small, but potentially very useful changes
to the I/O schema for tests:

* Supporting non-binary outputs beyond PASS/FAIL -
  integers/floats/booleans/strings/etc. - useful for performance tests.

* Supporting recording `compatible` values from the top of the device tree
  inside the test environment, for machines which use them - useful for
  correlating test results by hardware.

Here's the corresponding schema PR:

    https://github.com/kernelci/kcidb-io/pull/85

I'll follow up with a separate message for each of the changes, going over the
details and the rationale.

Feel free to reply to this or the other messages and leave comments in the PR!

Nick
