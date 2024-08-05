Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBF92AE95
	for <kernelci@lists.linux.dev>; Mon,  5 Aug 2024 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880051; cv=fail; b=ana1aIKXDBBcUaZuKd1+O+YCSexZhymvGsrk3ZlbtrPS8xkB6OAwwRr4FE2ixOjtgcdGtbU73a6614OGya2OpdjwyZhBbcEV4UpNS1/BeElXZ1ldzbhnrRMBegms0ERlqMM+PB337zwMkg+FgrTZXi/bw2wJTVCkhTLPONeJ6m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880051; c=relaxed/simple;
	bh=MbYI1BgxphRpVB8/BP8pKBCCFHNDyDGAnA2LyL7QS9o=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HpM18EnNESQbuUe7ILmEFHX16/0cN6pn1URVJqTW+nTtMGAbqJlxmSAPJRcn8jQbo3gI2JRoL3iSc69SKZtlx/VSjpdQzpryQmMCRsQtXThi9iG/jM3QVBiJRglJ/qNi0PsH5gwMRLS1nvtADJrlWRjIon3EoMmf2rMlnrPwp2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=YjyQcOE1; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="YjyQcOE1"
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475FfIYY008589;
	Mon, 5 Aug 2024 17:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=MbYI1Bg
	xphRpVB8/BP8pKBCCFHNDyDGAnA2LyL7QS9o=; b=YjyQcOE1QuiOr7vZ7cUW0jc
	CSgRc1ABwizzEeAQGYDgToqZMYocg6g7DM+oqQBlVFANclvBWNxlmaJkG4flTkq1
	G2cdWYcwLBoHVlC/31GQtxJbBMgiZD3fp/UsI2BGiAQPm4fvg9J5XQx+/gmzhHka
	B970mmR+rThVTpbLcZoHx7MPKXz6ktKH8irLaYY88eJskrd6vDRz7DHJDru7XPzm
	1+0/7QAYjktWFV5TqsOpLAVAMYOT2Bl4rd9iWARd9OeULec4gMx7PtzwnUgLJ4Uu
	iP+vEoXUop21gmLpIYAR/qnjuPXGAorewfHGPBcgedvw5d4GNwa5IhCGmZ/lbqQ=
	=
