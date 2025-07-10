Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B8272E6E
	for <kernelci@lists.linux.dev>; Thu, 10 Jul 2025 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157380; cv=none; b=hrmu4CNuWEpF+CsmLtMMWFhsQBbIs5gyStFgSUi3jEYbezNYxZaa1BfgQoFN4pmCVRcqW8yBsgp8SbUwwnAtc5jekJjNUVwrMnKNEbhyFQhbgThr8P7GIGVQ3blpSy8uKiJNw76urHkTs20yQ4raFUI3FQyQ2Qp1/biSMChCsEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157380; c=relaxed/simple;
	bh=DqgqMKNENlQbJgX6z2KYc6tL11ppP6PxZZb/QhmLBlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuIjq7oQ7jZLoFvVK/AeRMvBCz3pTEcelMEfOjiGDXko2x7g4pPrWgjAzg/9L02LFqH4QJRR4AGN61+pJnVxh0vUh+8a4/2WM5jT9km3B0ByaQcWANvwgcn5nQMj3aNyHSBPYcxxKb6ZE4NpQvBNTtibcPduOlPrqJIPvymT0zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wd777I9k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wd777I9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752157377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QyAJiaf+9Eief1NoR4OXw/wo9YHBl7gRI3nZMUdfBYY=;
	b=Wd777I9k61WOs9e1IdGC8Z/0rgzA9ND7jJ0a1c0u/96r+d7l6hBzw1LmHigywXRbLqlLfi
	gdb1VfFdOGqJxZz4MmMO+t2Y8ycD8Q6wFFexujjvcAx0/juQeHACaECbCtQmPjjilb9l8U
	NnlE7t/7Q1oHaps9yCpqhFtQf6Ot8hA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-2S7S_z9NN7--L-7MdVCVqw-1; Thu, 10 Jul 2025 10:22:56 -0400
X-MC-Unique: 2S7S_z9NN7--L-7MdVCVqw-1
X-Mimecast-MFC-AGG-ID: 2S7S_z9NN7--L-7MdVCVqw_1752157376
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-70e2b627b47so15950937b3.2
        for <kernelci@lists.linux.dev>; Thu, 10 Jul 2025 07:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752157376; x=1752762176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyAJiaf+9Eief1NoR4OXw/wo9YHBl7gRI3nZMUdfBYY=;
        b=u15HNETBPmhiEGmTcB96CkbYpcElq7to6Owb9ESSFNsUbcCaIyv1x1xzCFm1oPPNhH
         j7kYLSAFeIF2/QnF30xBARjck4Tj93qbmmByPfEjffFXWFXQzG4a+/nzwXvE9vtiNAmD
         6OcFaKMl0hHZx0LmCW+/1EJGo5gYxhZ+S2KXdhmHiGFedqypXqr2/QpTIeglMoiU3O+7
         2unjtv9CfagJTYClFxpTnX3ze68K8Xkz1naUc8KTASTU/fE0brZQFKknhrBE6doflLba
         vr9QI9XwPMWZ6h9/V2Xq6VNCMc0uByAfR0sQduVrA9fAA3geqNiorEROr9+5/FyTsGx5
         YT/w==
X-Gm-Message-State: AOJu0Yyp+xAN8hmAXbq4fg33VRw7oBZDUeKdyHtj/0nNfSOvbQgIH1yl
	XbrFW5vibCt+GZEvcdoPEvWsu/xf2fahBaluodTgwFOJNBG6NA/AeePYYHmuMetj8ybBVD2zbLN
	HQ27RR6Vv3Du+Tw7W2bskgkdJFHs8o8ikumKuZtp03qmLogKxdAnoP19i1pI+5WKQzqM14xeIw6
	UfCYcgpKia6M2gsh9CfcR4pYS1M56aKD2Lekc=
X-Gm-Gg: ASbGnctXOo8D5E6pCcSCvHql+Cgu+zJNmWsPQArug2ZJwFY1FSMdQ3pQijwHVsvKooJ
	7pUkNex62+XTLoEtbrdoEeaHgW1FKKh9+wq2BeuzK7/QsuW09CUdcBaJKkxyGotqkW6an4rWn0g
	jYnd5CZZTbaaAtGn+SiMLAeqwFc2ABJdQjd0LvSA==
X-Received: by 2002:a05:690c:a99:b0:712:d70b:45e2 with SMTP id 00721157ae682-717b16a7649mr109732947b3.6.1752157375940;
        Thu, 10 Jul 2025 07:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3ir7uPSd9L1o6KfcbYVtqM3Po6rgB+VmzB1jH+I8ZOksSBkJFjJhVcuYp56kW/NSULgmBCn+pfGDbETq6EFI=
