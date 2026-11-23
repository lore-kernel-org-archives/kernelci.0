Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795458540;
	b=ZYCoPWn5tVE8zt5sb3HIpzwAnz65t/jAdTjvTP6RfnaHPb0Mmqw4TYb5/ZQjJ1cZ1nIv
	 /0X15Z1lRdl/3gQSeLN9LbvPBEBI5jgAlB+5q/xl8n8SkTwe6EMrutg5Nezlclq9rh+Bd
	 yDv9jQZb2YDhMw6acfXllEfbh0nPVwou9Y4si14cIZ1MO1ePEUMdps/IO+2RpwOzed+2w
	 nf5HOxEsqRb7ct7DN/iXSJ3yqsEVDie3CXYwF2yLC+wgJ+/1kBz/XF7REBJUYfHboSbXa
	 wC6G5O/rLK1oy2yX2BU5ptl43yJRcL43FAQo17OfPED9yTiSsl98tWcf1GrMjAzeeWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=+Y+7rbvV2c3kaGsS7GvRG8/E1fZN2lfF/UFwJUBOQ5Q=;
	b=RmeHoVl+FNCYMVwo5bc/MBBODx9RYtMpD1t7zWJuSgkOEjNV5D/yytLBf7B814gXpRur
	 2NpXlKfHxKQFlpNkYhNgmCOerc8D6fMLMGUtEOiYzms52qP83qX8f7U2lBbosqtMuoLVR
	 U9Tynm51guyXs16fCDetduf044svZcBY8JPCo9dl92eg3clymA39UhGaSsO6NUG/eXmXC
	 2P6Fx+WbWOFEotWHMJc2VR0ps5IXpav2Bk3t9j6OS/8RFNizE79+ODWFvPDwzPzV7gKQe
	 sS4HsocY4hZV2I3UGnagDMjSMXs4OYRk7eHEBIuas6kR/viKiKGB8R4NNgzTAfCORqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=profusion.mobi;
	spf=pass smtp.mailfrom=profusion.mobi;
	dkim=pass header.d=profusion-mobi.20260707.gappssmtp.com header.i=@profusion-mobi.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QyooX58o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97F860A2637
	for <kernelci@lists.linux.dev>; Mon, 23 Nov 2026 18:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97F860A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=profusion-mobi.20260707.gappssmtp.com header.i=@profusion-mobi.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QyooX58o
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5126505cb3so466326466b.0
        for <kernelci@lists.linux.dev>; Mon, 23 Nov 2026 10:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795458538; cv=none;
        d=google.com; s=arc-20260327;
        b=eoYMXInwNmvnDa2EeCPVGFDHyKvMWVmQ2rYttefn2H6RdTnqXV8IxeZ9o3lfM2l6f6
         ZnPmVn89VEMY6CXPJgrz3DXEs6Hb0G/s5SBEggyYvfOzt796AsiJyhQaQ4gGaM4ksddw
         p9bX9CpZGB5uYegy+aA5jPeJJOSSBbf6ndUML9eZu3Avi+xIWBgemCjDM6pEEnlnC6DL
         AWLaGE+Njo+OSmvPyZMQLGCnyRYQByfjuI2R6SkDQczdJPmO3IOzFYveNOrrLbCuqPbo
         MVGNyPpkmqtfR/CUY1SSU+F0YriCNk+W+R+z1Yb6ufCrDd6o+Feaf2DXq9ULgWGL93g9
         Rbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+Y+7rbvV2c3kaGsS7GvRG8/E1fZN2lfF/UFwJUBOQ5Q=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=O3Gnm9xDB//rVi+7P8UGwlJvlXpQvR9fOn7vdeIpCzH3rZaLVXM8mig7xi8bY86T1d
         NCKxrUClXQvKwAGgq5yKfgBzpZmNvdQMAgIAIgrz9nldlAZrQB8sai6NIx4QTnNqV0L1
         AveMDlYGzsj6rcdEiciwWUoAWysPN3HDoMWP3osj+9mcGf19WHJe6jlJtpWrWAhAfpyj
         DiwMrDLZRnrmo3TD2jwcnAdcSnsKy7oaFX1qXZ+s94LSlY0uwxxmJ7r49r8k5Uw04TwO
         Jzx/317mLfQRBUWNY1wDrrE11iK1/ViVBzhZHNSaQ1ML2ElME5upZN1YoDvClIJj8RUE
         BNFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20260707.gappssmtp.com; s=20260707; t=1795458538; x=1796063338; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Y+7rbvV2c3kaGsS7GvRG8/E1fZN2lfF/UFwJUBOQ5Q=;
        b=QyooX58ox1PBwzzZQX8IjOlMoLVYECrYTfzPfkXUMCAeQze4VWaILgUyvo0E7ZiruZ
         /4x0cvWuLvZhQLYr3WvGP477QX/U7D/+HNALhJNx+CBwAIlpxgl5pBtYpR1UP7iZVJyL
         MH7JE88kIDOUy9Fs8XmkzlfUwDvoYtDbT+PHjsLDv9wdVmjSNZrvo/tc3to5PpqdrEwJ
         FogcABEr0aH44s5RnXlZNuEa1+zTAhueml2LO/QqEUx3r6RMZT5bsVaWWxV3MPFSL8Bl
         AsFBdnkAf4jLdj2RuagVaLFf0eIxNxejrxESLtrE6N1/LZgUqrFIiFsQTIyuP4H4GOTa
         A/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458538; x=1796063338;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Y+7rbvV2c3kaGsS7GvRG8/E1fZN2lfF/UFwJUBOQ5Q=;
        b=MVI8JqJ7pr/UEJZ7ec8mHcg7ThOlVxVAgpHxvVv1dvsMDG8C0KBa/xRSNVmjo0qBqQ
         UYwCea0mS8Lt2cQmCx14QTwC/gsFVQbEagqwhnLqlNtYr4wLFCFe5MEk4HpPHMl8UCVQ
         2njMA4J6qFyi7uohk8jDothNCHAD45Hk7R5iFhhtXfHTUrnE3ifMKwuS/nn2cuZhcxXH
         o35GdWDvsCbIRrxN2o1dFWfY+NYFBDVPAaPYX5j4CuLgcjKrkTdYJ2qPRCSirRdbbdKe
         Gw8qVd8Z6E0yAXYFjjjAkjrB+m5ogM4mrRhhHnto7+MAnYdHjWMU9VXwTVSpVrL1u/NK
         41PA==
