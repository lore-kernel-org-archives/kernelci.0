Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF8D514
	for <kernelci@lists.linux.dev>; Wed,  4 Oct 2023 11:57:06 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9ad8bf9bfabso384079766b.3
        for <kernelci@lists.linux.dev>; Wed, 04 Oct 2023 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696420625; x=1697025425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fak30zwIiRXPdGytZy+WPP26tw0Ab0tFEc/CFJJqvio=;
        b=I4X4B/aC11Mw7JHwDwv4N5fu1RtId++2frqTKrX79LGjtPMD9UycWW4Y6//SHVlJNF
         MkDlv2XgZ8b0bix/AvGudpxVMlNDA9VUv2HrkqknMA4iYqwyf02L/4Yr7eSft5ZXFN3y
         TxC38c5WWcCHfbFcoxSw7aNc7C6VMtcnJOb7poRo3cqrlG0BVV0rFo+W+4xERs7o59CW
         kcgXfzNR7OgbuvMmiWJ1s2NaEjcMcSLm0GtihvPPL+oV4xZAuGSq3lcf5Pcl39GOfn3q
         MldvRcrw4+xXi2BIstJkx4j2Yrw12SfO1i5NtrNUkzrjVD/63H73U9HcSzlaKPwx8bRT
         AZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696420625; x=1697025425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fak30zwIiRXPdGytZy+WPP26tw0Ab0tFEc/CFJJqvio=;
        b=SwLh45vSuCPbzLFzQ1SUQ+EG8VKJeNb+NA6hYNT0hmV73j/WFLX8WZEBqjlUlVGM2x
         +nGC2qRCDrHz3qayy4Gn6GEu+XjiiZ3kreyie8xnaa7ThiaqDDoEFBqSYxpKqE0LuVGi
         Wprtj0ycF0oxytPhs3sK4P3KNrC7BN1DQsvuDiqisznH4W6gm/njeQmz96coG5rpho3S
         RIBnODcPczxG3K3wtRRLm8/Qk79o7mEDPCpxLaQzie1Zpki3tzW+HlxAvOEyID9GzhJV
         ZaxXsxZM/h49Azu+Ds9TbBmEC0/ke3BkHRkSjno9m9N8mpb86iHV1Tbx1YqbepwQPwvb
         gC1g==
X-Gm-Message-State: AOJu0YxZ6DKfHJDJCiUpaXJH8eFdhSLtVi9+m4DEvUjnupwEVFurP8da
	JBTqBdOmsN2qWJW/luFEm2Q=
X-Google-Smtp-Source: AGHT+IE03ZTyX7Eihovbzbz3HYkX9qA5aSQe4jD1PMIq/BajgzJB0aV3dLHpGoiupjoaZgiSKEEsmQ==
X-Received: by 2002:a17:906:3289:b0:9ae:3e72:7c72 with SMTP id 9-20020a170906328900b009ae3e727c72mr1818051ejw.58.1696420625095;
        Wed, 04 Oct 2023 04:57:05 -0700 (PDT)
Received: from gmail.com (1F2EF530.nat.pool.telekom.hu. [31.46.245.48])
        by smtp.gmail.com with ESMTPSA id u16-20020a17090657d000b009937e7c4e54sm2681045ejr.39.2023.10.04.04.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 04:57:03 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Wed, 4 Oct 2023 13:57:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	kernelci-results@groups.io, kernelci@lists.linux.dev
Subject: Re: Request: better kernelCI reporting format [was: Re: tip/master
 baseline: 48 runs, 4 regressions (v6.6-rc4-243-g46219a3ac1db)]
Message-ID: <ZR1TDeD1gizPw3Ip@gmail.com>
References: <651d30c3.170a0220.b0a5a.85ad@mx.google.com>
 <ZR04v1/jeToNEOzJ@gmail.com>
 <13d74236-ac7b-4ebe-5bbd-ffd59b76929f@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13d74236-ac7b-4ebe-5bbd-ffd59b76929f@collabora.com>


* Guillaume Tucker <guillaume.tucker@collabora.com> wrote:

> Thanks for the feedback.  We're well aware of the issues with
> these email reports and there's already a plan to entirely rework
> them with the new KernelCI implementation currently under way.

Cool! :-)

> In particular, there will be improvements around tracking known
> issues which will also help enabling bisection email reports
> again.  Replying to the original thread with the patch from the
> lore archives is the ideal way to report issues, and bisections
> as well as "pre-merge" testing of patches allows this.
> 
> Regressions that haven't led to a successful bisection will need
> to be reported similarly to what we have here but as you
> highlighted, repeating known information is not useful.  The
> emails could for example just mention new regressions, and
> provide a link to the new web dashboard with more details about
> all known regressions.
> 
> If these current email reports are mostly causing noise on the
> x86 list and aren't useful then I would suggest to filter them
> out for now or we can just stop sending them until we have a
> better reporting system in place, in the coming months.

Nah, they are still quite useful - which is why I'm complaining
about the format :-)

Thanks,

	Ingo
