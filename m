Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918C34FF40
	for <kernelci@lists.linux.dev>; Fri, 17 Jul 2026 03:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784257479; cv=pass; b=h8bXWrGHZMevNnY+JhobnxrSPxMZYLPZrQloc67m5Rwitkh+GVN3ROUc800YbjiWao7NxehTgLTgg4MTUV+Hrz3aqy6NkPbJ59ZXBggcrHPQd5WgGnjD5/goMEF2MYSumO2vpM2cvCqC/CV67e2kv1O4QzXLF3nlrYOZW39yKMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784257479; c=relaxed/simple;
	bh=mqr1eGjgaNl5lAckcXfTGIgqynq/owkMRJ4M/3PH4Vs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Jt3VC09kpA2VzQRfNrxEvZ6VnCNla8/sN+bey+SRkBqjScM9tVvuJdR1r8yB8sBNC32aVm+avCHphmZl/xJOiAVc5iL66F9g4qpudX9MbIdB5SLXoI5NrZaHtwkZHSYnxUKTr6FKdAzNbhpvCqQeMmKGHAUkcMqfje87lkp8Eoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20251104.gappssmtp.com header.i=@miraclelinux-com.20251104.gappssmtp.com header.b=RRQxg7By; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20251104.gappssmtp.com header.i=@miraclelinux-com.20251104.gappssmtp.com header.b="RRQxg7By"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so7168432b3a.3
        for <kernelci@lists.linux.dev>; Thu, 16 Jul 2026 20:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784257477; cv=none;
        d=google.com; s=arc-20260327;
        b=syg7iStmfIRpdxjnsGTMe6dVzaQRSkKWkz0BTB9dv3OHCFD+z/sunl/zjqD0VzeQwC
         7VNCF0IqDpRMB2J0ut4Xpc8vdHMQhyAcw5oHrLQLGjdUiyYXJ7VdZ5mT+m5wkmJCO8ck
         bt4eAHe7OioqGpYS88vt+EWsiqkOX0RBXOLhENOFEq+w0LyerBAkRB2X2kAGtZwt8N9x
         qvAejShxLCWzdxu1ZeXwyoOpJ3YrjuqaQsoYIDCiBsdReqw/sVetcNbvwJn3Y4Z3vQ8I
         ps68mldjawfWGCmkYSR7/IoR5PvkHamJblbnxBoHkhbZCNhLhfJ7372SHOgNMoDK+Yap
         i7XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mqr1eGjgaNl5lAckcXfTGIgqynq/owkMRJ4M/3PH4Vs=;
        fh=Ho/vXI+CC24QvI9R4sgrL8kGj9PDcdBhIVRCe2nL05A=;
        b=kWldmVipBIWl2GT7+NQ4Ys/HdyNl3nL8FL161CSTPdsF19x76sRphLxl1m/b1VqtQv
         06Eze08up8Sp/tqe1syPMM0GNcPeAZvBd2AR0l0jzEi2byPYVb1Ttj5idQVSSJ2527++
         0Y91OPkEqCQovBagTEyGjsEHEKGFdoBMSlBzT3bbMdvLnxKrr20m/LhqaWH3aZKDtmAc
         4HS1OMXmZhOkfAfFBdIEI+w2PZaPLzEwXuqRsNtHr3e05o4oIgdHgmFl2pMiXJoKu+n8
         KZMv/B1FtyEcGcRoxXT/3NF0lOqGS5yquJoHyN1g4PLj1lKK7rd2wkA+nxEfMQy6zkpt
         0LUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20251104.gappssmtp.com; s=20251104; t=1784257477; x=1784862277; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mqr1eGjgaNl5lAckcXfTGIgqynq/owkMRJ4M/3PH4Vs=;
        b=RRQxg7ByvNI/NWKq45RXrKaIx5u+opPsJER+4oXptRsokc/uEP6h8YarrClhDIemkn
         tU1rDfiVH0etDQc1xVXyxzdVq2778HVl/iLsJaRESN3NSA4oBkOi8/B7ydxS0oYzOzUV
         Fb09RQIaEGl37vovtJuLgXVSVoaJUXdyvPWi2VoXmfkYzIdY4oriS1cJ7WEVoIBxREYv
         pZMkhO8leZ5TFAi4XaZoWwPrAtOAEOkQO3kwq77zGsh8IP6OoyVH2rpxyxRGpjxSpYsV
         3hPGx7XM6DSjlOKUcIfkKOBYrvQt3tlbghkrB4eWFAJposwvWQqz4oxY2LsM6W03CpK7
         fCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784257477; x=1784862277;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqr1eGjgaNl5lAckcXfTGIgqynq/owkMRJ4M/3PH4Vs=;
        b=CkiQAyXN9Q0GBPv5e4eB/5/CBDI/AVkeTz21HKmKDA2BBVT4Cg2Ip36k0VmTQVDfSt
         1pQbg6ffnBit1iowKlbJq5dEATMV22ea56T+jWh/vzAEIoBDkWJFwzCG+joG72RoGkaw
         VDduIx/jNDA4qLPULHykVtZKHTKgERHG4xWYezZIkLxf9quKiFTfKHVnIHssc/92z+ob
         XSsDOEa5i8yJKgonky1fQQ2pRZnk+UAomWzkjwKzDAy+1pqjPnBYJbjqjt5Gc8vMYysn
         +1RFwneqSoiX1Sl+UTAEVy2eXt/U/B8oUCUtBSNN5jrSH627U04xPOi56YGmtyk5kijb
         FY6Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro8oJSHRxRtw0LRoIFA76rY7nsj7D8m49CfkkUWXSA2GR1do4T8q1YjN5rgLNREXC3jgkuH6uEoRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxPZVE3wWJgQrBHcmszmlf07A4/uCCPRbV1cVRJ2Llpl35AAd6
	EonUTqfGO9++qDVtGpA5hSWSyy5OXznc6nIT8myVXmvRLYCVPG4xY7+itj99E2a/QpW8ccmq8Tq
	ccxvZOjg2J6O14wx0aL3CF9rQ9t2ZI8srQrgiERy26TrQSxlHoqOsRj1M
