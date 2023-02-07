Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6DA20FC
	for <kernelci@lists.linux.dev>; Tue,  7 Feb 2023 10:43:15 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id i38so3820255eda.1
        for <kernelci@lists.linux.dev>; Tue, 07 Feb 2023 02:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KtaXYio5Oeu1cRdDlA4KLVVfQih33KnE+clbGKmwvA0=;
        b=oqv+kpynE97P+Mh52Q+WM4e2nX+GXWF5VZ/7ZiON5DkydbddGrnhPWSO9Dts+frrWH
         CIvZESX2Nr+MhNsw+a4d9qNprcE59kaLEqtwcWyw1jqnvIp7J6zjp4RbzI7Ji7skQBvG
         ayn1Om2qm5OX/GNoHkq+Owr+bsaqBrnLOAku6wTAwVRv13EworVzEGrhQ+KKoVqq/lui
         nYur04Y9t9E8tRx/i7qpZ0rIhKlt9we0Xsn9U4Q0TZfN/82V/Rx7ZSSf0xOMW6hpL1Jd
         dvvyppVF90WUmzxRoIBk4SVgG4APGP9dnygfS4h6dFmDHUc6kKfu05fTBtrqaFsaxdg4
         Vq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KtaXYio5Oeu1cRdDlA4KLVVfQih33KnE+clbGKmwvA0=;
        b=FuHXUH2PoLIKsku/IztJsD5N51XKrBVvPXkRJP/fp2d6f0zDcvJmMYbDU9QM8MwyWQ
         kflLfcOcB56m02ewnkiHaHAsl35h5BoSR2Jiv9Egk4U3gj+CT/4p4ncdMLdr/tCnyEMF
         3pehhfejdzH/ggBnZW2J8Hr816gpASAZb+6RSb0CwbkDbUbHuwSR7+54p22vunGOJqss
         Gdepa5+0kP9n7yzIf6eubY8zt3qunV+7D/hG0aBZCTpxV5M4EzV38F7dbIR5CeFyLTmA
         qLJ+/dl8H88u1i1K5amZTBm8HsItcM1K0F7v4uejMSW/lBGz1lCDulHn33OGg2uyMmL6
         eNQQ==
X-Gm-Message-State: AO0yUKVLFnlZK1UxU1sn2SA9ftznxUGLlw2CTGk0ArH13+PqsaRrzWWp
	n9lVZsZY9FQvkaefBDGWitU=
X-Google-Smtp-Source: AK7set9WDZZGDrfyEMFwqSYiBi4lWCVxTdtD33CzWy+RYoZFlPSsFF+673F8FqTQh8e8AvAM0bOXag==
X-Received: by 2002:a50:d516:0:b0:4aa:b34a:e536 with SMTP id u22-20020a50d516000000b004aab34ae536mr3371462edi.20.1675766593359;
        Tue, 07 Feb 2023 02:43:13 -0800 (PST)
Received: from gmail.com (1F2EF0FB.nat.pool.telekom.hu. [31.46.240.251])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906201100b007ae32daf4b9sm6704048ejo.106.2023.02.07.02.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 02:43:12 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Tue, 7 Feb 2023 11:43:10 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: x86@kernel.org, "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"kernelci-results@groups.io" <kernelci-results@groups.io>
Subject: Re: tip/master build: 205 builds: 5 failed, 200 passed, 9 errors, 22
 warnings (v6.2-rc7-273-gd67c17ddc899)
Message-ID: <Y+IrPplefysppzDC@gmail.com>
References: <63e1f7e0.170a0220.7142.de7c@mx.google.com>
 <Y+IRiiRtXvUzXOGp@gmail.com>
 <c3cd3489-ca32-bdf5-4538-d95532bf9430@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3cd3489-ca32-bdf5-4538-d95532bf9430@collabora.com>


* Guillaume Tucker <guillaume.tucker@collabora.com> wrote:

> Hi Ingo,
> 
> On 07/02/2023 09:53, Ingo Molnar wrote:
> > 
> > * kernelci.org bot <bot@kernelci.org> wrote:
> > 
> >> tip/master build: 205 builds: 5 failed, 200 passed, 9 errors, 22 warnings (v6.2-rc7-273-gd67c17ddc899)
> >>
> >> Full Build Summary: https://kernelci.org/build/tip/branch/master/kernel/v6.2-rc7-273-gd67c17ddc899/
> >>
> >> Tree: tip
> >> Branch: master
> > 
> > Is anyone maintaining this CI build bot? Because it's either unmaintained, 
> > or is blatantly lying about regressions.
> > 
> > Let's see one of the 'errors' it reported today:
> 
> Yes, it's being maintained.

Good, and thanks for the quick response. :-)

> However there's no way for the KernelCI core team to manually verify all 
> the errors reported. So kernel developers following up on such errors is 
> the best way to handle them and get them resolved.  Thanks for replying 
> to the email report :)
> 
> >> Errors summary:
> >>
> >>     4    cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> > 
> > ... but this exact same error was 'reported' a year ago on January 22:
> > 
> >>    2    cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’
> > 
> > So these regression reports are useless in this form and they clutter 
> > people's inboxes. Is any person reading them and acting on them to make 
> > sure these emails are sensible?
> 
> They are not reported as regressions but as build errors.  So it doesn't 
> matter when it started failing or if this has always failed, any build 
> error will show up in the report.  It's definitely something to improve, 
> the runtime test reports differentiate regressions or "new failures" and 
> errors that have always been there.  This will also apply to builds at 
> some point, it's on the roadmap for the next few months.  Please bear 
> with us in the meantime.

At least the title of the email should report the 'delta' status of any 
tree it is testing: the difference to Linus's tree.

For example if Linus's tree is:

   linus/master build: 205 builds: 5 failed, 200 passed, 9 errors, 22 warnings (v6.2-rc7-xxx-xxxxxxxxxxx)

   [ mockup. ]

Then the tip/master email title should not be:

   tip/master build: 205 builds: 5 failed, 200 passed, 9 errors, 22 warnings (v6.2-rc7-273-gd67c17ddc899)

But something like this 'delta' report:

   tip/master build: 205 builds: PASS (v6.2-rc7-273-gd67c17ddc899)

Or if tip/master introduced new build failures/warnings, it should not 
report this:

   tip/master build: 205 builds: 6 failed, 199 passed, 10 errors, 24 warnings (v6.2-rc7-273-gd67c17ddc899)

... but should report something like this:

   tip/master build: 205 builds: FAIL [+1 errors, +2 warnings] (v6.2-rc7-273-gd67c17ddc899)

BTW., if I got such 'delta' emails I could guarantee to handle each and 
every one of them. With the current format it's the occasional spot check 
of these emails and a frustrating excercise of trying to figure out the 
delta to Linus's tree - and failing.

Yes, if tip/master has an older base then these might not be entirely 
accurate deltas, but *that* is something maintainers can fix in their 
routine flow: merge in Linus's latest or fix a bug newly introduced 
upstream.

But prominently displaying years-old bugs as 'errors' in the title is not 
just misleading, it's actively counterproductive. The primary output of 
continuous integration reports must always be 'delta' based.

> About the actual kernel build error, I guess it's a shame nobody has 
> fixed this yet. [...]

The main problem with the reports here is that there's no way to determine 
'at a glance' whether there's any regressions compared to Linus's tree - 
which is really what maintainers of non-Linus trees care about.

The figures the bot sends out as email titles are fine for Linus's tree I 
suspect, but are misleading in this form for any maintainer tree.

Thanks,

	Ingo
