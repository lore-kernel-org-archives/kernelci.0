Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124FF44239B
	for <kernelci@lists.linux.dev>; Fri,  4 Sep 2026 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511487; cv=pass; b=mM9Gw9UfW2o3hYtBWW5Z+yJSz6O3WBoG/E37ex9htaNF8Y1KrgCN5n1cLk4vS1eJNP7Rs9B/H2+Jz3nz9XE6fgiP2DgtNUYTTZwTBDmDI+ksHYEutWBFduaTYnD88GQ3z8JVU3jkjXcml0i9zc4gpzHrKu1jlwBOV4jT2hXYukQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511487; c=relaxed/simple;
	bh=Hab9kTfNTvF1RRf3swVjlSMQHtZEvwmLRdCkbve6+64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMzMzvbtWQ+4Jf3bRC6VcoQyvYRJBLnMc42OKrf7j+LI7mqcI6kO0qWaUH8vez447VVWou+sT0Rc+Z6kvkf4f9vs5hpLq/pu4md34ciTZBdRJwUNsAxFKS1oPEHVo9zDTr5viVgSgpPVMU+x3qSq8LWJ9tWykxavzoXoFp33FvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWvD/9Vt; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWvD/9Vt"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90d7fa95a58so8108506d6.1
        for <kernelci@lists.linux.dev>; Fri, 04 Sep 2026 01:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511484; cv=none;
        d=google.com; s=arc-20260327;
        b=pru2h0SQFIgdsI9e22ohWmHVAQzxEP5+uHL83L6Ie1kFY+xbBO6PYX7b7EgE0yO84x
         cKoOXF5SRM1ZZQNWSmA5RztuwKKsmovAXrPhLVBPNJ9e6XkTetNzRN/BwJxkho3HYxL0
         TJ5hpbsjxXJgkW+4XPJM9DiVbbbx1Ee1wjJXVzzbaGkJDvrq9Cl3UoAXBqFU117078xV
         AX4hxJTSSXbufatBJUFdkqZMOR0iaBNlBaiizXhQeGKGqdO/qQyKDRB9yTeSYqWXq14K
         qeDW3V1bHRgSTDOrV9pY0BRXYjY8Tlv9mpl0Uh5fPntUGR9mjtdiY1vBzlrtxzAH68aZ
         hPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26SnNDjCfn8a077tRatvxIGnk4LDpEe3luyxsNbDK14=;
        fh=lpgUxP36618n8HS/Di3u2/sE063A8m0805ewcPWnWYo=;
        b=j6CyL69yu2GeynvKKxt399sSNwjyPM+5bonj/28/ZHP2rg9v3hs7gh/S0SawPkoIE0
         36QEUGH4dMAWaZg9oUv21P/BrQxHcnhBrKV2JCH5A58Rn5vxxPNtAIrOk74M3tc06Klp
         tDwFI2/Yd8OGahwKXuWpdJ7D157B6Y1xKi3jJCz9+B2cisxpaYji1dy6exkEuVEfLCn5
         t+ZTn77Vrkcimz+fHjPv38l/lvckbm3IaMB3K8eh5kX6sipSrau7ctGL/8GBa7FKFtIn
         la2tcPRezIIgr7rTy1UHTr2oxCqCZ/DwBimzN7pgM+xB7SRm44oHWEvmVU10INasVQEf
         1Czw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788511484; x=1789116284; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=26SnNDjCfn8a077tRatvxIGnk4LDpEe3luyxsNbDK14=;
        b=UWvD/9VtdkTavP+DQFV1rzKpvRpssU1PwtA2XNIv7xhLIa+ps7rvBeV9ZYtOWiASU/
         TlbDV9w1v7ITvB6RXBIArWA/ibT/a2KH0hfs0imcJOVk1TpztWo1t29fvk1NmxZSzLQb
         XLkQ394W75IpuB/oGxUQadnmAFRdYpf/08FoYxObyd9lcxB4tRmTsKmdhRFSefJdIaIK
         Tdbdt95rgE1XamRcEYycrpuQU0jKYF4nkbfNg3UlU7rrNNF8fY6Mfa5F2AaQqTsdbp7t
         pA0PijF7ly7VV08K+Qyw3u+rZlbw+txXBeHIHVmeqjFyLc7C/eUWhRhPkeNX2l1nNO3a
         X0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511484; x=1789116284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26SnNDjCfn8a077tRatvxIGnk4LDpEe3luyxsNbDK14=;
        b=ReZ5ELV4lassYafZrKQYSKh28hX2PvddKHg11dRoLLVhDut2s2n/ix6kmeytNgWWqY
         bs1UUfwsv3RlS28x3rD/09iT9RKy4I5NH7B1Jt7Z4zSKo/xDmN/ixf7B6CflrR5B9mpJ
         HVMZuGQCILeUGYJXYXNvqN9JJCOwm5nX0YwrgEZR94dNnO/P+jIaqKTpRvJgwui+qeZE
         dGT/dfOtVkUFwA1kqRfb6T0woYY+bUSd2YN3aDABQ1tH4ymSUUKWLhWcvRQMu87pj9mw
         BT6bc8l/Tw4rcy93s8Ur4DxujCI6eQWZykY9OVMvkzuLKJLQj8Q4QL8zpw0x38y6Kz8e
         ht+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzX1by1rDKpG0iY2C+b0GZyuNRO2SByYljdutSqPIcSXPC15H+ixU9y9ejey9IqrvLZcaIE88gOfg==@lists.linux.dev