X-Gm-Message-State: APuU4Z8bwj60m/UBTFDKCan8QzeY3IgPOd5hzzojaH/d/4Kw/0vwM410
	e5pZrHuc3jk3R77Mga7MEPVOjdxQJw4EVQ3W1JBN6ho3IZc3eLaeDLBS+GhaDbV6vwpl2SgwjME
	DnOT4GVXSnpd0qpvdITMa8TwuYrZ7WPb9oqEjoXw8MgEJW3I5gEJc1kAxgw==
X-Gm-Gg: AZFdTZe52yL7b/NObIzU9MxgMBWBeiJ2VR4uz9qigGUMl+9fZMclKQCJF56ozeLyhUt
	LVpPk+P57emWIJAYTOuyaMx2HhzXGVQv4xPDpsUAOeqiuR83XYAemHpo1LrRaLhgSbR+9CPpLap
	DkUgELaGHkGoiAM/Zq4BGMx4M8P8/6u9NFzdsiB+3rrPSAOxs6s/QGzqu7WR+eLEuIPTTg9K8hr
	QRwaAqQ2Y7MYxqFj5bWxln3e8BiJQH53fN9ZqTCvjb7gEZt6pfSuha9wY6aZJzUQ9TqbXTp967C
	GXXV5VXGIXTRbYLpEMut3EUrbMlSv18K0/D30YPj9PLTxoyXyRlXu1Rf9uT2S5btGYenidWyiN0
	FInSa9hlxsurhk0JyuGJoe5q0gRsOYOtFsB2iqHE74XkLWTQFuesmUQO3qIUKuu0NvW6fDQ==
X-Received: by 2002:a17:906:12cc:b0:c49:b393:f1ab with SMTP id
 a640c23a62f3a-c513ab33761mr771248466b.30.1795458538118; Mon, 23 Nov 2026
 10:28:58 -0800 (PST)
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Post: <mailto:kernelci@lists.linux.dev>
List-Help: <mailto:kernelci+help@lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
List-Owner: <mailto:kernelci+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Felipe Bergamin <felipebergamin@profusion.mobi>
Date: Mon, 23 Nov 2026 15:28:46 -0300
X-Gm-Features: Aa3M54oO-VzU8WTtF4vYFVQEx92RgDUFPQA5fG-fzPVix9RgtIbt7iMekqyN5gs
Message-ID: <CACcoU0FwN=V-Vk6EW19aScEhimJhtzGbRcKAunHvxWdaRL6qmA@mail.gmail.com>
Subject: [RELEASE] KernelCI Dashboard release/20261123.0
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

We are releasing a new KernelCI Dashboard version with the following updates:

Hardware

- Filter the hardware and per-revision listings by architecture,
  processor, platform vendor, silicon vendor, platform, system
  module, form factor, and board type. The URL keeps your filter
  selections so you can share them.

- The dashboard now recognizes boards listed under compatible
  in the hardware registry.

- Improved hardware summary loading time.

Details and navigation

- Build, test, and issue pages now use a more compact layout.
  Log excerpts start collapsed, and you can expand miscellaneous
  JSON in place.

- Shared test links now show tree breadcrumbs. Hardware and
  Compatibles links preserve the test origin.

- Tree pages now show a specific error for missing checkouts.
  They also clear the previous commit's results while another
  commit loads.

Thanks to Denys Fedoryshchenko (nuclearcat) for restoring the
breadcrumbs, preserving the test origin in links, and fixing
the missing-checkout error handling.

Ingestion and monitoring

- The KCIDB ingester reuses workers across processing cycles to
  limit the number of Prometheus metrics files.

- The ingester now counts submission preparation failures by
  reason.

Thanks to nuclearcat for the ingester changes.

Full list of changes
https://github.com/kernelci/dashboard/compare/release/20261109.0...release/20261123.0

Thanks,
Felipe
