Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776977;
	b=P7R6DCbNSpcZ0gEHVxrTYemQQuIacg2a6qMgdT0QZ0TcdJg4PljLTeNnIFixqSm+SOV7
	 tNbRxPoYZgzmAiy7apLNLA3hNBLQT7qItsFBRf06p9woMPD80oCbBHdBtsneSONpqZjR9
	 zjijd0LejZRiAV4daoZ33fL8RcjKATabWgOHZA5shtnYc8DzCXcp8P07lyCZTsSDPZsTi
	 FriE6+FQx6xva9flO3DUhtSza3oxeQr6PN02olNtACnCCeQC2lbI0xdAQnmFH/h+H3lvR
	 sIGBvRF0b617J2U+eAsObTjx9BnR5Sf69nLhTsaNPLUqMa13wyZh/ykn598JunYaBiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=ktcjsRIIcLnaA4/v7wun/ZvAFnZ4fPr80pW9mvPITNc=;
	b=L0i8Oxeix7EVIKTiEbtYX/MgXJA99lQ2C2P5VqOqhRTrPaK91YTlxDpr2Lj9aqgEuSL3
	 F9eZZj+js5/4DePLPxSoXJLtoDJ/2AgX1Dcr8/kU63pL7w2hUZYx7m2AVZZQneret5Vww
	 mflp369dHNiuIJAzbYEtjDMiDxBTRyTp4cX5al3PzMqGJdWD41dzvFCddQICHBgQmPMQs
	 7bBMYaB3UiMvdK/t6fpm7S1vcsSz7ANTVPqRFohWBm1UU7U2bJs2Gae8USeC0bSyewI7d
	 G7/Z0B4Bt1TRg5wUxdQh54QeeGexmH9DrwiPTpLte7h5mjQiOj+0QGNcXPZpDwQRFtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yWLWpH1y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D20606A336
	for <kernelci@lists.linux.dev>; Fri, 27 Nov 2026 10:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D20606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yWLWpH1y
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-945e6d9ceeaso684478085a.0
        for <kernelci@lists.linux.dev>; Fri, 27 Nov 2026 02:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795776976; cv=none;
        d=google.com; s=arc-20260327;
        b=MfpQ20xU0FBnZZPvFR23PX2fVYYOulxz60Qaqq2IDNhZhti/a4HjuIfEx1EDR8uZqp
         nLwyTKQBxKFIGhX5K+ImhcAlxXaJTC6W/8qK0uzl/X8VqX0dBGAoKYi+iJKeo400QVjq
         to5DhJovGTl1zRbAm0UxAMNW7Ixw3sI+4YTvCBS2Fg1lMkSAKUKYTjHFBC+0LrhusaUi
         ZV1z7ql/LfSnVLihZiZs+/t1MXsU7F/jfF1lgl+ByDtrAuvy07bJBjwqjdpi3NZ8xETe
         +1r3loccmwby0Gad1sxMOlU+uI58mzpiZYF+Dxk9zgjdjLTPySIL9Q32KN0BFjyfvHHd
         WbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ktcjsRIIcLnaA4/v7wun/ZvAFnZ4fPr80pW9mvPITNc=;
        fh=xt9HLLLh0wbsPIoOvaqKeTvr8XC4yk7EZLMWDhma3YI=;
        b=ir7jiS8WTf4FgkwICdYczeCseTcZwVyqtKJN8bqStwN+33Ckn10GcOzBk7WNNaUwyI
         9GO8vkSwc6KMEmPATS60J1oMiWrSU5PzLEpg83iUNFNewk3dApfqFPJBcITf4M6TyDMl
         IHMaOCzkLtwHEyu1FZQfhEsD3BQiUld2ntANPHh8uSYrEYTSOrH5SOb3LGkV38H1Syho
         /TSwj9C1qZxtURuzpkz2qfiecLlNjxwGnwYhu7mTf+BZm9jhpN4qt1Qf0zk29vGGaRAv
         y2esx5s+iMIC9Cj8HPxCX5FMoai45inBwQXRPqGpwWat/quN+8UIAPXpaoriUJGBE2p5
         0Kfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776976; x=1796381776; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktcjsRIIcLnaA4/v7wun/ZvAFnZ4fPr80pW9mvPITNc=;
        b=yWLWpH1ybMpSFd1QLagd4yntXWU6Dth5rzrQYHSxfHfvNtBwHzYQcykYQ/tfpVKLbR
         ir9FAW3OglUgPlxudhez5hAm/vc9k1fPRg6FmG2DFzloa3QKwwPpU3rslRNvE6sl6KBA
         7L/7i8xar7qrjWIZVZPt0gBEah9sUsDzvyaGlZ2WVPSx8dO5jLleA0Lj0mXDxBNaPUld
         Hoh7fbcWcCObObYdG0+huVWdlwc5v/qpb0k9wcILUqj11OsNpgY3lIvegKb/3CcGyIc2
         V/PH42rwwWYNSMvE6nNmy1+QgFGskp15/qnxcp/c2HOUI2VD1ihlzLi9nAR8Ys7eDZac
         8ubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776976; x=1796381776;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ktcjsRIIcLnaA4/v7wun/ZvAFnZ4fPr80pW9mvPITNc=;
        b=ztlbjb/4jqXeCJRH1lcrZIgdWOrfypp7WjaNKNzIhQEUU7xvGmJeuTqT8rvh+ZLECE
         xz3/f6S302Krxls/1yJM2Hra0a1FJBPeDqtWbtieCn8XKMYLgF2xrJ7N1voedgg5lXNt
         KxKN8dUBS25ykf/OmfCCCPk8Xj0JFxcXbmDEvfONpR25DFqDkYKlTuI7ARyOGWE2He8x
         K+5jpbRMaCSjhaQO43vrDjC9Q1iCCtD089teEUjtKU8weupGREkT7NW9eFDb/WZYNzpy
         C+h4oyKXKVpuivq++eJJYeeAgaFemCJZOwEtrMvPjxXS+ZrkqFKFCd5THDM2wjPNr3hi
         Krug==