X-Gm-Message-State: AFuF++kWc/yRQalAz3hO4chczi4iLPH2+eG/KX1wc6DlZW0iAhWj09fY
	if9KrWQRuCkSjwDMq0wiIoC+9rRM0EO6diEc/trUs/H7UKDW/IoXZD+lvmHKMBn6yeb1kpQYMVs
	SPepNDCq5axtbFVA1rIP2HF/F6SnVAxzdKf058fct
X-Gm-Gg: AYBFou1ydVKV//gHmvwdBvseTGMfJtZQkRYnQFeZh+a3hNm6nSgQOlxWCgpCb597wf7
	Ph1eA7hkcKYzxHFTVTKWTuZ1QY/LWMh7zOPrW8o56JtjiXduo908LG3bfWDJ4xF05JG9ZjuhUeM
	R/8FLbEPfgi+ok9NqQZwuRfzjNpQbmIXd9Q44dhUAQF7o651/xoW1Do+RRN87538jDEBkeLYwpY
	FAFFjjDTuDpyDyj17IiUc/5MGQDfdoQWJEWOmMZ3igEMrvXKdjJOGC3BHzpu87oE9ZKuKzqpktg
	+NbVuwVXdVjoebw/IPQixwue6nBrcKn0FqkAImahccS13u9jpFyYtepFKsmrwTCvjJtbbXL0+oH
	HCwZTsrXRlgMsXtPFXy+9xrHIIZCqqt0Nzo6fq9Is2oGP+hvRkEqWWxx+KPWRveP7pVV1lxEXX0
	ziZ0cnqeMWKbC5EXzg4h4teqj9a21heAl7JRS/MAh3d8s=
X-Received: by 2002:ad4:5dcd:0:b0:910:4080:dc4f with SMTP id
 6a1803df08f44-9104080f964mr38471866d6.4.1788511483619; Fri, 04 Sep 2026
 01:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903154354.rXZZL6F9@linutronix.de> <CAKKBm2t3EoD4cRiBJzLqpE79ehRs+Xs-Ypb5ta3Y7rC=0jjyKA@mail.gmail.com>
 <1a06ad7a5bf.36f8f8422502097.1545856430736765843@collabora.com>
In-Reply-To: <1a06ad7a5bf.36f8f8422502097.1545856430736765843@collabora.com>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Fri, 4 Sep 2026 09:44:31 +0100
X-Gm-Features: AcwNN1U1jrxZYpK0jUMZ6jqDxFC1-syRtQfDz8KciPlqpSFgZGlJ1a5dt0Hpjd8
Message-ID: <CAL0q8a6RKqmEte6t+NcYX3u60YvJS+q_THcwKcO6YReY310-HQ@mail.gmail.com>
Subject: Re: kernelci test results
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, kernelci <kernelci@lists.linux.dev>, 
	kernelci-webdashboard <kernelci-webdashboard@groups.io>, John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Thanks for the report.

