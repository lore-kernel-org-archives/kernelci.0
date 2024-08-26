Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DA61494CA
	for <kernelci@lists.linux.dev>; Mon, 26 Aug 2024 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668759; cv=none; b=fnC93NFOOJFTSRGvJBnWSE8VyCy4c8wW+K4xZbkxzoqHckNqJEZPv4KfVVRw86DJswOnQqT5cUBVQaXhHLgeccTM1Vi59HGpu1aqvZw3mm31WSe2FjNQ/VCTUQ9jTkRhlHTxmxRSlGbiB3SrobIUnvHW50JFiuX0GS2q4gRFN9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668759; c=relaxed/simple;
	bh=NGb09nu8bcX4JOdC9OAH5QhOcGf/v64KPeasTu1AQFc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=bUuaImAgHvcp7xqR1e7iMEWZ76gEvXVMS8G/HF35nf3U8XWhpjYVvZUs9d/4oXKkiEexVZ8W01Qswz3ZBiLwLyqMUGLeqw3jAeSEsQt9wGJtYYUhXI/8kUFlsMc0KcZt+QeGD7C+C+KyBZ9OgCEeI5V0zWOkFoFyNJqdL2I7C2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEkb/zad; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEkb/zad"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-371b97cfd6fso2603145f8f.2
        for <kernelci@lists.linux.dev>; Mon, 26 Aug 2024 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724668756; x=1725273556; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csHRzmSLB8cubIMRhSCaTM9J00EK37rAKP910ub2xKQ=;
        b=VEkb/zad+2Oaa3vRtA312/deRq70dDt4AM/lFJ83hu7FOUPmuZy1Ew2ZPDQh3d6SqI
         IoFNmiZvr8GRezkk5EPguVV/cnMDbyPWzRy7BSqGDsXIX+y47tqqk5bCdxb/Prur0dEg
         DEafA4C09ZUZ6lYrDbLrIXTyRv2odUIqZKCrGUohH/g+kRyEjO36AoGB+fNZ5/ooov3o
         FMx2GkQ2VxCgxRxEbFIuJaHWWIKfvaIuMHfqdxyMbU182ySSAsEv28CRU/jarD7+v3V/
         iDguU+KSPFXF1aC78ywQ4/GQqzKewSr5HmKOOZI1AkGMq053HxBchSRKhhBqdMfJBjFw
         rkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668756; x=1725273556;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csHRzmSLB8cubIMRhSCaTM9J00EK37rAKP910ub2xKQ=;
        b=P+IJ/dS+BuBAuai8Y+JwWycngJAFkkTv7tLEgP3OBIJMtfrEHFcsVJ8aKBVnF6wpmn
         I+jG2apP2BxTTA/VB2GgGL9RoXVvYHE3Hnc85WfiW1nmdXqR6Fk/lzynJDGkgd9qO+02
         /UMdczpv3jAIhaNcK5rCJaHIeusXgvwUsAFXxXWi/Rr1HsjzqQOp+HVuZhm1STBn9mR0
         u5silCXv5vC3YZ2Jq3R4e1Mn8nRH3DnXmGW8cjNsed/P0ZdCkshD2OhybJTBoVYiE1kA
         gHxFZC3NiMEo2aYzMLSKfrQN/UEqdbjNT1ogtNuzPo5Ocl8b5ZhkTuNzjUUReZjuAxCg
         4nVw==
X-Forwarded-Encrypted: i=1; AJvYcCWwYEy0PifqaWW5baItpKMdqaFGOpVGRjNrwPL/I85rwP2jmGvRjKonEbVA7crcfDNVCQ7/AFKpdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv4rME/+ptGYp3TUWpegpLOqbgaazf97zootQ5GBmGjEFc0jrE
	0vcGVRB/xAOcRpZhe/n4I/4oz719+blLCWKWy2rGExvZpsxuTEOI8+toJNpaUIE=
X-Google-Smtp-Source: AGHT+IEJ73jDZPmEW6oRN/MJW/naPWGDv1fbvprd6QSgC/R2Bmc/VX5ES6jHTpO2OB2M5biVqYKBOA==
X-Received: by 2002:a5d:5409:0:b0:368:460a:961d with SMTP id ffacd0b85a97d-373118522afmr5822618f8f.3.1724668755491;
        Mon, 26 Aug 2024 03:39:15 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8b86bsm185488925e9.4.2024.08.26.03.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 03:39:15 -0700 (PDT)
Message-ID: <a600ef28-67f8-40a7-87bb-886aa63f2f1a@gmail.com>
Date: Mon, 26 Aug 2024 13:39:13 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: Support more checkout data
From: Nikolai Kondrashov <spbnick@gmail.com>
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Mark Brown <broonie@kernel.org>,
 Philip Li <philip.li@intel.com>, Denys Fedoryshchenko
 <denys.f@collabora.com>, Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
References: <9ea96b8e-6490-4541-81eb-8bab011c8918@gmail.com>
Content-Language: en-US
In-Reply-To: <9ea96b8e-6490-4541-81eb-8bab011c8918@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/24 8:02 PM, Nikolai Kondrashov wrote:
> Hello again, everyone (potentially) involved with sending data to KCIDB,
> 
> The previous schema update (v4.4, test data enhancements) is already being
> deployed, but I have prepared more backwards-compatible changes to go out with
> v4.5.
> 
> This time I rolled everything into a single commit, but I'll split it up, if
> we have disagreements, or need to work more on the changes.
> 
> The PR is at https://github.com/kernelci/kcidb-io/pull/87
> 
> But I'll repeat the commit message here:
> 
> Add support for three more checkout fields: `git_commit_tags`,
> `git_commit_message`, and `git_repository_branch_tip`.
> 
> The `git_commit_tags` is an array of strings representing annotated tags
> pointing directly at the commit being checked out, as seen in the source
> repository. I.e. the output of `git tag --points-at <commit>`. Set to an empty
> array, if the commit has no tags.
> 
> The `git_commit_message` is intended to hold the complete message of the
> commit being checked out, *both* subject and body. I.e. the output of `git
> show -s --format=%B`. We're putting the subject and the body together, as it's
> quite easy to extract the subject in SQL, while full-text search is easier and
> more efficient to do over a single column.
> 
> Finally, the `git_repository_branch_tip` is a boolean flag, which should be
> set to `true`, when the commit being checked out is at the tip of the branch
> at the moment of the checkout (as specified in `start_time`). Essentially, if
> you're always testing only the tip of the branch, you can set this to `true`
> unconditionally. This flag would let us extract the checkouts which
> represented the branch state over time, and produce a rough history of branch
> changes, which we can then use for (regression) analysis and graphs, in lieu
> of actual commit graph walking.
> 
> The (abbreviated) schema for all three fields is below and is very simple:
> 
>     "git_commit_tags": {
>         "type": "array",
>         "items": {"type": "string"},
>     },
>     "git_commit_message": {"type": "string"},
>     "git_repository_branch_tip": {"type": "boolean"}
> 
> The PR has the complete schema, with inline docs.

I'm going to merge this and start work on the support on Wednesday, Aug 28, if
there are no objections by that time.

Nick
