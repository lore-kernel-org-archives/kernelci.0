Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466381F7569
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997991; cv=none; b=PY9Ip3+AB+2Ez0lqFSNkWI4EaW+4zmYCAzahfjGO2yzpZldfZEFhgH5gDmJW7Eo18j3uVsCLaTyveO9wT/1SpzipqQBcYrIdX/X56vAxMK+QGZtyYjUXRMJw/5ZAk6DIewKcYkq8LWvSuyeMTTAXzvl+/DIu6fMcAbclV00EARk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997991; c=relaxed/simple;
	bh=gKMasaJgnST+gSNq4bwPdzLlWw2n/Gz2/XeOLnzeZ1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pm6JIlxQ0BYcZCcQWUROmfDCeUcHumwivHv3YN9vQbJKqTpO7tblzCCR+guWQVVkYnSmckhWKP8YVwImHj+nA3TSoIY26Ewc9+zYYDwlTANdtlsVapE1frT6E/8wVHyRU/j7JQyAnkIUfRYQ64DAGszD6JEs+TOvr/3NsUyQN3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbxbY32e; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbxbY32e"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-78f30dac856so7958756d6.2
        for <kernelci@lists.linux.dev>; Thu, 09 Oct 2025 01:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759997989; x=1760602789; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gKMasaJgnST+gSNq4bwPdzLlWw2n/Gz2/XeOLnzeZ1c=;
        b=kbxbY32ewGeA0i4o5z09MWWeq/PKjQZkxKvfeR/vsBu69Rqkk0aiIwDLmOk9b2f2e0
         CNrqoa+iNUJA7LfGJn4Q/9eFhSTldXZhbUgvvqRkQI554mWI43y575htfGMi9AL3Vh+R
         dDE6fmFRqZDHMHK16jQcxi6qZSmRfrXr0vz3Q65+ZwAbxFbNr/oPFPSYeyB57bCvaOK4
         hjGef1+sqE4wUyy9MPUEw6nvpHdu//olxKoDMzKr6xUA5ETmLvMbzIZlJ718e/I4OjmU
         cTNMr1msXY+u/vQgak6R2mcGS6f2PhlQarw56xc092kzp+/wmR28Qp8+HsQZ3pUUS2jP
         L9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997989; x=1760602789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKMasaJgnST+gSNq4bwPdzLlWw2n/Gz2/XeOLnzeZ1c=;
        b=Br1ZSkSpsB/5fTHAkGXVmH80C7N2cDzQO2jkFJlhovSCOcvx4sGxFCmIlZV4FdlwhR
         u7sTVPeRJjv7sV7aI5s9sdK1r6UVzNPUiPyp9YWZlmua/bbsRUR8cIgtohdCmZ93pN2M
         TTHrrvVcsupsg6aSDBnpX/pLXo/oH4YAYkAeLKdj4+uWgB0zlDG8r2ajHN03etkcAsBM
         GhMHdYLLO/pLnLKxPiz3t32eeYaNEpEkilQmHSr2C7pOPZ877D004td6s/EKp0UAM9hm
         qa/F2Hq+1f+OtVrxYTEW4SJeB3nCmzzuOVhqmzWtmDxo/d/X3GBpxzMNLxqSdVD/ZDfU
         UEyQ==
X-Gm-Message-State: AOJu0Yz8Cy2uipAkIkTGehxY3t1RV2G3BdewcWr+uDjXxuoe/w4PnH0E
	v3zX3uzvOd3O/hZO5rcK8POIBMzWTsM4Oq2d58l9YKYr3iOJ2Q7dg3Uk/7tbcTZLJrxnS9fmMRF
	H+K1ZuGw7+D83uNHF++T4segYK+3cqELpnONPTDLj
X-Gm-Gg: ASbGncuUdKCOqu/dTch5RT4kZQqWqxaZgmml9QIGMr0pj0lxFbX40/Huq292i3x2b5T
	T1nYX3pZmRD+hhiPx1o3heY1MZS4JMI0ZhVC5QdSfvQFg4808jlwgP56z/LgGLEpSW9Yj0sMswz
	GN9gexHiXfxNRUdHVUCAwI9XFtoyyJAZnZm46GwRv/vKFE/R4t1WA1Zd+KbymO9neCyRlJfTfSE
	F+SO7RY2kWEoFnE7570gqXRgZDhXIOE
X-Google-Smtp-Source: AGHT+IEf52Zdjarhj98xrutH3+2jaqbCL2dEBtvU8zks20nf0gusBayFr6ODG5nwIco0tNEdZTOc9vbrAJbL3epAtoU=
X-Received: by 2002:ad4:5764:0:b0:823:f922:8f10 with SMTP id
 6a1803df08f44-87b210ab14cmr112334116d6.30.1759997989088; Thu, 09 Oct 2025
 01:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4e471946538c47cd9d000fa7ba31044e@ti.com>
In-Reply-To: <4e471946538c47cd9d000fa7ba31044e@ti.com>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Thu, 9 Oct 2025 09:19:38 +0100
X-Gm-Features: AS18NWD-OZaNreK2Z85z4GFFT2r5Q6hPe2GDmrZAHLKPWxs7VfcQitl6RIMPK1w
Message-ID: <CAL0q8a5Wu0x2+bxnRCTEgfefPdsT2PvCvoQLAQ=2sMuWgXBhvQ@mail.gmail.com>
Subject: Re: Hardware registry schema proposal
To: "Hambardzumyan, Minas" <minas@ti.com>
Cc: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>, "Menon, Nishanth" <nm@ti.com>, 
	"Sheraw, Barry" <bsheraw@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hello Minas,

On Wed, 8 Oct 2025 at 22:20, Hambardzumyan, Minas <minas@ti.com> wrote:
>
> Hello,
>
> I signed up a couple of weeks ago to propose a schema for organizing information about the hardware tested in Kernel-CI labs.
>
> Please review and share your comments on a proposed schema here:
> https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/main/hardware_registry/hardware_registry_schema.yaml
>
> along with an example yaml file here:
> https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/main/hardware_registry/hardware_registry.yaml
>
> In summary, the schema defines following main sections with cross references:
>
> * silicon_vendors: A collection of silicon vendors (processors, SOCs)
> * platform_vendors: A collection of platform vendors (servers, laptops, boards, etc.)
> * processors: A collection of processors used on tested platforms
> * system_modules: A collection of system modules (SoMs, SiPs)
> * platforms: A collection of platforms tested in labs

I think it would also make sense to add revisions in.

If you look at LAVA, you can see the messiness of not having revisions
https://gitlab.com/lava/lava/-/tree/master/etc/dispatcher-config/device-types?ref_type=heads

Ben

>
> Regards,
> Minas.
>
