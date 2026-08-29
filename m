Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431E2620DE
	for <kernelci@lists.linux.dev>; Sat, 29 Aug 2026 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001057; cv=pass; b=LmY1sJKJob9TgtWkPEbSrDAhm6udfdbp9eqxPVad3eLHTpZhdIbyb+yTBUd5FXxeRTxlZFgX8yo0iUWxnbkcd80v7V4KEy6oy3uDqrYbN6AjoPxh7SyxiEYuiTCoSawN3/o/qTtEm1vIFkbM/PMdEzE56iP+4ivSdGSYS8JyUks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001057; c=relaxed/simple;
	bh=hsBKohLfCZd0jfnALC1cEzA++W2MrcDhahlgqPLVM7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmJ0qU20IDcrvW6qZpI3WdCxy+xyc1FoD4Z+6NOUWO88PKINuLgw/4ZJ1tV9/cgO/hInc6weCGtnJJXDauhqc3PyCJJB1or78Qhi2Cqm0nsorfwg1Ew2DrmPRhRRaFB8h5jXRzhcs7iA0nZNmFVEAI+XHfrDt+Jl9eiOatUeb6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZ7w8KFe; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZ7w8KFe"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5862bc921so4444275ad.1
        for <kernelci@lists.linux.dev>; Sat, 29 Aug 2026 03:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001056; cv=none;
        d=google.com; s=arc-20260327;
        b=BHEnP0NUILJqBPxbqhNo2NFC+Nf7HDYY4QILHfWfTjKYqJWbbT/I6b+BrTZUS15gJl
         UgfM0dWwYrKreRW8KsepCMpk7SWaHyXc6o7owndVKhj9yKJoQXhCS4ocRwzdkDQ02w/h
         M4sVZeL6mpOJuz91pWHyr1Q4XkVGIoPs/kfy/oCj9AcTsw5EcwnHKT5SLCXdg6kJBIRI
         Pw4IzlpM0e0h6Fk7o+bOZ6r2HYV4PSyiTYHCM8WhzmbTVnHN8XR8hwOZVlsJO5WUURU8
         AT6kWB7HL6hGJXcK8fZm/h9fom4J4iqszbqGBXoCm1M+ziVHHx8YYAwbNjBYibGpTPaj
         vUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        fh=VJ6NJfV4C1Ews/ZZEdaWkyCfAfCW5GjQODlLttF5f0Q=;
        b=HGOi9AEOtD1bfUmwYrgDZOuetcT1uqsdyHUzP6hKSB32/cFx1Ee3+Z41bQBOCQkpER
         r6xBoEx6oFwhT1Z1lQgF20aL8aJS14P9dldGsrct1StrJIJCSmrQiEka78kFwlP+zuNF
         lLPZwYPw/5Auc8OqSGEHPAMLw+348TtOiQDjWQbO7Ukyin1B2SMdVgIyGfVKCb8OItKU
         PxkqLaJZONmWGAZTbLSMEvxh92RWqQwpbJu3A7xFPC0dNh08y3Rh5MRhrisZ6uymN8CV
         XfsGmxRMGnuuhjxINhuguVKWPsC7AcX3cuc3fDkWGY4lQuBL2kRaiIHd09HXoSjzXAWU
         F/BQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001056; x=1788605856; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=AZ7w8KFegRoX+WBAnDw3o546qS+1qum8bozUrgkXUNtY9BDoi/ZgC7fUhenXsKyrsk
         mUjeKwWpN9jBKSdI87wbu5JPYjbci54HcShWhHXIeAU0x6S4RJSYPvoGuVzRKrXPtzgX
         QJ4BzRkMYrzhSuKl3+eLRJUU2Q3zU2D/hT13OwikDxyYp1OygvU0kCTOmq5Yt8i08DbM
         HTcnKfVisWaestA4IEDdRQmuHaZFopk2wtBc6p8+bzeGet7+Ib9+FsSWKQhhqCmEfZ8L
         ciqNRyB3CaMntt7QKZfv1SxcQqtfTJ/Ypv2RJWUOgk0N7/urqmKYh763LzupDFiGxegt
         wq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001056; x=1788605856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=h6EpSOqG0e8lI4EVprDxqEl0b8jbNS9eMQpjwrDTn2NNrVnGNlMHi0ehP05HifDEuU
         m84c4PFWrzjAHAsQoW+u3yRlpVtN5MR7lrruE3KH8z4Hz3FAIKhsY+XIBrmOuAuEtGnb
         9zZX5bxUkzA6wfoUueQS4gM/JErIVGDtVPdB2c1CQ2hug4mav3vAvf6uAxLDoGKmoduf
         kz6tOPEO+lMtn8quS1zzHaSog8h/gdZ25gJgO4brH/MYxulzE6dGDdPqSUShXE/vU/LU
         ptljvnN2epCxMPbgKV0HUMzoGjqz2W6W2Jx1f7VgEB6EmVjBQEzjKx2wS3YVGTZWJAUZ
         9zlw==
