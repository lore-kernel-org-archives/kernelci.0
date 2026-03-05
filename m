Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2923DBD67
	for <kernelci@lists.linux.dev>; Thu,  5 Mar 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729777; cv=pass; b=Zule4UiXufgufgy/3islOCo6zQUDFtoiKdyR4RfTzJxTrax2pPTh9GQRci86o7xdP5uEazvWlgMo+SvsV+0d9UTQ0TfahyeCR37droGNtINThcxWqCTdIym+GEgp0mjMFKXihdcvTaVz6cFd06DG/VRMBX0ye0qGWSxZNoaeA10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729777; c=relaxed/simple;
	bh=ktn2fUr7hSZrUzjfL5Bwkhi/3FxGxLmbbaO1b/F1294=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKHXpc9+Fz+CDWBty/teRLuvcT5rnrQnZ7hBA+eyr4LaXGqdlUTMngPaSHzWEmrDBAiL1GP4u5sn7VEclaMfXGDBMoIf6/Yq4jrqwnmxrhRsCk48eINITiQmQss2aslr+U7Afx5/VJOMfILWarazww0p2rUwOBXj9umPQeyBXeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDRBnK8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFAK3J+s; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDRBnK8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFAK3J+s"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFpUg1517930
	for <kernelci@lists.linux.dev>; Thu, 5 Mar 2026 16:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktn2fUr7hSZrUzjfL5Bwkhi/3FxGxLmbbaO1b/F1294=; b=fDRBnK8yGDsDKoGe
	BONPGPFZo0yI7q5DKk3O/CeUnN4nwXjluCeA811ndiwnueDNz4hcvVN3iotUcH+M
	yu3dc8TW/ccCeuRD8BmHkAY4g65z7tNgHTnSCC0xU8L5tL9y5xZpScntlUzlOh6Y
	ZVgs4bAWdj9641dwt+aT3ZKIskoCbthroGFyvkT9f/qeuKWvEJAeRfaRNCIzi/E/
	+LjfhNLD2smfA1rsfIKf8zORVoJ8F9P2M3zP2hE6Pt+F9WzINrhxbdPtZqtBE6Ll
	+X+FygofzQIz0qe0cyT6CpZ7mRYumz99SGT/C8eSh0caY3JUb8AMauveL/fMKJ+f
	kc7mXw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptkkts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernelci@lists.linux.dev>; Thu, 05 Mar 2026 16:56:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5675cb317e3so11216018e0c.0
        for <kernelci@lists.linux.dev>; Thu, 05 Mar 2026 08:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772729774; cv=none;
        d=google.com; s=arc-20240605;
        b=K3vIz3HFgelDZ0g6PQRWA+9doeI2tgNvdSCBt8+Wi3OE2oGOJVActySuYvsLnB2tw9
         YKcG0wDeX4hM/2eI3OXv9rVo1CcrPTTxh4+jgUREod9+jvlLCjRNzU86AnQoiucuEg7m
         P5mQQM8tDI/TkCO4D4t+WMs7Xfwe0P0CHJX3hXbkJnf432RGDBCyXJ11LFB7VrXsmEKx
         FG7qPFi6c3YJxVhLdI6MJOYs5ZJVloSEjPM7FVqy8G8ZkNGQgAz0RAc0VL8dQAguvFtD
         cVebdmCjwn0zuZ92K1S431x/+uYNFbJdq1LSFcKSA1y1iBqZRBJdZtSl1m9pRa3TaA19
         zXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ktn2fUr7hSZrUzjfL5Bwkhi/3FxGxLmbbaO1b/F1294=;
        fh=tQoNDkh0hviDaZYtdSuW9sLhFTxSt3IJbdefTfG+ocI=;
        b=IEC42LFoMsbUDdg0/kfzW3zuKqDQI3KvDbE5UBNnuquN4lzSEjJim2nEFXiA4i3SQc
         vHb/dr1yahvnzUqgkBHB24urmR4I97p1e+6G0e1fIlYN0KgviOFSbbzdSk3BKEWKQMs2
         qw88WBv71Jm/O7rxc43FezbkiEQ98At20bFe4uHNMeTSrsT0HG/JcL8DYSH3WMhYk7xP
         ecGC2KYjSYUnyGTKhQxhvubLhPIx3ws/TkWCpvSd6DuZrp/wsiM3D3M1+OZGqaMV1tmW
         OGw3kJ8yzvHH+a6T6OlBQlb46Vvfu/lsx6ydfQuDrIM1D6uiBYGLmo0amQSdetiW9V1J
         Mtyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772729774; x=1773334574; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktn2fUr7hSZrUzjfL5Bwkhi/3FxGxLmbbaO1b/F1294=;
        b=HFAK3J+sUJI7royCcEmdnVV3fwbt0o7h9xyY+HxLIL1YKKrUmx8QV4upiwPmiHS4Vj
         VGZaLdMCK53SKX5G7sxhsm12g9rjU83QESqPYaP8Ld9ETFL3O1rE/pMpnh6k9jteW1N3
         DRP3YQaEVOYl7rl3udz4GDB7y2X3XmuqSYX89CyPflU1rt4bhXvsT+cEemwt6e6X7Xb1
         nBmVPSaBxFFdj+iyr/lb9q6josxbd5YTyIeQnehS+zJT0pPetqDBDMIgtULXGOEOX10a
         KRqOgyfaKsY9Lwyjz9NsuECE/xvbaq35ubRXMhYpKEyUqTyg8bEKsfc11B26tGROQIdG
         twcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729774; x=1773334574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ktn2fUr7hSZrUzjfL5Bwkhi/3FxGxLmbbaO1b/F1294=;
        b=tg4b9UP83BfeuTcfNNQl2WZNT6ImzT/1vyrhzi6yxoQbk8pkSFB2V+7DmrDrAJSzwt
         qxT5ufHXTnmdjRsyosNTLKii5GxJqe9cjWuReR0NQqnE/cQZ6ZQaw9jMnPSc+PgsPchY
         lLZECbK2LBDtRWESpMYdIVhkkZ/gFOpPkXGm98S23sSbrIrXEgPsqPDNfRjiU5UHX7YX
         QwNvbna5CQ/vhyy6jBudjMgMfoeud0u23TP2ws1F12S+Sr9IhkxRgnh+7yhQWXgcXMYv
         KMvs6cKU8xDy/nAuCnMDt39/d05QOtEWKFzJAtDaoBqTfwYzAL76nyo64bALh+/kFJ6m
         ZXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0jQRC5xZBv3ZSEXNPVR38zKW1C0c9LGNNpVCIbHE00YMGTWAwI1D2qnOqeYpFUFsTeHmG/1mxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1wzaf6KaMXCXDC0SQFc1Vo/Iv3TRuf9WoAbpddlDORtiQzg1O
	W7vbJSvDlERXDuJraD4ZmHuf/YZbM+VSag9pNcHDadeQ1NVR93B16/daSR702wEWOmGT1uvGyjm
	RlmZVTKKVzzAUFqUi7tySLzTVRXjevYno0VvHx4ZgZXev1l3VKvTusAfFHx+js4LxFe3nxOgXu6
	xowu1ltDGIF+NsYVDn6mgOzx2k5uZUJ4o95YU=
