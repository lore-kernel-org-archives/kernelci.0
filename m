Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7473191CA
	for <kernelci@lists.linux.dev>; Fri,  5 Sep 2025 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757093370; cv=none; b=RUMLacii7RZQgIHVWFGhQTToAbTY+rQS4u/4dXTCg+/+Zo9H40ZDBhgaD8foZdWQx9pS0H/f4sArrXD0UA4nsMC2xO71oHZ7poY1OmUtDNp5+IM/YFToqzhs3Xptru3daczaKZbP7vsyffIpRwRvJOTaeBhxCfsdXwyzRE6Si6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757093370; c=relaxed/simple;
	bh=Bq1mq1QvO9/bHoassoDAltaC2ISM3u1ZhHG1a/vZyo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwuz6fnNQX9XsUFqt0X+aV9HxSHiSy4VUJ3Y5V4fn2s/NTQEfxWr7TtLcHApIM/D3ZevI+1T+D1BbHs6sVEmzHDS9RoNfx4INV8FwNaCCBseMIEUWDqRCCvv1dgK8MDPGkT8RFvhChhtlsD7hhDR9Ajo3kdbmEaPgZftYnyPwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTk/qepX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTk/qepX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GJmXX031977
	for <kernelci@lists.linux.dev>; Fri, 5 Sep 2025 17:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bq1mq1QvO9/bHoassoDAltaC2ISM3u1ZhHG1a/vZyo8=; b=HTk/qepXHDcQIjse
	4fqC0kWEKEB2cbypnE2b/iM/yzo+TW5u754RQAoFHAhnzdKnpXZ6M8mzOJGSda96
	xqtrdQHRrkhDvOJJ/9H2jl3eVGfbE9MtqnuFFZeor+61GFKENCgZSvU5Y+HhzHvs
	Mcrf4qfHuTBOmgLeL2A6kQE2sRNY4TgEkZSQyq3IMdOV5ELs4+LAJ8CEXrUBPlRS
	Wo6rP34Bb5CVU7L3aT1/9kYlp5Ejjexww1XA3WzPWjamRCmxiUkJ2qZ1VsEmLrCM
	wbmB/fgyIAJsJ/Sq7A2DCT7DiNXL/iD9QblbvRHMlt85YFqhLRrLTPke7Ze+DfrM
	LOGwjA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0c1r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernelci@lists.linux.dev>; Fri, 05 Sep 2025 17:29:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-52e090c943cso895958137.1
        for <kernelci@lists.linux.dev>; Fri, 05 Sep 2025 10:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757093366; x=1757698166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq1mq1QvO9/bHoassoDAltaC2ISM3u1ZhHG1a/vZyo8=;
        b=Sgqe4T9NPadxnTdGIjwmgD8cA/38maFvKt6p95ddfJybwulQchPnVijqae+l0eVa6z
         A8qvuJQCAcFs1FD+IcIq6tlmhLKoDbXJKcXrLqJ25d4WPLO0Oecl4xw/s7s/n1JZauIy
         7OtdHY5yUZKsGSQsBj63+ut9Ho8csZ6m6HpAGIiWomCg848/LqogR00DfE1XSHO0YCC4
         08UZVhB2wrPj5djIKXqRLJZ7ieU740InNo9QwbIs9TpQo5eGTwlXHpEahRwbq93Q8Vm9
         xM3gkcpQxtCEhN+xM7CaaUhfKjw5tqv1OmAOwFtpdMYXDzRLr4sJYIb1oCk/D65H2ozX
         3NwQ==
X-Gm-Message-State: AOJu0YzgrhhtSLwMrdt9xgkZtiZ4B8T150DLyM4T5X/6FMFj4i0y2a9G
	Cr80yZPkdza1LmkIHtlzOstwblousylJwZsp6vs6X2C0gSWdEss9ckbqAdlxeEgX54GR6X7l9I5
	EG6oaeYHtSxyBFxlRCNX/azxEOMTHmdSYEfF5IaubXaYi6lw69DImzucLIypeJW9+yrXXkO5URe
	32In2hBG6fchycd4an2B+q7sLRgOb/1YB/6PU=
