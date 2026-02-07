Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FF03126AF
	for <kernelci@lists.linux.dev>; Sat,  7 Feb 2026 00:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770422408; cv=none; b=OB6kkRP+n6y2mRLftGcTdwqGG73YYvtEQLNSoUHuGFgt1jFuZLUKIkO3u/4ICTpfSc6/FX76WhpBh3F+ptHybqpeBpVIHSLyFLfrMD6AaV52GhUZKsJ5Jop+fbkqeYuqOxbNg/C0pnBDRoLwImHmB6lOTGML89Tz3de6waCCUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770422408; c=relaxed/simple;
	bh=E5wJZOHWYlukdhQiarS0LlPEgCEmB2stqJEaTvwpDEQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Yz2m2kEanODQureAgbwhClGPIZCPSfEXnQ+ZlgFyrhfS/g+y5kfl7uLvkv71E8DKAA2fedXNcdk3e1uZw6utrH3ew2810EJ8e3TD0TMrGkNPbBcNnGCjeXHWwi/k4pQ5vCxDaJO0AsO3t/cI9fplaPOjlTxFzXRjxMyDbNAh57w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0skbCxx/; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0skbCxx/"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b785801c93so3093381eec.0
        for <kernelci@lists.linux.dev>; Fri, 06 Feb 2026 16:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1770422407; x=1771027207; darn=lists.linux.dev;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hynv5aLGXfueGK9Q5AU0HfS1QbXPi+j/xS2Cfe6309I=;
        b=0skbCxx/NdHVtE3VlLJ2+15xQ1oyXZ/Cz6PU5UxbmMKS+u+67ac7ggWQfy77wGRr2/
         GJvyW+e2QFO+IYc+h8VVheoE0/xrn4Crw64gNwgXe0M+yWo+cZkq2spMKk25NWLq6ExW
         huL64SaG6TIwy8J0Mx+MYKb2AhsQij1UylJOhwbToNBdpuQ2qPY5fmmPWmmw3WEY5VMo
         oyB+WMUn8ufuf0vCS7RKJi1MMr1BRKaw8yZCtwX9xWeGEuy6JGxkLc0hv+pVnEYk91Io
         liO39yxo7HeUIVZOAIsXyMmpaCvHMXb7ds2B47gRkl3eJsJmq53LruA/xlf3maUjYiIE
         ptqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770422407; x=1771027207;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hynv5aLGXfueGK9Q5AU0HfS1QbXPi+j/xS2Cfe6309I=;
        b=LieyVnUC35DxoOHBc/ODPu6GQ0wfBneOSKErUNL3Pc+krp0KhUtt6QAEI/gljPejSL
         HA+wFnk27dMCkDXa0F5KeZLUnU9m72tqiG/0RcsXk5pbIp4BXIyjCeV0Jp5upfns3GY6
         yHpbeI0H04zjCGWsYKX8FdE4dHpwbitWY4C5iXTxWhRf4HAfpA16G0lorlzo8aEKmkZB
         R2yTmiUegiIuKPwlCZ6P+kO6c18BFGaIKKR6NaqbaY784XFKg1YJbSnU9YqJyYcC14Rz
         O8KLnkYqnnJU9M56g6lfnRg11DFqe+JIgGAgIy7nuZeFEqXNnPgNhnDL7ZHd/jxwEHKR
         KHeQ==
X-Gm-Message-State: AOJu0Yw0qOQAQOVPsNiX96R2DxyA6TDPw74qrE0WxBbOpMzxcOtIJMyh
	K+0nAdnIIckaUaSUfpkdgcayafJH90G0x1okrj5pqKd28mDi5uzgjs0gg46FJVMJkavWE1tCr15
	7paGr70k=
X-Gm-Gg: AZuq6aK5PTGPv+tuYrSFR/odVCrE/PU08GUkGYjiDXvjA79KHGFI+owvUWAw9g+38ql
	yCpdj9G/oWkwuDZch5VGgaRXGPknWPQtFLZInEDZmmku+PmOyCrrDSQzgH3QjJ74hppp6rm6+vB
	w1VQ1QMByVJk6SDmkNC4cvZqSD5XR7jqnRdQhp9/KFSpMz56bFlFw8aqGjgFIZiX0Lw1VoFdb6T
	GJGHUz124Hao8Bk6kUX8FyzYKWV1iymve+xh4ByaFoZkfbWMcFbXZmFRW7wLbtcIB1Td8OY3u+2
	fg7WFGwbm4y84T524/ijna4+8Z1xbDLb3kYEvpma0NsQh5P7NVcMYeWmzjVaTxqGav+CMSw/dux
	OMqQEiD8CtwGcg7Ry8BaHWEjFMiJC8Lb+yZQkmEs555HwsNgvJkt+eZiLHD68pO+lQUyEeNjxXe
	g22WWr1XzLCWGjuHI=
X-Received: by 2002:a05:7300:cc12:b0:2ae:56dc:eb18 with SMTP id 5a478bee46e88-2b856834497mr2108103eec.21.1770422406708;
        Fri, 06 Feb 2026 16:00:06 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855b0f624sm3530872eec.14.2026.02.06.16.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 16:00:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: KernelCI Metrics Report - 2026-02-07 00:00 UTC
From: KernelCI bot <bot@kernelci.org>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Date: Sat, 07 Feb 2026 00:00:05 -0000
Message-ID: <177042240541.8044.18439998138510437430@22d5995788c3>



KernelCI Metrics Summary
========================
Period: 2026-01-31 00:00 UTC to 2026-02-07 00:00 UTC


ACTIVITY
--------
   329 issues
  1796 incidents
  3744 checkouts
  8726 builds
599282 tests


BUILD REGRESSIONS
-----------------
Incidents are any occurrences of an issue.
New regressions are the first incident of an issue.

Origin      Total Incidents    New Regressions
──────────────────────────────────────────────
maestro     237                9
microsoft   2                  0
redhat      5                  1


LAB ACTIVITY
------------
There were 10 labs registered. Incidents reported per lab:

Origin      Lab                    Builds    Boots     Tests
────────────────────────────────────────────────────────────
maestro     k8s-all                4908      0         1401
maestro     k8s-gke-eu-west4       0         0         53239
maestro     lava-broonie           0         398       205555
maestro     lava-cip               0         467       233
maestro     lava-collabora         0         3590      268510
maestro     lava-foundriesio       0         44        0
maestro     lava-kci-qualcomm      0         93        44172
maestro     lava-kontron           0         46        0
maestro     lava-pengutronix       0         108       0
ti          opentest-ti            0         1161      0
────────────────────────────────────────────────────────────
Total                              4908      5907      573110



--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
