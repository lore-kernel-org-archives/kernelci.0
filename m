Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FF227472
	for <kernelci@lists.linux.dev>; Wed,  3 Sep 2025 05:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756877096; cv=none; b=D32mIhl+/L2KvBns69wtoVVBip5AxuUVaid4fMwW4/l9J+FcNa6bw6186GP8AmvtP/j0CEasTTQ2RpXZBMOHcI9tMEIgB0wHvHo252QwM0m5Vg9/EOEp6hQbj1vfU+QBVNrI1yrTRGnLodCiZDblrtyQkSW2k23r4B5TCS6TsOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756877096; c=relaxed/simple;
	bh=bzPR94hhgUTxyJGfsoSeDPHqFwunfcpzOM1VHW8Ln9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNSDEycuFbECNXbqDYD8kDg06ynz47FYGi4b2Pere+V4iXMXOALaVMpNJba+4s1CRxG2cgKycva0B1gJkQCJJOpX0cxVp3hk1gS4lpo/aXMuckSs/m9jM4BoTVPSbBLFxu7FWnylqBrzCPjieADf3ZGpFl6h0zl474vM1bXNjBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fz4zZzu0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fz4zZzu0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832HQ4Q019818
	for <kernelci@lists.linux.dev>; Wed, 3 Sep 2025 05:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzPR94hhgUTxyJGfsoSeDPHqFwunfcpzOM1VHW8Ln9s=; b=fz4zZzu0Xwz+cueo
	lwRmgnLUZ6q+zWD5eXxsjaEUFLIlz7L2GvziKA79qJFZ3NZZvuHLSD5pK9QI0e/j
	HgG12e+/ChYb9yCLicqlwyddeaSgFbLWAg0hcrqw3ct8NkBJkiSttdviXx69QRBR
	d79qEyV84jBuTM12rFa47pVqU3+FnF5F9a3+PlhhrDK3FX8l4NI33hNWMX2ON+7s
	6Xnhx3hQkyj8RLyP57/iSltVaBftiq/PUbgjb2Ptc1rm1vKjHtmQyiu3Dmjw7mVV
	RIj1b9jpJtZdsPMHfjAsnmUVRIYaUTIIa2XNLbxmuOX7Vosy8hcESbtiDyvMhvvs
	5g3UHA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw02b4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernelci@lists.linux.dev>; Wed, 03 Sep 2025 05:24:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-52ae22973feso566857137.2
        for <kernelci@lists.linux.dev>; Tue, 02 Sep 2025 22:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756877092; x=1757481892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzPR94hhgUTxyJGfsoSeDPHqFwunfcpzOM1VHW8Ln9s=;
        b=jB1RAAG0rIYXNgfDJEe4qiUE5Ltx8sxwy2VPP5R9c60pBo5QzSJOWPEzlU/CnnmKOt
         pTC5KSGb+X5pt5bzuvXeS/OnYzMVA7R4+da5/x/noQURNDM6HKMSmaBZ1q1v6Adzw0UQ
         o94ONumhzLgsh5143OU9zT1yLUUvN+A0J3zH2dLxTkZNi6yWqzGM4hkQZJZvr5dsOYPk
         sdeJ4DaNRisTKxlsmZ70Zltk3Lh4UNL01FGZUvHmjR3Lyp/CniyP8t8jYVK2+UzPppaP
         v1eM3pWgLJgAsthl26k7YYOzMP3IYqF5piT/5AooNMzJ/FGUvcc5nLxpaD8P4nFiN4Zn
         yWLA==
X-Forwarded-Encrypted: i=1; AJvYcCVGTpunpfQNj05j2EuEc/DRy78dB3leRWzDN42ne7+Fv5cTH9/ZzFKaot2Mh4hLdwbO6LOWEhRRMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwII5oWrcwicUVVi+bS9c3qe6L+gxo5hZa189gMvTA4kCgSIrtL
	uU91ZGtAN04jqXW1nuycK9dVDPyMisKS1FLbYAtr5OxOhCqlmEuQhJunSubbAMaT1ycZd9eTc5G
	D0vRlw6bkXz36CmLReUCF1nsC8nO6eaQY+MmIS/dh2tVCZp4wn2mu7V3qhX7JLfYAuwi1mhEeaE
	aCvTHHJrMgW5jiW+flMAxPc2ynzInPEB5JjWc=
X-Gm-Gg: ASbGnctL0HaJgBK88k3hhn1lq8HgurTZVkjBYKVpmLvBBiV6jpd9IojfEode4dUDRv1
	My5nq0GDMiIy8y52kVTflf1gx0lOtJ9N8KGgWos9svDHa9fE4w0ulnvLqX1KbmXkx2qdTP6nmpY
	C3nkcG/jEJDCiM2MimdHdG
X-Received: by 2002:a05:6102:5127:b0:4e6:d911:dd84 with SMTP id ada2fe7eead31-52b1b6f5b9dmr4277792137.22.1756877092008;
        Tue, 02 Sep 2025 22:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPgKr8DKdFG7TCz79WpLldLydK6Owr7Sp4DMP5gbx9nMSuxDpLZgyZ1zNst7tqA0tKbfWzg25ICaub5uD7tT4=
X-Received: by 2002:a05:6102:5127:b0:4e6:d911:dd84 with SMTP id
 ada2fe7eead31-52b1b6f5b9dmr4277784137.22.1756877091578; Tue, 02 Sep 2025
 22:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com> <58ac950d-a253-a85a-4e50-6d758181232d@ti.com>
