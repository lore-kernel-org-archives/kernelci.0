Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4B16FF56
	for <kernelci@lists.linux.dev>; Fri,  1 Mar 2024 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709302881; cv=none; b=dZbQw1MUXwrWKpGNW3ybc0954NWRXlA101qmCzYrK7cBU8aobtzVTMPmEltcQBBx78bbe4por6E2O5aoInBu9AFQQNSY3vGPsnjTOx063FyIoqSP+Gd/NCJttokz/a0mJhjWjrWRbYszf1rxGWK6QzSYgXbMbkBKky9GAPYgVrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709302881; c=relaxed/simple;
	bh=udLEyhFlle918jMDpugSYsT1ztgbuuWE8/UQvqTOgvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcqnpAtYGWNqM38FdQ8fAje+R9jiDuIzpp8PwGi0q68Lnea34gyB1N/UcnWCv8SnoimAPVoItcOdZSQKrfuDqnDOAjM4o6cx6WsBwESOMs+1MnfQYj/ES5318MT64Xg7xhwTQJ9BwR/Khp4xu9pmLjGg+nlMdwx/bck9HrhUQI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdI4SOS1; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdI4SOS1"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-68fb71fc886so8780976d6.3
        for <kernelci@lists.linux.dev>; Fri, 01 Mar 2024 06:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709302879; x=1709907679; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoAmmdskcDEXNaQow37B4LW3k1Xhhw94dVezbr43csY=;
        b=hdI4SOS1B+bV4pgTIY2sX9THWz5Kb103bZNcjKUIlkV5U4rnUByH4OTGSLAJ9d39SF
         dDvFMXfL3RDDuUPk6n7HGrfO+JHOE7qKpUxKs67tp1yjgKm7lET+8spNkhCTVMZanQ9d
         d19oAX7ViL2StzrxbcamYVOp7YAAUKw4BrttWrpe3H0C0b/Uy3tyUlFKSMDsb6tHAHa+
         CZ2gMcXTDyXRQwPLRY3AorjmQVq7AOjTChhhe64MzI5ws74DMcVyPp5if/5t5UYpoXMS
         DEcqkgTZFgtgmZcdqYrk2su2lyEkc654b20XxHZYL6WB+0vKvBkTQWehvsU8swNPthCq
         aslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709302879; x=1709907679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoAmmdskcDEXNaQow37B4LW3k1Xhhw94dVezbr43csY=;
        b=knoYaT71cgZvOMf5kyc8Dc36KER9JA9HR3tAQSIIbEJslkA7197d0uy3TAyo0Zq6tm
         Vfj2c2gAXeBFLoeKtJKgiNfuReNfIbALmP744xRfq/qSnCkUmFBi4M8NNitE0TXDi6IC
         u8Qh5FNuUolxS2cWq4KATbmKefbw8s5+RvDxj1oVC6TFlTy4Eh2Zclae5QD8/cKXoemN
         R1QPx6GcVhgjTok7V+CyfeSZ9FxEBTLtqyE82wXKgfSPNDcW9RLJ0hXlqGTEHYTtTG5U
         9UN+FiOYelXsJoG7jOVrgJTD0ZCLp7zw23j4DNxRxcKwRea58qy//51SEZ/PziV4PeXl
         XnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0xTlgSaoTwaeYTe/zCGyJR87mB4I3Pp8fx0Ev2jjZa+bbOGEyFcfXcb7Ly6sH8enTGcXodWPYACtyaHJqc8cnLl7l4uOhab0=
X-Gm-Message-State: AOJu0YxwljyZExF67nh6w8vzY1oCSOFbHHf+iUuxeR3O5HKDozZzURbE
	/vv6WaX5mOZ102C3p1/mUb56ZAHxfxQAFroL/UBqpVwcpCc0ui90
X-Google-Smtp-Source: AGHT+IGUka20RbGSTdt31weLyZD5CrTDkIoL5pB4A7Y1ldsaQGmBLLgCExV8/nV3WHdz4i56V+bA9Q==
X-Received: by 2002:ad4:44a7:0:b0:68f:3dbd:466f with SMTP id n7-20020ad444a7000000b0068f3dbd466fmr1814520qvt.39.1709302879223;
        Fri, 01 Mar 2024 06:21:19 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id em19-20020ad44f93000000b0068fdb03a3a3sm1900825qvb.95.2024.03.01.06.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 06:21:18 -0800 (PST)
Message-ID: <f8d45e8f-81ca-432f-9494-441e9a44b390@gmail.com>
Date: Fri, 1 Mar 2024 16:21:13 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Helen Koike <helen.koike@collabora.com>,
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
 <9183479f-eea8-493e-9a56-9f3f778e3034@sirena.org.uk>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <9183479f-eea8-493e-9a56-9f3f778e3034@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/24 4:07 PM, Mark Brown wrote:
> On Fri, Mar 01, 2024 at 12:27:13PM +0200, Nikolai Kondrashov wrote:
>> On 2/29/24 10:21 PM, Linus Torvalds wrote:
>>> I would suggest the CI project be separate from the kernel.
> 
>> It is possible to have a GitLab CI setup with the YAML files in a separate
>> repository. And we can start with that. However, ultimately I think it's
>> better to have it in the same repo with the code being tested. This way you
>> could submit code changes together with the required tweaks to the CI to keep
>> it passing, making development smoother and faster.
> 
>> With that in mind, and if you agree, where else would you say we could put it?
>> Under "scripts"? Or "Documentation"? And where it would be best for the
>> various subsystems to put theirs? Or could we have the top-level "ci" dir and
>> pile all the different setups there? Or would you like to wait and see how
>> adoption goes, and then decide?
> 
> If we were going to put bits of this in tree how about something like
> tools/testing/forges?  I'd hope that things could be shared by multiple
> services, if not we could always have subdirs I guess.  We could put
> glue bits like defining how to run kunit, checkpatch or whatever with
> these systems in there so people can share figuring that bit out.
> Individual trees or CI systems using these forge based systems could
> then reference these files when defining what specific tests they want
> to run when which seems more like where the differences will be.
> 
> I'm not super familiar with this stuff, the above is based on it looking
> like there's an OK degree of separation between the "what to run" and
> "how to run" bits.  I might be misreading things, and it's not clear to
> me how often it'll be useful to be able to update things in tree.

Yes, facilitating reuse and collaboration between CI setups, even if they're 
largely different, is another good reason to have it inside the kernel repo.

Nick
