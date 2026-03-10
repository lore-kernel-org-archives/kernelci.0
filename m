Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA48B3AB266
	for <kernelci@lists.linux.dev>; Tue, 10 Mar 2026 16:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158774; cv=pass; b=A5IqUDORdyhTftkFo/Vxesib48ZXclp73+G50+5hD0weVBmRKHgZX09q5xYZ15XHIlVQoELVK+BRjRjCktl8lx+ZP/qY8RJKY0EKFlJjb4gAfVPiwqmCytUGLtvw5MgiKX10mbVCSbIWdWqyFZw3AbfRp5HLUWu4dAzkqShH+fU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158774; c=relaxed/simple;
	bh=RK6R9rcIZk+e5cMcZQwbS/S4iz6ZqZixmQKbOi/v3zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fqzfl2HZ06qrp1PCdFtYtzRM9zyV0YkJlXAJaXoqOQ2WhBMBDSzCIwQTdy/QLc0AVgO+Tpm7xr13pI9xpqQ/ABLQFDTdjyLVuC3+cz2iLxWU+hNcy8nvugFIX1Enu31XSQ1YHMjbaVh6JsAJmpwrHEYhqU6LLQZI5A/Y15KjUq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3s+7gkv; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3s+7gkv"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-899d6b7b073so146082786d6.2
        for <kernelci@lists.linux.dev>; Tue, 10 Mar 2026 09:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773158773; cv=none;
        d=google.com; s=arc-20240605;
        b=bGCTz5A1c+ocUaDzHpbWU0ddf/LmYwsqUl4txmpLJoggR+DPkzXq3ahEi4dRk1Z9/y
         aIqgL4+KIR/zNy0Gkc9rpV68JFvV5j1oULDcFYli86r1Xes56+Zaze6/482Lzlx61+wK
         MrP4ATyU/Gk1+EMbgNaPAWEd63Z/Qn2ViSJ3l6YqcdbsfVbUcRI7p3Tjl9+5wRVYVEI9
         AtQAYnMwUuw4+nHryxpy5ie02EOlF2JA8e6oH9aTCe8eI2ame7naAvu7ZQGBmCxKURh2
         3SMvaq4wHz6/gKU+FoVwXbqAp/DqEczEoUJtaRieI+JhEmEKGFOQeCuDNwk/rt9oW3Js
         vV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CXb0GUhoJ8MMg6VDp98gUQrVR9GMvFF9B7HPSclxQtE=;
        fh=33RbU1r3/6xw/NVzDBACaieBayloTW8o7GgVRjKJhVg=;
        b=T02bWtK+2NUuCxtDtrvChwaYzkptlLbVez+fgKQUjVBNZaCpwqKWRSxgj45q/oMPV8
         xyK72BA2cQdpaSAOk45mV1KxpgQ31+pgqAi+L6Ztxn/ZdHfWj10QEQIDUYq9RkOaU8XS
         3LdAvqZUqiDGdsEwh3Kifs/JtGHS5YiraaR+uBDsv2DEfUivFZqui+YFfaCe9B3wdOIw
         sv6yJ0t8szVym66iVz2h0zu30a/7KQ+mCQAgaz1nicleInmtPaMkUgL9N0tEbrrXwI5t
         GE2rz3Rss8qd199XgnFkIS4lOuDZXcw9B/mMhZLIBxLAfEkfya616XRIQ2ndEwNro3m2
         uKRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773158773; x=1773763573; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CXb0GUhoJ8MMg6VDp98gUQrVR9GMvFF9B7HPSclxQtE=;
        b=Z3s+7gkvujunT33uEFxaCGuwM/7SUVYgoFVaxiiWGv3B1pIrg7egB6e3KSf0jQVhbW
         n+Xj7GifAiGPVQX7LSed+ppaa2n21sNx6pUS0ovVWQeJciuYf21dXK7eE+ZtHab5y92m
         jRQ1OLVsxaAth3y0rGYp7qm1Wb4evx+C2M0feJ3sLLnqPEdo9MwwuLlxI66J4waPSSJR
         woZ/eM1ZOa5OTAta9TqeJz7y0J3wiZvejAX7Y2muPGxPDcE6OypjZ5EkPraR6omNoKEQ
         qylw8BJy2YFRJLmXjXoMx4iMncPzA+eDqW3CSKMmahMdjLPhHE74hpM7IZshAbng6WQC
         B1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158773; x=1773763573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXb0GUhoJ8MMg6VDp98gUQrVR9GMvFF9B7HPSclxQtE=;
        b=h9vPyoviVHFIKFBmoOUKv4ar4UiezRgcWmVsfx+JP+u0NzG4SOQ7efFz8YRuB+wOEi
         h5teV0SVsHGqtrltnWVkFDWNdlUb5oCZ+xlBGHqdpB/orDnKtk7z7O8a6OQH9bLOxaWO
         bhDFztTY2FpvaOF+vUl8Hen6uZN5m/w18M3ea5MrBBRqxWMj2um/2QsOw1EU0qfZsVJo
         f4YhKDNjl9+sozylzmGNSlEhz5gApeD7eAqRO5YRn1QpNob70TfVcvpbziUqilq0N8Fo
         FQzXwtAF5CC09N8pZtm/KKCn9Wu7PBqRB4TAU2qSOg40VBG20EsmaPRwNi03aVwjQxSz
         bzcQ==
