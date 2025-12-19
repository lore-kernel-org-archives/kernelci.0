Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678DB1E520C
	for <kernelci@lists.linux.dev>; Fri, 19 Dec 2025 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766178485; cv=none; b=pvBEh74iKbQQzUZd7RERdOGYAF5kyGwG8MV9X8ncVjhR90VSSf732NOzK0mbX5G8069NsU3Iq/44b1alNPe0dQhZTTJkGyb6PASChD1/rjcjS7KBiHenB1VYbFVq1lqvZuyipFsWg+dYNSbPV7tJ9XoKRsnlrFtJ1E74Tc+h9MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766178485; c=relaxed/simple;
	bh=49a+TZsqszrvkWiDpeFHPwyY6eLsyfZBt3Si50x83Mo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i423EXBrhEYXKj7RR8ogDyeB/eY7hep4l4rKCCNVKUpHLH4j2CPzraG5sf4faXP6trc14Ky35hUMe735lGBrwLJ83111fiya5LNon+1PB74pVmgnQkvf1NA/HhyjnTCX4uH9TzieEHAlUelRCojl88JN5JCAL7ou3bq72LF4zrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=FEqRKNLA; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="FEqRKNLA"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c902f6845so2864150a91.2
        for <kernelci@lists.linux.dev>; Fri, 19 Dec 2025 13:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1766178482; x=1766783282; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49a+TZsqszrvkWiDpeFHPwyY6eLsyfZBt3Si50x83Mo=;
        b=FEqRKNLAu2/QwQESmgGgwx3DUVuWbmerQYAbuZhEkdQ5aI13KdJ1PsMaOiKFRJhiJz
         sgC1npyyUeAStgvpTkeyyylNtxPfvme+EIVBM55/dM1R+mZDoma2PKFubhyL7qkJGTis
         Q6amvXgWKBEvjlFd89Sv8Zn5F1l804BziPtyeanOFGXBo6MCEOXCQZ97RrCZlXy3+FSM
         NMxchAUPdciunsU5wAq5yhyArxXC31BzKo6z50DLxVycZnBM2tjZJl9S/27RhyM1XSTq
         4HbNYqd4mNepBECWwq2uQgzXBtxd0QuvnFDu2rnmziSg4OIRi3abZyYgO0STVaEObuud
         gzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766178482; x=1766783282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49a+TZsqszrvkWiDpeFHPwyY6eLsyfZBt3Si50x83Mo=;
        b=AFP14GWm1SSwc0PrKghxJQlv+3PLRXs/OVwRtmWCCZg1HgsTvs4iWLVFUy83rrBph4
         ZeMxvJ8vSiuZD0eRcBpUMiWWRI+6o8mn/EERRUrl/G3MyK04Ph6kqWlYiHDViBXtqpTL
         NYhnzTzO016SNzxD66fPe1UmqonCOzypI/CrwDAZ0w6ZQKjqEUI0e30mtP/A6/xT1ELR
         hFNh16DY7MQRaQNhZK/6JgnlA6GKroO+Vgkwj2LgExJKaIlQI/u5beJ0b9tjF9I/eQSs
         pUU9l3bs55rPvR2oMcfdxN2GyfU+XLuQ0FQCLGSs4KmhEuSOxq6bY92yjgAQuSotXaLg
         qTfQ==
X-Gm-Message-State: AOJu0YypxDaf5648bt4xDzFd8SrFTC2ZP1/4MeCCZWmSq9hvrCz/VJxA
	QpabhTqJB07fPTTyJuzt4YwRDaJ4lfAZZqfU233BYxe1/okuN8RvN7Jmg/JfaephJ1q/xySXHge
	zHy6AXs2xCYAoLzmdtVvRqTlcJWNevhDGeEIz6TdCIpu24Esrlzs4uW8=
X-Gm-Gg: AY/fxX7l5gET/J7w6cN9WpEz895PtsbYg4+oGg3G6L7wZju+ameRU4YdzvOVr/Otvnr
	Mdv/+o8hOSuPbXHIfUtkdhQvnGnIcvnjyeqwV0pA6Mg14Fs2tPCzD8r0O2mFwEwGAH5Q0tXizkn
	oIFABtWxI83r3xRCd5Yj8yaR2nX1PS8iOveZhlD77ewt8x5MwTFKNFJs/o+KPMv9TrQ0vUik6OT
	4GzTBrKaE3UMw7D4pAJn7R8tlM3W0Rogvzyy/R/ipU4BVhxIsHHTNgDJCqn6W/f3a2ye9ZO
X-Google-Smtp-Source: AGHT+IFaYmw3UUZfCPUjaIhtVD/TMPsqMPMcrz8v6MA0TsmC9jCaOlAn/e/G+jI9GOdKEW/WPqWNyQVqVm57f2qkhiM=
X-Received: by 2002:a17:90b:3015:b0:34a:b4a2:f0c8 with SMTP id
 98e67ed59e1d1-34e921ccb4cmr2589630a91.30.1766178482192; Fri, 19 Dec 2025
 13:08:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gustavo Flores <gustavo.flores@profusion.mobi>
Date: Fri, 19 Dec 2025 18:07:51 -0300
X-Gm-Features: AQt7F2qv5V7B08Gk6RiCdQsysPyv9h0MjfyCgGP-kOzIDNrcNYGYEBVsSeEfGns
Message-ID: <CAB31pVmWr-=4-fQa4ivp03e8=y=cVAt-aq6K=BEVd_vVEt0BKw@mail.gmail.com>
Subject: KernelCI Dashboard Report - December 08 - December 19, 2025
To: kernelci@lists.linux.dev
Cc: kernelci-webdashboard@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Over the last two weeks we focused on improving ingester observability
and reliability, extending metrics, and advancing the hardware view
improvements, including starting the rollout of a significantly faster
/hardware view (currently staging-only at
https://staging.dashboard.kernelci.org:9000/hardware-new), no existing
endpoints/routes changed, we only added a new backend endpoint and a
new frontend route, feel free to test it out!

This will be the last report of the year, as we=E2=80=99ll be taking a brea=
k
for Christmas and New Year=E2=80=99s Eve. We=E2=80=99ll resume reports in t=
he new
year.

## Ingester

- Added submissions and items-created Prometheus metrics. [1]
- Switched the ingester execution model from threads to processes. [2]
- Reported ingester queue size via OpenMetrics. [3]
- Added a `pending_retry` folder to improve handling of retryable
ingestion failures. [4]
- Fixed log excerpt handling by ensuring `log_excerpt` is set to an
empty string after conversion. [5]

## UI

- Added a lab filter to the hardware details view. [6]
- Added a new hardware listing view backed by the hardware-v2 endpoint. [7]

## Notifications

- Added a metrics summary notification and template. [8]
- Fixed the metrics notification recipient configuration. [9]

## Database

- Updated the latest_checkout table primary key via migration. [10]

## References

[1] - https://github.com/kernelci/dashboard/pull/1660
[2] - https://github.com/kernelci/dashboard/pull/1670
[3] - https://github.com/kernelci/dashboard/pull/1677
[4] - https://github.com/kernelci/dashboard/pull/1678
[5] - https://github.com/kernelci/dashboard/pull/1682
[6] - https://github.com/kernelci/dashboard/pull/1671
[7] - https://github.com/kernelci/dashboard/pull/1685
[8] - https://github.com/kernelci/dashboard/pull/1646
[9] - https://github.com/kernelci/dashboard/pull/1683
[10] - https://github.com/kernelci/dashboard/pull/1681

Merry christmas and happy new year!
