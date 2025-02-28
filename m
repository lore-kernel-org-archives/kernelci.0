Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8281EF360
	for <kernelci@lists.linux.dev>; Fri, 28 Feb 2025 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740754787; cv=none; b=J7+4N5gPi3yyzDtUM9tX7i0NRPrE1Mu8u00dOsG8I37OLWXelBt6LsfUw58fd14t3Rn/QrG7D2tjO+c6g32Zvu322q2pFCWnGyC2h3RvlTjmBKuwMixfSu/zz36WTfOel5A8Yer1nopw1RHGz80BamSsdET/9G9nqdhaqckcigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740754787; c=relaxed/simple;
	bh=I5XHD61LGdsmBzCPv32BpZV6glnPGSJKkLXF2YSMlPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nev6shi2o13HbX79cvInHJ8o/Dtj30xC1qZXKwIiAPKTnspdjDz3azQR63UW48+D3bhupfPkNdbHseHTFtZjSA+CiB6r5sDThnvi/jBALv9co/L9+R0TJ3Fs8YH0lsJPxcbFQ177h9UKu+J44yX6DjiB1+ISgsq2jaVU/t4LSRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ACGuf49R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ACGuf49R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740754784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5XHD61LGdsmBzCPv32BpZV6glnPGSJKkLXF2YSMlPE=;
	b=ACGuf49R1J5M8TZVU5ZhQOSQntp3BQ4NvnDHec+6EGa+2zs8Ja6Qophzx9ZiUYHiHMB3Xc
	83G6QlbVsJgQJtU2MZaM0CrmcqCpB7AWS6vhJPLiwttYe57Y/ddXC1+ZgfKXBvFUu1cx9v
	VC6j3NPEHgFIhWq+K1AgFKyKri8opiA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-mhoXIU_6NmCwmet9xntA3A-1; Fri, 28 Feb 2025 09:59:42 -0500
X-MC-Unique: mhoXIU_6NmCwmet9xntA3A-1
X-Mimecast-MFC-AGG-ID: mhoXIU_6NmCwmet9xntA3A_1740754782
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ce3bbb2b9dso25752405ab.3
        for <kernelci@lists.linux.dev>; Fri, 28 Feb 2025 06:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740754782; x=1741359582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5XHD61LGdsmBzCPv32BpZV6glnPGSJKkLXF2YSMlPE=;
        b=N7rFLkEOqB2mIVfscbdgRo8M8DN9bwUlqLozBulfPi+6XwiO8Bouv+pmDHcOlR1yaG
         ZyHmJi4aOIGZk5rILh+PXSMG3KUcIOSt+uDFLDXMT5eu8LIqaE1nT8yzsIbZhI3Rxi2S
         UNZVprsHFweQlQyRzcRfmWRNUQF5QZwxAPhhtSQmFeNuDTMax/46PIqVGXt7NQUw+ueb
         +najYXh9XgqXiHIIXEYB5AswyLGxss450xiwChY6SN94A5l8YYAEomcCSH40di8klotS
         CpfydNIeBZtwEYx9qrKVqHnOqKLij7EoUQ9YO+xuPO13MQ0+4zz3E89fisgksXKxifmk
         /hew==
X-Forwarded-Encrypted: i=1; AJvYcCUny0wPpcfa7MnkbbV0I/keCqv5N5wYeeM5e71aO/IC733P//MNPgHsaoPkkyH09NlwMEY6GA5jyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSX4ixgLz5KDrUYeMgnYqlnEfGVMBeyRt/4r65/Hba6PDzYvmF
	JV/8B3UOJ+lcp8HQfNAsk2Nm7bygrSQYepTLRtHhiAdGEriKM8jxjhyXsGlNOcdfsZ97FvczBDn
	iQqI/Szvsj5ifsAdOsHVb1CCNnCNKIyqx10b3pMLLf+ngyc8oIuYkhHBcd3CiadgEQsAfsb0kXw
	+sMwMJSXlEgpOy+wufkWFe2YVE9G73QMA=