X-Gm-Gg: AfdE7cn9wP13we/384NxJ+dtkG6Eh7wlcOK8muIdQ91J6d7KD1b5K01tb7/q3jT2CCF
	EaYKruV7Lb4jrZwrqHzDduAj2+hR+RMr3LwLS/O3WQnAZOr+ozoRlPa8v0RJEPftmkv7GOZhQVE
	/inXDH0JIF4goHdKBf/Kr0NsZn7gHIJLZGAFPID13jPZKphTq4OJVERnGn01fHfpKjf+lz+EMPU
	1ZdRqmcDiCFCd4MiRNXkN2aSnkX4AzHOCrA5yIbNw4WTvrs4eq3La0eek/mhQ==
X-Received: by 2002:a05:6a00:2302:b0:848:89ee:9de6 with SMTP id
 d2e1a72fcca58-84c29501a3amr638961b3a.58.1784257477201; Thu, 16 Jul 2026
 20:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Fri, 17 Jul 2026 12:04:00 +0900
X-Gm-Features: AUfX_mwxk1uxGEfezceKWzAJsj6gE6-YUKbhLsKern7QuPulS8RkTY_CSUcc-cY
Message-ID: <CANgtXuMMvU7TQq8hv-T5NQbA6yfzcAMsFq5sdxXq-VzF+oHYxA@mail.gmail.com>
Subject: [ANNOUNCE/CFP] Kernel Testing & Dependability Micro-conference at LPC
 2026 CFP
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, gtucker@gtucker.io, sashal@kernel.org, 
	kernelci@lists.linux.dev, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

We are pleased to announce that the Kernel Testing & Dependability
Micro-Conference has been accepted for Linux Plumbers 2026!
You can read more about our track here:
https://lpc.events/event/20/contributions/2328/

Our Call for Proposals (CFP) is currently open.
This is a quick reminder to please get your submissions in by 11:59 PM
UTC on Saturday, August 7, 2026.

We highly encourage you to send your submissions as soon as possible
to ensure you have a chance to get into preregistration!

You can submit your proposals here: https://lpc.events/event/20/abstracts/

Thanks,
Arisu, Guillaume, Shuah, and Sasha
