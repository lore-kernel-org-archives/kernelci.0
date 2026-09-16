Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159D34EE874
	for <kernelci@lists.linux.dev>; Wed, 16 Sep 2026 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593207; cv=pass; b=ntz19w73chY7xWe8UA/hRpuguTXsSlVMGcGQpG2kJ8iA2fK17wpNuBpB/L82qESDVypkZ0+5+eK26RYBektJ7SWmStVfzOnGe1qPaeol7YqviEArHXv6Inq3dtchKbv4Kir4PHn6RCiFtcmJvjYKsHJSfeJ6v1zW1iDMYCMKYQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593207; c=relaxed/simple;
	bh=7w8FImVeOCVCEs971y00qHxXPfDshqK+fDSQU87vvSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/sRzdk+5Eq+7CUJ27nfaH4K/bjwndy+1yKmN4sQmFhB+8fumylntz5oS96yyIZX40iex/aUI/Af3q6V/4/vpK/vcyBabfBQrB1VdxJSZBiFwWlIMw2Rk7g3cPowe+ObksKWbM3PJ7AThb9x3ZzbPoNlpHn91cUeero77DrW3Q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=vuwgRQAH; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="vuwgRQAH"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0b25dso1640825ad.2
        for <kernelci@lists.linux.dev>; Wed, 16 Sep 2026 14:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789593190; cv=none;
        d=google.com; s=arc-20260327;
        b=E7d3O89g9ROw8PsmL8Bz714kAyoLscHwVGkHLTSSUabm4/9aHtQKbgDA3dV+LXrCdf
         rm76yza8l0NB5OD9m0v28Kd8EuNU5m6qW0IUISYc+9nTlgdYvO9BovK5coqlawJWjYcI
         GXuIuRlQsm/tEwck6oVy3HtDa337fkF2Htkg/VcLTAnvOWSVPfUhECESbqIHZGjbzS6T
         0K24WnrA/zsbX+hoEU/VCJQ380qVVbgFKWNX6icsZy78r5awlv24x6sjr40a21KentTY
         j5WGZFLRwd5X6JM9KdifuWKwBO3F2Y9WMT3i2Oy8d+5Ma1vOf7bvWwWBWktTv4jWPDS4
         QUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9eEj8yhvf5g+6UCbJrxe6Xsi092JDglie2in0m4w4hw=;
        fh=hG1kLSo0Miwoh8slQ41K76zGoUqmBtAawdXpYUJJj7Y=;
        b=SpS1JOR8Q7O4w5gkVtvme7UvDZ4Rg0sSthP9VqWM6JV4JdY1xO5FTXPt7kO5HAfFLw
         uB8on8aQ3lSd0qj9rHLiDKOLugxvNkv7sawoxiVABcCgiEXTAw78w53LGZ56vBzprX8G
         bkVPp/PAPBsk/U1x16H+QjMODYWW50sbnyekjqsNks5MpR1g9H4p0DkHqE79JB2HIkYY
         OJ85Bv601yjp9jzJUzVXlB2VXwqOeMxqF290ZPZosY0jS7GfkTEU8RHcqyivhIsBfti8
         0S10YnhY1ZqW8LaelplvQo1+bMkQlOgAkDgl75h5vrfcApYaWq7bm1wu7E848sBjhz0y
         CVqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1789593190; x=1790197990; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9eEj8yhvf5g+6UCbJrxe6Xsi092JDglie2in0m4w4hw=;
        b=vuwgRQAHgksL0tWa/LxBIbQNvbK9rBgCoPG0S3se8+BOSbBFQ2gRnnPoUxZGXascHw
         YTw0NzcIW07F1nlne2Bw1BfbH0rYkNgZLdBxXQOUjzphpZ4KFbRLqhzf1xagMQYCq1UC
         Uigs/0BuaU+srVwynDXAoVV4c+i/GkykKPT3Vq60Yxd8DaITt5dTyxbxz2p7wfRMlAo9
         MWKsobQB4FRxy7jqbb22ZfCl9/qMnHfqu5Xp4TX+XSD7tWJo21+JENkeuLEEKnJKKhbU
         A7AgOQIbGZcO6y2Bsu1P3X1oHemkqhre42H8w8Ch3FTW5zcl7/F/pxf7WzN4QMEobLix
         i2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593190; x=1790197990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eEj8yhvf5g+6UCbJrxe6Xsi092JDglie2in0m4w4hw=;
        b=G5AMpGugEv8UZDjgjF4kkRykWBTiTCeX3BC8JNizpSpQIB5+ul7stIx3zNqEU2XsA/
         B26wT7S/qHaBVcS7wPgkpffoOzZDbDoZbnMA3uaTD+c9Ws9Ddoobvxw0biA00k1QBMKz
         PBgt0EYZg60UgAsia7ktJNy+gUVCNjMuQJvGAuE5YUhu4ab0xZA+9GCJ5MbohlIURr2E
         x26qih3N7ONk+UOEa695QcYPHsj1TFlZzAnLoQHqpCIf3QNhiDW8wLSkTM4dxHI2wQu0
         FKnsTSj6pN9Io7w1SFzZuTjdFzV3X5lxeqwUKvG2xvzOFNJoWg2+DY+5BLHJC0Hj18oL
         tB+g==
