Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D183803D3
	for <kernelci@lists.linux.dev>; Thu,  3 Sep 2026 18:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460643; cv=pass; b=af+NRoDshO44OUmrJVr558MkTEJ+gfQ45TKwnZ5MDVdr+mYv96BVPK7HUSZyQ8AMmY/DdjMacWZ0yTt+9Bt1NYBB7KRJq2pdv+IRR5LOylbwpYiUZx/yF+jGIEbKFYW+3w8TurSob6i7VuoususdTDOy5YCAe0iDj5JffJMG37g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460643; c=relaxed/simple;
	bh=+SlbUvkRDvhyeOm17vBGx1rkhstQT52xn55v8LvgDRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSsBbWNNfXZdZ5NU5XUNLtHSSxdtTMLBbevrRp647CC2+yAzVqqOolXJIT394oYKd9SDtCFZctuPKExv4qbdViWQeLDmHp+58RO8pdm+soSLc3pCvE36arvbWGf2qbC5CnKYi1t/jFc0xmBQs3HoORFmgI7oKU5u7zQzBMd1HJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=nReVbAK8; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="nReVbAK8"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso94184a91.1
        for <kernelci@lists.linux.dev>; Thu, 03 Sep 2026 11:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788460641; cv=none;
        d=google.com; s=arc-20260327;
        b=PyjzzzKuQkZiMTRPT9J/rXhjm36eRuLh1QGWopE4muQH7xGW6aE4745M+fw0Qk+Fcw
         NFM0RYnksALcenNjzq9CkauLYWEnwkczpQJ5SfZMaqw0aFOAG0e9qFw4VwqLEV8nvuxT
         urmOiIe90tQDIlzawNeSnm1KFlBegvCD0o9XFQiMg4OX3X3swey/K1dffvq9AHm/18S3
         N+onxUjJZ3c+hFmGB2lVyyzPQPz/aMyfP5eHGyS4TQ6MfhgMKjwS8sBc04fEGGemqlkN
         Jp+w4mjR+rr8evf4lhUXlbNITh7Ybr3Wu4T78TQoIEOvF3KMWlSNziA5h3T3vMX68/D4
         YtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/E/al1yKMnTu6QDoPmZ0D5boDUugVZpS04DhUrYznhI=;
        fh=G08B+9seSEPKQK2b1IIyc0+ArdzU9UWU5YDHhW0xZxA=;
        b=i8Hne0oi2+66UZx7oK1cK8RQ0nzQyW7y9+YgKetGXVeEnAtOrLvghxrEkryMdnn7rb
         4g4i4OKd7hxmXlbbAxodQofco2800VmIlWpdcfqABexv4/DpDzDBVwuRaXZzN03e84XO
         GxkSMGEJVF6WN/1akzy1Y2FWZE04Wz4zV0rkiQhkLXSN8DFgg7WY3Z7p2PqHGdB3ZjbL
         eWFpRNQiZycvPEilMVJWMWSOuqoAeHvANmgqLa5mMKfX9KmvDRlFqVdmOz1hFLaVmhOf
         nlJHh9+8YaDJcJZvLj2xu6GhePN/leuCvV95QetGp5KLTbS8MarjKIgLHWQfhBRRTZod
         IjFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1788460641; x=1789065441; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/E/al1yKMnTu6QDoPmZ0D5boDUugVZpS04DhUrYznhI=;
        b=nReVbAK8NOL7k+QrPTtUOxVfygiIb4tQfw3dxwxlexHRJ1vTuD5+MmCSKIwmj7p6HF
         fjR/tBipDCYnGsRMyJy43lIx7ft772g4MaPpI3WkSECjOrl1DfqBlDqArIeQV1NxUPGX
         BHrzOorBTyPm2VqAn1la71S9NXgFGWOkIIpd3thpPY5/3l+1zJx28ihZC1OdtdVBiTGg
         f3yVCOUJgeraz8q2dctM3i1a/+3NVUFsJdGtvlmnFbee8FP6kdDP2hVsA1KVYAyr6GY+
         rEQj60BPDv8XiIqI/s1/upqWybmvnwKANIQ7lxq127U+TOqCnBJG/GUH64Hkp8Mx/xTe
         7VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788460641; x=1789065441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/E/al1yKMnTu6QDoPmZ0D5boDUugVZpS04DhUrYznhI=;
        b=dmAFjCd1BX6McBxTqLBDMOwnKncI4qIp+o4XTJz1CEymrLdn7+/61YrBvO/BpP6zR/
         EDoFoEk4OsnnUnL2K1WzIud5oNwKeZYVjWiw02q5kaOvkxqICkIcMTTG1ZZFDeZ9YbRU
         TOYkMUMb501zl7t+7/eNUKk5Q1NUWI3VS1U5xpUCu24MgJyk4RKpYC+/KlX92atD9enE
         9L+6aO/UJZlDuWFMN399pnB5EqSyykzmmB2mDGZR+gGxpuqV/SAsL3U2eJXNorQYwuv/
         5fhqR0tX124DkMMBOyPKHhJIUnol87DgViu2y+BwJk+dUcONk9wzqTKExLWvzCU6XkMQ
         1tMg==
X-Gm-Message-State: AFuF++mdWXZWGQTCEJtpUcoVxAcomWhv1gm37i3Fsww5nUBdz/0mJEqc
	8ewCDGouRh3g6ZPcJVxMm6lWqJSSC8LCWSs8yImB3Ky+AZnSSfOh4YcLKp1QigZM3+KvkiW/ade
	+LPoeWhE20CfLpMYacbPdMJNNKEhx4rrKz0u4XX0yhA==