X-Gm-Message-State: APuU4Z+MXUmR02j68Pqeq/0eipq5YwCRQmBcwnrzJZ0BrvSCWxd6uvaq
	XUvlsxhHBEWgECRA+OuEhx8hDS4OOsW9Onbs9MOLjpXyPEkXR9rvAoZpmcvodCYhNUmy9MZss3H
	eaH4HH31Gm4U7SbpfZKiWXkIMGKpdnXViYUwHwLt6K00/sjeJgHPVtA==
X-Gm-Gg: AZFdTZfh4wv6Xy65q6v2vliWUiK/ImUhySljAb6Bmke13kcjirAiPljB2heEa3CggEh
	GUGw2DEHntyxXWe89n8CojwtnkZFjBhaEPsbYkg9T/j/ScBA1eeU7VFhkAGl2COAAqLcYjDINQa
	tA/kVRKl+Dtb7/bTGh/d2UKk/dXD4I9h8nYJbQ/dxbvfxBuk9cPAOiEfJDwykrc4qFjOzxlcLGZ
	QoXfWU7vOxo68KmJLbLMolFLqVX2a4+2voD5IOQHbzjOD/+Z5a3rY0BOMTy5zxVw+fJ+EFD1Pol
	gbrUuvR4NuTGh07NZRFo80lRPi5+NRHE1XL1ONMSGDetWGuFtLzinK1PNLc+9L7U2DaDVy6nlyy
	OFF/kT0dff8/8E/fSEC6+Vhew2uHFwy9jV5WG1j4xuRvtbKgxma6ewrltZPPS8uIGUjGLJX8Gyk
	pgB0igGL/o4CK8uerUgViVSMXpsEsFiY4fd/arrJYhySDWaAfwBrkbFsKhUJ6jFwYs3xdeznw6h
	guaPJ7X0uIKMzF6j+Fev1jGr09lF6N9+3HJTLnh+n1xDB3Kx/Z1
X-Received: by 2002:a05:620a:2850:b0:94a:934:6e87 with SMTP id
 af79cd13be357-94a09347071mr1314403885a.50.1795776976281; Fri, 27 Nov 2026
 02:56:16 -0800 (PST)
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Post: <mailto:kernelci@lists.linux.dev>
List-Help: <mailto:kernelci+help@lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernelci+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Ben Copeland <ben.copeland@linaro.org>
Date: Fri, 27 Nov 2026 10:56:05 +0000
X-Gm-Features: Aa3M54rbGv7M4pfKlYTrLk7Z14tjEqD8OZ94VV-nLolFGPkg2oqkhsR9FPxN8Fo
Message-ID: <CAL0q8a6SP056y2OWbZj94OTO2qgPZFwQyn4aNw6jcjpph_yX0Q@mail.gmail.com>
Subject: [RFC] Performance summaries and comparisons in KCIDB
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Cc: kernelci-webdashboard <kernelci-webdashboard@groups.io>, "denys.f" <denys.f@collabora.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Linaro is working with Arm on getting performance results into
KernelCI, starting with Arm's Fastpath benchmarking tool. Here is how
we plan to do it on the KCIDB side, ahead of Anders sending patches.

What gets stored:

For this first step we store summaries and comparisons, not raw
measurements. A summary is the statistics for one metric of one
benchmark on one kernel build (mean, sample count, standard deviation
and confidence interval), with the machine and software profile it ran
on. A comparison points at two summaries, a baseline and a target, and
carries the submitter's verdict (improvement, regression or no change)
with the method and settings behind it. KernelCI stores the verdict as
submitted and does not recompute it.

How:

- A new, backward compatible kcidb-io schema version adding two
top-level arrays, performance_summaries and performance_comparisons.
Existing submissions are unaffected.
- The kernel stays an ordinary checkout and build, as labs send today,
and each summary points at its build. For performance data the
ingester also checks that the build carries the repository URL,
commit, git describe name, compiler and a config fingerprint (in misc
for now).
- Submission goes through kcidb-ng /submit with a normal origin and
token. No separate service.
- The dashboard ingester writes the records to new tables linked to
builds, with reversible Django migrations. Each submission carries its
own machine and software profile so it stands alone, but the dashboard
stores shared ones once.
- A few read-only endpoints in the dashboard backend: summaries for a
kernel, comparisons between two kernels, regressions for a kernel,
metric definitions, and a plain-text regression summary for a baseline
and target pair.

The format is generic, so other submitters can send performance
results the same way; Fastpath is the first.

One thing where input would help: per-record error reporting from
/status, so a submitter can see which record failed and why. We need
it for this data, but it may make sense to add it for every submitter
rather than just these records.

Anders will send the kcidb-io patches as an RFC.

Thanks,
Ben