X-Forwarded-Encrypted: i=1; AKwUvBxv1N5H63hmVdnkyLuMOlMT70scihy1Fsgnc4aJoBak/jqvicdtrsQ8uGTHSNnS4m/lRzEBB4C9Rw==@lists.linux.dev
X-Gm-Message-State: AFuF++mjqs8JLyIBqwKx9cr0zxMT36WMtQUlspLa9OXyWniLg6Nar1JK
	xkvbCrxZ/oUFU0pcC2+B4Z52MdVbAxAr42M7Da+CksqzXcpyJuN6znULtjPyhAx15BZDAwoVQFd
	99Xtr0A8FBamtFBI0fL8UgEyIC8A1z4jYkLY86qecrw==
X-Gm-Gg: AYBFou2DA/IBrht0/mMYsVkoh5ljN8uM5M9YtbfNseCfsVzgDdmaCZu7+OgdISWgal9
	j8mMDgB7X6+oh9+TXaBcuhBumk4urGRA/7H2x+LQLDb9kwpbttKllU6fExnu9rDDzJcy5iQgh+B
	O3KJgcrGv/hywd4LjQVTgZQDqO+W+ITBJYMvq4TsJiR76UsmOcpLoE3zRN6WFL+z4ZM/tYtUI+u
	zwnrSpItM6DBLYUrmA7mIwLL31scT6K/0pZl/dgrRG4EuyY+y4emSWs6WNC1BPu1Mg+rn5k90+5
	qVOzn2nEZn4FCt/y6lTNWk7yEEsNohuSj9AaGMNEStkMbDkLDXPihACl
X-Received: by 2002:a17:903:26c8:b0:2ca:d91d:d3a7 with SMTP id
 d9443c01a7336-2dd8e3f57edmr88806365ad.10.1789593190225; Wed, 16 Sep 2026
 14:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903154354.rXZZL6F9@linutronix.de> <CAKKBm2t3EoD4cRiBJzLqpE79ehRs+Xs-Ypb5ta3Y7rC=0jjyKA@mail.gmail.com>
 <1a06ad7a5bf.36f8f8422502097.1545856430736765843@collabora.com>
 <CAL0q8a6RKqmEte6t+NcYX3u60YvJS+q_THcwKcO6YReY310-HQ@mail.gmail.com> <20260915153535.jTjws1qq@linutronix.de>
In-Reply-To: <20260915153535.jTjws1qq@linutronix.de>
From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Date: Wed, 16 Sep 2026 18:12:58 -0300
X-Gm-Features: AcwNN1Vus6KuKA1ynMI6vrZaltZRCe_JrYcjNTfVRNHxxTKnVqlUfCqQtqNHhx4
Message-ID: <CAKKBm2s1Az3t8FqpR-PwknPLKf9jUKb69uM=ZTKmswfcAq-NNg@mail.gmail.com>
Subject: Re: kernelci test results
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Ben Copeland <ben.copeland@linaro.org>, Denys Fedoryshchenko <denys.f@collabora.com>, 
	kernelci <kernelci@lists.linux.dev>, 
	kernelci-webdashboard <kernelci-webdashboard@groups.io>, John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The confusing part is that "boots" says 0 but then I can download the