X-Received: by 2002:a05:690c:a99:b0:712:d70b:45e2 with SMTP id
 00721157ae682-717b16a7649mr109732287b3.6.1752157375326; Thu, 10 Jul 2025
 07:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMVAkEsCEBNayPxXJXBXBXHRYLtqiwq6cMcgr8GL+5MgSgRtgw@mail.gmail.com>
 <CAK18DXYuM_bHrB-oCbct5bV4tuL2FYxeyVD1mT=Sfb7_8axOEQ@mail.gmail.com>
In-Reply-To: <CAK18DXYuM_bHrB-oCbct5bV4tuL2FYxeyVD1mT=Sfb7_8axOEQ@mail.gmail.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Thu, 10 Jul 2025 10:22:44 -0400
X-Gm-Features: Ac12FXzIdzlH7SIpNeALbvcOWfhYoObfLrE_NHoDXMFCCCkaay4lcUpcwld8UCk
Message-ID: <CAK18DXZo7WdVy6q+KVY+tHRr1wONU_MOh2+eec-Tx23Zmub+NA@mail.gmail.com>
Subject: Re: [kernelci-webdashboard] KernelCI Dashboard Report - June 27 -
 July 9, 2025
To: kernelci-webdashboard@groups.io
Cc: kernelci@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: anlPpEchW8zUNt-MlHD8t4_8jBucfo-fizRfgxI-CpY_1752157376
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(resending as text/plain not html [which is gmail default])


On Thu, Jul 10, 2025 at 9:59=E2=80=AFAM Donald Zickus <dzickus@redhat.com> =
wrote:
>
> Hi Marcelo,
>
> Thank you for your work and the report!
>
> Do you see any blockers or challenges slowing down your next sprint?  Or =
are you able to do most of the work unimpeded?  It seems like most of your =
work is implement fixes/improvements based on customer feedback which don't=
 appear to be blocked by anything.  Just curious to see if I understand thi=
ngs correctly.
>
> Cheers,
> Don
>
>
> On Thu, Jul 10, 2025 at 8:21=E2=80=AFAM Marcelo Robert via groups.io <mar=
celo.santos=3Dprofusion.mobi@groups.io> wrote:
>>
>> Hello everyone,
>>
>> We in the dashboard team are working on sending a new report after a
>> deployment of every sprint with the main features and fixes, which
>> usually happens every other week. Here are the changes since the last
>> report:
>>
>> ## Improvements
>> - A new endpoint was added with the same return as the checkout
>> summary report, polling tests up to 1 day and with some other
>> parameters open [1]
>> - Added support for multiple paths in a checkout report, as well as
>> multiple paths in the kci-summary endpoint [2]
>> - Improved checkout notification query performance [3]
>> - Added kci-dev information on the page footer, linking to the cli
>> page and with an example command [4]
>> - Added description to request parameters on most backend endpoints,
>> also visible in the swagger ui
>> (https://dashboard.kernelci.org/api/schema/swagger-ui/) [5]
>>
>>
>> ## Bugfixes
>> - Filtering by architecture wasn=E2=80=99t updating the card correctly, =
even
>> though the data was correct [6]
>> - The /c/treeName/gitBranch/gitHash endpoint wasn=E2=80=99t working afte=
r the
>> treeDetails url change, but was corrected [7]
>>
>>
>> ## Technical Debts
>> - The sqlite used to store cache and extra data was a single database,
>> it was then divided into two, allowing for a better control over cache
>> versus notification data [8]
>>
>>
>> References:
>> [1] https://github.com/kernelci/dashboard/issues/1321
>> [2] https://github.com/kernelci/dashboard/issues/1217
>> [3] https://github.com/kernelci/dashboard/issues/1310
>> [4] https://github.com/kernelci/dashboard/issues/1247
>> [5] https://github.com/kernelci/dashboard/issues/1300
>> [6] https://github.com/kernelci/dashboard/issues/1268
>> [7] https://github.com/kernelci/dashboard/issues/1311
>> [8] https://github.com/kernelci/dashboard/issues/1223
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Groups.io Links: You receive all messages sent to this group.
>> View/Reply Online (#180): https://groups.io/g/kernelci-webdashboard/mess=
age/180
>> Mute This Topic: https://groups.io/mt/114081027/2627485
>> Group Owner: kernelci-webdashboard+owner@groups.io
>> Unsubscribe: https://groups.io/g/kernelci-webdashboard/leave/12826961/26=
27485/264394869/xyzzy [dzickus@redhat.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