X-Gm-Gg: AYBFou3t1qocJK5/fO5LhbddwjYYi6+nKcTtGO8u98jsuNmlRPqnZkC1gUXj+skpSh1
	HirrBU6eaZ818nw0/wt83qGyxigsChaC28lhUwIROMqheV2BwUyCZFtieuSE68lBo5ynW37rEw0
	Qs93y+Eohy1WLTxU9gHTgtlTl0t00V63erFtxp65kwYquybyvkDNjViMcaHxsZCE3qRIZZGUi1b
	xTauo+MVEnm7bsBR/YL2O0hE/RILVyRHkGpgR6yGsOHL6aXEc1Vj30Xb0pBqXJiUNnNFmf4phcz
	M9G7XP2h7/b1TJG1INYhpt+QFfWqyF9gfYogAE9hYMQynQ==
X-Received: by 2002:a17:90b:35cb:b0:398:a486:81ec with SMTP id
 98e67ed59e1d1-39b261ae617mr737674a91.11.1788460640475; Thu, 03 Sep 2026
 11:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903154354.rXZZL6F9@linutronix.de>
In-Reply-To: <20260903154354.rXZZL6F9@linutronix.de>
From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Date: Thu, 3 Sep 2026 15:37:09 -0300
X-Gm-Features: AcwNN1UYrwzDp26UTs1qOsxY7FPjC9ogVzHCnSSqISB-3A8uhy2iljDyGw-FE0g
Message-ID: <CAKKBm2t3EoD4cRiBJzLqpE79ehRs+Xs-Ypb5ta3Y7rC=0jjyKA@mail.gmail.com>
Subject: Re: kernelci test results
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernelci@lists.linux.dev, kernelci-webdashboard@groups.io, 
	John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian, I work with the dashboard team, so I hope I am able to help y=
ou.

First of all, thanks for using the dashboard, and for taking time to
write this up. Scenarios like this one are exactly what help us find
the UX gaps for improvement.

The dashboard is mostly organized around tree checkouts first.
If i understood it properly you might be able to achieve what you are
looking for via:
1. Selecting a tree (ie stable-rt/v6.6-rt).
2. Clicking on the filters button on the right. There we can apply
filters for configs (defconfig+preempt_rt, etc).
3. We click on the tests tab (default tab is for builds).
4. On the list of tests you can search for test paths (cyclictest,
rt-tests, etc).

Link for the view:
https://dashboard.kernelci.org/tree/stable-rt/v6.6-rt/84925bb144f49eb0d5f4c=
5c29f690b4bbf84903b?df|c|defconfig%2Bpreempt_rt=3Dtrue&p=3Dt

That list is for that checkout across hardware, so you do not have to
go board by board. (Unfortunately there is still no search for =E2=80=9Cthi=
s
test on this device over time=E2=80=9D across all trees.)

About the other questions.

All the logs presented are the ones that have been submitted via KCI
submissions, so there might be some missing information when not
reported.

On the topic of notifying on log errors, this is a feature on active
discussion, to automate notification for first for boots and later for
test failures as well. Today we only notify registered issues.

We are actually looking for some feedback of dashboard users to help
us steer on the roadmap for new features, and your help would be much
appreciated.

Att
Alan Peixinho
KernelCI Dashboard Team

On Thu, Sep 3, 2026 at 2:36=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> Hi,
>
> I've been poking at the dashboard to see how rt-tests tests are doing.
> I tried to summarize my doing/ process and added questions while doing
> so. I might be doing things wrong, not the expected way or simply
> missing the obvious.
>
>
> On the dashboard, by clicking hardware, Tree=3Dmainline I see only
> kubernetes as platform. There I see on the bottom various builds. There
> is a search bar where I can limit to "preempt_rt" and then builds are
> limited to "preempt_rt" configuration and it also includes "next".
>
> There I can click on the build-log (and later I get the build.log.gz)
> but it appears not to contain the build log of the kernel. I think there
> is the "config merging" part and kselftest build but not the actual
> build of the kernel itself.
>
> Clicking on tests, I can also filter for preempt_rt but there is only
> kselftest. I can't see the results, there is always "No logs available".
> Based on the timestamp the results are from today so I wouldn't expect
> them to be deleted because of age.
>
> Going back to "trees" and selecting "stable-rt" and branch v6.6-rt
> there is more HW. Clicking on bcm2711-rpi-4-b since it has the most
> results here.
>
> Here I clicked on configs "defconfig+preempt_rt" and then one of tree
> that appeared is "mainline/master" but I did not see this earlier while
> I did select that tree.
>
> I did click on "tests" and then "rt-tests" appeared. Expanding it up, I
> found cyclictest results for that tree.
>
> Clicking on details I found a link to
>         https://lava.collabora.dev/scheduler/job/22810572
>
> where the complete log is available of what has been done on that
> hardware. In the bootlog I noticed
> | [    0.000000] WARNING: kernel/trace/trace_events.c:420 at test_double_=
dereference+0x128/0x130, CPU#0: swapper/0/0
>
> which is a warning that appeared during boot. Is this picked up
> somewhere? Is there a notification sent somewhere that this has been
> noticed?
>
> Later there is the cyclictest invocation, arguments and the result.
> There is no max-value set for the test so it passes. Would there be a
> notification if the test failed and if so, where?
>
> I noticed that on the lava page, by clicking on the device I can search
> for "rt-tests-cyclictest" and get the recent results for this device for
> this test. Is something like this possible on the dashboard? I.e. look
> for the recent cyclictest results?
> Right now I have no idea how to do this without going device by device.
>
> Sebastian
>
