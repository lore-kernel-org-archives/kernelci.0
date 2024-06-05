Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D2118FC94
	for <kernelci@lists.linux.dev>; Wed,  5 Jun 2024 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717581611; cv=none; b=CVMamQYmrSmpOOJEbSAXjOGYe9IjApdC/Sc40qZ7KJO9OOoEMltV/8LTmwtv63v+QX93n0KF0YYZ7FeLELVqQPLH2dETxaVerT/m0eoC7PAj2fO85g1S4/5RllmC5RFmLlDxQ0Dq/PETTFwcGnztDszNSMfgUa43gunCLm80G4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717581611; c=relaxed/simple;
	bh=+thXwnDInqNfxRygJ+qtZpPWvkiWgmqw4KWejs9EFkQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ejs0MRPVttyu9Ds/L4iBJYfw8Vu1PP//x7TxCW3Ea4MH6vZOryq3zE/yzZ8dK2/ulwXF5MdjpQ+8FlD3fvwm+XAXPcipAyQVnoPVvjkQ1hOJa2QyG+bUX3y3xBDqEHjZFajIGa8iGUXM9uc/3sIPNwjgudetRm0tD4mkm6eFkZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YX6dukez; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YX6dukez"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b912198f1so6057228e87.0
        for <kernelci@lists.linux.dev>; Wed, 05 Jun 2024 03:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717581608; x=1718186408; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA6ICDUTPaeuPqC0lydxqpzaZAA9Bmuf8DzZJdI01nU=;
        b=YX6dukezZmjjiIF5ziFXv9LxfuihO2nki4ESCdsw4zmrGkamHCJMO3ChbVOrJ+W9Wz
         47hVz7xikOJvAeZ+1m3okryf7FfrhKyqiOgCC8DOwKCcfWLImCtWX47kHRKKrtH7JTR9
         XqPA6To9NOOn2+oeE77Sp7yrmt7lYKuXALRwPiASFGWVoTzm/8uYO6QI/lioEh0JAEpu
         ohLmS6RBXxZflLzH862LptkuhzjJh9rUipH5iIvoNUsiP213Jbh4/1pd3YMV1eU7LxyL
         12hXt5rY72I0acBz4Ei4oytQKM2ItoAlyUHmFuK4ko/mTnOkIftfSqRR4QaCFiMbgxf6
         lulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717581608; x=1718186408;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AA6ICDUTPaeuPqC0lydxqpzaZAA9Bmuf8DzZJdI01nU=;
        b=fE6w6WuiL0gnPZrem5WVopKOSJ8CkqtFhOPG8wQcxRGlmbrI8Mq+9VHv8vR+DkjuT3
         gu4gmTvKZFYM3JFbjm8aB6458QJJov/uYoZ6qYHOiVBW/S/DvOy03L9h2z8cg/SJ/Byx
         raqPJpOixNUQKAojpwpYnnpGBSXN163OYznna1aymijX2ord7sHtkSYF1QJynCpQ2NHW
         kuHL4PNnecZ4HBc+9MDxYSPIGiFZCWyX8w2YMXrVoDYeKJuKeynEj7HPHvgvUNWKMu+r
         5Bg4Fmzt3egbv5e9kmTL2pmRepDY/1X8F3U0zq3opwTFrbFACmrXWRWUVZWzZqqQzn06
         MVIA==
X-Gm-Message-State: AOJu0Yz88csn32n8g4DOyaJj63a+B+j44VCYeHJkPb/2y3TCENhLXyX3
	owcXReCazee54JvK0ORJa0zBP5f5kOUBdY39XDfvg1cKDmf8wwJLr7ixRdzU
X-Google-Smtp-Source: AGHT+IEY4cQhDWS3vkRCbz9pJ9EBcxWmeBNQhS8j2625JVy0YqCCMywOpqFTStrtP6KTNMbb67wVmw==
X-Received: by 2002:a05:6512:3f8:b0:52b:7a5b:4773 with SMTP id 2adb3069b0e04-52bab4d3027mr1054692e87.24.1717581607534;
        Wed, 05 Jun 2024 03:00:07 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9e4c04bfsm651892e87.296.2024.06.05.03.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 03:00:06 -0700 (PDT)
Message-ID: <20f8a3d0-2246-4762-a981-4690bf6afcf7@gmail.com>
Date: Wed, 5 Jun 2024 13:00:05 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New name for new "KernelCI"
From: Nikolai Kondrashov <spbnick@gmail.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
Content-Language: en-US
In-Reply-To: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/23/24 6:54 PM, Nikolai Kondrashov wrote:
> As you know, we've been developing the new KernelCI API [1], and the
> kernelci-pipeline [2] based on it, for quite a while.
> 
> However, by now it seems that too many things are being called "KernelCI": the
> project, pieces of the old system, pieces of the new system. We would also
> like to give the name of KernelCI the project a wider scope than just a
> particular CI system, and accommodate more packages/projects under its name.
> 
> So we would like to propose to call the new system "KernelCI <Something>".
> 
> And this message is about that "<Something>".

Almost two weeks have passed from my original message, and we have collected a
number of opinions and potential names. So I went ahead and created a poll to
help us pick the new name:

https://forms.gle/GY2uWw3yGLA6u5EbA

The poll requires authenticating to Google to limit the number of votes, but
if anyone has a problem with that, just post your response here (pick all the
options you like), and I'll add it myself. We'll close the poll in a week.

If you've already responded with your preferences on the maillists, and don't
want them changed, there's no need to vote again (although you can).

Our options (assume each is used with "KernelCI" in front):

Anthill
Arrow
Kraken
Lens
Lighthouse
Maestro
Needle
Nucleus
PristineCI
Pulse
Sense
Sensei
Tamanduá
Trails
Warden
Yuga


Thank you!
Nick
