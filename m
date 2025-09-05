Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70323E342
	for <kernelci@lists.linux.dev>; Fri,  5 Sep 2025 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757094641; cv=none; b=uwy1DMk/tW8gx3aTY/CIiCpQTkwSvDrnoz0ii8oBCRDSfT+VYrIQT4bHndy2BpYX6OkogE8+Q0fV6WiKcAlLhjfLrHL7UNzmUzfExSKoCD+ND7GJIde117qtzFmiDf7c1/5qmGNrRDEWM33Vl27evDkjfQnhPoGQojk7I5gvofY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757094641; c=relaxed/simple;
	bh=U9r/KVzDQgUE7XgRy4to0H11oTUFvVnZ0Zrb+KMY6nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYA/HxQF40+7adDA/O+1YJ86sAny1aS09VLCYD9amDC8W+KUEiiMVnqp3LaPctpDJA2kptz2W1b7Vs0YZtYmzCsyJNbe/UProsknxELKSrrzB0kRC5vxDTJ7WG0rWs76RvaGL6nC4/c35WiOpif7tLFooO3t43qzo0lJw3mTb6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eoeObWna; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eoeObWna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757094638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sklPpsVgaMx0RE6OE7HNs4HITPNMtLsOCxV7kgu0FEY=;
	b=eoeObWnaC0es1XrCeZG9HyPwWWbxwbiMZ0yeJqh4gmM5fNYwLYGZ/myJJjJ2Us+gdaAL7w
	Y+nrgikAbXsMNA7W5EQbliMbyFbEAk3VY8GLMBlXEMuZbmy5oYGPU0ydefdgM19gWDKGXj
	RwTb8Sh/0539QikfL/piPENU4R/zr+U=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-AAbSWQVwN9e830HZ-8-fxg-1; Fri, 05 Sep 2025 13:50:37 -0400
X-MC-Unique: AAbSWQVwN9e830HZ-8-fxg-1
X-Mimecast-MFC-AGG-ID: AAbSWQVwN9e830HZ-8-fxg_1757094637
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e96d57eb1d0so4194770276.3
        for <kernelci@lists.linux.dev>; Fri, 05 Sep 2025 10:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757094636; x=1757699436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sklPpsVgaMx0RE6OE7HNs4HITPNMtLsOCxV7kgu0FEY=;
        b=QuxwCuxKfwsqZHEVj26QLcvbM6CXjYWvJbIfaETYrLp1C0kD4wxfxJWVLzrlcS8Gub
         nuSByXsCLa1FD12GFry70Si9zjFGkV3Z+1nTzURmiP4ZgYiEXlJnpt+3TcOyPUPOfxJa
         +c50Gc4BpUZDjrQg9yJOQHQ38JmV3f/4c45nQXREc9sA2Nf3CCC/XxXfjAoqKHhwZW6s
         Fu2BOeBYGDlXMVubO1uBaQBspKJLf6UNEIUXeJ4jMFYbzkxF8uwYfG95WfyhN0CCed7X
         E9lYPLyMC0xVnBWS81muNNYcJd7Ob1erTHqdKqcEoeHvZpDGJq59x+LIY+LTc7vwMQab
         UUAA==
X-Gm-Message-State: AOJu0YxX4UlQOHPi5/E4Vdc47SwODAmUf8ae1rCHYBR4nS0AP8htbbOr
	0lSSQjG5hI+byQAKZctcSZcuzM7jjMeg4qTVozGoeD7HrVikZOIjKanlHchr9ICq+AXIr2E562C
	y57StpyTqOKOGPbBag9xnHMqQBW3XW3/Dqw3HHwlQ9EnTH+aIQu3pifrVEUOMEXw75Vac1o5Axb
	3Erf6reJqPz2hWkkxIS6NsbGNVeKmfC8OJjo6LIn6O1mk=
X-Gm-Gg: ASbGncuQiMeFbYhTsFg3hsOWwD31Nprcn7i0ns6xWNrhG7o+BHUtaIJ/a383pdSWFQ6
	KQC4xyulfW9/kVV9hoOiotCPuM//F446yn+uUyfuU6VbxBmR4vZWDgImRGOm80MvOIGFkqyRb4q
	tm/srNRRWjTR7E+1IGHnoVLuJdyhXbBghZsB6N59LpZIfcwz4JXyAU7EA=
X-Received: by 2002:a05:690e:2492:b0:5fa:da4a:cea9 with SMTP id 956f58d0204a3-60177dd1d02mr5053369d50.31.1757094636474;
        Fri, 05 Sep 2025 10:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0uGUcenlb9Pjlgom1P1aLBJzv1x4txpmD5EDNR4fQlZwZnpGZIH+eze0PFv6mdCyAc+baI8Lb3xfGvl7VfkE=
X-Received: by 2002:a05:690e:2492:b0:5fa:da4a:cea9 with SMTP id
 956f58d0204a3-60177dd1d02mr5053352d50.31.1757094636071; Fri, 05 Sep 2025
 10:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
In-Reply-To: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Fri, 5 Sep 2025 13:50:23 -0400
X-Gm-Features: Ac12FXyth_0WfIMfZf5bQSrD94ZJMoTHvvj73yNE22q4eSHWMza4wdgjPDpfxn0
Message-ID: <CAK18DXbDiXqiP_A+89h0D-1tFWOo0ezua2Np2VytbZ9DK5p=8w@mail.gmail.com>
Subject: Re: KernelCI TSC nomination request
To: kernelci <kernelci@lists.linux.dev>
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>, mwaqar <mwaqar@linuxfoundation.org>, 
	"Hambardzumyan, Minas" <minas@ti.com>, Greg KH <gregkh@linuxfoundation.org>, 
	arisu.tachibana@miraclelinux.com, broonie@kernel.org, 
	Guillaume Tucker <gtucker@gtucker.io>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B-K1YCOPnADAF5Fw-dOxRZwbop5GtVE4vA9SYLOLBQU_1757094637
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 2, 2025 at 3:24=E2=80=AFPM Donald Zickus <dzickus@redhat.com> w=
rote:
>
> (resending text/plain)
>
> Hello KernelCI community!
>
> We have recently revised the KernelCI TSC charter[0] to establish a
> more effective approach for our future work. The TSC will continue to
> monitor and provide technical direction for all activities and
> services related to KernelCI. Additionally, with the inception of the
> Infrastructure Working Group, the TSC will serve as the primary
> interface between the KernelCI community and our key users (kernel
> maintainers and developers, hardware/cloud vendors, etc.), translating
> user needs to the Infrastructure WG.
>
> The updated charter requires a new committee to be elected, consisting
> of no more than four members, each serving a one-year term, with only
> one member per company.
>
> If you would like to nominate yourself for a committee position on the
> TSC, please reply to this email with your nomination request.

Additional request, can folks add a small paragraph (2-3 sentences)
about their involvement in kernelci that will be provided during
voting.  I will poke current nominees next week if they haven't
provided something by then.
I will use the ones provided by Gustavo and Yogesh for theirs.

Thanks!

Cheers,
Don

>
> Cheers,
> Don Zickus - Chair KernelCI Board