Received: from pps.reinject (localhost [127.0.0.1])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 40s9y21r6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Aug 2024 17:02:46 +0000 (GMT)
Received: from m0209321.ppops.net (m0209321.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 475H2kit029070;
	Mon, 5 Aug 2024 17:02:46 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 40s9y21r6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Aug 2024 17:02:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQMQlB8UbShmitxEsmrhi+b4DSHVfZUnhJ8kbpLUGZwCdweZHTxUGbO+41FmNCXdyuQzt02TkZuIVspEMzsqQHP2XRY4sJ6u4HEsRplPpZqA4rC3B36I8Pfx86RQXUDdb3NAzKNSqfDDq6KlzOl2FhrD3Xfk9LTj8fRSct6+Vh8aXUPetQgbUaFReMvbOIWJ8OLvuJoA/jnLodar1PI3Q8c0TTsb755byqDv7OEDSTL+hPCn+MTxzSxQ8A95yOjzMUzrlkRuJoByilmHP2JuiGcx2y6hrlVUAtZf6dYS25u7AmfHJ4VJUIz/D8ZAyvL8E48GKZmmV6kUqhnHbmNUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbYI1BgxphRpVB8/BP8pKBCCFHNDyDGAnA2LyL7QS9o=;
 b=bcSwnOlA09kAMTJLY/sB8bL41YxTTAcoQ/rO+Jox6EQm1NhcpefM0SKUZ28//bzWuJN6BCTeoyOoPPEsMDDFmUSvlOE0f0nHa8DmzDclx8tyCbMSA85g7m53KRYB+cgnNAioCTY/d1sdy6jpu+jK3z39NDZyGdd/jpx0fiGx1Ln+pbX/Mlds42pC7PTeqhUS3OvMjVBl20rQWU2jKeyWWYlKFeAqi9VujITQiaAoMuIM8IxonDhUGTRsm8sFAECdEtIt00dux4WxaweFZrHBab7kRlpAbrjwsbD9tB1nbQooNiSmym1vxbYKe12heeREYKocuWrDslJjsVzYLyF70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BN6PR13MB3041.namprd13.prod.outlook.com (2603:10b6:405:7b::18)
 by BN0PR13MB4662.namprd13.prod.outlook.com (2603:10b6:408:123::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 17:02:40 +0000
Received: from BN6PR13MB3041.namprd13.prod.outlook.com
 ([fe80::3661:5a0d:34d0:7c4]) by BN6PR13MB3041.namprd13.prod.outlook.com
 ([fe80::3661:5a0d:34d0:7c4%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 17:02:40 +0000
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
        Veronika Kabatova <vkabatov@redhat.com>,
        Guillaume Tucker
	<guillaume.tucker@collabora.com>,
        "kernelci@lists.linux.dev"
	<kernelci@lists.linux.dev>,
        Don Zickus <dzickus@redhat.com>, Mark Brown
	<broonie@kernel.org>,
        Philip Li <philip.li@intel.com>,
        Denys Fedoryshchenko
	<denys.f@collabora.com>,
        Michael Hofmann <mhofmann@redhat.com>,
        Tales da
 Aparecida <tdaapare@redhat.com>,
        Aditya Nagesh <adityanagesh@microsoft.com>,
        Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
        Sachin Sant
	<sachinp@linux.ibm.com>,
        "Hambardzumyan, Minas" <minas@ti.com>
Subject: RE: KCIDB: Support non-binary test outputs
Thread-Topic: KCIDB: Support non-binary test outputs
Thread-Index: AQHa5yqbcUF1g+nnlkWvpXGZOW+0KbIY4ZUw
Date: Mon, 5 Aug 2024 17:02:39 +0000
Message-ID:
 <BN6PR13MB3041F310826A4245F2B04DA9FDBE2@BN6PR13MB3041.namprd13.prod.outlook.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
In-Reply-To: <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR13MB3041:EE_|BN0PR13MB4662:EE_
x-ms-office365-filtering-correlation-id: 5eb829e3-20ca-4bb8-1b14-08dcb57069f2
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?UTBPVFlKYWNpbGRMSWtyVmNtS2FMbGIyRjJzWi8zY1V3U3hOYjlXUU1sbXhO?=
 =?utf-8?B?UWxFU2tEcEpNT0pOWUtMOS9VVno4NlAwZG9WdG53RVIzdHduUDlKUk5BODcr?=
 =?utf-8?B?Vk1ibmQ4WjNlNjJTZDRIYXBvYnBDbWEwZUNqRW1aZjU2bnhER0gzN2JCdUEw?=
 =?utf-8?B?UDF0U0ZLZFhtZXcyQVpkbm5Qd0JWM0RJUkVraTN5b2pGc2FldzVZUGpxeU4y?=
 =?utf-8?B?ekF4MUtsNWhwVTdtY055T3JDekhsNk5ZaEpkNm1YdFFHei8wUHlGcHpGR3Nw?=
 =?utf-8?B?ZkJTeUYzWlhvYnBHWHU4NGR1VVV1bVc4TWxEUm1BejBaeHdqbm85U3FKYjEz?=
 =?utf-8?B?RHUyc1owNkRVQWlDbFc1WDlVTUY0V3lyRkRmZGJZZlBGYVlzRmVQbE91SzY4?=
 =?utf-8?B?UGFNZ2NpUUxoMjJjcjdkcWNmaVhPREY1UFRPWEhKTnZlSlZsUDhQanJEUWxJ?=
 =?utf-8?B?d2tWSlBDSlVUdHltV1grU3dWNVhwamlhdXo2ZVNFNGdRUEllTVVteC9ZbHFL?=
 =?utf-8?B?L0VqUFhlZ2RmQXlQcjlRekVIK0ZtRjB1VkRScmR0YlphNEkxZng4VkRvMVJM?=
 =?utf-8?B?cUpLOTIrZzUrM1ZVaFUxVDQ4eVVIdjFxYXNHVlVNUFZNeWV0THJJemtqc3BC?=
 =?utf-8?B?QzdHVFBESkh5TkpIRlROeTZkektFdUt1S1diWTh5dkZPcjZsWWpiUEJLMXNv?=
 =?utf-8?B?U3BDa21lcTczSkIxWENKOU1NVElZTnlwaDZiMEpDV2JScWptamJYTzZYNWpC?=
 =?utf-8?B?R2laZWJjYnYvUkRwNFE0Nmt6ditzS04vUVRGVUJtZW9ZNHdrdEhiQmhLd3lC?=
 =?utf-8?B?Q3NNajFsdC9ldjBmQ2oyN3BBTlVXRlhlYWxOSHEzTEhFV2Nxc3dSSll4VEwr?=
 =?utf-8?B?V2JDNG1rYS9XWEZuR0JCckQvWldpcnA1YkJHQzNJV0ZIQ2ZFMWtsek1PSTh5?=
 =?utf-8?B?Q2RYT2hBQjJ4NndqUGRMUmUza2hqSWtkekFLVVQ5K2RSU01Ecks5cUNXT1ZU?=
 =?utf-8?B?RWY1MC8wNmZtaWt2NEIrRlBDanhQck5SMmUvOWkzVnFPc2JnbEFvK3ZRUFpQ?=
 =?utf-8?B?bm8wcjRXc3hQblRJb1JzY3BYY0FTOTVQenpKdGh6V0ozWncvc0huaDdwSnhH?=
 =?utf-8?B?bnY0T3pQQ0ZzRWdJcVRlUXpvdGcxcVEveEtRM2NkZW5mTlFVckRlNDlIU2lr?=
 =?utf-8?B?Mjl1a0NwZDdIbjBQVU9QTlhUWER5RXZRdGF5YTFweFNHUWZ1dUVtQ2hLN3ly?=
 =?utf-8?B?VVcydzVTd1lCWjBOKzdMSU0zNFZIMkNkOFJUUElYdVFCSk5WUjNURlkyNTE5?=
 =?utf-8?B?WkJoWUZCV00zN0ltNER4RXZiYW0rRFczQkxWUkhNaXYwRFhndUVPdmV0KzNk?=
 =?utf-8?B?ZnZBV3RZTjFXK0JGNFVscUczV3RJMXJER25IR0ltNWM5clNBS28yZDZQMGNu?=
 =?utf-8?B?dGliMHZMVUp6VTdTNk5lcFdOYitncnZyRFhTQktJSVUzaFlKZm5pbm5FSDBV?=
 =?utf-8?B?UnBHbzVnd29CN1h2THRZNTExb1BoM3RWM0s1QTRWL052WHhtbDJBbFdKQTQ1?=
 =?utf-8?B?bi9uU20rNUJpa3RQZmp2TnNsSGtEYVMvb0tHWXR3VDZIaWlaSUd1UnJmZERN?=
 =?utf-8?B?N2FHc2s0OXFBbWRBODhIc1dXeXVoeG1hZXl0ZnFhbXRGdzRhTWlaa00zUEhj?=
 =?utf-8?B?MVRPQXcwUTEzbkIxOXkwUFZFM1BLQndvWmRPbzRyTk5PQ3c0ak5JQ2syZEl1?=
 =?utf-8?B?cW42SDVubWRocUhWTzhFV2ZQYzFFUGVaekF0VVNibVgzVFU3MGpUcHMvQWxN?=
 =?utf-8?B?RXNrRk9reStheHdXalJkeTVRRGRoQUc4SHU3Q3RkcVREQzJEK2dLRnB4d3l2?=
 =?utf-8?Q?oyej2jNVHjz7G?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR13MB3041.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WERvQThsT2RzcWgyaVdyK1FOMUp0MEo5TDhkRmZyMUpWK3NkcnlRYVFFOFdm?=
 =?utf-8?B?NzU5dDVMbFpzb0xRNHdMdkRYUjVvZTBaWW1aZXUzSW9SVEFOVkwwME5lcE42?=
 =?utf-8?B?OE11VTFlZzdLUlRTMlpkY2tReUNIUW4vaTRoM2Vlc2pIZHRxRFhreHFVMUUr?=
 =?utf-8?B?QmE2SUhlNzhGMmw4NmZqNXUxaWdlcHphKzlVMHRNL1FRcXY1NjlFMUhodVIv?=
 =?utf-8?B?dlRLNjFRRGE1QTVibnE5UjJ3Zi9EL1dDaTZORnZDOThWOWp5TXN5MXI4V3h5?=
 =?utf-8?B?L2NrZVgxSVNuSHVuU2Vwd3pneEZ2VjZYbXppSTR3ZE5ISGIwaVRiWE1BZUVs?=
 =?utf-8?B?ZVpsRlE3U3REbzR0SVlEQS9UZjl6TUlFZ05DbHpwVXJJbjcweEh3SitLK2hD?=
 =?utf-8?B?OWI4Qy9tQzFpRFdUR0ZJK1B0UGd5c3N2UDVaazZZdGU3TmF3QldkYjA2Z3JY?=
 =?utf-8?B?SXFEYnVTSGZpN29OWHZNcGtibkVMZDZkck01K0RUWXhGenBUUWNYU3ZQYnZZ?=
 =?utf-8?B?T3pjWHNLZ3lvR2VtWS9ScEltR2dUaUI4OVgvT1cvK0V1aWRoazE5RnNsNHBQ?=
 =?utf-8?B?YkhJWkc5TVV2Wk5PZzNHdWRHVGN1ZUNIejZFOW04UWtyNlBHK093dlhCMFFY?=
 =?utf-8?B?RS9wWCtzbzRsR3l3SFF1S0E5RWRDSXZnWCthTHd4YXpGQ0hUakRESm5RY2ww?=
 =?utf-8?B?TXJrYUtyU0FBOWdRSnFmTXFJa1JPQmdjTzhlUDJnVlZyNXhKckNzaDZsZ0xi?=
 =?utf-8?B?WXl4UHlSc29zVjJJc215RVVGRHFiZmExcXNNUHVKNmQ0dldXRjR3QTNkTGdx?=
 =?utf-8?B?a2Jna1F5UUlNSlVrYldkK0xMVWI5QUlYL1g1YXdqdXVwVVZHVTdoUUN5dks3?=
 =?utf-8?B?S3ppTXNhOFdmYkdQY3JqZzhSMHlXTml2aTNXcWdBRUViRGQzbkRvck9OS2NO?=
 =?utf-8?B?NHhydTRZdUtqT3VLdUJMY3VjYStRNW5JVldWTnVwR0ZVUXcxT2p5T0VjN0VE?=
 =?utf-8?B?clUvcUs4UGxCdXFvM0tFVmNxeGVPeDgzcmRqamw1bTE2OHQ5WDEzZ3pNWlAr?=
 =?utf-8?B?YUxBanV6UjloTlJTNTNJeTV0dFQwelBIYWE0VEJXQmhzM1hiMDVwdFhiQ0Fi?=
 =?utf-8?B?ZDc2MlVmL2JwQm4vbFZDeS92bTB0WUU5K3hJUloreWo0KzN5ellEM1J0d0Ix?=
 =?utf-8?B?VjBidHRJTHgrSFpFekx6bnFWeStIUEJlV2NLL1NRQ295RkRORWRIY0NVUERH?=
 =?utf-8?B?aUtuTjRJQm43bXh1a2l2TjBocWFGL3NFMlFTdlkwRGRpVFp4eUtGN2tTWTY2?=
 =?utf-8?B?VHRta0hvZEFBMEc5aXVQRnV2TnUrWlVhenRlL0ZHZWdvanRpVmtHWGczMkNp?=
 =?utf-8?B?KzRXT3FkMXNiM01jQjJYR3pBVW1uTnBuUC82MEhsd1ZEUExZQk5UZTlrc0tj?=
 =?utf-8?B?VktLbkZyWVNXeHRhSk5XVlNDRjQrdmxJY2lFSXQxTTlaZjZlZ1BhVFIwVDR0?=
 =?utf-8?B?R0VsaVBUMWttRkQ5aVdMVGhOSVVqQjJkdmNNUEJTOVkydkNMTHk2ZTZqUzNU?=
 =?utf-8?B?WXlTSUluNVZMTzlBVVdLMTY1ckwrMU1Gd3NJdFBKQWZ1YkNJaVhRTVZFSUpZ?=
 =?utf-8?B?SjgvdnYxMzZTT05hbzlVZWZ6eFEzdDliTDhxdVl0ejFvSkxxeHNIU3EvU2dP?=
 =?utf-8?B?RGUvVTFsZVdBSzM0QVJZbHJsL1A5dUNvWTArRTlpR2s5WEF0eU50RUg0WHBa?=
 =?utf-8?B?akxjTlhjZktxU29WdGcvK0hLUmUwOWZuSW9odzhIdEpLWUZhMXhIK1BFVmE3?=
 =?utf-8?B?Ny9PekdDMDRBMWt3azJMdUQ4YnFGaFdBSWE4aVI2b0pxRmw3Z2t5Zm9OL2gr?=
 =?utf-8?B?YXhwOVJPZzFSM1BTRVF0a0JzTHlmUStoTG5HOXdTSUtPVmUrQ1laZlBLcnI1?=
 =?utf-8?B?d3NXS3ZZTHZaY1ZXYldLVjd3cnBpRUxZV2ZjKzdyeGVHazk0anVtaExDWE1J?=
 =?utf-8?B?cWxBemplWnZCclcxdXgxbnptczl6bnFiYlk4ZDdHTElKRE5NRk1hdzZTbDlJ?=
 =?utf-8?B?TTBCWVJKWHBySFRiYUxjWEZVY3RPNWFGczdlNGFSdWRZSkl0ejZoTk95UWRn?=
 =?utf-8?Q?1G2E=3D?=
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
	xMmV3zYNCmsIWbm079O6Ma9fkQct/Nfo/JUOkUt++z5nHdmahpzv4NchmEch7Qf55teCZGDpogHbch0UROPGbIg9YSaIWptIoPXCN5n3z8ld5qQs2Sg/pGxB6lW4a1k6ZfwteTqL1+6pEDHIaz1jz31RfkpyNQmPQ3fyDgUtYLOKgVgAbFNq9BbXBAXNTG651M+g91Gmn02O9d7kOlq+lExPyQOlfxL0PU8l9Jxt4sAXf5GGImSJ/1au1uBSlbfuCva3kSdaHve7pyQHpVCTBTZnGKITPIg5hJ/vyxzC4EaXxyZhVacRyjq10Mi29+fNBzzlHPp+94oh87G7DXwCVgyitkYkIK9E82Y8sPcwSj8lCpe/lApkQkP3RsGgXdnOG1zdX4YLU9xFKSDpupoRerywJAilgZUFCkFGlUPU+SwHjxpAwBJG9wUIC5RWrxlb4Gny1ARkDCbXTAQ8uasC/WG14Zig+gT5Pdj69fWE3kNG14jPn/2fhUWQljeqfilpvDlX6xCsWfFK+vlF8U2NcvoFCqSE5EZJ+bbq4i0dY2CEBHK5ggGOjJ4SJqGxxpOVt6iql2AGkoF2Mv0qz5S9SAHoL4nuB75ehuqcfOKEZp7whi56oasdpMsOMie6w0af
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR13MB3041.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb829e3-20ca-4bb8-1b14-08dcb57069f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 17:02:39.8042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: geIOJxMpBFTZpdrbpMG/AyPs205THnj8RMHq++9kzVWjKEAWUwExpimuGjzHq5613P2hjDDNLe6aXuPjWTkz7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR13MB4662
X-Proofpoint-GUID: 7t9XRwOecdNQmQHc09gV1nX8azo7wNsJ
X-Proofpoint-ORIG-GUID: GXgcWc8aS5ZlEnCcDbmAyI5JEeHceTtX
X-Sony-Outbound-GUID: 7t9XRwOecdNQmQHc09gV1nX8azo7wNsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_05,2024-08-02_01,2024-05-17_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlrb2xhaSBLb25kcmFz
aG92IDxzcGJuaWNrQGdtYWlsLmNvbT4NCj4gSGkgZXZlcnlvbmUsDQo+IA0KPiBPbiA4LzUvMjQg
MTI6NTYgUE0sIE5pa29sYWkgS29uZHJhc2hvdiB3cm90ZToNCj4gPiBNZWFud2hpbGUgSSdkIGxp
a2UgdG8gcHJvcG9zZSB0d28gc21hbGwsIGJ1dCBwb3RlbnRpYWxseSB2ZXJ5IHVzZWZ1bCBjaGFu
Z2VzDQo+ID4gdG8gdGhlIEkvTyBzY2hlbWEgZm9yIHRlc3RzOg0KPiA+DQo+ID4gKiBTdXBwb3J0
aW5nIG5vbi1iaW5hcnkgb3V0cHV0cyBiZXlvbmQgUEFTUy9GQUlMIC0NCj4gPiAgIGludGVnZXJz
L2Zsb2F0cy9ib29sZWFucy9zdHJpbmdzL2V0Yy4gLSB1c2VmdWwgZm9yIHBlcmZvcm1hbmNlIHRl
c3RzLg0KPiA+DQo+ID4gKiBTdXBwb3J0aW5nIHJlY29yZGluZyBgY29tcGF0aWJsZWAgdmFsdWVz
IGZyb20gdGhlIHRvcCBvZiB0aGUgZGV2aWNlIHRyZWUNCj4gPiAgIGluc2lkZSB0aGUgdGVzdCBl
bnZpcm9ubWVudCwgZm9yIG1hY2hpbmVzIHdoaWNoIHVzZSB0aGVtIC0gdXNlZnVsIGZvcg0KPiA+
ICAgY29ycmVsYXRpbmcgdGVzdCByZXN1bHRzIGJ5IGhhcmR3YXJlLg0KPiA+DQo+ID4gSGVyZSdz
IHRoZSBjb3JyZXNwb25kaW5nIHNjaGVtYSBQUjoNCj4gPg0KPiA+ICAgICBodHRwczovL2dpdGh1
Yi5jb20va2VybmVsY2kva2NpZGItaW8vcHVsbC84NQ0KPiA+DQo+ID4gSSdsbCBmb2xsb3cgdXAg
d2l0aCBhIHNlcGFyYXRlIG1lc3NhZ2UgZm9yIGVhY2ggb2YgdGhlIGNoYW5nZXMsIGdvaW5nIG92
ZXIgdGhlDQo+ID4gZGV0YWlscyBhbmQgdGhlIHJhdGlvbmFsZS4NCj4gDQo+IFRoZSBzdXBwb3J0
IGZvciBub24tYmluYXJ5IHRlc3Qgb3V0cHV0cyBpbnRyb2R1Y2VzIGEgbmV3IGZpZWxkIHRvIHRo
ZSAidGVzdCINCj4gb2JqZWN0cyBjYWxsZWQgInZhbHVlIiwgYmVpbmcgYW4gIm9iamVjdCIgaXRz
ZWxmLiBJdCAoYW5kIGl0cyBhYnN0cmFjdA0KPiBtZWFuaW5nKSBhcmUgc3VwcG9zZWQgdG8gd29y
ayB0b2dldGhlciB3aXRoIHRoZSAic3RhdHVzIiBmaWVsZC4gVGhhdCBpcywgaXQNCj4gc2hvdWxk
IG9ubHkgYmUgY29uc2lkZXJlZCB3aGVuIHRoZSB0ZXN0IGhhcyBhY3R1YWxseSBleGVjdXRlZC4g
SS5lLiB3aXRoIGENCj4gIkZBSUwiLCAiRVJST1IiLCAiUEFTUyIsIG9yICJET05FIiBzdGF0dXMg
b25seS4gTm9ybWFsbHkgIkRPTkUiIHNob3VsZCBiZQ0KPiB1c2VkLCB3aGVuIHRoZSB2YWx1ZSBp
cyB0aGUgdGVzdCdzIG91dHB1dCwgYW5kIG5vdCBhbiBhdXhpbGlhcnkgdmFsdWUuDQoNCkknbSBu
b3Qgc3VyZSBJJ20gcmVhZGluZyB0aGlzIGNvcnJlY3RseSwgYnV0IGFzIEkgdW5kZXJzdGFuZCBp
dCwgdGhpcyBwcmUtc3VwcG9zZXMNCnRoYXQgdGhlIHZhbHVlIGFuZCB0aGUgdGVzdGNhc2UgYXJl
IHN5bm9ueW1vdXMuICBJcyB0aGF0IHJpZ2h0PyAgQXJlIHRoZXJlDQp2YWx1ZXMgdGhhdCBhcmUg
bm90IGFzc2lnbmVkIHRvIGEgdGVzdGNhc2U/DQoNCkluIG15IGV4cGVyaWVuY2UsIG1hbnkgdGVz
dHMgKHBhcnRpY3VsYXJseSBJTyBwZXJmb3JtYW5jZSB0ZXN0cykgcHJvZHVjZQ0KYSB3aG9sZSBs
b3Qgb2YgdmFsdWVzIChiYXNpY2FsbHkgYSBtYXRyaXggZm9yIGNvbWJpbmF0aW9ucyBvZiBkaWZm
ZXJlbnQgSU8gc2l6ZXMsDQpJTyBkaXJlY3Rpb24gKHJlYWQvd3JpdGUpLCBwYXR0ZXJucyAoc2Vx
dWVudGlhbCB2cyByYW5kb20pLCBhbmQgc2NoZWR1bGluZw0KY2xhc3NlcykuICBJdCdzIHF1aXRl
IGNvbW1vbiB0byBoYXZlIGEgdGVzdGVyIHNlbGVjdCBvbmx5IGEgZmV3IHZhbHVlcyB0bw0KY29u
dmVydCBpbnRvIHRlc3RjYXNlcyAodGhhdCBpcywgaXRlbXMgdGhhdCB3b3VsZCBjYXVzZSBhIHRl
c3QgdG8gcGFzcyBvciBmYWlsKS4NCg0KPiANCj4gSGVyZSBpcyB0aGUgKGFiYnJldmlhdGVkKSBz
Y2hlbWEgZm9yIHRoZSBuZXcgZmllbGQ6DQo+IA0KPiAgICAgInZhbHVlIjogew0KPiAgICAgICAg
ICJ0eXBlIjogIm9iamVjdCIsDQo+ICAgICAgICAgInByb3BlcnRpZXMiOiB7DQo+ICAgICAgICAg
ICAgICJpbnRlZ2VyIjogeyJ0eXBlIjogImludGVnZXIifSwNCj4gICAgICAgICAgICAgIm51bWJl
ciI6IHsidHlwZSI6ICJudW1iZXIifSwNCj4gICAgICAgICAgICAgInN0cmluZyI6IHsidHlwZSI6
ICJzdHJpbmcifSwNCj4gICAgICAgICAgICAgImJvb2xlYW4iOiB7InR5cGUiOiAiYm9vbGVhbiJ9
LA0KPiAgICAgICAgIH0sDQo+ICAgICAgICAgIm1pblByb3BlcnRpZXMiOiAxLA0KPiAgICAgICAg
ICJhZGRpdGlvbmFsUHJvcGVydGllcyI6IEZhbHNlDQo+ICAgICB9LA0KPiANCj4gVGhlIG1lYW5p
bmcgb2YgdGhlIHZhbHVlIGl0c2VsZiBkZXBlbmRzIG9uIHRoZSBwYXJ0aWN1bGFyIHRlc3QsIHRo
YXQgaXMgdGhlDQo+ICJwYXRoIiBmaWVsZCB2YWx1ZS4gRWFjaCBwcm9wZXJ0eSBpbnNpZGUgdGhl
IHZhbHVlIGNvcnJlc3BvbmRzIHRvIGEgZGF0YSB0eXBlLg0KPiBBdCBsZWFzdCBvbmUgbXVzdCBi
ZSBzcGVjaWZpZWQsIGJ1dCBpZiBtb3JlIHRoYW4gb25lIHR5cGUgcHJvcGVydHkgaXMgc2V0LA0K
PiBlYWNoIGlzIGNvbnNpZGVyZWQgYSBkaWZmZXJlbnQgcmVwcmVzZW50YXRpb24gb2YgdGhlICpz
YW1lKiB2YWx1ZSwgYW5kIG5vdCBhDQo+IGRpZmZlcmVudCB2YWx1ZS4gRS5nLiB0aGVzZSBjYW4g
YmUgc3BlY2lmaWVkIGF0IHRoZSBzYW1lIHRpbWU6ICJpbnRlZ2VyIjogMSwNCj4gIm51bWJlciI6
IDEsICJib29sZWFuIjogdHJ1ZSwgInN0cmluZyI6ICJ0cnVlIi4NCg0KSSdtIG5vdCBzdXJlIHdo
YXQgdGhlIGludGVuZGVkIHVzZSBpcyBmb3IgdGhlc2UgZGlmZmVyZW50IHR5cGUgcHJvcGVydGll
cy4NCkFsbW9zdCB1bml2ZXJzYWxseSwgYmVuY2htYXJrIGRhdGEgaXMgZXhwcmVzc2VkIGFzIG51
bWVyaWMgdmFsdWVzICh0aGF0IGlzLA0KbnVtYmVycykuICBBcmUgdGhlc2Ugb3RoZXIgdHlwZXMg
dXNlZCB0byBob2xkIGludGVybWVkaWF0ZSBmb3JtYXRzPw0KSWYgc28sIGZvciB3aGF0IHJlYXNv
bj8gIEkgd291bGQgc3VnZ2VzdCBkcm9wcGluZyB0aGUgdHlwZSBmaWVsZCwgYW5kIGp1c3QNCm1h
a2luZyB0aGVtIGFsbCBudW1iZXJzLg0KIA0KPiBTcGVjaWZ5aW5nIG11bHRpcGxlIHR5cGVzIGF0
IG9uY2UgY2FuIGJlIHVzZWQgdG8gYXNzaXN0IHRyYW5zaXRpb25pbmcNCj4gdGVzdCBvdXRwdXQg
dG8gYSBkaWZmZXJlbnQgdHlwZSwgYnV0IGluIG5vcm1hbCB1c2Ugb25seSBvbmUgb2YgdGhlbQ0K
PiBzaG91bGQgYmUgc3VwcGxpZWQuDQo+IA0KPiBIZXJlJ3MgYW4gZXhhbXBsZSB0ZXN0IG9iamVj
dCB1c2luZyB0aGUgInZhbHVlIiBmaWVsZDoNCj4gDQo+IHsNCj4gICAgICJpZCI6ICJyZWRoYXQ6
Mjg3NjgyOWM5OGU5ODc4NzY2YSIsDQo+ICAgICAib3JpZ2luIjogInJlZGhhdCIsDQo+ICAgICAi
YnVpbGRfaWQiOiAicmVkaGF0OjM4N2QzNDU5ZWYiLA0KPiAgICAgInBhdGgiOiJyZWRoYXRfZXh0
NGZzLnBlcmZvcm1hbmNlLmlvcHMiLA0KPiAgICAgImNvbW1lbnQiOiAiUmVkIEhhdCBFeHQ0IEZT
IEkvTyBwZXJmb3JtYW5jZSwgSU9QUyINCj4gICAgICJzdGF0dXMiOiAiRE9ORSIsDQo+ICAgICAi
dmFsdWUiOiB7ImludGVnZXIiOiA1NzMyNH0NCj4gfQ0KPiANCj4gSWYgdGhlIHRlc3QgaW4gcXVl
c3Rpb24gaGFzIG11bHRpcGxlIHZhbHVlcyB0byByZXBvcnQsIHRoZW4gdGhlIHN1Ym1pdHRpbmcg
Q0kNCj4gc3lzdGVtIHNob3VsZCBjcmVhdGUgKHN5bnRoZXRpYykgc3VidGVzdHMgdW5kZXIgdGhl
IHRlc3Qgbm9kZSwgb25lIGZvciBlYWNoDQo+IHZhbHVlLiBFLmcuIGlmIHRoZSAoaW1hZ2luYXJ5
KSB0ZXN0IGFib3ZlIGhhZCByYW5kb20tcmVhZCBhbmQgcmFuZG9tLXdyaXRlDQo+IElPUFMgdG8g
cmVwb3J0IHNlcGFyYXRlbHksIGl0IGNvdWxkJ3ZlIGJlZW4gZXhwcmVzc2VkIGFzIHN1Y2g6DQo+
IA0KPiAidGVzdHMiOiBbDQo+ICAgICB7DQo+ICAgICAgICAgImlkIjogInJlZGhhdDoyODc2ODI5
Yzk4ZTk4Nzg3NjZhIiwNCj4gICAgICAgICAib3JpZ2luIjogInJlZGhhdCIsDQo+ICAgICAgICAg
ImJ1aWxkX2lkIjogInJlZGhhdDozODdkMzQ1OWVmIiwNCj4gICAgICAgICAicGF0aCI6InJlZGhh
dF9leHQ0ZnMucGVyZm9ybWFuY2UiLA0KPiAgICAgICAgICJjb21tZW50IjogIlJlZCBIYXQgRXh0
NCBGUyBJL08gcGVyZm9ybWFuY2UiDQo+ICAgICAgICAgInN0YXR1cyI6ICJET05FIg0KPiAgICAg
fSwNCj4gICAgIHsNCj4gICAgICAgICAiaWQiOiAicmVkaGF0OjI4NzY4MjljOThlOTg3ODc2NmE6
cnJpb3BzIiwNCj4gICAgICAgICAib3JpZ2luIjogInJlZGhhdCIsDQo+ICAgICAgICAgImJ1aWxk
X2lkIjogInJlZGhhdDozODdkMzQ1OWVmIiwNCj4gICAgICAgICAicGF0aCI6InJlZGhhdF9leHQ0
ZnMucGVyZm9ybWFuY2UucnJpb3BzIiwNCj4gICAgICAgICAiY29tbWVudCI6ICJSZWQgSGF0IEV4
dDQgRlMgSS9PIHBlcmZvcm1hbmNlLCByYW5kb20tcmVhZCBJT1BTIg0KPiAgICAgICAgICJzdGF0
dXMiOiAiRE9ORSIsDQo+ICAgICAgICAgInZhbHVlIjogeyJpbnRlZ2VyIjogOTc1MjR9DQo+ICAg
ICB9LA0KPiAgICAgew0KPiAgICAgICAgICJpZCI6ICJyZWRoYXQ6Mjg3NjgyOWM5OGU5ODc4NzY2
YTpyd2lvcHMiLA0KPiAgICAgICAgICJvcmlnaW4iOiAicmVkaGF0IiwNCj4gICAgICAgICAiYnVp
bGRfaWQiOiAicmVkaGF0OjM4N2QzNDU5ZWYiLA0KPiAgICAgICAgICJwYXRoIjoicmVkaGF0X2V4
dDRmcy5wZXJmb3JtYW5jZS5yd2lvcHMiLA0KPiAgICAgICAgICJjb21tZW50IjogIlJlZCBIYXQg
RXh0NCBGUyBJL08gcGVyZm9ybWFuY2UsIHJhbmRvbS13cml0ZSBJT1BTIg0KPiAgICAgICAgICJz
dGF0dXMiOiAiRE9ORSIsDQo+ICAgICAgICAgInZhbHVlIjogeyJpbnRlZ2VyIjogNDY0MzR9DQo+
ICAgICB9DQo+IF0NCj4gDQo+IFRoaXMgc2VwYXJhdGlvbiBhbGxvd3MgdXMgdG8gY29udHJvbCBj
b21wbGV4aXR5LCB3aGlsZSBhdCB0aGUgc2FtZSB0aW1lDQo+IGFsbG93aW5nIEtDSURCIHRvIGFu
YWx5emUgYW5kIHRyYWNrIHJlc3VsdHMgaW4gYSBtb3JlLW9yLWxlc3MgZ2VuZXJpYyB3YXkuDQo+
IA0KPiBGaW5hbGx5LCBpZiB5b3UgbmVlZCB0byBtb25pdG9yIGJvdGggdGhlIHNlcGFyYXRlIHJl
c3VsdHMgYW5kIGEgY29tYmluZWQNCj4gcmVzdWx0LCB5b3Ugc2ltcGx5IGFkZCBpdCB0byB0aGUg
cGFyZW50IHRlc3QuIExpa2UgYWRkaW5nIGJhY2sgdGhlIG92ZXJhbGwNCj4gSU9QUyB2YWx1ZSB0
byB0aGUgcGFyZW50IHRlc3QgYWJvdmUuDQo+IA0KPiBEb24ndCBoZXNpdGF0ZSB0byBzZW5kIHlv
dXIgY29tbWVudHMvcXVlc3Rpb25zL29iamVjdGlvbnMgaGVyZSBvciBpbiB0aGUgUFIhDQo+IA0K
PiBOaWNrDQo=
