Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0255A286425
	for <kernelci@lists.linux.dev>; Sat, 14 Feb 2026 00:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771027217; cv=none; b=E5ecZybHlWuv2xaiW6gIxoQNJ+2OG2LSl2X+xSgaS+3f0wMiDceJYbwcRlPqJ3LX06Sf3oVepl588pmlngtuXKOM6sgo6/Qxc5d7bS0zZ6o8Xnw2VjlT+Q7xuaUJvitzvNVqDLkJ2Bk24f6v7j0ZnKhroNsDCu23r/+FrPzcE5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771027217; c=relaxed/simple;
	bh=V7i5GRUrt5onmZoMVIm3yKr/29Ss1ZrPQ4xTjEPTvYw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=La1x9+U0R6V8wAc2cUOvAvy2JjNAPEN8HZsRmF6kw75KhNcZ9hshq+pS2cO0/47UpbXItmqehbEA5V2xXjhJ8unVbGvszkbUhZKBJEoQRfb2hOvfiMFENXEgDgVtgfciupygjNOH3Gu89MrhuEpv+p3A5sB/3ca5o7vmETuwAiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YgJmN1Yj; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YgJmN1Yj"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124a635476fso1871099c88.0
        for <kernelci@lists.linux.dev>; Fri, 13 Feb 2026 16:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1771027215; x=1771632015; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nsFokxbtmWjRbKlDkjul6RNVWP9wN0KBm3UkCdus3o0=;
        b=YgJmN1YjWjtaW3FKaAL1Wso1bmfpnDEgUgbHBimbO7KG4BfuhwNtCf5UMAuI0ujQrg
         vIx5G03a3oArE4TKNF/NdEtE3nQQ9JaLS4pQtZPo5/oSOcBZBlIGkMyn+XvVfjL4OMed
         nbzhW2CZfGuLw4UCK+cNaERCyFxXAjLTLjfUJFQy7G7claOr3LUq3hxSQBnvO8VBzZbQ
         2Sal+q8a7EDXuEnZFmWaCEG/m0SSg0EJ4HaLAkuXuVAc/lXflHtTSfd3KWP6mdbJjag3
         fmkx29gmro6QggDfNvRwn3KJJc/a0SkSIRT+eXDZ3y+rExIN1f4H40qHWhoTIIJD85CY
         zJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771027215; x=1771632015;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsFokxbtmWjRbKlDkjul6RNVWP9wN0KBm3UkCdus3o0=;
        b=JJVf9SkdQQa2XNYnz8FoQ/ZwF87W446yJIRjtOLwsCZgBQ3oLFAXiKCI6HFSu8zIF9
         H7WskHFZGRtgijqWGJHLD/y1NB92ohv6pbB47mIKaFMKQVD8co8ClzbfP1HFSw+KsCAP
         MDQZEMqVSWUZr9lOVPry7O882C1ZBYY0mQCHUJ/9VAoxOEmNXKdCiF5jFJixuduukwjH
         YRUaMgVLJ87Iq9l72Fqe2S1sTbN3uetuwaAvibTfE7xWZXwSuBnBi9LszFEWyYPc0368
         l0SJAgXrs+gt5NXCwQGjO9IP8yd5HGZnDQqXiTAjp3tut3yRGxlsJmz3rVFelAEf/c9n
         XGzg==
X-Gm-Message-State: AOJu0Yyu7uOn3m/bMS66HjIA1vWipKs6uPSi3kb7LvMP3cNtIoeH/Bs9
	L+lWX+ZCEXWCq7RDxlG3SqixAuwY9LBzcA72BhOZ6SmVkrHY6ljXHiOQxogn9iHUOVvT2R4gRo9
	5cs1F
X-Gm-Gg: AZuq6aJGIcT2dlC1Uw2u9rjW8V/AigxiJyEDRLW/EzSVuaZ9ot8YAvil0jcaf4wxbr2
	LcN5ele9+lci5RkyUDk5YokXXAA0r3UiV4DJ+fvCjhExfhdgwWx7VbdvD+AyR7RSio2CTcbWDFW
	K1h7eR0ubducmTlAiAIEJdHksLRny4AFFdSbg6PuR+o1G7xHgCeAL7UqcaD8c20c/J3RK6IFo+2
	NuJeRP1mRU6V5mST14MLuB2Kk5jBTjB25nkcRpMZqSFXOUbBFtcXfN1Ns+Wp3BIeNYWncicVaYT
	KJFmUEVZuR4EOe1+RFRJRIJSqcsmg2DMqmRXxBCoUFRLrr9E7Xv2STDWGduangKi2XQg+FbW15m
	lMTneMXwoqygFYwO3xFVqW68yDIFSlTc85m0K5XRqMAm7tDqEHXZRb/HfoTtJTujEs8uP5ZMdLi
	6m2crl11e25tKSTLee
X-Received: by 2002:a05:7022:618e:b0:127:1b8f:aa02 with SMTP id a92af1059eb24-1273ae2f163mr1413151c88.28.1771027214142;
        Fri, 13 Feb 2026 16:00:14 -0800 (PST)
Received: from f55b40a4666e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm456879c88.5.2026.02.13.16.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 16:00:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-02-14 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 14 Feb 2026 00:00:13 -0000
Message-ID: <177102721280.1502.13461067648001480170@f55b40a4666e>



KernelCI Metrics Summary
========================
Period: 2026-02-07 00:00 UTC to 2026-02-14 00:00 UTC


ACTIVITY
--------
   289 issues
  3117 incidents
  1192 checkouts
 11537 builds
1040069 tests


BUILD REGRESSIONS
-----------------
Incidents are any occurrences of an issue.
New regressions are the first incident of an issue.

Origin      Total Incidents    New Regressions
──────────────────────────────────────────────
maestro     155                1
microsoft   0                  0
redhat      5                  0


LAB ACTIVITY
------------
There were 10 labs registered. Incidents reported per lab:

Origin      Lab                    Builds    Boots     Tests
────────────────────────────────────────────────────────────
maestro     k8s-all                64        0         151
maestro     k8s-gke-eu-west4       0         0         743
maestro     lava-broonie           0         721       264312
maestro     lava-cip               0         727       85
maestro     lava-collabora         0         6141      572028
maestro     lava-foundriesio       0         60        0
maestro     lava-kci-qualcomm      0         162       83383
maestro     lava-kontron           0         111       0
maestro     lava-pengutronix       0         215       0
ti          opentest-ti            0         2039      0
────────────────────────────────────────────────────────────
Total                              64        10176     920702



--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
