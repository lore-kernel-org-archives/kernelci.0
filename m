Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECFFAD2C
	for <kernelci@lists.linux.dev>; Thu, 23 May 2024 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716484243; cv=fail; b=HBA5y2wp/dBbbFfNk/+gESlU4/Zs/nsxR/puMAnRPGrl5mndVg8Gk3uHIRB1lKv+FKrmqZclG4KiWq0ylF5KWYoFHNp7+P5FwS+4LseDlLsg3BZOBpbUbM5w8CWpFZZtEJY6ON0mK4de8rBwMYFdvjTS4N4nmREvte/v/8m0N1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716484243; c=relaxed/simple;
	bh=GFFjMMa5sP5UtwviT2Iwz/NcMxUWYzwpkm6umoLJMRA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bQdpWZMM16na+cc4XMUQD+ImrrW7wosFWJ6wII1Oe5L3kvSzB2cKdo8+ujg2k5qK5pMEpFrFj9jOERf8rwdcShV/TG8j0bfmaRZhuKw1po0mZ6O0QgUKEUg5iyh41hRTZDFran6rL3WzpSLpLlEs5n9baDm1KLxoBvgiz04F8Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bbBWOkRd; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bbBWOkRd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NCokk1014691;
	Thu, 23 May 2024 17:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFFjMMa5sP5UtwviT2Iwz/NcMxUWYzwpkm6umoLJMRA=; b=bbBWOkRd9UujaoEZ
	d4bnzM+KZ9aiQuXoZvADs+L02J15FeGvEOKv/SHJZfUGSXEAvISXWLbdDB489PC4
	i+sB4p/c4BGbOrFax3JgTI6c7Q5igqCyaxXQbRViJhgV1/3c9yIKsFcJiFnabS0w
	Ce5rUU5WHajz5/dIBIFqFgbBlyGwxigFJobsQFDtJqtA5j4tU/d1sOPKLI9pEZz9
	Z0gSZqFjAXgr820YBZMZN4mfg8oifplSH+kPEGMxyU95mbtISC0Ry2nlRpWIYW4y
	zaUP0DLfTupKcTMRlRO6VDcs45uqSdvxKb647densfuhG/TyNCPx2va1qyK77Vog
	MvypZw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9xywhv2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 17:10:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTpf/D2hb6+/HDUPW9WK4NNGjhfSow2ZnQCBsIIzma7hFloE7FEQja+LzbrLPfh0hVlT2qJI+wVFGU3tBygbCHSEeehI/EeOkIUw23EvZiic50uh2CbKIDxa/7IsI+0Ihxgjl22C0J8hd2R7sP8CQroHSSpf1dp5q0DE5oItZbPkF9CfLa7eweASy7e2khnHespzlATgOh92NkGGd6rHAfDk7y4CvLPS5wrDwrtPUQePtQPXc7Zhj0sJY7YKNk8ovodQHGcqcBLsed7PCg4EEJLMSNo8wtU4t6ggD+o41kHlY9r7pP392cUvdlr/pgc6wvGgkmDgKOpGAYQO86vB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFFjMMa5sP5UtwviT2Iwz/NcMxUWYzwpkm6umoLJMRA=;
 b=Uy7a/3kTowHQhCHfFC+obEbzyr5rp8ZnW74ggfHzmf3xJ7Vp+zBH7CpILEhaKt3HVCwYkuzxCZSG1PtynJCTXefqFv/9JDDsyNqVBtCyhlSLuj12eS16wes0T4ahDOLAipaZ7S34XRuTxLFQ87orsxcICBJgf2W+tdHaLgMy4GEniGac1naSHRaZwu38O2y/LV5YhkZIu7LIiCzx/IQ6jxd0QQ9nErsACFeq7x4T8LT0R8DUSlGFWx1RVId1FKsWXeM71e7G2W7eCJi3vFbQel+01BRWmX5m2DlN2gsCL35OrMI4+P7j2raGDFgWsy8cPzdg2Tjg20ya5705HncfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BY5PR02MB6754.namprd02.prod.outlook.com (2603:10b6:a03:213::18)
 by CH0PR02MB8165.namprd02.prod.outlook.com (2603:10b6:610:10a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 17:10:36 +0000
Received: from BY5PR02MB6754.namprd02.prod.outlook.com
 ([fe80::70da:1517:85ef:8d41]) by BY5PR02MB6754.namprd02.prod.outlook.com
 ([fe80::70da:1517:85ef:8d41%7]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 17:10:35 +0000
From: Trilok Soni <tsoni@quicinc.com>
To: Nikolai Kondrashov <spbnick@gmail.com>,
        "kernelci@lists.linux.dev"
	<kernelci@lists.linux.dev>,
        "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>
Subject: RE: New name for new "KernelCI"
Thread-Topic: New name for new "KernelCI"
Thread-Index: AQHarSmVfWpKfYKwl0mtEiRdy0FrirGlDYig
Date: Thu, 23 May 2024 17:10:35 +0000
Message-ID: 
 <BY5PR02MB67543462B27CBA2C56BE5249B0F42@BY5PR02MB6754.namprd02.prod.outlook.com>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
In-Reply-To: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR02MB6754:EE_|CH0PR02MB8165:EE_
x-ms-office365-filtering-correlation-id: 2e222417-a8d5-474c-5b73-08dc7b4b4309
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MWVNWUcvcW1TK0wwUmZLSjY3VWIvb2hWUTlSVHRHMVliK0NCRDhObzJFYit4?=
 =?utf-8?B?Z2hUbkZKUXMyZFYwb3Jsa2FBRDcxR25aZ3I2eGpqL3llN3hPeWNyY1ZrT0JL?=
 =?utf-8?B?cDJGZHNCeDdLckNnbUMvYW9tTlBjWlc4a091ZnBNTmZ6S0JEZHpVTk5KSUhO?=
 =?utf-8?B?R0pkeEdES2xZYjl1WURVczJQWTQ1MnNyYzEyV0FxeU1xaGRDelhYR21jL1FS?=
 =?utf-8?B?dFhpWXY2SC9EOEFicWdwTzBxenpBWktrdjFaaXZCTFZKamxYSVhJRC9sYUhZ?=
 =?utf-8?B?ckRZd0dSZE1VQ0ZCd1BqR25hTmhCbHhDbTZtVm1NaUdXUDJDVzFaVllTcWh1?=
 =?utf-8?B?ZHBWKzdNOUNrZlFUN0tJWmt3cHBkN0xtYkIvME5Hc3ZMRy9rVVdzc3RqREo3?=
 =?utf-8?B?cCtZMHpEZ004K0s4YWgrZWppWlhOTXQvZ3dJZ0NuVWVSY0VVa3g5cnQyL1Ro?=
 =?utf-8?B?OStTRlh0bi9Ya0JyQmpPRTZTRmhSKzhHS1d1QXozbHNDQnYvSytBOFFScEFY?=
 =?utf-8?B?L0R4ZUFIMjNEWFBWVklEcDlMZmVKeHltZWd4S1JNUEk4Mm1MOFZaWlBUYXlB?=
 =?utf-8?B?dzRpU1hXRkFueHNrdkpHZXVPVTMrOFdwZmdEK1Q5OGx1VWY1bkxsZUVUeEUv?=
 =?utf-8?B?dGx6MkwvYWI4VEFBQzNMenBIcDZiejh3N3JnYzRhVHlFTy9Ebyt2MVVCMEtZ?=
 =?utf-8?B?NmZVWDRkZjRqc09pV1l6dlVFTkJtdjVKNUVzVExzcDB0ZVgvMUdJQVcrYm4r?=
 =?utf-8?B?WVhSRmtjNmd2Si9UUERkeTBpRElEWXJaZFowRDdyYmw2dnlmdFE0dW80Tlly?=
 =?utf-8?B?V2xzODlXdFdFc0lHOFA1SmhXN1g4U2NDN1BHSlJ1Mk1vVTFkcU5jQk81QW5D?=
 =?utf-8?B?bjRiekVvZlJnZ1IrSVNPWVFTVG1SOG9OcDAxL054bmtydXhWSzF0ckZEMjNL?=
 =?utf-8?B?TmpLVU5RZFhlTWZFZGJ3N2t5aDNlWEdJOS9zb2lSa2dpcU16V1RxWTRkYnU5?=
 =?utf-8?B?MlhlQmxveEhUdTlOdU05eFRDcEhpZlFoQ2pmSnBHell1ZHVZRzZ0TXBKMlNJ?=
 =?utf-8?B?eEJPUWt3VlVlUGRoWEtWMzRKU3M3cHMvNWg2QmxpY2JOY3JrZFM0bUtCNS9S?=
 =?utf-8?B?Z0k4eDFOeUJ4N1JqT0xST1ZuMVRTNExuNmV4MmJwZGNUVnJPT01HVC9veDQ4?=
 =?utf-8?B?QmhqT2RjRy9XVEUwYitGbHdQY0tadlhYOUM1SHNmQ2x0QUhYNXJTditwSzFT?=
 =?utf-8?B?QmhsR0hhRzQ3bnh6RTF1VFV1ZkJ2TjBKVEIyVUlKZjlnSjRyb3l2LzJxY3pu?=
 =?utf-8?B?WWVhaVE4OVhRWERVcTcrY1JJZW1rL3Q3K0FjcWtqK3c0UnduUDVLQzF2RCtV?=
 =?utf-8?B?ZnZRM3dXQzh5SnRQcUd0UGVjb0hFM1A4eG1mY2RoT2hkdUVOWXZzc0s2eThn?=
 =?utf-8?B?TUtzaFJ6S05hcVpRdFIxY2RIa2hIRjh4U21QVSttYUZ0ei9Dc1NpUHBqMVhu?=
 =?utf-8?B?MjhJVlg2UTlkVnlTRFJkTElQRVNCNFBBaHF6TkFhNGlndTJYSmY0bU9GZDdV?=
 =?utf-8?B?QndFdTRyR1VLYmNrWTN2aXdHWVhXU1h1Tm5STlR3MTNKN21CZmhnYjEzWFdF?=
 =?utf-8?B?cExHRHR4cUl4YmRjZ2JKNCtrN2VvcnlRbWhQZUpkUC9PY01Rd3phSTl2TDhW?=
 =?utf-8?B?THNrUzd2S05qbE9HclVKQTNndS9tbkF5d1ZCUXo0VHBJUFVLTTVjSXFXL3NP?=
 =?utf-8?Q?gYdC7jeMp+UoE12WX0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR02MB6754.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SlZuMzczWDFiV3YwZFJ0NFBMZ2ZQb0YvY1pWbWdSS2xqTk10M3lFbEF2NmJk?=
 =?utf-8?B?SFR6cFVvZ2Rwb0tsNm03dzhkQ1hDYTBpWFdQSUVLM25kc1Q4dXByMWllbjlm?=
 =?utf-8?B?Vk5xTGwwVEdDUWhyMzMwMWtDR2dmVFBnSUc4aWtnd3dpSG1IcU5ETWtCTG9R?=
 =?utf-8?B?KzhaeWlBck4yaUcxNDkwQXNqbHJzcHg2dFVpRkZ2d3U2YXhvV3FyeE9rTkl5?=
 =?utf-8?B?WklZZ2NCK0gzMDM4YVVSRmx1QXNoTWF0MVlNY3JCTmltRUZIOUQ4QVRxV0dV?=
 =?utf-8?B?YUpDaGxrdXJ1SnZqTmNTYitZOFV1M25sMGxWQUZSTm1pOVhxQXJZTUxuSTNv?=
 =?utf-8?B?RUZ3T3A1WTRxQzh0UThwcWd4bSs5a2x0SWw5dXZSUkVmQjNSelBYM3lwMndJ?=
 =?utf-8?B?NE5Yams3RjBBYXpRZVR2WEluTnlIM01aa3ZFR2UxRmg3YUNlQ3lpeGo3aTlO?=
 =?utf-8?B?N0VXOFJkeFMxa25oQ0dFQzUrRHhydUdVMDlKaTV6KzV3bE8rSHZtYVpHVmVj?=
 =?utf-8?B?VmN5NTVSNUdxaTU4cEFBcERsV3VEZDgrVFNLN08vSjdXeTBkVjgyQXpRSHlQ?=
 =?utf-8?B?eWRVTSsrOEgxam5lcVVjUEEzUloyQUpUQm5uQW43UFNzRENlc1lkNXNLc3p0?=
 =?utf-8?B?NU1lRE1Zbzg5d3poU3cxNks0bThSR2V4WE05U0VSRU5udWk4aVNwMk12czFi?=
 =?utf-8?B?d1hGNFhMQVE2akRMMlFNeXovMHQ4ZzF2cHFsV25xMnp4UTVWYWQ2eFFDOUdT?=
 =?utf-8?B?cDlrQkRxN3pLTXd6RTdDcVVJOEdXK3ZYOTNJZjVxRHdSMEw5VUJvQUVjS3c2?=
 =?utf-8?B?SGxDbVB6MmpiM3JDazUzbWg4MjJza2dlei85YWdBSjBaclpPN2tuRE9NZXZT?=
 =?utf-8?B?c1NVbVNhdDc3L1JBM2N0TDY3WmxkbVNaazlvdGxOUXJpTmdIbEJhdXJaY2Jw?=
 =?utf-8?B?eXhsbzdrQTBta3B1dm9aeGJtYUJldjR3OUtaNE9QeHdqVW1NdUczcGsrem03?=
 =?utf-8?B?NmRTOERXSXRFWUgxd3FkRVBaZkRSMkoxWnArcDIxdEYxVWpZYWhXblI3aVN5?=
 =?utf-8?B?MFp2MzI4bU9qTGE2SVp1bnp5N1lpeTZqUlo0emk4bkw5RUVPSjl1dlZRWHQ0?=
 =?utf-8?B?WmNTNlVLVWwvVS9IaTdDRDNzU3M3RFRpSzRwMjJNc3RWY21oaUxKUnhPejdr?=
 =?utf-8?B?blZuVTlyY0dCd05sSHh5Y1lEdjBqNXJxSUcwS0JYMXY0YmdkZGRUam1CMm5T?=
 =?utf-8?B?U1ZtbUt0QjFmeW9maTlWUXl3RjhpYU5DOGdtUmVxeEU5Uyt2dXRJNVBEbW5G?=
 =?utf-8?B?ZVphcVZaL0QvaytPU0hsZU9UclZPNVZUY2wzUkJsdzVhUWpXSHFNbXZ4VjZl?=
 =?utf-8?B?M2RUM0FOcnFHMFp5Vk52MjFLcFJCSUhzNmF2akZreUpBUHNmVGFvK2JpM0Fq?=
 =?utf-8?B?MHhFM1ZGZFh3VGxPcWduRlgxWW40WUJoaVYwS0ZBN3ZsVTl4YmFPUkFsZllL?=
 =?utf-8?B?anBpZlJMelFncm1JNE5hb0RyTFFKMTl2cy9SczF2K2pubVB4bkY2MjdjbjJ6?=
 =?utf-8?B?UXUvdTdLSHM4bGd4bjlnUEpKYytzNFovOXFvcytjeWVOc0krNVBveWkzaGEz?=
 =?utf-8?B?K0NVMlJlYk5hWXdDT3NLeWFvTjd4R0dtNUllSFU4UlIyVjdMai9wdWpreUZD?=
 =?utf-8?B?WHc3K2x4cDVyMmVHYjdySGpXZWNoNDFiZURaQXl2TVk4RHVqTFZVOVZMcjBi?=
 =?utf-8?B?VTl3QkpaTGF6bVI0bmZUYy8zOVBOTCs1UGdUMVl2ckw0V3cyRmxEVnBJQTJC?=
 =?utf-8?B?bjFIeTlwNTNjM2IyckpwSGJwVmEzU0lSSnVMSUJIMHFNNVBuZEFtTGk5clYy?=
 =?utf-8?B?SzNnVVg4cXl1amM4b2h4VG5DZCtsTVkzMERlcjZDREFvWk0xM0dNMzNTSG9s?=
 =?utf-8?B?VEJ2eUNLdXg3ODlQWVJicVZMajBPd1NWclNnb1crc2pSQkpsWGVHREVzV3dj?=
 =?utf-8?B?R1ZKSzV2OGMxT2ZjZ2ErNlRSQzUxSFUxR2tLYUttL2srOUN5SnVUMDVsTHhy?=
 =?utf-8?B?L1BzajkraVpacHFoUFJYY2F4ckw3VEZwMkcrMW9UNzNqa0JUUTg0RGdTVG5V?=
 =?utf-8?Q?k+kVVMSEDkttqIpUWYeB9YV6J?=
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
	dhrL9wlEm6TADpTQq+gNtGW8VYnPc9xr9HW1QZcT5Jh5Ja4xzOQlzNLlGfJPTwxiH3aooqpUEyAjr4Gm2zUS//DvmeK907+B1eSwBFHOzLRci3fljjOpsOwaWedIjf9AC7aL54YZZQNFBsZ9lBsvKjYGh/66LNMH3eKCgPtPjxmpnQzXTo4mYmgwgUhSmMtOVPKGwCZ/cqerpg54PCmi0HTK0uu0DZ67yCP7FPwerHW4cmaABxSwnaPEn625j6LCp2tKBbBuFXGGUDYCv2Uxvvc9gkDfu0YVVf9hYEpAFIGnDVTAU9MoXxKtoajC9QY12oYg/AQqCY3tf6uhA+uHskb0sRCvBQCXw+UMnavc7VFGYQqFrnsG3iIm9D/KepzGNpo9co9U499bSz9WoLe4jE+otxbruguY2RHDLIIvZ/GB1oFGZXQKtFGM7RyG+F3IjTR9wGTEvEnpGzIXoYaZKCCQhIqDhJfFAZp7kDlMN6PiNGyfwfEkJvmXlNvf/W/+64uARpltlE2RZNPcIeouxiRgv+0fwX7OS9sjJ+hfYTxs/EiQF8WWcZnkaaeFz/Sb2eSNPy6/Txq/hVu5/WtIbJz8eqjerlOhffJr6Z4SJUgl63GhI1vR2aefQ6pmLQCw
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6754.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e222417-a8d5-474c-5b73-08dc7b4b4309
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 17:10:35.6673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SOP5IcsTl/jWC4z2HOmQc+JHWqv+YgNIxCfE979h8YBaWZvOwl+S5Ej8GuuM40DEC+y8XKEQXf/px8T3KuHxfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8165
X-Proofpoint-GUID: Pz80dNmjsV001CF4jSmCw5wmEdKb4e7X
X-Proofpoint-ORIG-GUID: Pz80dNmjsV001CF4jSmCw5wmEdKb4e7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_10,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230119

Tmlrb2xhaSwNCg0KSG93IGFib3V0IFl1Z2E/IEl0IG1lYW5zIGZvbGxvd2luZy4gDQoNCll1Z2E6
DQpNZWFuaW5nOiDigJxFcmHigJ0gb3Ig4oCcQWdlLuKAnQ0KQXR0cmlidXRlczogRXhwZXJpZW5j
ZWQgKHRocm91Z2ggdGltZSksIHBvd2VyZnVsLCBhbmQgb3Blbi4NCkNvbnRleHQ6IFl1Z2EgcmVw
cmVzZW50cyBjeWNsZXMgb2YgdGltZSBhbmQgZXZvbHV0aW9uLg0KDQotLS1Ucmlsb2sgU29uaQ0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTmlrb2xhaSBLb25kcmFzaG92IDxz
cGJuaWNrQGdtYWlsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTWF5IDIzLCAyMDI0IDg6NTUgQU0N
ClRvOiBrZXJuZWxjaUBsaXN0cy5saW51eC5kZXY7IGtlcm5lbGNpLXRzY0Bncm91cHMuaW8NClN1
YmplY3Q6IE5ldyBuYW1lIGZvciBuZXcgIktlcm5lbENJIg0KDQpXQVJOSU5HOiBUaGlzIGVtYWls
IG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeSBvZiBh
bnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCg0KSGkg
ZXZlcnlvbmUsDQoNCkFzIHlvdSBrbm93LCB3ZSd2ZSBiZWVuIGRldmVsb3BpbmcgdGhlIG5ldyBL
ZXJuZWxDSSBBUEkgWzFdLCBhbmQgdGhlIGtlcm5lbGNpLXBpcGVsaW5lIFsyXSBiYXNlZCBvbiBp
dCwgZm9yIHF1aXRlIGEgd2hpbGUuDQoNCkhvd2V2ZXIsIGJ5IG5vdyBpdCBzZWVtcyB0aGF0IHRv
byBtYW55IHRoaW5ncyBhcmUgYmVpbmcgY2FsbGVkICJLZXJuZWxDSSI6IHRoZSBwcm9qZWN0LCBw
aWVjZXMgb2YgdGhlIG9sZCBzeXN0ZW0sIHBpZWNlcyBvZiB0aGUgbmV3IHN5c3RlbS4gV2Ugd291
bGQgYWxzbyBsaWtlIHRvIGdpdmUgdGhlIG5hbWUgb2YgS2VybmVsQ0kgdGhlIHByb2plY3QgYSB3
aWRlciBzY29wZSB0aGFuIGp1c3QgYSBwYXJ0aWN1bGFyIENJIHN5c3RlbSwgYW5kIGFjY29tbW9k
YXRlIG1vcmUgcGFja2FnZXMvcHJvamVjdHMgdW5kZXIgaXRzIG5hbWUuDQoNClNvIHdlIHdvdWxk
IGxpa2UgdG8gcHJvcG9zZSB0byBjYWxsIHRoZSBuZXcgc3lzdGVtICJLZXJuZWxDSSA8U29tZXRo
aW5nPiIuDQoNCkFuZCB0aGlzIG1lc3NhZ2UgaXMgYWJvdXQgdGhhdCAiPFNvbWV0aGluZz4iLg0K
DQpJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSB0aGUgbmV3IG5hbWUgYXNzb2NpYXRl
IHdpdGggb25lIG9yIG1vcmUgb2YgdGhlIGJlbG93IHF1YWxpdGllcy9mdW5jdGlvbnMgKGJ1dCBm
ZWVsIGZyZWUgdG8gZGlzcHV0ZSBhbmQgZXh0ZW5kIHRoaXMpOg0KDQoqIGZvY3VzZWQNCiogc2lt
cGxlDQoqIHBvd2VyZnVsDQoqIGV4cGVyaWVuY2VkIChhcyBpbiBhcmlzaW5nIGZyb20gZXhwZXJp
ZW5jZSkNCiogb3Blbg0KKiBkaXN0cmlidXRlZA0KKiBjb21tYW5kaW5nIChhIGZsZWV0KQ0KKiBr
ZXJuZWwtcmVsYXRlZA0KKiBidWctcmVsYXRlZA0KDQpPbmUgb2YgdGhlIGN1cnJlbnQgd29ya2lu
ZyBuYW1lcywgdGhhdCBHdXN0YXZvIFBhZG92YW4gaGFzIHByb3Bvc2VkLCBpcyAiTWFlc3RybyIu
IEFzIGluICJLZXJuZWxDSSBNYWVzdHJvIi4gSXQgaGl0cyB0aGUgZm9sbG93aW5nIGFzc29jaWF0
aW9uczoNCmZvY3VzZWQsIHBvd2VyZnVsLCBleHBlcmllbmNlZCwgY29tbWFuZGluZy4NCg0KQXMg
YSBqb2tlIGFuZCB0byBjb21lIHVwIHdpdGggYW4gZXhhbXBsZSwgSSBzdWdnZXN0ZWQgIktyYWtl
biIsIHRoYXQgaXMgIktlcm5lbENJIEtyYWtlbiIsIHdoaWNoIGhpdHMgdGhlc2U6IHBvd2VyZnVs
LCBleHBlcmllbmNlZCAoaXQncyBvbGQpLCBzaW1wbGUgKG1pbmRlZCksIGZvY3VzZWQgKG9uIHNp
bmtpbmcgc2hpcHMpLCBkaXN0cmlidXRlZCAoaXQgaGFzIHRlbnRhY2xlcyksDQoNCktlZXBpbmcg
dGhpbmdzIHNob3J0LCBoZXJlIGFyZSBhbGwgdGhlIGlkZWFzIHNvIGZhciwgaW4gYWxwaGFiZXRp
YyBvcmRlcjoNCg0KKiBLZXJuZWxDSSBBbnRoaWxsIC0gYnVnLXJlbGF0ZWQsIGRpc3RyaWJ1dGVk
LCBjb21tYW5kaW5nLCBmb2N1c2VkDQoqIEtlcm5lbENJIEFycm93IC0gZm9jdXNlZCwgc2ltcGxl
LCBwb3dlcmZ1bA0KKiBLZXJuZWxDSSBLcmFrZW4gLSBwb3dlcmZ1bCwgZXhwZXJpZW5jZWQsIHNp
bXBsZSwgZm9jdXNlZCwgZGlzdHJpYnV0ZWQNCiogS2VybmVsQ0kgTGVucyAtIGZvY3VzZWQsIHBv
d2VyZnVsLCBzaW1wbGUNCiogS2VybmVsQ0kgTGlnaHRob3VzZSAtIGZvY3VzZWQsIHNpbXBsZSwg
cG93ZXJmdWwsIGNvbW1hbmRpbmcsIGV4cGVyaWVuY2VkDQoqIEtlcm5lbENJIE1hZXN0cm8gLSBm
b2N1c2VkLCBwb3dlcmZ1bCwgZXhwZXJpZW5jZWQsIGNvbW1hbmRpbmcNCiogS2VybmVsQ0kgTmVl
ZGxlIChpbiBhIGhheXN0YWNrKSAtIGZvY3VzZWQsIHNpbXBsZSwgcG93ZXJmdWwsIGV4cGVyaWVu
Y2VkDQoqIEtlcm5lbENJIE51Y2xldXMgLSBrZXJuZWwtcmVsYXRlZCwgc2ltcGxlLCBwb3dlcmZ1
bCAod2hlbiBzcGxpdCkNCiogS2VybmVsQ0kgUHJpc3RpbmVDSSAtIHNpbXBsZSwgb3Blbg0KKiBL
ZXJuZWxDSSBQdWxzZSAtIGZvY3VzZWQsIHNpbXBsZSwgcG93ZXJmdWwsIGV4cGVyaWVuY2VkDQoq
IEtlcm5lbENJIFRhbWFuZHXDoSAoYW50ZWF0ZXIgaW4gU3BhbmlzaCkgLSBidWctcmVsYXRlZCwg
c2ltcGxlLCBmb2N1c2VkDQoqIEtlcm5lbENJIFRyYWlscyAtIGZvY3VzZWQsIGV4cGVyaWVuY2Vk
LCBkaXN0cmlidXRlZA0KKiBLZXJuZWxDSSBXYXJkZW4gLSBmb2N1c2VkLCBwb3dlcmZ1bCwgZXhw
ZXJpZW5jZWQsIGNvbW1hbmRpbmcNCg0KSSB3b3VsZCBhcHByZWNpYXRlIGFueSBhcmd1bWVudHMg
YW5kIGlkZWFzIGFib3V0IHRoaXMuIE9uY2Ugd2UgaGF2ZSBhbGwgdGhlIG5hbWVzIHdlIGNhbiB0
aGluayBvZiwgYW5kIHN0cmlrZSBvdXQgb25lcyB3ZSBkZWZpbml0ZWx5IGRvbid0IGxpa2UsIEkn
bGwgY3JlYXRlIGFuZCBwb3N0IGEgcG9sbCBoZXJlIHRvIHBpY2sgb25lLg0KDQpUaGFuayB5b3Uh
DQoNCk5pY2sNClRTQyBDaGFpcg0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbGNpL2tl
cm5lbGNpLWFwaQ0KWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9rZXJuZWxjaS9rZXJuZWxjaS1waXBl
bGluZQ0KDQo=