On Fri, 4 Sept 2026 at 06:25, Denys Fedoryshchenko
<denys.f@collabora.com> wrote:
>
> Hi Sebastian, Alan
>
> The system currently creates a short log extract only when a build or boo=
t test is marked as failed. This job completed successfully, including the =
boot and cyclictest, so the log was stored but not automatically analyzed f=
or an extract.
> The kernel warning is present in the full log and our analyzer can recogn=
ize it, but it was missed because the overall job passed. This is a limitat=
ion in the current reporting flow.
> We initially chose to create log extracts only for failed builds or boot =
tests because successful boots often contain harmless or known warnings, su=
ch as spurious IRQ messages. Reporting every warning as an issue could crea=
te substantial noise that kernel developers may not find actionable.
> We could review this policy and maintain an ignore list for known, non-ac=
tionable messages. That would let us highlight new or unexpected warnings w=
ithout creating unnecessary noise for kernel developers.
>
> From: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
> To: "Sebastian Andrzej Siewior"<bigeasy@linutronix.de>
> Cc: <kernelci@lists.linux.dev>, <kernelci-webdashboard@groups.io>, "John =
Ogness"<john.ogness@linutronix.de>
> Date: Thu, 03 Sep 2026 21:37:09 +0300
> Subject: Re: kernelci test results
>
>  > Hi Sebastian, I work with the dashboard team, so I hope I am able to h=
elp you.
>  >
>  > First of all, thanks for using the dashboard, and for taking time to
>  > write this up. Scenarios like this one are exactly what help us find
>  > the UX gaps for improvement.
>  >
>  > The dashboard is mostly organized around tree checkouts first.
>  > If i understood it properly you might be able to achieve what you are
>  > looking for via:
>  > 1. Selecting a tree (ie stable-rt/v6.6-rt).
>  > 2. Clicking on the filters button on the right. There we can apply
>  > filters for configs (defconfig+preempt_rt, etc).
>  > 3. We click on the tests tab (default tab is for builds).
>  > 4. On the list of tests you can search for test paths (cyclictest,
>  > rt-tests, etc).
>  >
>  > Link for the view:
>  > https://dashboard.kernelci.org/tree/stable-rt/v6.6-rt/84925bb144f49eb0=
d5f4c5c29f690b4bbf84903b?df|c|defconfig%2Bpreempt_rt=3Dtrue&p=3Dt
>  >
>  > That list is for that checkout across hardware, so you do not have to
>  > go board by board. (Unfortunately there is still no search for =E2=80=
=9Cthis
>  > test on this device over time=E2=80=9D across all trees.)
>  >
>  > About the other questions.
>  >
>  > All the logs presented are the ones that have been submitted via KCI
>  > submissions, so there might be some missing information when not
>  > reported.
>  >
>  > On the topic of notifying on log errors, this is a feature on active
>  > discussion, to automate notification for first for boots and later for
>  > test failures as well. Today we only notify registered issues.
>  >
>  > We are actually looking for some feedback of dashboard users to help
>  > us steer on the roadmap for new features, and your help would be much
>  > appreciated.
>  >
>  > Att
>  > Alan Peixinho
>  > KernelCI Dashboard Team
>  >
>  > On Thu, Sep 3, 2026 at 2:36=E2=80=AFPM Sebastian Andrzej Siewior
>  > <bigeasy@linutronix.de> wrote:
>  > >
>  > > Hi,
>  > >
>  > > I've been poking at the dashboard to see how rt-tests tests are doin=
g.
>  > > I tried to summarize my doing/ process and added questions while doi=
ng
>  > > so. I might be doing things wrong, not the expected way or simply
>  > > missing the obvious.
>  > >
>  > >
>  > > On the dashboard, by clicking hardware, Tree=3Dmainline I see only
>  > > kubernetes as platform. There I see on the bottom various builds. Th=
ere
>  > > is a search bar where I can limit to "preempt_rt" and then builds ar=
e
>  > > limited to "preempt_rt" configuration and it also includes "next".
>  > >
>  > > There I can click on the build-log (and later I get the build.log.gz=
)
>  > > but it appears not to contain the build log of the kernel. I think t=
here
>  > > is the "config merging" part and kselftest build but not the actual
>  > > build of the kernel itself.

