Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D921EB9F2
	for <kernelci@lists.linux.dev>; Thu,  4 Sep 2025 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756998343; cv=fail; b=h3ylpUc1UIOUTRvKspUmaOcmRWk7X4ZOW9HJWnsE5z96qeStatTB7NW9NVC3Q7QYIAg/90Pv5X0XrIV9xHyeq4+y22fSR1JAg0RG0111M7lGBLJtI7joPkuw6wSwULxbNfJ5OMnxNekcb6ZLk0cgkuEJUqFw+ip5+tPdNhhHnmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756998343; c=relaxed/simple;
	bh=zhbQIqPpsQp5FZVhHI6gj0ZkK3NRmnJDj3+JjUf6WG8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EWfFpkMdFNJD53vMu2OC8jbCEbERGW4vFKtlUg0Zrym05LH66/XqT2yaYV1MmMyB0b3jd0SA72mFv8OPykoVnIXav5AllQz7iLJ5bn7Vt78rC2lmy5Xq2J2dmHLq9M9WG8Jax4pP0+qypjrnz2ogk2tukQXXlM8+TJTgis/g96s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KqJXaRz1; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KqJXaRz1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XDTk012203;
	Thu, 4 Sep 2025 15:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=zhbQIqPpsQp5FZVhHI6gj0ZkK3NRmnJDj3+JjUf6WG8=; b=Kq
	JXaRz1Rbylh4cBczIBqWPcY1rHrOPKgNHfMAfvBWhQ5pag2z2yi1OAbBw1twyVoL
	xwMDlNO9kQIKIfARoVP0yPJtfQOdrV8/kJNuHMOUxcHkJc5LkKhc0VRNZGwqlWTd
	OVvUKeibbrm4a+wW5UXJ8aJLejMvwbA1SXvpON66wkMeK0ZO9donlY92q2ho06a0
	wU9cURsOJTrFgKd6B7gsBku8CSYKrSi463Lndzz77nnL+ztRiA2LdDkb52TyNYjS
	TFoDN2P8FLKo/URh71F4VUdJNvCjt72JWFwQ1toLgigol+2Ja8xWeRSwPG/vUrnO
	4aemfDFtFvxQd6x9gXYw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj4c9p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 15:05:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXRX//51KEfie90KOXCS+c62xGlXaDzjsB3LJKNGJZN0cibSzeF4WKz+6tfYW5g1ygdUP2+CHoz9EJwiHEwJ+CEGyn/vXvRF1Z+dNDtcewz3TfN0wUEkPXJ6lUYPbwb/UeVB9RGlVvBa/csTNTS0hoiO7EKX6jHEQIYLs5hd0gDI0S2XhPFIXCLOLG27Nb3mBqQjW2EzFwwF+sAJ7R89uI4BklwoZOaU0HvkHZbd5wHq3qC3py/28ScJb5vOOkM5wRLzmcGWqbOyDLO2lcp3YU3OdWccWbILy3uHq2Vq/sqN+cgBwiwn1z60ejhXv+oO6RWIOYcbVGHIAf1VTS7+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhbQIqPpsQp5FZVhHI6gj0ZkK3NRmnJDj3+JjUf6WG8=;
 b=rbL0BPZrR6WY6Pc8uKykDcxDke5xCAMCRD0g4LEUJeY6CHsnArLE+qcTXqm3ET0+K7FFzUF5s1+3yuPmLDoylIhr9owt8rqNggvD+fqgDIXDmVcK1bh4HYl6oNOS3HZ8QTAhixvw2KTu6h/CftdWqnfMrx3hTuwh+DHpiueAg8S+hHmrVLPMa8fQQ3UAfa32m3KmL5FwP+UyMaQj80rC3Q3kFZrFvtU+0N0kTQh3UyKNK/vFBM/K+Xcen6VKhIfVfI7chI4SdNlaMkTOXcxoYNyXSn4gPdKq7wy+hEc6zp25hkML10z/fluJs5+34/+oL4tiEpjUa5jDhDY+ZhxPcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM6PR02MB6510.namprd02.prod.outlook.com (2603:10b6:5:1bc::7) by
 SA3PR02MB10951.namprd02.prod.outlook.com (2603:10b6:806:464::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 15:05:30 +0000
Received: from DM6PR02MB6510.namprd02.prod.outlook.com
 ([fe80::a6b9:4ca9:7fdf:d714]) by DM6PR02MB6510.namprd02.prod.outlook.com
 ([fe80::a6b9:4ca9:7fdf:d714%4]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 15:05:30 +0000
From: Milosz Wasilewski <mwasilew@quicinc.com>
To: Gustavo Padovan <gus@collabora.com>,
        kernelci lists.linux.dev
	<kernelci@lists.linux.dev>
CC: chris.paterson2 <chris.paterson2@renesas.com>,
        ben.copeland
	<ben.copeland@linaro.org>, cfi <cfi@pengutronix.de>,
        broonie
	<broonie@kernel.org>, sjoerd <sjoerd@collabora.com>,
        khilman
	<khilman@baylibre.com>, f.pflug <f.pflug@pengutronix.de>,
        =?utf-8?B?IlBhd2XFgiBXaWVjem9yZWsi?= <pawiecz@collabora.com>,
        Tim Orling
	<tim.orling@konsulko.com>
Subject: Re: KernelCI Labs Working Group
Thread-Topic: KernelCI Labs Working Group
Thread-Index: AQHcG5N+usIShUCIlkaawFEpzlQ2V7SDNFEA
Date: Thu, 4 Sep 2025 15:05:30 +0000
Message-ID: <680F4937-FCF6-4E32-B4DB-628ECFF79A7B@quicinc.com>
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
In-Reply-To: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_08f6f869-1ed0-46b3-a227-1d3e52347e28_Enabled=true;MSIP_Label_08f6f869-1ed0-46b3-a227-1d3e52347e28_Tag=50,
 3, 0,
 1;MSIP_Label_08f6f869-1ed0-46b3-a227-1d3e52347e28_ActionId=ca8acb6f-8676-4400-9e44-f852792bf7a4;MSIP_Label_08f6f869-1ed0-46b3-a227-1d3e52347e28_Name=CCI;MSIP_Label_08f6f869-1ed0-46b3-a227-1d3e52347e28_SiteId=98e9ba89-e1a1-4e38-9007-8bdabc25de1d;MSIP_Label_08f6f869-1ed0-46b3-a227-1d3e52347e28_SetDate=2025-09-04T15:03:53Z;MSIP_Label_08f6f869-1ed0-46b3-a227-1d3e52347e28_Method=Standard;MSIP_Label_08f6f869-1ed0-46b3-a227-1d3e52347e28_ContentBits=0;MSIP_Label_08f6f869-1ed0-46b3-a227-1d3e52347e28_Enabled=true;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR02MB6510:EE_|SA3PR02MB10951:EE_
x-ms-office365-filtering-correlation-id: 72bd9d44-1c2c-48ca-769a-08ddebc47d79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dW5USEFITzZoYnR0RjRMVGFEVm0zTzJYbC9VbnpsdEduclJtdDZSR0RncmJZ?=
 =?utf-8?B?QlFSdzM4emRiTEVGOVRDSG40YUxWZ0hJR0p6QTZHbHhRSXNIamZzTEl4ZFJz?=
 =?utf-8?B?bmNwMVY3bGNxVlQ4a3V4cG1lcUhXLzNOTnJJR1NTQjl0YWZ4R21RdDBpVklt?=
 =?utf-8?B?eis0cVV4RGl0SHU4a3owejVkMmc2ZVNESWtXNlVnNlkwb3J3WnEwMFg2M290?=
 =?utf-8?B?RlBuU3JrOTBjK1JRc3RSK2RzaE9LdkJPcnI5bUpRTXl0cHlRY3Z5VE9KdjNX?=
 =?utf-8?B?UzFhQTNsWVEyNnBKTUhqT0JJUit0aG9jTTJqT0NSbVpJb1dQcjJBWElOWkhU?=
 =?utf-8?B?aE51dnVtSFc3RU9rTkhSeFJlemdHaGx4REIrbHJUbEJ4T1YzRDhLMWVqbklu?=
 =?utf-8?B?bStTd0F6aDBzNjkwSGJaUnA5SkVWUUVBUW1GMGdOUWhwNlVxUXZpUThZWXJB?=
 =?utf-8?B?L2hFYTNoaCs0VlZaNTMzaHloVkIybDFCa3J3MGgyR3lGOVc5U2tiSml5dCtw?=
 =?utf-8?B?azhFdGFoZFoxOFdmaFNmOW9pRzEvWjkxNERzNU5lTXFkTUdoZnhZMUM1aG0v?=
 =?utf-8?B?c1RscER1cS96RU9JQ1hqZHJCM3RGcmpxbTFxbUtVQWQyN29FOSsvdC96ZERz?=
 =?utf-8?B?b3RPOUJqMzViN1FaZmwxMUE3RmN0MGVDRXd0SlRieWc2elM1Wk8rOWVZaEV0?=
 =?utf-8?B?STlqOGRMTlJyZ3ovc0p4c3ZXSDVmTWIvWjlKN1VnRHZrRVpaNCtXdEczb2hu?=
 =?utf-8?B?N3E3d2dqelMveERMNlVSM3A5MHY1SkxCd2RTM3FMRGlBcTc0WVZOTjVpWE1q?=
 =?utf-8?B?aHFLbEtTNDVtbU1hSDJMbmdrdDZUbmtzVjZWeUNULytMUGFLVy9LMWI4WlRv?=
 =?utf-8?B?Y0hEemw5aE92U2F3Yjh5Wm4wRnUwbHcrOVltT2ZJVzNwd1BYTHJRTWd2SUg3?=
 =?utf-8?B?VEo1UVp5aVpTZEthdGVSTVMxeTBFdWwzcGVpaWEzMUI2YzQyMUFBWWdqTXRx?=
 =?utf-8?B?K01PNzVNS2p3Vm1UVnczV2FyS1dLNEYzTjAxcHk5aGc2dmJtOVhpdzJUM3hC?=
 =?utf-8?B?VTZPczVrakdmbHVGaE5aM0NlYkVZeXRUSUpXWDdQc3BkbDNpdFdDalArYUtF?=
 =?utf-8?B?d2FvS1FZVGgrZkFBMHh5eXdacWpoV2dYQldIcmYwUlcrMGxwNGVkTkRTVlhU?=
 =?utf-8?B?Y0tUbU10Q1JlL3h0d1dZR1p2OSs4OUZMTlJUZmV1SzdydU1YU09oTGt5QVRh?=
 =?utf-8?B?S0JrT2xWREZkV3Vyb2wzS1JCNkJEd0FWNEhVWW5PYjYwYkx1SEVzUDRpV1hV?=
 =?utf-8?B?WE9YTDVSWFQ4SmJMNTdpbnpwVkxZeHBTRmJOK1hVdGtjcUNrSktUT1E5bGd0?=
 =?utf-8?B?a3d2RGlwNEs4ZWIvSEluTmg2M2xUcUxwdlZPWHR6dGZkMFZ5bGZCOUZKVjk5?=
 =?utf-8?B?enBwb3BBOVREMlZ0SXVKWGFpYVdDdlY0K2pXVjdJTGJkYjZWSEVzN05uZEk2?=
 =?utf-8?B?UDR5RURzdkxOajUvc3BUb0k0Zjdtbzh2M05xVlYvQ215OC80bkNpWGpGbkhH?=
 =?utf-8?B?VU04K3ZGQ2J5WDJSVjFYNGdOWitjZWZMRHpNVVhMRmNqaVp4MkJ3VSsxSkRY?=
 =?utf-8?B?VHA4NzNwZjN5TVVBK21zWlIxZWNxNUhrR3lTRkpvc1BXQWppQmRoMTNoNnk2?=
 =?utf-8?B?Mko0alpncTRqVmZ3RkwrZzJRRk1GM1o3OXRNYjRjQ29Rbk11ZHJmWHhWeHd2?=
 =?utf-8?B?SlhEbWI3VmorbjBCanF1akVrQW04YjFIZ0tYMUUvdi9xQnRlNk1RTGt6SGhO?=
 =?utf-8?B?Q2FPakVkZmJ1cEJsS0d0SHNUQTNFTHRMMUdZdGdHelB0VmZBYnR2U1lGcUZK?=
 =?utf-8?B?OSs3S3RLNkwremlJdkZOTzBycUx2ZmpyQUVEY2xoYWoxWnF0dlduR3pBd1pY?=
 =?utf-8?B?cTJZaWtMTFp6MmxJYmVMb1IyU1dCbk96S0QvaFZVS0s1YTZIWWozVHgxMFZO?=
 =?utf-8?B?ZSsyZllhNGtBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB6510.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzNnSWJpV3FLaW1SZklMdHdzcklqYzFTYndRUzh5c2xCb3hVRWdQWEdYSmQx?=
 =?utf-8?B?SXRxTi9sY2Z6MTlBMGNudWdWODNRaUlWWmpyNmZ2U1cyYm4wNWQ2c3B3amJr?=
 =?utf-8?B?K1hvdjkvZVU3T3FyNGhnZVVQMWU4dDdHYis2aDJDNi9jUHNDTDdkeHdieXJC?=
 =?utf-8?B?eldnamZnQnl4d2lUOVZqRWN6dUNqckp0V0cyTlFTZzhPNmYyRXRyT0oycC9l?=
 =?utf-8?B?NWdhaGVwZXpXTWxvcEtWZHhKamlIRStXNjREelhhNC9oU2JTblF4elIrZzVx?=
 =?utf-8?B?dWZaUXF2TTNRRUN4a21HNGJKVU40UktOZjJMTGdKb01mVU43a0VuNXh2SVZE?=
 =?utf-8?B?NHh0Q1RCOUFXY1JzeTVCNjM3dDZub0w1WkszaGJLVlZueVM1RTlYOXNBRlhs?=
 =?utf-8?B?UlhOTXUrUWkwc0NjWnNpdWFCMlFXZURnMUNEZ05pV1UxWDJIVDc5NEEvNlZ5?=
 =?utf-8?B?QzExMnVuenh6NGxCdHBJZTIzdTFyaG5yUmsvSU9NdklDSlBjeHd3aHQyV0Rw?=
 =?utf-8?B?TGUyVGI1cHN0UnRVZVlwdnV3b3NIN3JrVkRNRUpndXAreCtWZ3VUaEhBR2xa?=
 =?utf-8?B?M3RkekQrMFR6ckRxdW0wUHgrbU9VYWlHRHpaZmxpV2dvd1R3ckpzT2xrTWEz?=
 =?utf-8?B?NHdxTnF1eXA3RE00RExFSDdtcnlsdG1Fby9lNE0yQXlyeWFrTU8vRGpJTGRs?=
 =?utf-8?B?ZDhyZUZKVWZVU29rV2JaTFZMdStqUFJxbmJEOUNXUEFQRWN0c1FDMDFpMzAz?=
 =?utf-8?B?NVNxWFNvUlVJdXlMa3NvN09BVGxoelYvbm1xLzlkcHpOeHlJcHc0aXNyZDFw?=
 =?utf-8?B?TFM0M0srSVlSNDJkM3VpNk82clgvOWFZMW9UUVozTy8wK1Fjdjl1U2VJWmhp?=
 =?utf-8?B?dzNyU1JXZ3BVU3ZMbzJJZ203MEJJOVp5VUx1cUJiQlVJMUx3VlBiem9YWmdY?=
 =?utf-8?B?VDZIQkdRVUM3bHllTElPU1NQNHMwODdpcHkwVUlONjRPd2lhZ1pDdEcrbjdz?=
 =?utf-8?B?R2FjRlEzclk4QXJqc3Fjdm0xS1kzOFJtRlo1Uk13Nm9sbDU4dDJHMjM3bnNJ?=
 =?utf-8?B?czFhMmZHRkMyc1pjcUpLN1YvY2V2RzArZDdrRW9TbUNIQmttYVhQRHREcnhu?=
 =?utf-8?B?ZVlaajRMWktQSFFZY3dWWTJUMGhCSmRPOFF2Sm1qZTMrQzF5bllnejZ2M1Y2?=
 =?utf-8?B?TTMzVWllQnZ1d1FvZ3BjbHRlTDc0UEtMTWkySG1lMURvRnRzRXowaXYzWlpZ?=
 =?utf-8?B?WWVSaDdvVkVabXVjVTlkNUxsOG9sZ2d3ZHovR3ZydW1DUE12ZkhOM0xUeXM4?=
 =?utf-8?B?T0x6SWx6UGtVODBUejJ3VGZPUTFveUFoclNVN2tMLzV0NE1RR1k0c2MwbkJX?=
 =?utf-8?B?MXBnVjV0YlRSOTNRY3lJQVlQU09KV3hXWXg1N0EvYyt1cEw4S1BnMUdvNTVO?=
 =?utf-8?B?V01YN2x0Z3ZPelhjMmVBWG5xdFhqZmw5U2h6SGJTU1ZlcGp2dkdGb1VIVDF2?=
 =?utf-8?B?SG4rdzFrWVExTzRSV092c1FRd3ZDQjVpR1FRREl1azM0bTc0R1B5OExUSW9p?=
 =?utf-8?B?SE5OT1FSdGVGMVRuUWQ2UFBhR1NlTEpDWVZMM1ZvNThpNWU1UFhaZ1N4ekJZ?=
 =?utf-8?B?OSttZEFWY2xvTDRwZDhIaDZaRFZDZzMwZU01MnVJNHozMGEyNS9BekhVN3Fj?=
 =?utf-8?B?SFQydEU3ekRReFVNSjU2REZ6UlZjY09FWTVPR2orQlZMUElwVFRnZWZQclk5?=
 =?utf-8?B?dnd6SmNsNllLaWdMT24wKzlyVDlaMGlhVjNJOWhQYzR4d1k0MDZ0WkhkRjkz?=
 =?utf-8?B?OE4xUzc2ekZBejBod3llQms3bzVtQUVOVFhBOGR5T3pKbGl1Zy9wcTU0OGFN?=
 =?utf-8?B?L21leXZMOGNxK0xYU2dRU0pYOGZCL0c0UDNqMzd3QlVRbFNlcUs0eTFycDds?=
 =?utf-8?B?VHVFVThFTlYzb3ZhNFVMUWdFWFg0UndveDlBRXhpUDZVb0F3L0VXcW9PSVZ4?=
 =?utf-8?B?bHEva1ZuVlVVZ2NaQjhNL3gvRHNxR0hzZldyK0xpWkk1RGduNVhiWVptY3k3?=
 =?utf-8?B?TVROa1RKeGRXNWRkR0JPUUJIRVQvTkdQbHBXOGFJVDhFTTl3WDhjNVIrY1N0?=
 =?utf-8?Q?76jvcgJFAzB/aRScatzqEHT5t?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63FFB922758F124A8441665E2082CE85@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	My+iL/nShN70wa8/uHu/N3wBYSf6e8/ImgbT+PtHkqluzgNnP/BqCX3Vcy1lE5vyuPTWSALPTIA0xbbnL9mo49jNtL20TvRB/d/iLtTZ0HdNFazh1sqp617knLEEScJ1oRflTR5ZomNvi6GgTaV6OV1PMBiqJXb2x5PoAlPg/pTO0nNdhI55t4gu7WT32ecohHqB8SyPNofILsVCIUL38bflJB649t5btExdW3mE+wMUaQIh6NcI/Og8PNCVvLvZaPUYYZYuFI71MJiS/br8/3sTbpL72oxWEo74gQ0Qf2TSDPHQhYOaVurSsKwbvUugcRdwYbSJF75kjDGj+OvqrIGXjfOoBVADjctGaE9+QXxMeItjbQkIEGTf8a8AA8bzbMF6R5Y3TcgPZTadnnqp69WSBE9bCGqexn/LUkbdtscFBhDKgpYfKw29LJrUbIw8bHffwyO7LnDg7NxdUBk9WxeZRqhcHRCuBiQdoqsJ2H2RXpdUGEzZDu/ACCecpD99iC3proTwUnEVeSicILE1A8GEbkpPSxa5hLY8f4ittJHfKrYT65tKEOkYLUahoCASbH0STh43OoK+7RPDB6SsPXj/Kl3aIR4Nl6474grIx1u0rckKa73pXgJbkPPxz6Dv
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB6510.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bd9d44-1c2c-48ca-769a-08ddebc47d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 15:05:30.7667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yo1D4XaEzpyc8aCjqHRWruvpE38syRvM+L47qkU9JARwkRnsFHc7aYIlnV2nGgGUdbsuQomQFG75lAbE0raoQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB10951
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX8HbidHSngURN
 r2EISur8/AZKDaQffmQJV6SSrav0HL8MtxKWXIhrqJBw70HiA3/ZNTZZ2732JDQH4gEBpa5E5QG
 gcHP65fvCiw6TNcb4/svCkYUXaDTc6LKrRZpTBoRdCvXsYWW3b7jXuapn7Ad+NgLd+BZnTYFuMY
 soLtGST6E444JkstIeB5yUbJgiJb/fUQcYaRf9I5WZiMwNXB8VLWWPDtuA4zH3nfYGB7jyp9Onu
 La5g/fvRP517tBFMWgeh3bO+CXoCLiyTRbG4dC3I2UbaElADUIvfhnC08MhRM+TyhUxv99pUw7d
 C0XOJA2nKw9ph44RTYk2f6M49JMgoTml1H/TE5A3R6o6gkeuS2YbOrBnmmrI4ZDAU08p5KV4rk5
 N2mXBLNe
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b9aabe cx=c_pps
 a=OnljjeCONrlUuPUItWmgXA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=ecscfcNgwp-QV0bpzPEA:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: s35hCrH35H7g_wWMrYlvgPVozEnj_PKw
X-Proofpoint-ORIG-GUID: s35hCrH35H7g_wWMrYlvgPVozEnj_PKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

SGksDQoNCu+7v09uIDAxLzA5LzIwMjUsIDIzOjU1LCAiR3VzdGF2byBQYWRvdmFuIiA8Z3VzQGNv
bGxhYm9yYS5jb20gPG1haWx0bzpndXNAY29sbGFib3JhLmNvbT4+IHdyb3RlOg0KDQo+IEJhc2Vk
IG9uIHRoZSBpbnRlcmVzdCBkdXJpbmcgdGhlIHdvcmtzaG9wLCB3ZeKAmWQgbmVlZCB0byBjb3Zl
ciB0aGUgV2VzdCBDb2FzdCB0aW1lem9uZQ0KPiBhcyB3ZWxsLiBTbyBhbiBpbml0aWFsIHByb3Bv
c2FsIGZvciB0aGVzZSBtZWV0aW5ncyBpcyBzdGFydGluZyBuZXh0IHdlZWsgb24gVGh1cnNkYXks
DQo+IFNlcHRlbWJlciAxMSBhdCA3OjMwYW0gUERULzQ6MzBwbSBDRVNULg0KDQpUaGlzIHdvcmtz
IGZvciBtZS4NCg0KQmVzdCBSZWdhcmRzLA0KTWlsb3N6DQoNCg0KDQoNCg==
