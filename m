Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794256217;
	b=45bFfQNp+klmNdgEaxqsVT7qkeV3JsgAzdovBoqfUDFQmrnAitaWmekiPtGNApeTo/iw
	 UrdoRJEwKF5qbYj4OpIN3lwoKOQvQXuxlAc4JE/R7tTpaN7/Vk4Lh0rkoSM+oGPevV8VM
	 3VE2vVIrwzvakw68yZ0MXnwjFo1A2h2CnUO2Z7hn/YASblAK7lenLYQtDHmCR7Cy9m4C7
	 OiEUixKF1I821N2z7DOnddiTldfhfFgHMh0nrFzryBN35lcREx0yWIPOuEW8wDihT8mtP
	 V3EVf0TWvp0JU46Q3kHNNjEz4XJPLekPb1bmDDr2bxiFQyYgNkUBf3glZf6QIEZsBrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=jxoL1vkksv6+PpaP3p3y3nKcoLpOHEtWRnV5Y2aKg+A=;
	b=wDYIYLFOpO+/eO+67FwV02LUkcJjhnRe4HOpvp7aPQjiqHS8GqHCY9i/uEGO2I+T9qWh
	 NsU1bFfu4HreoBsGxiuZn1MEwv1DOIIQh/Nqdp27DPbXkCVzN2s5ePqIrPDWT3ududOc+
	 amQub5Jbf3V2iX1eZwqqWwLbsQR6c1nM35x1Cf2A5fxAU0M+Aut+xwD/LLdE68WX8gXhG
	 +KrgPC08DotwcPxTpSRS6HvkBct3Wlrs6d9+LlVAOk94vwgnmcduceoBwlLm4aYMkA3JG
	 LH8iJtmuap7jhR2M3RnTEWLEYcLk3OeNkmmWbvQYl0RHIPxdhtLzUo5aypzt+wLwlCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=profusion.mobi;
	spf=pass smtp.mailfrom=profusion.mobi;
	dkim=pass header.d=profusion-mobi.20260707.gappssmtp.com header.i=@profusion-mobi.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YqEUQUJe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2209A606A331
	for <kernelci@lists.linux.dev>; Mon,  9 Nov 2026 20:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2209A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=profusion-mobi.20260707.gappssmtp.com header.i=@profusion-mobi.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YqEUQUJe
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso186484366b.3
        for <kernelci@lists.linux.dev>; Mon, 09 Nov 2026 12:30:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794256215; cv=none;
        d=google.com; s=arc-20260327;
        b=GC9X8RHymf9t/ly7OBu8x/LFlVLGV+8scGFHEYTru+FhsRKDSy+IIEQsh0aBHh/aM8
         nRyJXD60kKswTkjnJMCTWdZcaHoibwn4Li1ofYbCAj5SIecQnhytqFy0HJjcm7hD7i0N
         YsnOVirL7f849bZ1vlp0ON0cIMS/RngdND0SNC6iMy09HXPecXbRNaqpf4+MKSm2Wx78
         oCFecJjCC3YdiZ2y9NaejyM0cVjJkFpXuTGPFrr7YtvhYRn8tOlc7yOWeTWz86x47hRl
         OuuZ3cl/vu61yGaETCk8uQ6ih58DzKiMAOru1vCT+TLWGeNW4hw5sqIlHPC3xZtaAEHi
         fpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jxoL1vkksv6+PpaP3p3y3nKcoLpOHEtWRnV5Y2aKg+A=;
        fh=rmq/YLFzDAglBwji5AmBmtb7cJxq3EZCkg46fu2xnLc=;
        b=DgjKnWM9nbPDqmmQ4qYBsH5DA9GPTaGV4ZdFe0Tvu8EX9KmylV3ubdOssI16LPAlfU
         ++cEK3rNGHQFWlT8dvGqN/PdAo1qOVMFVKzxG50yr8pyRV+Vlja3vEFY3wbb5FGBTfob
         S/HXq9KapSOjD44S/PaG9NdjHJqTny9qSTwVaRA8MBD721E18gdt8W86YsXdP5A0BM25
         AejI6zrYvYeDs5KChtEsBlVOfGy9y1/2S6TF/Y8c9kMx3aD0W3f1P971bYbEPw3sgqUq
         OVkxOaMfvwnGn5ZdScjaRiSpZdX5OWTmP++pYiURl94byOB+1EhziFvKjc3WW6ljQBS3
         CHhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20260707.gappssmtp.com; s=20260707; t=1794256215; x=1794861015; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jxoL1vkksv6+PpaP3p3y3nKcoLpOHEtWRnV5Y2aKg+A=;
        b=YqEUQUJe7S2VRy83A0joxakUU61gaJa0cR6G6cDThPHkFnDXH5Vd/aLDisDubzoaPy
         j5nnUeKmTxodxZ14cLt7ZCW54ldmC+AGOK866c9aElpMt2UE6pNFybj32Z3dtgRtnIdF
         cnq0TVEVDyfcq78at0WQO4+zP6gpYFTJMpacz3tzzW63tQoePo2O1TU5S25u1MJWU6dr
         rFUV2MeskAAW3gmeCwURtpCa9FfA1B8fbxblnsipxO6VcCD/GqLeqb2VNHPJ8UZrk7cr
         0Q28b3jRbPenQN9gQbfwde7VA7L2VzI9mZMF9oL2lPk5kk6K7SwtCjTi+/IPSK7o+esw
         TNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794256215; x=1794861015;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxoL1vkksv6+PpaP3p3y3nKcoLpOHEtWRnV5Y2aKg+A=;
        b=uCkVCZytqongFINfawgoDMTKlUOBrp2ZQDUItX80JpzXqTHoWtLyLZSS1ir1OWQwmk
         NTu+encww9Pc64FH1fvd0+vd/d0pNQxqXPaFDnGdlz5UmPEq1xOrBTLYfrJ6FZGJdkGT
         6HnnmCENTlK2BiDloNZRWFr3zHBS+clm2zlkERDMxALG7G/u//QhMoysVVWUsRauAISk
         xQLMbbZGscmFnjYPYT0Z82CDNmaI4cDz4ZsZztnVy5JNlcyTLccfdXug/fT/N6n4QRST
         tj+LXTpZS+9DfstvyCOeThw2JuQEAq4F7tNvTfVuLN/QHT7NWNURM+NF0Oy7dt6+fjsJ
         JPNg==