In-Reply-To: <58ac950d-a253-a85a-4e50-6d758181232d@ti.com>
From: Yogesh Lal <yogesh.lal@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 10:54:40 +0530
X-Gm-Features: Ac12FXw4RkCPQI1ov4HDIWbCiu4Z8pysIUiLQySMYa6T3fkGuVv-XFxIZUY3LV8
Message-ID: <CAOUSUDq936WYNsB=tRkYbqzm9z=q=tJEUXo7j565ii1AWGBBvw@mail.gmail.com>
Subject: Re: KernelCI Labs Working Group
To: Minas Hambardzumyan <minas@ti.com>
Cc: Gustavo Padovan <gus@collabora.com>,
        "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
        "chris.paterson2" <chris.paterson2@renesas.com>,
        "ben.copeland" <ben.copeland@linaro.org>, cfi <cfi@pengutronix.de>,
        broonie <broonie@kernel.org>, sjoerd <sjoerd@collabora.com>,
        khilman <khilman@baylibre.com>, "f.pflug" <f.pflug@pengutronix.de>,
        =?UTF-8?Q?Pawe=C5=82_Wieczorek?= <pawiecz@collabora.com>,
        Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: vUUDgEZKE7pTJkNAvDeOejMoWQQTjtZP
X-Proofpoint-ORIG-GUID: vUUDgEZKE7pTJkNAvDeOejMoWQQTjtZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX8AJ3d1m20YBp
 d/Ho+16By3GIeGXjEZAX17QBQKQQxVMLd2MX1tpDBjY64EWCmh8NiW29tmS24m/ZIkafHWWDAhz
 uB8OMBbOrcpgTNRM2rHHRsqBF/NgdRtIf6U36VfoBhUqUWdmRzWI9xd7cRpnDT0iNWaGmFa4pDQ
 6yns5D8JUzsgzoHq0HcfsWkFv16+r1HEzqwyDDrRRsb1EB0PI9J/+3C8bZ7L+f01/JFY2/wuWTl
 4m2P2N6V7OsErVfvEbRFIieOzYpgyzAnCBxVHwXv/igKbYxOnue7Xe/I9e0Sms7aJE/8+wCwz0c
 P2Xxqbw1HKNb5kCsbt8OXU1rtjBioU2pY3Gj6kyg88IemKPLJKJoRvnFEVMqA4bUEEpAGICyur8
 8e9S5OXw
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b7d124 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=sozttTNsAAAA:8 a=Vu2j5zFU1t3VutZakRoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Hi Gustavo,

This will work for me, and thanks for initiating this.

Thanks
Yogesh Lal



On Tue, Sep 2, 2025 at 9:00=E2=80=AFPM Minas Hambardzumyan <minas@ti.com> w=
rote:
>
> Hello Gus,
>
> On 9/1/25 17:54, Gustavo Padovan wrote:
> > Following discussions at the KernelCI Workshop 2025 in Amsterdam, we're=
 establishing
> > a Labs Working Group to address the challenges of executing testing thr=
ough hardware
> > labs in KernelCI.
> >
> > ## Working Group Scope
> >
> > The Labs WG will focus on improving how KernelCI integrates with and ma=
nages
> > hardware testing laboratories. Currently, we support only LAVA, but the=
re's growing
> > interest in expanding backend support and addressing various infrastruc=
ture challenges.
> >
> >
> > ## Key Areas of Focus
> >
> > - Labgrid Integration: Design and implement labgrid backend support alo=
ngside existing
> > LAVA integration
> > - CI Ecosystem Labs: Better support for vendor labs (TI, Qualcomm, etc.=
) through improved
> > events API and shared rootfs images.
> > - Alternative Backends: Explore integration with other lab management s=
ystems like Tuxtest
> > for virtualized testing
> > - Lab Health Dashboard: Develop tools to monitor lab status and infrast=
ructure issues
> > - Failure Classification: Improve detection and reporting of infrastruc=
ture failures vs. actual
> > test failures
> > - Lab Admin Guidelines: Create standards for lab administrators on devi=
ce type differentiation
> > and configuration facilitating accessing the same hardware across multi=
ple labs.
> > - Job Prioritization: Implement smarter job scheduling
> > - Dependency Management: Avoid running dependent tests when prerequisit=
es fail (e.g.,
> > skip NFS-dependent tests if NFS boot fails)
> >
> > The Labs WG will work closely with the Infrastructure Working Group and=
 Technical
> > Steering Committee to ensure our efforts align with KernelCI's overall =
architecture and goals.
> >
> > Based on the interest during the workshop, we=E2=80=99d need to cover t=
he West Coast timezone
> > as well. So an initial proposal for these meetings is starting next wee=
k on Thursday,
> > September 11 at 7:30am PDT/4:30pm CEST.
>
> Thanks for setting this up. This time should work for me.
>
> Regards,
> Minas.
>
> >
> > We invite all interested community members, especially those running or=
 managing
> > hardware labs, to participate in this working group. Please reply to th=
is thread if
> > you're interested in contributing or have specific use cases and requir=
ements to discuss.
> >
> > Best,
> >
> > - Gus
> >
> > --
> > Gustavo Padovan
> >
> > Collabora Ltd.
> >
> >
>
>