> complete log for one of the boards where the test did run. So I guess
> "boot" is something else here.

I am not sure, but I believe the filter might be filtering out the
boots on that board,
because on the kci the boots are also tests.

> Is there something you want me to do?

You have already helped with the feedback, wich already brought some
discusison on how to improve the UX.
But if you have more suggestions, they will be more than welcome.

Att
Alan Peixinho

On Tue, Sep 15, 2026 at 12:35=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-09-04 09:44:31 [+0100], Ben Copeland wrote:
> > Hi Sebastian,
> Hi Ben,
>
> > >  > > On the dashboard, by clicking hardware, Tree=3Dmainline I see on=
ly
> > >  > > kubernetes as platform. There I see on the bottom various builds=
. There
> > >  > > is a search bar where I can limit to "preempt_rt" and then build=
s are
> > >  > > limited to "preempt_rt" configuration and it also includes "next=
".
> > >  > >
> > >  > > There I can click on the build-log (and later I get the build.lo=
g.gz)
> > >  > > but it appears not to contain the build log of the kernel. I thi=
nk there
> > >  > > is the "config merging" part and kselftest build but not the act=
ual
> > >  > > build of the kernel itself.
> >
> > By design. We build with tuxmake, which builds silently unless you
> > pass --verbose, so a good kernel build emits little more than echoed
> > commands. What is left is warnings and errors, and for a failed build
> > that log is what logspec parses. The noise you see is the kselftest
> > build, which echoes anyway. There is also a reproducer.sh artefact if
> > you want to reproduce the build locally.
>
> Ah okay, then.
>
> > >  > >
> > >  > > Clicking on tests, I can also filter for preempt_rt but there is=
 only
> > >  > > kselftest. I can't see the results, there is always "No logs ava=
ilable".
> >
> > Those aren't LAVA test runs, which is why it looks broken. On the
> > kubernetes hardware page you are seeing kselftest *build* results
> > hanging off the kbuild node, e.g. path
> >
> >   kbuild-gcc-14-arm-preempt_rt-kselftest.build.kselftest.rseq
> >
> > Those have no log_url, so the viewer says "No logs available", but the
> > log is there: look at the output files section of the test page for
> > build_kselftest.log.gz and build_kselftest_stderr.log.gz. Not expiry.
>
> Ah okay. So build logs for the tests are there, I see it. But there are
> not run anywhere therefore there is not log output. Understood.
>
> > >  > > Later there is the cyclictest invocation, arguments and the resu=
lt.
> > >  > > There is no max-value set for the test so it passes. Would there=
 be a
> > >  > > notification if the test failed and if so, where?
> >
> > I cannot find any thresholds set, which isn't ideal.
> > parse_rt_tests_results.py prints the literal string "pass" for every
> > latency line; only cyclictest's return code decides the overall
> > result. So a max-value parameter on our side would change nothing
> > until the parser learns about thresholds.
>
> Okay. I have two pulls open to the priority thingy. Let me then look
> into this.
>
> > >  > > I noticed that on the lava page, by clicking on the device I can=
 search
> > >  > > for "rt-tests-cyclictest" and get the recent results for this de=
vice for
> > >  > > this test. Is something like this possible on the dashboard? I.e=
. look
> > >  > > for the recent cyclictest results?
> >
> > Alan already covered this; however, after a quick dive into some of
> > the rt results, I noticed jobs dying with "Unsupported url protocol
> > scheme". Seems to be an issue with rt-tests + nfs boot. I will have to
> > dig deeper, but there is some improvement to be had here. I also
> > noticed that we are missing trixie-rt armhf rootfs, which will be a
> > problem for imx6q-sabrelite (and other armhf boards about running rt).
> >
> > So bcm2711-rpi-4-b, where you ended up, is one of the few places
> > rt-tests actually produces data. I'd need to dig further to see where
> > else it is running or failing.
>
> Okay, thanks.
>
> > Thanks
> >
> > Ben
>
> Sebastian