X-Gm-Message-State: AOJu0YyeTD4/Bu72M/FNM7ctemu3c1x3v/NiJDuxFbBepGgKfQE6V+cS
	v0JXjFo2DUPylTrnRPiV/lzbAVhIurjJsIaVcIUe5LoQw2fN6vavFKNmTwlLQgSIUxSjxCPv3iV
	ugVv9AbNf1c8wGAXkxIYaUwoYLdf88pIRpLbqCq2g9mAAqh8ekFh7/A==
X-Gm-Gg: ATEYQzxO86JYbtdAS3m1cR0jC0HDLPDf9a3sqfZacipSUa1gUdufBXgmTdaxbCLyMe+
	wVStWcVgLw18HiLxCpSPuuh1hqrL276y3WlMM3kjiXmu+Pz2JrmeZkePSOg32J/cxJqYwxTYgrj
	sZIxnYUC9F3EUc0plplmUgAkD1mznpQ6tCKotkxW+/xBELxm32ylkK0fOq6eHlchhoWyetirg6v
	OZoqxOr+zvpwht0Zgk/ZHLOd69G4j5bjttkYZF2s+nQalOsQfJQsG77F2i4ZoHGWO1/Suzcz2Az
	02Rj5BGqVnFWbzwjO32CnPL2ZAAvE4jW7bo+fESI79nJ4o2MLs8eTF2NJj6j
X-Received: by 2002:ad4:5c68:0:b0:89a:8be:9d49 with SMTP id
 6a1803df08f44-89a30aa042cmr221783126d6.31.1773158772541; Tue, 10 Mar 2026
 09:06:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <5847e9d0-2ddf-4d8d-b080-9f0c18b83e10@heusel.eu>
In-Reply-To: <5847e9d0-2ddf-4d8d-b080-9f0c18b83e10@heusel.eu>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Tue, 10 Mar 2026 16:06:01 +0000
X-Gm-Features: AaiRm53PJZPQSE5e-h3vjeQAzVuh7ZpHytIctEmqNbDvhT_B1sUOQ4jbW6QB8ZI
Message-ID: <CAL0q8a7ABpLDWzw1m0tshcfgx2tzcDC4dLjpPG4kKjbfK6AQFQ@mail.gmail.com>
Subject: Re: Meeting proposal for KernelCI Bisection
To: Christian Heusel <christian@heusel.eu>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hello Christian,

On Tue, 10 Mar 2026 at 14:23, Christian Heusel <christian@heusel.eu> wrote:
>
> On 26/03/04 05:28PM, Ben Copeland wrote:
> > Hello all,
>
> Hey!
>
> > On the KernelCI roadmap, I propose we start a discussion on adding
> > Automated Bisection into KernelCI.
> >
> > We have many options and have learnt many lessons from past
> > experiences. KernelCI today lacks the ability to do automated
> > bisection. So I would like to put the meeting together to cover
> >
> >  - What bisection in Kernelci should look like
> >  - How do we go about Bisection at an efficient computational cost
> >  - What are the options for automation
> >  - Put together actions list
> >
> > Bisection needs to fit into KernelCI V2 tooling (i.e., Kubernetes,
> > kci-dev). We also want to provide bisected results to the Maestro
> > mailing list.
> >
> > I have a list of people to include on a call. If you are interested,
> > please let me know, and I will add you to the meeting.
>
> I would be interested to join aswell, could you invite me? I did a lot
> of bisection work within the Arch Linux distribution and would
> potentially be interested to provide some input and maybe use the
> resulting tooling!

Great, would be good to get your input! I have added you to the meeting invite.

Regards

Ben

>
> > I propose the meeting for Thursday, 19 March, at 15:00 UTC.
> >
> > Regards,
> > Ben
>
> Cheers,
> Chris
