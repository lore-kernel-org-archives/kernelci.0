Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510BE2309AF
	for <kernelci@lists.linux.dev>; Thu, 27 Feb 2025 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740681709; cv=fail; b=Us+Tpnn08zIs0D2tALnhIytDiguWEP1nC2LqvwfJ/vYZS/5SChbUdj/ax+5w5obne1J2Fvtcl19YsrZgjXxJ9wpUS6q7DnB0yojx9dHQzvEhQZ0j+Iu6gkj0UcfPBonjyNCXv/nqNIRFBntUXdzku0N5iqH5jZiaOGh7rNfUx/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740681709; c=relaxed/simple;
	bh=yxAkxkSJW4Rxw0FnU+9Tx2YW1IF97rTg1V3+Gpfa5Vs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=meevVt5Udf+1IFggt11hOEVz/324Nb1jqpWO/m1jSKxFVSf1kQE1NumFF6vBy20ByjqfBX5RiCXNsBl3aZsf0Ca5nMx20xa25ariUsXBy4CndugFbrCPGOHoSLQrl2fUpPX9Avj1Ga6HutsGIxCECxE+S3W7NdWlWQxA8pmXT2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=VZ4jsugF; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="VZ4jsugF"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RHGnnM028779;
	Thu, 27 Feb 2025 18:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=yxAkxkS
	JW4Rxw0FnU+9Tx2YW1IF97rTg1V3+Gpfa5Vs=; b=VZ4jsugFlEfQCkTrnOYlMGT
	sTBzJWy5dostDFLjxkdTyhdq+eqs7woH+5jHK29PR3xyreDKcD5UT33Taxt8d+lm
	xpC/gx9qdE7o1AowFPKxcLzxmebf2xqpSGYsWWkXBiiGgFb3FNctItijhlfyzZsY
	9dFML7KvnRf6Jt8YXmJTVMV16pwV3Jmav3uYENHpKu0cgotPu+GfraBDU8IFIYA9
	Ah1wevBqZpFbuu78P7f0cowYjXpJtEXPSh04ga6i2QlsoSF9PmzGpoc9MyjMzMtq
	8T0oOmlQ35iGCdx1Ih2UUX+RRdp6oXFvLoKgCvhak8H1yEyXoZn0y79MCsF6JYA=
	=