X-Gm-Gg: ASbGnctcP/Ctp198oIuHFxYbByVm+PzMmzzay8oDu53g/GX8OGSbX3mQcLQ1IMOBiDy
	mA25d22x+jdTjgddUirOTLorhIXgpbgL5cxlkQy8iEQR3NPrMRL+C0uVxlotLX+FaTRnJHJ5AZb
	kJKCWOtHuE3DI49BLZ3rf7s4da9xk4+g==
X-Received: by 2002:a92:d084:0:b0:3d3:eeec:89f3 with SMTP id e9e14a558f8ab-3d3eeec8cbamr9733585ab.13.1740754782008;
        Fri, 28 Feb 2025 06:59:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYFZVLXpqyEwcgj6VviFu1RhJMnhVxOqOm8JwBZTtiW1mzFVXuXwipbCmV/U8yqaM3lA6OP4EwZBxLJtS7yas=
X-Received: by 2002:a92:d084:0:b0:3d3:eeec:89f3 with SMTP id
 e9e14a558f8ab-3d3eeec8cbamr9733325ab.13.1740754781690; Fri, 28 Feb 2025
 06:59:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
In-Reply-To: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
From: Tales da Aparecida <tales.aparecida@redhat.com>
Date: Fri, 28 Feb 2025 11:59:04 -0300
X-Gm-Features: AQ5f1JoNEwtxyaRIYfbW_7vJJZQtD2hyiiG43aHxyy0W_w8FRvS9u65k8JBG0TM
Message-ID: <CAPo4OxQikJkY4U6+TxOuw6xaS9W6LQLcMrmd+D2FFNeW6qD14Q@mail.gmail.com>
Subject: Re: KCIDB: v5.0 - backwards-incompatible changes
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: CKI Project <cki-project@redhat.com>, Michael Hofmann <mhofmann@redhat.com>, 
	syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vishal Bhoj <vishal.bhoj@linaro.org>, Alice Ferrazzi <alicef@gentoo.org>, 
	automated-testing@lists.yoctoproject.org, 
	Cristian Marussi <cristian.marussi@arm.com>, Johnson George <Johnson.George@microsoft.com>, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>, Mark Brown <broonie@kernel.org>, 
	Philip Li <philip.li@intel.com>, Denys Fedoryshchenko <denys.f@collabora.com>, 
	Aditya Nagesh <adityanagesh@microsoft.com>, Sachin Sant <sachinp@linux.ibm.com>, 
	Benjamin Copeland <Benjamin.Copeland@linaro.org>, Manoj Kumar <ManojKumar08@arm.com>, 
	marcelo.santos@profusion.mobi, kernelci-webdashboard@groups.io
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XCMrPlRMqt3N508KL199qKlqxEBje2VNv_MebKGufS4_1740754782
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 27, 2025 at 3:32=E2=80=AFPM Nikolai Kondrashov <spbnick@gmail.c=
om> wrote:
>
> Hello again, everyone (potentially) involved with sending data to KCIDB,
>
> We've accumulated a bunch of schema change needs, which would break backw=
ards
> compatibility, and so it's time for another major update: v5.0.
>
> First, here's the kcidb-io PR: https://github.com/kernelci/kcidb-io/pull/=
95
>
> This will be followed by a DB/ORM update, once we agree on something. I'l=
l go
> over each proposed change below, linking to corresponding commits in the =
PR so
> far. Please review and respond if you have any objections, comments or
> requests (here, or in the PR).
>
> I'll merge this next Friday, March 7, if there are no objections by that =
time.
>
> And this is finally all for this schema update. Please respond if you dis=
agree
> with any of these changes, or would like to propose your own. Thank you f=
or
> reading all the way to here!
> ...
> I'll merge this next Friday, March 7, if there are no objections by that =
time.
>
> Nick
>

The upcoming changes look great, no objections from CKI!

--=20
Kind regards,
Tales da Aparecida