X-Gm-Gg: ASbGncuUlr9iOSrd3s9N+lW+usuLpI3XwZNV8VucyHImwxWKqDoTfT19yiMS8e4nvRh
	fjylCJH55xBPd8QaLsmLDN+FKPSgNkszkA4P8UZZccypZSy/BMX0T93/UqJZNyYIdnIPJm59lMM
	O0cMZCYhSfnYS0I0BMaSw2
X-Received: by 2002:a05:6102:4412:b0:523:712d:4499 with SMTP id ada2fe7eead31-52b1b90018amr7773124137.26.1757093366586;
        Fri, 05 Sep 2025 10:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYyiwIu/Ed0LHQNrGCF7RH9kJf1icaDoEEZNSr5MirRcFQPd0aeXuB0ZEBRwqwyRgQpFSmQb2f9WEutQaxXJE=
X-Received: by 2002:a05:6102:4412:b0:523:712d:4499 with SMTP id
 ada2fe7eead31-52b1b90018amr7773114137.26.1757093366172; Fri, 05 Sep 2025
 10:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
In-Reply-To: <CAK18DXZFCrvj-QK=45xVSkt+EJ6FSSPsxPxoeRBXPdDRySup9A@mail.gmail.com>
From: Yogesh Lal <yogesh.lal@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 22:59:15 +0530
X-Gm-Features: Ac12FXy3E3JzehGiFD-IEf-DDpkd4xPu4nmTCExRYqmk4Vs7O2tMqmvDYQDqmFA
Message-ID: <CAOUSUDr17QX3_dcGGn=umUsV-j84L020Q+hannp-dhX61mi-sg@mail.gmail.com>
Subject: Re: KernelCI TSC nomination request
To: Donald Zickus <dzickus@redhat.com>
Cc: kernelci <kernelci@lists.linux.dev>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        mwaqar <mwaqar@linuxfoundation.org>, trilok.soni@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7ocs7nYcyZAeHaebpdSuAx46P9Gj4F6q
X-Proofpoint-ORIG-GUID: 7ocs7nYcyZAeHaebpdSuAx46P9Gj4F6q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX6CYcuM9uIKZp
 UnYvMzo0+x7UXuagGpJJ+GPoLIlhv5rQZusw0YmYvthuHls3VOIhxOyb4c+rSg7hwUGBgTV8t9+
 KO/cAJU68NHFoFsYpzYjW/0w8wbIt8QsnxBDWq1GyXyV0SiQqaUd5fSk5YEQLG1QkzupWk9HhFR
 HSFXXtuyMQhII7Wc7JHpmrmar58VYw50DmPCWlAR0l9wftzV48wJffpfBIbcOTT0LMTTuxCRJnz
 5EYKJE+YLjkk/KMbGzh8uSurfcPNzVwuLiijwtRtx+8kH8L4Jj8ymePD1Fv6q1r3a1xgxGgEKtf
 fABBOm7LdcNOWyh0EFSl1gUuD20WGRjahf2d1bsBu3AxnNm080FO4LTKdLu7kScGEfHAWKaowPF
 pE8ZIp0/
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bb1df7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=U0zfkUukAAAA:8 a=8nTepdsTWJm7l-CMkfkA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
 a=rXRU1dkEVDZ1dOovDhQH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Wed, Sep 3, 2025 at 12:54=E2=80=AFAM Donald Zickus <dzickus@redhat.com> =
wrote:
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
>
> Cheers,
> Don Zickus - Chair KernelCI Board
>
>

I would like to nominate for a TSC seat.

I am working with KernelCI community since a year now and actively
involved in bring up first external kernelci-labs( Qualcomm ) on
KernelCI2.0 model and since then maintaining Qualcomm kernelci-labs
and Qualcomm SoC platform on it.

Along with that I am working with the KernelCI community to streamline
kernelci-labs and integrate it to KernelCI.org and scale up the test
platform and plan to scale up the test coverage.

Also presented Qualcomm kernelci-labs integration with KernelCI.org at
Linaro Connect 2025
(https://resources.linaro.org/en/resource/tTW1et2jS2ivYxP2umR1d1) and
presented demo at Open Source Summit India, Hyderabad 2025.

Thanks and Regard
Yogesh Lal