X-Gm-Message-State: APuU4Z+/znX62OBu9hv3wPpyYhs7n5F33f4+G7zRWccnMUL85FHa0GCU
	W7tfihM3OcxliE09cowcIdcIHE5DEvmU6xredgRKAP2QHTX7iFsA+WP4UYxbmhMiFjoSKpDdEzK
	6FzmitrZG1yCr+yf5jezvQyDHAtiMVz0VzDtr2WO1DxvhT1jTMN3NPoM/4A==
X-Gm-Gg: AYBFou18G2ipm8MjCo4s9+4rBDRO6u+ee4KJJzs2Dy/MaVA59Ced3HiPl/nC2hpIhrM
	sLKxhYpyIolHOKYkMomYYaIlcgCEeU5QFvgLCYurczVa9KByCg5agZO/5RiDAyMjC8L2z9+mDeO
	bX9wgKUl9VlSIGVe5kiYn3Z3+k8QkP9b+dXnjIKMw0gt8akGBzEz+bfl66fbFleYQrs9DmFBdZE
	WifeitGI9s2xPap3kqY0Ali3bVTuUMd16HSgdifYARz/qMJymzXFWgBHxFX3bPBeUkIaUhhgUP/
	LDwJXXKnxeWADodBM+ZrfzGi7twDDBgMaUY0mVWcVTUH17ZfQyTk7eI47DMcGaLAqyapMX5tj5z
	WkDkdx8zHDRwpVRDxp4lJ3KH22uYBVIjb5SlaU42YNs7I5ehHqlOJa18Ma/jTiOmsUmf8iL/98C
	O1XDgsmZ90OSsdBWI=
X-Received: by 2002:a17:907:3e0c:b0:c4d:2f6b:435 with SMTP id
 a640c23a62f3a-c50494e6ceamr40852066b.18.1794256215329; Mon, 09 Nov 2026
 12:30:15 -0800 (PST)
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
Date: Mon, 9 Nov 2026 17:30:04 -0300
X-Gm-Features: AclHuK--Kahjq1sFVJDqb-2qEWjnSONOZhAbfSJToJvgT0iBLaGf9VJV2K7bvzw
Message-ID: <CACcoU0GJzBxc2n_c9_WGc+CmC_nYC8LhuQZk8VyRSV5+O1E8Gw@mail.gmail.com>
Subject: KernelCI Dashboard release
To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have just deployed KernelCI Dashboard release/20261109.0 with the
following changes:

Hardware filtering

- Added separate filters for checkout, build, and test origins, plus
build and test labs.
- Hardware details retain the filters selected on the listing page.
Existing origin bookmarks map to the test-origin filter.

Labs

- Added lab details API endpoints to support the upcoming lab details page.
- Applied lab filtering to tree, hardware, and issue result queries.
- Improved the labs listing page performance.

Email reports

- Added configurable regression recipients scoped by branch and, for
build issues, architecture, kernel configuration, and compiler.
- Added optional copies of the new-issues summary filtered by tree or
hardware, issue type, branch, origin, and platform.
- Added optional metrics reports scoped by lab and origin, with a
configurable reporting period. Headline totals remain project-wide.
- Existing community summaries continue. Subscription configuration is
documented in docs/notifications.md

Performance and reliability

- Improved performance for tree details endpoints (builds, boots and tests).
- Improved performance in hardware history and tree commit-history.
Optimized commit-tag lookups and issue history queries.

Security and testing

- Updated frontend and backend dependencies to address security alerts.
- Added kci-dev integration checks against the seeded API, including
results, compare, and gate commands.

Thank you!

Felipe Bergamin
ProFUSION - KernelCI Dashboard Team