By design. We build with tuxmake, which builds silently unless you
pass --verbose, so a good kernel build emits little more than echoed
commands. What is left is warnings and errors, and for a failed build
that log is what logspec parses. The noise you see is the kselftest
build, which echoes anyway. There is also a reproducer.sh artefact if
you want to reproduce the build locally.

>  > >
>  > > Clicking on tests, I can also filter for preempt_rt but there is onl=
y
>  > > kselftest. I can't see the results, there is always "No logs availab=
le".

Those aren't LAVA test runs, which is why it looks broken. On the
kubernetes hardware page you are seeing kselftest *build* results
hanging off the kbuild node, e.g. path

  kbuild-gcc-14-arm-preempt_rt-kselftest.build.kselftest.rseq

Those have no log_url, so the viewer says "No logs available", but the
log is there: look at the output files section of the test page for
build_kselftest.log.gz and build_kselftest_stderr.log.gz. Not expiry.

>  > > Based on the timestamp the results are from today so I wouldn't expe=
ct
>  > > them to be deleted because of age.
>  > >
>  > > Going back to "trees" and selecting "stable-rt" and branch v6.6-rt
>  > > there is more HW. Clicking on bcm2711-rpi-4-b since it has the most
>  > > results here.
>  > >
>  > > Here I clicked on configs "defconfig+preempt_rt" and then one of tre=
e
>  > > that appeared is "mainline/master" but I did not see this earlier wh=
ile
>  > > I did select that tree.
>  > >
>  > > I did click on "tests" and then "rt-tests" appeared. Expanding it up=
, I
>  > > found cyclictest results for that tree.
>  > >
>  > > Clicking on details I found a link to
>  > >         https://lava.collabora.dev/scheduler/job/22810572
>  > >
>  > > where the complete log is available of what has been done on that
>  > > hardware. In the bootlog I noticed
>  > > | [    0.000000] WARNING: kernel/trace/trace_events.c:420 at test_do=
uble_dereference+0x128/0x130, CPU#0: swapper/0/0
>  > >
>  > > which is a warning that appeared during boot. Is this picked up
>  > > somewhere? Is there a notification sent somewhere that this has been
>  > > noticed?

Denys mostly already covered this. One thing to add, since it bears on
the ignore list he suggested: our parser was written for the pre-v6.19
WARNING layout. On the reordered format your log uses it extracts

    WARNING at test_double_dereference+0x128/0x130, CPU#0: swapper/0/0

So the file:line is dropped, and the CPU and comm/pid land in the
string we hash into the issue ID. The same warning on a different CPU
becomes a different issue, and an ignore list keyed on that text would
not match reliably. Only affects 6.19 and later, so the -rt branches
are fine today. Its a simple regex fix

On the notifications:
https://github.com/kernelci/dashboard/blob/main/backend/data/notifications/=
subscriptions/stable-rt.yaml.
This needs to be updated. It looks like there's work here to build
more branches and update notifications, but also to see if we can
automate this going forward so it doesn't slip.

>  > >
>  > > Later there is the cyclictest invocation, arguments and the result.
>  > > There is no max-value set for the test so it passes. Would there be =
a
>  > > notification if the test failed and if so, where?

I cannot find any thresholds set, which isn't ideal.
parse_rt_tests_results.py prints the literal string "pass" for every
latency line; only cyclictest's return code decides the overall
result. So a max-value parameter on our side would change nothing
until the parser learns about thresholds.

>  > >
>  > > I noticed that on the lava page, by clicking on the device I can sea=
rch
>  > > for "rt-tests-cyclictest" and get the recent results for this device=
 for
>  > > this test. Is something like this possible on the dashboard? I.e. lo=
ok
>  > > for the recent cyclictest results?

Alan already covered this; however, after a quick dive into some of
the rt results, I noticed jobs dying with "Unsupported url protocol
scheme". Seems to be an issue with rt-tests + nfs boot. I will have to
dig deeper, but there is some improvement to be had here. I also
noticed that we are missing trixie-rt armhf rootfs, which will be a
problem for imx6q-sabrelite (and other armhf boards about running rt).

So bcm2711-rpi-4-b, where you ended up, is one of the few places
rt-tests actually produces data. I'd need to dig further to see where
else it is running or failing.

Thanks

Ben

>  > > Right now I have no idea how to do this without going device by devi=
ce.
>  > >
>  > > Sebastian
>  > >
>  >
>  >
>
>
>
