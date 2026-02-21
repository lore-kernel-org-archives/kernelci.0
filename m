Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FF192B90
	for <kernelci@lists.linux.dev>; Sat, 21 Feb 2026 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771632014; cv=none; b=VfMMtSFjpwA+UyYKumkEiKQrJWfz9jEPv3eftziiWOnJ4VqcFUTBsSNGfmgh0EjoPb8KtItMeoCf3176cQSUunqBKM9FnUXjOwcFReUhOkaTSHnWr4x7Hxei+CoDfww/nqckHVoO8LYtDfbVWgIOBOuFrHzMdQfjyrpVs3/TVrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771632014; c=relaxed/simple;
	bh=zsLwOxqdAGe5ofn/YfYOaRApNSz+AhMovakZDYmbZsA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=t4Qrpfaf/BATWM1ZxLYdv2bISBCtHUyisDOIQuNaaH31MJjzjR2jC5uZqShu/aBl9PpnMxsJ5jSoxf9jYXajeH023ydCHlqSQc7IN3MynkrsDa8izZZgmlT3sRuBcBfWNoseRbJ7aX8rVytcvWZmcO6BxdMiyDX1ckQCfTSO2WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=hmAC37yf; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="hmAC37yf"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2baa6ec5638so1228667eec.0
        for <kernelci@lists.linux.dev>; Fri, 20 Feb 2026 16:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771632011; x=1772236811; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+bm7gBqtDjrFB1sztGCvvY2ahfL7BiPFIA8dH5/Hew=;
        b=hmAC37yfpNi70purH3SmLQ8fN59zFjywoW0PNRLAyP/38LoObnb2vz4oZnZSm5iFvw
         W2cMvRAY0WUZfLolmMSRxCy2ttzzebNB00PrgCroTw09WWFJcn6vhnvUdRfDLLVDSM8b
         1cy/kKgj1QRxUrZ6+MCKsPVRL/VCOBuPPyjApDlqhXgS23cf0bN8mkQtJf+M/yj3xeB/
         fY4r4mjCFxSDzQe5KQ0KXGnEQCeRnWCXPnyWRDpFXfu1+e7e3wGYOj7AeLJPJWM41ed+
         r7Q5Lm5BOEDe8dPvVM++J7gSg8UJbYZtNt+s9NBEi784y2KIaJnFvYSKSPNItSAqQh6g
         /j8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771632011; x=1772236811;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+bm7gBqtDjrFB1sztGCvvY2ahfL7BiPFIA8dH5/Hew=;
        b=rK8EkaPTsG/KHX+JYgIYNQbg8t/3Ggk/6x7TZDOwus7MT+hgx/9mscMeeY3FCWmF5n
         eL4gH8XpHSGctX3OsET0F1Fp04Nqri8zY2u1mw7bwlBPoGBd3qFGNW+EkQ0qvdpPrb+7
         AHoT3aA972V9XcP3Kqus903qLKb/kbwNu0dAzafXeSY7T62YHDY10Q2OIBuq6rQO20MS
         dQ+vtif8SXA7ncI8GZj1LMPOI4QqUrtJhepa5DxzfRJ8au8EXTcL5RIZ/8JNXXO58saT
         YlTT6MEx14hcUNOe7k2w8Um6JaGdLGv8/6w4sV7fU9IRXyQMsNX6gqseyXShs9xbfC3a
         k/2g==
X-Gm-Message-State: AOJu0Yw7mCJTps+qJweT7H+vxDJJWJEFFyx3l0EeJuz8tS1h5oKIL3j/
	LKqic4s4vnLs+W6pWIp0gr/0oOoT7aQRHlNQUdwkck1WtSrHs25dYwYJAhS20+Ha4U+MP+5Ub8B
	NCYJP
X-Gm-Gg: AZuq6aKVQOW91w3JuUGERovtdbBkq6fWQmBVqN91W45bfX9dN7xmHx7znzvSzoomO4W
	z+uzZ+eMEfgGPqKYBMH8Fim6E9oR840ZGD+9Buucn77gL/B5JgyNGxlJxcERYJzSu3xYlg45ySs
	K3iw9vIOtawwhZkk527021PfZomE5efkzA0Dciy8m8opoeUC1WPFpxVst/i6ZGnqkTonQX3WGtX
	r9H12ao3s4Ncd9QG91dhMst7zT5/lwlkM38Zx02P8JZwZ7eATO9+wZKf80FzeqSklCb03c5+4NA
	2+5gem10xUiEHCssQHEdB7S6UATfWPoGmSHs0utrpVgvJv3sbokqXHMGWW1VYoksDs+3CGfr3af
	6UkdIbZVma1txu2dgDMEJ8+5BOtmqoCac5u6GY6nWPtMvp+qR4jmsOF3YzwL4px+yDxu5X1bB7E
	/rDtn8uSc/oRVWolS2
X-Received: by 2002:a05:7301:6794:b0:2ba:9e39:23ad with SMTP id 5a478bee46e88-2bd7b893b81mr705823eec.13.1771632010788;
        Fri, 20 Feb 2026 16:00:10 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da45537sm443633eec.7.2026.02.20.16.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 16:00:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-02-21 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 21 Feb 2026 00:00:10 -0000
Message-ID: <177163200960.717.16941897657809166050@d14e337afe00>



KernelCI Metrics Summary
========================
Period: 2026-02-14 00:00 UTC to 2026-02-21 00:00 UTC


ACTIVITY
--------
   250 issues
  2585 incidents
  1964 checkouts
  7156 builds
834382 tests


BUILD REGRESSIONS
-----------------
Incidents are any occurrences of an issue.
New regressions are the first incident of an issue.

Origin      Total Incidents    New Regressions
──────────────────────────────────────────────
maestro     66                 3
microsoft   0                  0
redhat      9                  0


LAB ACTIVITY
------------
There were 8 labs registered. Incidents reported per lab:

Origin      Lab                    Builds    Boots     Tests
────────────────────────────────────────────────────────────
maestro     lava-broonie           0         913       342553
maestro     lava-cip               0         654       79
maestro     lava-collabora         0         5998      403889
maestro     lava-foundriesio       0         64        0
maestro     lava-kci-qualcomm      0         15        12628
maestro     lava-kontron           0         60        0
maestro     lava-pengutronix       0         246       0
ti          opentest-ti            0         1323      0
────────────────────────────────────────────────────────────
Total                              0         9273      759149



--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