Received: from pps.reinject (localhost [127.0.0.1])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 451psxj0xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 18:41:11 +0000 (GMT)
Received: from m0209324.ppops.net (m0209324.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51RIfBDI010077;
	Thu, 27 Feb 2025 18:41:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 451psxj0xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 18:41:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT2+DgcYGDCG9tozejKBRQkFSxo3MIJL2Tg2eP7WNAEw6AWDhOa3UgVrTjvW3t+zk9n/mMFUjZeiwXp4O2Vo1CvK9CzDps+w6D5tdg0Hi6m2MWrl/TFjTUG40+GiBfXwN01AX1AXZ4sCHRSzfOiukG1W+v3tjFMtq2gZoWDW0JGzIAeK9I3lPHpNmWiZt0gHiVsaltslkpRJROpE+6OdExzkQXhYK8e54I7vmmhhvSvM4dpvZek3wurC5WmxnXtXqmRfS4RzS7ZmN4Ueblk49xBSHwIz8oC/ZiSsPSRIm5u0V0i9RsgiExd3kJEgnqRTF0sXOvzeJpcDW/InwG0FPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxAkxkSJW4Rxw0FnU+9Tx2YW1IF97rTg1V3+Gpfa5Vs=;
 b=dbduDchwdUAayHOkFUH/BqA8A/H6/GZvQ/B3osNmo706J21exfuL2XjWlrxKbLfpXbWYBgPqw6BPfy6FP9ECRGIw1EJiW7O3g+QqkhXKrPF2zXNKd2Yn898a+KdyEWOvTC+XgKWpAD1qEabBzWsd6OHafIsyZafJxVOczQdWZ4RK5SEnFO9xkzeFwDB2LY7A+lcMXyFfqQCnAK5VeqoYjIF4vsCc4tckBE4E/HUg6ffHY/l30Ty9AhJMXROgy3v2hBcRqjKT7YmtudOWX5krJkaiTxznKNTfkhlIXtUiStQHaviPuJLEADb+aqLu1CHz5mYfsnJPG6Ul40fFFBc5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by PH7PR13MB5595.namprd13.prod.outlook.com (2603:10b6:510:139::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Thu, 27 Feb
 2025 18:41:04 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8466.020; Thu, 27 Feb 2025
 18:41:04 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Nikolai Kondrashov <spbnick@gmail.com>,
        syzkaller
	<syzkaller@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vishal Bhoj
	<vishal.bhoj@linaro.org>,
        Alice Ferrazzi <alicef@gentoo.org>,
        "automated-testing@lists.yoctoproject.org"
	<automated-testing@lists.yoctoproject.org>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        Johnson George <Johnson.George@microsoft.com>,
        "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
        Mark Brown
	<broonie@kernel.org>, Philip Li <philip.li@intel.com>,
        Denys Fedoryshchenko
	<denys.f@collabora.com>,
        Tales da Aparecida <tdaapare@redhat.com>,
        Aditya
 Nagesh <adityanagesh@microsoft.com>,
        Sachin Sant <sachinp@linux.ibm.com>,
        Benjamin Copeland <Benjamin.Copeland@linaro.org>,
        Manoj Kumar
	<ManojKumar08@arm.com>,
        Michael Hofmann <mhofmann@redhat.com>,
        "marcelo.santos@profusion.mobi" <marcelo.santos@profusion.mobi>,
        "kernelci-webdashboard@groups.io" <kernelci-webdashboard@groups.io>
Subject: RE: KCIDB: v5.0 - backwards-incompatible changes
Thread-Topic: KCIDB: v5.0 - backwards-incompatible changes
Thread-Index: AQHbiUX3JN+V5LX+GkKJsYdAWaxIx7Nbe13g
Date: Thu, 27 Feb 2025 18:41:04 +0000
Message-ID:
 <MW5PR13MB5632ECCE787456CE1BA27E4FFDCD2@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
In-Reply-To: <87b2306a-4110-4032-956b-d0a6db8e3aca@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|PH7PR13MB5595:EE_
x-ms-office365-filtering-correlation-id: d4a2bcd3-2836-45cb-55ec-08dd575e4a8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dzhLaFllL3NvS3ZPUys5WW9GcmNMVVk4b21JaGtXN1lzYXlzNWU3MXZvR092?=
 =?utf-8?B?NStQTEU4b1p2QURUVnhzWWEvRXJndkg5dDJPWlc3UUxRYm9zS0hRYUlyYVVa?=
 =?utf-8?B?YStLWWZrZzlLZmJWVlpoWTNoNTU3TDVHa2lqWE8xYTVzMmFuQ2k3YmczQno3?=
 =?utf-8?B?WjZiYWRuS3JkMGxHN1F1TG9vQi9MVHU4N09oTk1UVm1SeWRlT3hjMHZjVnc5?=
 =?utf-8?B?eG96U1g3VkJxQWRUeGhGRElaSFRINDV6YUxJRVIxQTFEODhYQm9tWmlQWjk2?=
 =?utf-8?B?VlVqT0hOQWF0UGlFSFVuLzQ0TW83YXpvcU8rZWZtOGE2V2JxcllnLzNOMnhr?=
 =?utf-8?B?YWpJRHZLNDRaYmJOMTRFQlcxZHJRQkdGK0VQY0orbm1FcURuYnlueW9Ha3h6?=
 =?utf-8?B?TzNrNVBSVWJZcFhSaVFpcE5rb2tNYmdwc3VJcHVKUTBUZ2Z3Z0pnNEViT2pt?=
 =?utf-8?B?RHdjcHZiR3NKaXpPRUVLY2Z3OXJoZEpFV29DRHd0dEpIL1p5WmNHTVIveEtO?=
 =?utf-8?B?dkNlaTlWSG04a21USEJUNlhjcmVISVdOcmVVN0cyUjVvKzBIZkRIRmpRNXls?=
 =?utf-8?B?TTlYREdJSVc4SFQxWWtEZ2pVZ0RjSkVTbDRMaDdwQ2xoRll2WXVNZHFITXpS?=
 =?utf-8?B?MEQ2VHNqRlUrMG1mTGd4UEtaNHdTRDNsSHFHWFVJZmpmR3Z6b1lMdElJK2tL?=
 =?utf-8?B?RG83bkVqd3BYWWJUZWllR0xveTVhNkFaejNLenQ4REo4TklLdFUzS2hzYS9q?=
 =?utf-8?B?Wkdqd0ZkUnEwTVVyc0t4ZENWSXNkNGxGa004dWpXYWhOampwcHdjTmdYTXdN?=
 =?utf-8?B?eEluN2NJamY4d1FXWHd4RGpQNEpYSi9oUldSelNwOUlpWklHaTlFdHQyYXFo?=
 =?utf-8?B?T3lGU0xhOGlVTS9tbW5vd0hxNk9jTlZrVWV1alMvRy9HWGhBVjJnWTBVQzBS?=
 =?utf-8?B?ckNPOTVNdEhxNTFyVXU5cEdtQk5NTjlvOUVzR1VtVnJxUlo2aVQzSlJqanhW?=
 =?utf-8?B?Q1dzQUl3S1hqb1NRblBaeFJvMjJMV2VGcVpYbDNEMHg2MEdvNFZyY0JhNHBP?=
 =?utf-8?B?K1lYK1pwYk1aMzc5a1lmWE9oNGMreE1yeS9VS3MrTER1Yy9uL3pwSkk5cVBF?=
 =?utf-8?B?SmRjb1ZNRFhwWWhPTmpqaUErdk1FZmRVT2RLb3NWOEw3Vld1djJQQXFsQXRt?=
 =?utf-8?B?WWhIKzRCUVQ3ajM4MG9VZTdNcGUwcWt5clhuTUk5YjFPM00zVzJ1RlpxT0hn?=
 =?utf-8?B?SHNCSGZ6dTZsSXBacGk5MkZjWFVVVFpTRjVqcmF4WUVhdnI5dnptTjd5c210?=
 =?utf-8?B?VythRzNuZk12anNqMElKNUhWbEJUWG9rV01Ubk5oYVJuSUl4aEJRbVRTTGY3?=
 =?utf-8?B?L1VxL0RKckxoV3lINDFlWjVUTExUWlo3SUluUERVV251QXpsT0tuWS9NN2Vs?=
 =?utf-8?B?UGhjbGtYR3pqd0k2SlFJc3VnUWxVQ2RpM1k1aWRRYU4wL000dklheUY5OEp4?=
 =?utf-8?B?OTQwWHhyZHdIT0NoTHZPTVBqaUdPd0VJTGpPY0pUSHdFUmxlallEQWl0NjBU?=
 =?utf-8?B?VjV2NmE3S3FxSEdBUEM4S24vZld2YUpmRjdubXphS21JLytpR0dmQUNqZG5m?=
 =?utf-8?B?RnBEVUU1Qm5GZGRHa2NCM0lYdCtSM3UybUhiWVI1VVRLMUNLTVhrQmh1WU5q?=
 =?utf-8?B?bTk5UWNjWjFOUVBjTUVjR2dPZ3I2OUIrNnpPNjVveGZHV0JxaXlJNzFCVzFW?=
 =?utf-8?B?ZjdvK3BwWlFadXhlYkRGd1JNNFY3ZnVwZEx6a0VQNVl3SGhxOEVONitXQ2NH?=
 =?utf-8?B?SWVUb1dTK0RUcjZmWEdPN0VTcHUyNEdpeVZKQVoyZlJLSkx4YzB1Mm5FQmRr?=
 =?utf-8?B?eGtla3drQldxYnhoN2Z6YXkwUG1ZU1YvREV4dUI2dlRtcmhNYUdSRG56ekRm?=
 =?utf-8?B?NEtpV05lV3VCcmxLc2N3TUJXSlBxN21jdjhORVdlN0prUzJhMUZZalFMMTNN?=
 =?utf-8?B?K000NmFkT0RnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OCtFOVlsOHVlRjVJdFZjOURrL3FYbzRrUXdVUWM4UWJVMld6U05hbVJweXlx?=
 =?utf-8?B?V0k2bjRXcTlpcFA2QVV3alVkQ1gyUk1rYWFHUjU2OE5ERkt4cHFBU012alk1?=
 =?utf-8?B?QU9NOHNhY3FzNDQrMXBZQXl0aU5la0twai8wT1craFFqZmNEYXpNSFB0L0Rq?=
 =?utf-8?B?RlBvdTFjd1VYM1BSck82ZjhYaTNUZHBoU20zUTZKMC9ES3psT0s3a1l1ait2?=
 =?utf-8?B?cXQ2UHg4NU4vRGduT05QMjlOZGc1aG1wRkx1OTdlSUtqanE0TncxVlBGbXBr?=
 =?utf-8?B?cnM1cXI0V1E2MVNLWm1mL0dDTGtYeEF3bjFxSEpOTFZlc1pYaTNCVnU1WVRE?=
 =?utf-8?B?Zm5hNmhqQVlvREpmYXhnbTRWem9HTk1pZTlrcWU4Y2k0NXpTWTlzU0U4TmFL?=
 =?utf-8?B?Q2FkZWp3c3E3aWZMVnh1dlM4V3JJQm1rWVVUenVqb2s5ckQ0N1EwY0VjZWhW?=
 =?utf-8?B?VjNTSzlYZWMvem5pMGlkRjJ1dVhiRWg2ZEZkRThjUTRoWFVjZmgxM1NOdmhK?=
 =?utf-8?B?MHpZUGVYNXdPZVFTcWloOU1lSitudkdsVyttRWhQT0tORzNGQ0xMZ3dBS1h6?=
 =?utf-8?B?RDBIZEZhMk1LTEl0T1IrZkVSRHpGUklHcEpvV05GZ1VuZHBFZXJOWUsraFd0?=
 =?utf-8?B?eHI1STNNejZYdThNM2J5T1FlbGRaZDhtcjFwNWdFRkJJNnYxRS9ieHpjRllH?=
 =?utf-8?B?QTJhT0VzN2pxc01rRVVPQXBTQ2I1OWZWQ2wrNFdXbFBtamd4WERRMnNEQmxM?=
 =?utf-8?B?VHFnVWtacUxCOVdTS1NVY1gydTAyTWdERmFKcUhSeVNEbzBGRzgwRVo0NGdL?=
 =?utf-8?B?eU1KZHU1VWZnY296bEEyWFY0b1VjTDFiSXRZQmZRUnpCakIxdWJybGRPTDJ3?=
 =?utf-8?B?eG1CS3JPVXg4V0JDdjk5N3JjTlgzL1FGdHZmQlpqcWFtZ2ZlZzZSNGc4d3ZX?=
 =?utf-8?B?K2pnOGdyMDJTczlVK3czK1N4Zmxya3FFN0lQRkljWnJ5RmZNV3lyWnhWdU1Y?=
 =?utf-8?B?bERONEVnZUkyV2htSUdoWWV6YkxLcWZ6VnFhWWtMT1JOWEp5VU0rVW95Rjh0?=
 =?utf-8?B?MFUwcXZ4c3g3Yi95RlRiaVBXYld2bVNJRng0QmFEcGpET2ZPMmZXb2RHeFlP?=
 =?utf-8?B?UmhIdzloSG1EbGt3WStsZmplcEZPdTVFblNSTmhSb0p1OTlmczNHWkN4eW1s?=
 =?utf-8?B?dURYTTk3ZHlSWCtOcGVMSE0xWVNhbU1vT2JKblVMa2k4MHRjaVcxTHZWNFdl?=
 =?utf-8?B?aUlyQXVHbmVhYWpSWmJoSng3Zy8rOTduVitNRXBZY252dEJNSjAvclRKckYw?=
 =?utf-8?B?MzlIRVV2RTNiWXJwUVlvQWJxUlEzTXpCU081THp6Vjg1WVg2bSsrb2hGYzcw?=
 =?utf-8?B?djl0UlhDdWhsZ2RPQjlJNG54S3FuQkp6eWN4VjQybDgyZ0pTR25SUWdhUEJN?=
 =?utf-8?B?cDZNVmZJdE5zTzk3Tkh0clAraXIzQmJraG03TjFSMnpMNEo2VzEvN21sbkdh?=
 =?utf-8?B?aWw4dS9NQWVGT0JVMkprWEU2R1l3L1ZHU01JeWtNMFFncU5MWmVxR3VQVVh5?=
 =?utf-8?B?UW5YbTNDOUplTjFRQUtsNmEvUnNhK01ZSEE3NDBKTkRDWmtVZTBCNFRrT2Vy?=
 =?utf-8?B?Znk1Tkc5NUlIc1FxRlhRalcxQnZUUTNGMitMdGp5bFZzVGdRdUlrQWdpazNU?=
 =?utf-8?B?YkdxeVljY00xcG9EQmpIZHRzVDlnaE9IMXRqQWovb0hsUWlIM3B5TTdGQkZt?=
 =?utf-8?B?NWh6RzdrZWk4UmlvK3pPZVhrbnhKWUxPaUtkTDM1U0FRT0E2YzFkVGRoeDVl?=
 =?utf-8?B?ZEpuRUNkb2JrV1Q2VkorTEJxM1pwS0ZuTGdNVjdXNWNzWTFVQnZLbU9XTWgy?=
 =?utf-8?B?VDJ6c2FzMzI2dFE0Z0V4Qm01eWRJNjJwYTUzR0dKRWxqb285RmhabVY0QTE4?=
 =?utf-8?B?QkUrMlI5Ri91WlA1N2dsZnRkTFFneHFZbDl3R3NLL3lrSDYzNWdKTTQ5cXAr?=
 =?utf-8?B?KzlnU3RiZDRmd0ViWjkvTE1LbDNrVjN5cHcramhNSGxodDR5T0FIRklyQm1P?=
 =?utf-8?B?RE5LZjNFVGQ4RzBFRmVpNkozRVVwc2JPeHhoSVpNeWZLazRrVldlQkxmVllp?=
 =?utf-8?Q?5Uts=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HhVEs1rM4YMuiJxDkumkzEy8i1AWbxI5Z8zQRgeoEkPIpVr29Ts7XpOXH6OJ9FtJc9R2WiEizStL1Xd8o0WAdvYEzJeRkqCJczEtQSlV6L7mgNQSP3FMJ/t5hpK5GzrYJ5gXn6FBEQA+QbtqyCNxSqN3YaCH5hw29gfNnBqomoMiJ1MCEJMWjMcJei2AZvV56y3Yq20WPJuS2P+bZySHIem7jetJoq8DywQzskJBNiOaTjS2GL/nWfplJRhBVnliEnk47JZqhvCd0YdqdJ0HHJZP1wYJzS9yaGAnHsTi/7jc4o/frw89fGIauA1i03phZDHM/hZgaq1TWRTYozd0q7u3o3WYOj3yb6cikASvIeVSdfv1AYj42yRSOYHQVIS+8dSZj1z36CGgTzOyPtO1DwcYi+HezF/mLxrtWA5Wtwxu3BqZ54WPmHXqn5DNdBm9sbVf+wcrgxf7jmugbj3AEjOhPulfxeoPOJH++fwVM6DHe0q7p248Li11iTWojK5BDYDoEBCDIIK8t1nJui0RTYJMBqFhyPIP/T934aQuoqPkhsbnqzzEoO7f2bZQIVzeW+ptgbaPL60v4L4jhG4QEvZ15B22bydJTlAGGspkM/xlS1EYlLKvfXUQm2r5r0qu
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a2bcd3-2836-45cb-55ec-08dd575e4a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 18:41:04.5591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vfXRK/XrMPXPN4chBjgyhzOUrX1zRtISkgjEzzDUxSVaTwajTl3rPOjUUk51UOSmXlcld/HIT6piwFTiPrH/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR13MB5595
X-Proofpoint-ORIG-GUID: HyfUM2-f3nR0xc98T3wmXaM3kJ7hTOy6
X-Proofpoint-GUID: MGwPBwRdCltqeYXMpU5sMdj6Vfim-aYD
X-Sony-Outbound-GUID: MGwPBwRdCltqeYXMpU5sMdj6Vfim-aYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWtvbGFpIEtvbmRyYXNob3Yg
PHNwYm5pY2tAZ21haWwuY29tPg0KPiANCj4gSGVsbG8gYWdhaW4sIGV2ZXJ5b25lIChwb3RlbnRp
YWxseSkgaW52b2x2ZWQgd2l0aCBzZW5kaW5nIGRhdGEgdG8gS0NJREIsDQo+IA0KPiBXZSd2ZSBh
Y2N1bXVsYXRlZCBhIGJ1bmNoIG9mIHNjaGVtYSBjaGFuZ2UgbmVlZHMsIHdoaWNoIHdvdWxkIGJy
ZWFrIGJhY2t3YXJkcw0KPiBjb21wYXRpYmlsaXR5LCBhbmQgc28gaXQncyB0aW1lIGZvciBhbm90
aGVyIG1ham9yIHVwZGF0ZTogdjUuMC4NCj4gDQo+IEZpcnN0LCBoZXJlJ3MgdGhlIGtjaWRiLWlv
IFBSOiBodHRwczovL2dpdGh1Yi5jb20va2VybmVsY2kva2NpZGItaW8vcHVsbC85NQ0KPiANCj4g
VGhpcyB3aWxsIGJlIGZvbGxvd2VkIGJ5IGEgREIvT1JNIHVwZGF0ZSwgb25jZSB3ZSBhZ3JlZSBv
biBzb21ldGhpbmcuIEknbGwgZ28NCj4gb3ZlciBlYWNoIHByb3Bvc2VkIGNoYW5nZSBiZWxvdywg
bGlua2luZyB0byBjb3JyZXNwb25kaW5nIGNvbW1pdHMgaW4gdGhlIFBSIHNvDQo+IGZhci4gUGxl
YXNlIHJldmlldyBhbmQgcmVzcG9uZCBpZiB5b3UgaGF2ZSBhbnkgb2JqZWN0aW9ucywgY29tbWVu
dHMgb3INCj4gcmVxdWVzdHMgKGhlcmUsIG9yIGluIHRoZSBQUikuDQoNCkkgcmVhbGl6ZSBJJ20g
bm90IGFuIGFjdGl2ZSBzdWJtaXR0ZXIgdG8gS0NJREIsIGJ1dCBoZXJlJ3Mgc29tZSBmZWVkYmFj
ayBhbnl3YXkuDQpJIGxvb2tlZCBhdCB0aGUgcHJvcG9zZWQgY2hhbmdlcywgYW5kIHRoZXkgYWxs
IGxvb2sgZ29vZCB0byBtZS4NCiAtLSBUaW0NCg0KDQo=