X-Gm-Gg: ATEYQzxePoE5pXzBuHI1Obs7j3OyNcYsBTmsKfdq8R95ZIOIJN3cXzPs4ByeUW7abv2
	fIzCXZK874te/rqcWXBfFDhI6tstEfoThg+zI95Svb1EMISQk6tWsqQxS0L/Jluk/s2I9XBy61m
	iIjlaeD1kl6Fb0dVmwTPjJkKUjPTq78BA5iMNxa5bC7eWJwghuhWBZ10k8lwDQlG2xURjEmr/Wn
	WNG9c0=
X-Received: by 2002:a05:6122:ec7:b0:567:629a:6b45 with SMTP id 71dfb90a1353d-56ae7797cf4mr2737551e0c.11.1772729774583;
        Thu, 05 Mar 2026 08:56:14 -0800 (PST)
X-Received: by 2002:a05:6122:ec7:b0:567:629a:6b45 with SMTP id
 71dfb90a1353d-56ae7797cf4mr2737545e0c.11.1772729774179; Thu, 05 Mar 2026
 08:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <7a042ff1-4360-4dcb-97df-7b49f3c5f8b1@sirena.org.uk>
In-Reply-To: <7a042ff1-4360-4dcb-97df-7b49f3c5f8b1@sirena.org.uk>
From: Yogesh Lal <yogesh.lal@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 22:26:03 +0530
X-Gm-Features: AaiRm53ELio_1p7vqyLT02H5WJCDjODcz56l5FkqrjbbAvgpvPo3Ms4upzqzs1M
Message-ID: <CAOUSUDo-uFc88m4LkG=oM42frEpT27F_EYQE=KL-+-yNjyrn0A@mail.gmail.com>
Subject: Re: Meeting proposal for KernelCI Bisection
To: Mark Brown <broonie@kernel.org>
Cc: Ben Copeland <ben.copeland@linaro.org>,
        "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEzOCBTYWx0ZWRfXxRKfakRpsB8D
 KVKF+MY6eZaW3JTyWNUDMNn8FAQYn6SoMI7JxPIe+j4sfuClmVHK4CrRxY0etg/h18KqDW71G0S
 9QX+8QOsqzgR82ELq2vXhtPEQzcHlpNfnfJGPsdQ9kbCY18R3s6zPh3v45fK15XJjEe+3jZqaPC
 OEmKOimWkf0V0hztJBHc1eT2d6lnkoPiCzmkZLVY2G8mtmJ5V2jqvXJPz4jcCNjHMzTRE9OiRTG
 lLSGzNXFG3wj5OcbgHwL89MU/a93hdpXRZuvNha33I0qOSYcrPluYCe8j6Z40AJEvOqu9MAj3em
 /xX3im0pF6WU0OWHXMiEJCDHzrM5rapCQdaMpeTSdRlQx2jf9alqbh7CImzv51HBbzjB/RZjt2i
 PpJtw95KJ+4vwnk7xVpqs++cS2ogUhCr9E1fNN9U7v1Pec2j7GMMKspSzAZ1vCpPgU15ek6zVwx
 WY0dOWmHmARL100Gz/A==
X-Proofpoint-ORIG-GUID: 5Vxmkfmv4gLGRl_zmSW0y3xV1d6OM_j6
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a9b5af cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=dhbZpO1kUukDP0kxHBwA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 5Vxmkfmv4gLGRl_zmSW0y3xV1d6OM_j6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050138

On Thu, Mar 5, 2026 at 10:19=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Mar 04, 2026 at 05:28:06PM +0000, Ben Copeland wrote:
>
> > I have a list of people to include on a call. If you are interested,
> > please let me know, and I will add you to the meeting.
>
> > I propose the meeting for Thursday, 19 March, at 15:00 UTC.
>
> That works for me.

I like to join.