X-Forwarded-Encrypted: i=1; AKwUvByrx7RpD0eE4C/XCRy6Usg2hNKSV5calUbLCclE/hu6muHWAUbSj8m/EuWEYH6f2BYv0xh0Y73lgA==@lists.linux.dev
X-Gm-Message-State: AFuF++lynsRODvqUfnLb62d90obHMXv7jSbPICa6CKisON74QVkJZp4r
	D5BWrzj4Sko385QuSox14QiFAv1yv2FZIWErEEftCvZTYQpRf2nVYXtQy+YPDlD8IquZ6BGRiAm
	FSfWPbZFFPUigjRX+BsnFUgM67khU2bs=
X-Gm-Gg: AR+sD12lK3mHRjxF6TWW9I3JgOBVT55inapIEVUoBW7YiqKQ95Upb5QuiOnBZJ7uyyn
	YK8bB3qvPstzwB7j4o0WIQ6ZGCcio7dBb/d/dGZ1r3Id+3jD37yQMJ+1aNGoBU9PTOdnHyzkVA9
	ZHQhYENLXdGZiYVSld5F8+EBS7uj6NyZC4wDR95wgpHLbB6nYWfJ9zg0AncDGwaemGqc8rQGcn2
	rv/APrD5n/8Q3JTLyl5ythzA5/dtuXaS7TAdbM9kHrGDa+ax+YKfQay82hCO0m/V/TPO8K3voas
	ZzPKjm4E/3iowiSOzGtIMDL5apCdo5sj4OdKa+OZKBXVW5o1t7wVcatiXXef/CWN3omWZjZ1KFe
	kcJFz0Xandbzn6eT5ET5IDYsuk1/N1LM/khAJ29XZ8eWC6+eQLrbbVpR5bvhw
X-Received: by 2002:a17:903:1104:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2d74df62ccemr115727945ad.3.1788001055774; Sat, 29 Aug 2026
 03:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
In-Reply-To: <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 12:57:22 +0200
X-Gm-Features: AcwNN1U4Xd-ZPEH0J5NkeG85FCsQEWIBZhyX8xsSVfYp0sl8uMCqeYTmtDyhT2w
Message-ID: <CANiq72m0eemCPbEAvZSC49OZHyaNvQgbMdSDphT01no1B+YWEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 11:02=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> See "bc20c56e98e0 docs: changes: better document Python needs"
>
> Also it's explained briefly in the docs here:
>
>    https://www.kernel.org/doc/html/latest/process/changes.html#python
>
> So I guess that if it's needed for at least one build configuration,
> then it's not optional anymore.

Yeah, that is the commit I was referring to, but I am not sure what
that commit meant, i.e. if that were the case, then e.g. Rust would be
mandatory too since it is required for at least one build
configuration... :)

I guess the commit was trying to say "used in enough places" or
perhaps "the default config of at least one architecture" or "some
`make` targets" or a combination of all those, but it is not clear.

Cheers,
Miguel
