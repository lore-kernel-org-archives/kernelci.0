Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2201C2300
	for <kernelci@lists.linux.dev>; Fri, 16 Aug 2024 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723831957; cv=fail; b=DrlnApRXP0rMz6oESWGKpFnNCi7B+NBQRpySrT3/ID6CWbjb+gOZ1d0iaDiahNFWiBShHYY8a/zKJteS4a0twg/kF/zl6IrZXyyxMntwzdtLllrmqfBIlyYlGy/u4In8ciXwpB3BnBdJpRIFJMBkEhU/VcTwIfFh+peoCuF0/+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723831957; c=relaxed/simple;
	bh=AR2rSd8jMthyG9vFA9Cu+l2+0CKW+PLelpZfipwqAbo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tcp7YckqjgSy8imrdRooWDGcGtEj+ZTSM79F+W4A1vvmlaT6fxYDnpv0k5DnueeP1LR37pRZy7msl1dYjWc58Xmo8X+i16Nlw96vgPagp/Qv4BjIwmuJ1zM8HA60n5h6pH71NNvAoqE0/NNsynERgYXPx3MHjSGWTREzrm/yIOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=kJAm0Jfm; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="kJAm0Jfm"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GGMUkQ028854;
	Fri, 16 Aug 2024 16:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=AR2rSd8
	jMthyG9vFA9Cu+l2+0CKW+PLelpZfipwqAbo=; b=kJAm0JfmR8aZKKT0Fyd3RLq
	+RBeddoRHYyV2B7ysgieilpwaMqHic1swl1ajXHM7uGTeyxbo9a045spf9ywgfoq
	IdJVeTQuVB52Odoioiz8vEIYHjQFIQcotQYNbWme9So2O7tLVi9rXN53lY0QqaRV
	QDh2pePhdFOjckeTIWupZgHNYAC4t7B5txD/rQpM5eom3vis0+mfOPbcKP7uiXuQ
	4mQIAgLG5DCsx40xx8OWbxLn93R/BNHLbjqzc4xpWgrvGCFlmQayU5Z7viEAa+iS
	i3b25zC2HnPXKpmUfKHRI4/JLQeiI8P+kk0lTaRSOhqpNq7nLf03cHf9zYv0MMA=
	=
Received: from pps.reinject (localhost [127.0.0.1])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 40x18jd1dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Aug 2024 16:43:54 +0000 (GMT)
Received: from m0209320.ppops.net (m0209320.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47GGhrXR028020;
	Fri, 16 Aug 2024 16:43:53 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 40x18jd1dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Aug 2024 16:43:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rW6NHFXiXZ8DuagT8G75y/5eO+NG7qorY9V5Nz7uHgzGawhSxSPPpWfFbR7T4JBVQ5JQPKBGWtBt5+zXdJVx0DvKiIDYjYYwl1jGzpq6X9f3SdrWzFzbLndPH7BVbNF+U/SNvg9j8D0J2Knz6CCFz1e2JCXDeTERnMSRBhHQDWKu9BUOA1lkv74ZZA6/3vXITftfq8ocXbSr6oGFz2zurQFPVHwg8gRgVWcWOmp7XoNHUPSy96p5jA6L2evgjo1sjBaFotbmR+Kpy9NCGDcaG2iRHLVsHqLCU/qNcQ8M3sB7KomCD8Lze61pMtOqa7wZWGkBk8/BUo4Y93QdKtR2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AR2rSd8jMthyG9vFA9Cu+l2+0CKW+PLelpZfipwqAbo=;
 b=ZaWZK/cg/iQnEKhmYovhJ7pQfEWfAHxKOQprAJ42bauAKPt9eI+XQaRNqMIbHGZCO20rqCOqr92yYlpxJ6H1ksEZljekEt4bDB1Zpwk/vxRtju0ar5yw7UPOuxmoZsmXL791Inul0B1ahxJIdbdzcoHItOfgAfRFM5vdiyt33mp/JpirHpb4oe0YDeQP8NNjuOh9c7culcJVkofNrX0+FpHSaK8moHfp39O1a/t5TqRfr53+K8zT4BErSiV+VBUzdxfe7daRtBp6KGKULqtODpxTxZhVzDYOnpfUTIbWVb60hICKKVc5dKvCCGEtWfQ+HrrOhPg8dg/+j/oWGbIkfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BN6PR13MB3041.namprd13.prod.outlook.com (2603:10b6:405:7b::18)
 by BLAPR13MB4594.namprd13.prod.outlook.com (2603:10b6:208:320::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 16 Aug
 2024 16:43:46 +0000
Received: from BN6PR13MB3041.namprd13.prod.outlook.com
 ([fe80::3661:5a0d:34d0:7c4]) by BN6PR13MB3041.namprd13.prod.outlook.com
 ([fe80::3661:5a0d:34d0:7c4%5]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 16:43:46 +0000
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
Subject: RE: [Automated-testing] KCIDB: Support non-binary test outputs V3
Thread-Topic: [Automated-testing] KCIDB: Support non-binary test outputs V3
Thread-Index: AQHa7+VmXKi0xEYQSk6zViyHs6oAP7IqFldg
Date: Fri, 16 Aug 2024 16:43:45 +0000
Message-ID:
 <BN6PR13MB3041F60A657804ACDEB94409FD812@BN6PR13MB3041.namprd13.prod.outlook.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
 <c66e960b-0a43-45fd-8220-82a91b0b8523@gmail.com>
 <944bf5c2-6914-4c28-86d9-6dbbab450363@gmail.com>
In-Reply-To: <944bf5c2-6914-4c28-86d9-6dbbab450363@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR13MB3041:EE_|BLAPR13MB4594:EE_
x-ms-office365-filtering-correlation-id: a784ff98-2426-4511-3b88-08dcbe1298af
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YkJjZElYVk9RSU80cTVmbUJYWSt6WERnelU2Qk5hTnA2L0RrMUJMRkNobUpT?=
 =?utf-8?B?NHFoV2IxVngwNnlmMyswckVYSnR2c3lOazZkOURDRGM2akNjV1QwUURmbEcv?=
 =?utf-8?B?aXo5ZkFocXkwRVhDSExvL2tyeDBCNStRMGdjWC9SaHhGRnEwQ2tzdXJLM3NX?=
 =?utf-8?B?b0tlczZSbnlFMXNXdlA3a3d0eEk5cDYwbkl3a09Canl6NXVXTVY3OW9ZcGUr?=
 =?utf-8?B?NTd3Z1B4Qk1YV3lRbXFMUGRNQzFZNHNmeTBKY0k2VlFrdG56eHg1em1kOU01?=
 =?utf-8?B?VzlIMUN0TU1tcm9tbGRxZC9JUmo4MFFzOW45clArNFhtb285QWN5NzFxdTVO?=
 =?utf-8?B?WXlkVFhGMUt1YnFaTnY0NUJDVnhYREVjblRYMFgyMm13LzdXN0h6eno2NG40?=
 =?utf-8?B?K2NqZWJNWEw5b3VwY2pCVnVQQTBEU1U1M1c4d1BOTU5MNkpiU2JoNjdIQ3ZO?=
 =?utf-8?B?aHRWM3VWNVE3NitzSDNjdmlGWm1yOUQ3WDluYlMwQUF2TXlkRndpb2V3SGQv?=
 =?utf-8?B?Q0phWlFKa2d3WDVCQVNjSzdzVGpYaHp6Q0dLS0hwVCtnc2ltUy9jVkM2Z0cx?=
 =?utf-8?B?RUNNMGt4a1IraG82THFvS0xhTGZ3Qi9aTXd3RVVoeko1WW12Z3FBczRCa29O?=
 =?utf-8?B?cXNpQXM3aEw3Q0pIdXVCdHVHUGYxVENyYURDV1FBWStzYjJTQUpTcmIyaUla?=
 =?utf-8?B?a3doU2JDZW8wUDVTZ0hoNmZ6diszRzE3WEVNSytBY3hnRTVMRTdaKzZCWU8z?=
 =?utf-8?B?Ujh1UldhamZNRXlRSGU0YlRlZ2tlVlRGZ0pkMWhNZVhFQVVJT2pHMTlTVlFo?=
 =?utf-8?B?aml3Y2lrMnh6aGNCQ3MzRC9vamw1ZDJBMWtDSzJkYitrSE5qVTFqWFRXWXI2?=
 =?utf-8?B?Nk5TTUV3SlY3YVVTTHUzNHlHajdRWi9DZGJnc0xvOHYwcTBKbkpRS3BWRWV5?=
 =?utf-8?B?dXNDcWUrdVRKQ1RKVWorcUhhaHFlYWZjUWkxeW9SMmJ2UUwvTmI3bVg5MFkr?=
 =?utf-8?B?SzVneE5XeUVQQVYyQUMxc2k5amZqeHpMa3VMaGFkRjVWVnRZZTFEUzJMaHNV?=
 =?utf-8?B?eXRYWWJpWEl3M0toK3JKRTkxYmFvYUMvbmV4eHBvV1gwRlVMYUhRck11eU1a?=
 =?utf-8?B?OTBHYi9zTm1YVG5JV0FBNHVtT2lOcDFJMjFSSnh0RjB3VkxMNDJyanh1ZTdV?=
 =?utf-8?B?cUE5QmR1N2lGRmNBT3lwM2VrRWlGam1IZUJBdDdPRnY1UWREVjZpUkwwV0E0?=
 =?utf-8?B?RWxOci92a1J0MkRkSnNWcTJjdXQ2R1U1dGt4UmdSVlRiemZnOEtSNWtwSzlG?=
 =?utf-8?B?U1l1Q2FOSkU1NVdQY0RTNjZKUkFwYlRtOGVZSVMydmRMbWpWWkEwQVViZW5Z?=
 =?utf-8?B?QkErdEE4cXJMUnZEWVpjNEVmK1pibXRyNEdTTk5wdUp1a05jRElObDdtcFdh?=
 =?utf-8?B?U2xVRStZMkdmYzJJQkhKZEFCRnA1UXNURzI5S1VYRm55MHNyZUZ3N0N6QmxU?=
 =?utf-8?B?WDc5ZmpxUGE0TGROMmxTWklWUEszNEo0NUpmY3pTTXI2ZytVRG9zZ0laS05R?=
 =?utf-8?B?Q3dKSHNjYS9RQ2VyaTdjUGJ5VUsvbTFIdnZMUVE3U1NpUFNsbEhDZ05xdkJT?=
 =?utf-8?B?dWRGQ1lIK2JBMVUwbWxCR2N2K2ZxQUJmL3NEMUhHbXpJM29PNHl0bUh0bktw?=
 =?utf-8?B?eFBCRm5hbG1NUzhqNWg3QnNpVzFyalZPTXdSY0VHR0J3Y1ZTZld3S1d5bk1x?=
 =?utf-8?B?Q3EvVkR1TnBiZWJvOU11WUlCb25oQm1KemR3T2tYRFJnWE9KSFNRUjU1cHZS?=
 =?utf-8?B?QkorVW5vbC8zTi9UbDg0NVNBOTVjSUt6UU5kQ1pzSjlEd1lmZ0hxMUp5M1pL?=
 =?utf-8?B?NUVJQmdzeVRHSE1KSTRsc0g4RGZ4NmU5S1NUdUw3QnNZUW14RkVIQmc1V3VQ?=
 =?utf-8?Q?p1eYg0wUbGmTwSsn4CRby8+z7/w+q69T?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR13MB3041.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTBnSHA2UDdFaVpCc2U5T3R2L2dOM0dBaCtTUlkxZnB6QkJlRk1XQXkxRWQz?=
 =?utf-8?B?R05pTysxS1QrZnh5RVlkcmlVdU90SGgvdzJsNFVqUkRHRXduaEhYUjhNY0Vo?=
 =?utf-8?B?eENrVEh0cWFhdTR6bWtJc0I4TXA4aVRSY3JZYjN6MnlUUGtmaWFDVnR1Unpr?=
 =?utf-8?B?WXBJODVWRHAvZUhSc2RmZW5tY2ZUeFJ6TC9DeHRXN3dzTExjV2ZMbEtQZ0Zw?=
 =?utf-8?B?L3lVNHZBNWRGUTVoM2E2Z1A2a0hjYVRFM2lrK3lIWFJhQUVLNzBzakZaNVRE?=
 =?utf-8?B?YnVRdzF1dWF6ckF0S2p1VWpBSWNMVkRKWGNwODQ0dVlJSk5DQkVRNER2dlpv?=
 =?utf-8?B?Nm1tZFNsSWd5dXh1L3J0eTlOWkNUMUxWeHhwL0VOejdMSnQ5TmZlYmEyR1F3?=
 =?utf-8?B?VndaNmtLczNEc21HaUYwenlUNGZBZDUvQThJZ01nb2JBYXQ3ZTlBdWZBZWk2?=
 =?utf-8?B?VkZPeWlFcnQ0Vk5mK3dFYjkzNW95eTRtUnFkYjN3YnB3S0ZwZ3o5eXlnTTNM?=
 =?utf-8?B?Uk9NRkhybExXMHRKVU9hWk9JUWt0bmZXYzB6TEd6YWd4Z2RwWHNoVUNkREsx?=
 =?utf-8?B?WG9IelZpdGFrZ3U5VkhXMGFBVzZlYk9Za1BYMGVSeFBNM0ozdUluL1Vaa1Ux?=
 =?utf-8?B?Q2dqUWRKa210NWtvNlZTN1FWV2dkZzNqZE4vZ3BCVGYyOVJVWmkvSVNXMTE3?=
 =?utf-8?B?czh4T2JTdCs4VHR4Nk9vd3lBd0s4YVR3SDZpQVAxSks1dnBGTG1nUkFyL3pl?=
 =?utf-8?B?WmUxeEl4Q3RpTkNreExGMzNnOFF1ODNyaUhKdjMvOFZpb3piQzJFOFdhQ0pR?=
 =?utf-8?B?clkxMktSc1BzVXFtSmRXYnhMOE53b2w1ZGxkYmtSajNva1dKYWw3bTBYU0xB?=
 =?utf-8?B?RURpd0g5UFR1Y29mdzZ6RXpqWm5aQ3JpVnAvVnl0K1JMM0VaNDlDTFFqbnBD?=
 =?utf-8?B?RCtDSTZrT1pJdXQ1R0ppU1Fvb0dzUGpLQk4ycklsb29vdGRlNmNUUC9hZXg3?=
 =?utf-8?B?QnVBTGQxWitlcmZHVHV4VGV1Wm5KMkV5NGFwdER5QjlCRERvNWhwaGN5VDZC?=
 =?utf-8?B?K0s3UmRFMEdsOFA4WlV4NzN1ck5mQmlrVExWaEh5QjBIRXp1Z3JYYnZ1T0Nt?=
 =?utf-8?B?a2hiM3E2VzFidHgyR2NNTVdscGdnZUplSEEyRi9KK0szaUZQK3QrNkMvUDN4?=
 =?utf-8?B?OWNPc3J1dnZCZjlzSk1qRlRnWGRqcVFENWphdm52SDZ0cm9pYU5WcGI1OTh3?=
 =?utf-8?B?UUk1T3lYaTBENGlYQmpCNVVGWnA5b0hqZ2VxVkJsdXd0bGNyNlgvOUVyVUh1?=
 =?utf-8?B?WTVRQ21PSjNtUTk1VEdJRW9jK3MzNU5WekxYS29OdlgvQno3MWRvb05NdWla?=
 =?utf-8?B?dmJFb2duSzlOcmVuVHU5YkJ3dEFaKzZVbzRBeUtkR3Z4SCt4SDNWYkNtUUhG?=
 =?utf-8?B?NHp5ZnBmdWdlK0xvU1ZoZnRTa3FlbTRaYWJuVlJFd0ludFB0Qm1LMk05Vjcx?=
 =?utf-8?B?QkR2SXpDVnNYMHNKajM5YnVGd0lBejVNa1JSMDZmVkxjL3RuckVqOHVhS2hx?=
 =?utf-8?B?Ni9SNksyOExOeDFoVXFacDJZZjlZa1ZvZkpQR3M4UnRxNE5aaGlPalhUUmo0?=
 =?utf-8?B?aHVrdjlsTmo2alk0dEhVOFhKVDlyQUZBSFZkTDZubjN1bWM4ckl3Z2g5NGI5?=
 =?utf-8?B?ZEFYSXRaK052UGY1a3B2dGJpZzNlYTRhemZ5TE0zZU9tVnZQWDlYVzIwdC9k?=
 =?utf-8?B?Y1QzcU9VVTdPOW81NVNCRktmQVg0djgvNW12NWZxZnJJcHNsQlFVY2JVNXcv?=
 =?utf-8?B?dHFVTGppUmVod0Z2dzNFQmNSQ012V25SdktuMXpVVWhRdHRiRStyeldJWnBq?=
 =?utf-8?B?VldNcUxyVzFqSUZlZVRlNEdMUGVpTUpRTjhieUNwaFJHOWY1NXlWc2dUaWpZ?=
 =?utf-8?B?eUc1dzVtc1hsdHJnUW5Qak9UU3RBTHZlbVduZDJYbzlveXljRys0U2JMRVRz?=
 =?utf-8?B?VHNML0pkejU1NWRUSHR0TFlzbExGSGNsTzNUTWgyTjNXeG9MSzJPV3pLV3Rv?=
 =?utf-8?B?My94TmxyTGZnVXFsQ1BaUTNJVDIwZldFMHA3QlNrbDUzZ0Y4cUtnK0RkQ0Y2?=
 =?utf-8?Q?ZkVs=3D?=
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
	fs2yXeK/wmvzzmfdj5XasfrIpqgdpVVKFMfrUi45EvGFlj61z8BqGE2SBxWP/x18qagmJwjdfFNJzKgX+XP41U35tuJG3L7g1o7E3AZDstURnl74kxozJQohqzu14NwjkaLJMR/E70FNKKdkY3JHczMk2XAJljIKmBTRQ4XBGSG4+rXOMb1AOBNdHV41J88AcL5nwJZiuIIPQh62NLqK4H9l+/wGgJZM60/OQ3MUeuSdtIrVcVvvcJn6SlnS+0owKMk4ECQjsFjAYlRiCvchy7ajnLqg5n3FcO71vZjlE0U6x77bYUPa5sc95hGVHO0iYEjlurQakFZTZ20ZwoH4xK8TrhjdgNc3QH1pe7H4MCCJabrlZJ6vMYYyHSP6MbQRtqn2YfCWSTS8aU+KXwLrOx0RtJheDqkVnGLAfqvF0V2Z8GFrBG08Y47lLEE6djWBa8oaOqCH+GRoHPqr+H6WnVBP6wYeN1uZL1P5R/phJBEbx5aPD6O5brFtIR9irwR4TbfPGnC3WVfXxRAiW5sKPQatB/X3kYxP9ZdaeTpDC6YJJ+bFiKixZeU2/HtPoeqkGQjP1c+TUEvmBV3hkE9wAxIg6YuXE+c2UiuL1NRGE6Ka050pRe2dY5JYkOl+RhSZ
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR13MB3041.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a784ff98-2426-4511-3b88-08dcbe1298af
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 16:43:45.9961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dL10I2fE8u5/magZsNmlTy5XuZzKhYqXSqZmQTpJD1/XHeb7tqv10iFGv1tkkQLrpxA4il8fdR2pd1fKaD+z9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR13MB4594
X-Proofpoint-ORIG-GUID: a40gucUFmkUHNYSnsb7IBJ2e-O4eFtGn
X-Proofpoint-GUID: PS9q7ZqBxony5ZIJGTMdGfeRWU_LKRao
X-Sony-Outbound-GUID: PS9q7ZqBxony5ZIJGTMdGfeRWU_LKRao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_11,2024-08-16_01,2024-05-17_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYXV0b21hdGVkLXRlc3Rp
bmdAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8YXV0b21hdGVkLXRlc3RpbmdAbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIE5pa29sYWkgS29uZHJhc2hvdg0KPiBPbiA4LzE2LzI0
IDE6MDMgUE0sIE5pa29sYWkgS29uZHJhc2hvdiB3cm90ZToNCj4gPiBPbiA4LzUvMjQgMjoyOCBQ
TSwgTmlrb2xhaSBLb25kcmFzaG92IHdyb3RlOg0KPiA+Pj4gSSdsbCBmb2xsb3cgdXAgd2l0aCBh
IHNlcGFyYXRlIG1lc3NhZ2UgZm9yIGVhY2ggb2YgdGhlIGNoYW5nZXMsIGdvaW5nIG92ZXIgdGhl
DQo+ID4+PiBkZXRhaWxzIGFuZCB0aGUgcmF0aW9uYWxlLg0KPiA+Pg0KPiA+PiBUaGUgc3VwcG9y
dCBmb3Igbm9uLWJpbmFyeSB0ZXN0IG91dHB1dHMgaW50cm9kdWNlcyBhIG5ldyBmaWVsZCB0byB0
aGUgInRlc3QiDQo+ID4+IG9iamVjdHMgY2FsbGVkICJ2YWx1ZSIsIGJlaW5nIGFuICJvYmplY3Qi
IGl0c2VsZi4gSXQgKGFuZCBpdHMgYWJzdHJhY3QNCj4gPj4gbWVhbmluZykgYXJlIHN1cHBvc2Vk
IHRvIHdvcmsgdG9nZXRoZXIgd2l0aCB0aGUgInN0YXR1cyIgZmllbGQuIFRoYXQgaXMsIGl0DQo+
ID4+IHNob3VsZCBvbmx5IGJlIGNvbnNpZGVyZWQgd2hlbiB0aGUgdGVzdCBoYXMgYWN0dWFsbHkg
ZXhlY3V0ZWQuIEkuZS4gd2l0aCBhDQo+ID4+ICJGQUlMIiwgIkVSUk9SIiwgIlBBU1MiLCBvciAi
RE9ORSIgc3RhdHVzIG9ubHkuIE5vcm1hbGx5ICJET05FIiBzaG91bGQgYmUNCj4gPj4gdXNlZCwg
d2hlbiB0aGUgdmFsdWUgaXMgdGhlIHRlc3QncyBvdXRwdXQsIGFuZCBub3QgYW4gYXV4aWxpYXJ5
IHZhbHVlLg0KPiA+DQo+ID4gQWxyaWdodCwgSSByZWRpZCBzdXBwb3J0IGZvciBub24tYmluYXJ5
IHRlc3Qgb3V0cHV0czoNCj4gPg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9rZXJuZWxjaS9rY2lk
Yi1pby9wdWxsLzg1L2NvbW1pdHMvMDQwYTIwZGI0MDdmMjU5MmMyOGMzNzk3Y2VjOWU0MTE4MjIx
YWY5Yw0KPiANCj4gQWFhbmQsIHJlZG9uZSBhZ2FpbjoNCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9rZXJuZWxjaS9rY2lkYi1pby9wdWxsLzg1L2NvbW1pdHMvODZiNzVmNmJmNmU0Zjc0ZTU5NGEz
MDEzODJmMmI3N2NmZTRjYmJkOQ0KPiANCj4gSSBzd2l0Y2hlZCB0aGUgdmFsdWUgZnJvbSBpbnRl
Z2VyIHRvIGZsb2F0aW5nLXBvaW50LCBhcyB0aGF0IGFsbG93cyB1cyB0byBnZXQNCj4gcmlkIG9m
IHRoZSBleHBvbmVudCBmaWVsZCwgYXQgdGhlIGNvc3Qgb2YgYSBzbWFsbCBhY2N1cmFjeSBsb3Nz
LiBUaGUgc3RvcmFnZQ0KPiByZXF1aXJlbWVudHMgYXJlIHN0aWxsIDY0IGJpdHMuDQo+IA0KPiBU
aGVzZSB2YWx1ZXMgYXJlIGludGVuZGVkIGZvciBhbmFseXNpcyBhbmQgdHJhY2tpbmcgZmlyc3Qg
b2YgYWxsLCBhbmQgc21hbGwNCj4gaW5hY2N1cmFjeSB3b3VsZCBoYXZlIGxpdHRsZSBlZmZlY3Qg
b24gdGhlbS4gSWYgeW91IHdhbnQgdG8gc3RvcmUgdGhlIGV4YWN0DQo+IG1lYXN1cmVkIHZhbHVl
LCB5b3UgY2FuIHB1dCBpdCBpbnRvIHRoZSAibWlzYyIgZmllbGQuDQo+IA0KPiBPVE9ILCB0aGlz
IG1ha2VzIGl0IG11Y2ggZWFzaWVyIGFuZCBmYXN0ZXIgdG8gcnVuIHF1ZXJpZXMgb24gdGhlIHZh
bHVlcy4NCj4gDQo+IEhlcmUncyB0aGUgbmV3IChhYmJyZXZpYXRlZCBzY2hlbWEpOg0KPiANCj4g
ICAgICJudW1iZXIiOiB7DQo+ICAgICAgICAgInR5cGUiOiAib2JqZWN0IiwNCj4gICAgICAgICAi
cHJvcGVydGllcyI6IHsNCj4gICAgICAgICAgICAgInZhbHVlIjogeyJ0eXBlIjogIm51bWJlciJ9
LA0KPiAgICAgICAgICAgICAidW5pdCI6IHsidHlwZSI6ICJzdHJpbmcifSwNCj4gICAgICAgICAg
ICAgInByZWZpeCI6IHsNCj4gICAgICAgICAgICAgICAgICJ0eXBlIjogInN0cmluZyIsDQo+ICAg
ICAgICAgICAgICAgICAiZW51bSI6IFsibWV0cmljIiwgImJpbmFyeSJdLA0KDQpXaGF0IGlzIHRo
ZSBwdXJwb3NlIG9mIHRoZSBtZXRyaWMvYmluYXJ5IGVudW0/ICBJcyBpdCB0byBkaXNhbWJpZ3Vh
dGUgdGhlIG1lYW5pbmcNCm9mIEsgYW5kIE0gaW4gdW5pdCBwcmVmaXhlcz8gIElzIGl0IG9ubHkg
Zm9yIGRpc3BsYXk/DQoNCj4gICAgICAgICAgICAgfSwNCj4gICAgICAgICB9LA0KPiAgICAgICAg
ICJyZXF1aXJlZCI6IFsidmFsdWUiXSwNCj4gICAgICAgICAiYWRkaXRpb25hbFByb3BlcnRpZXMi
OiBGYWxzZSwNCj4gICAgIH0NCj4gDQo+IEFuZCB0aGUgcmV3cml0dGVuIGV4YW1wbGVzOg0KPiAN
Cj4gICAgICJ2YWx1ZSI6IDQyLA0KPiAgICAgIyBEaXNwbGF5OiA0Mg0KPiANCj4gICAgICJ2YWx1
ZSI6IDMuMTQxNTksDQo+ICAgICAjIERpc3BsYXk6IDMuMTQxNTkNCj4gDQo+ICAgICAidmFsdWUi
OiA3MjAsDQo+ICAgICAidW5pdCI6ICJLQiIsDQo+ICAgICAjIERpc3BsYXk6IDcyMCBLQg0KPiAN
Cj4gICAgICJ2YWx1ZSI6IDE0NTAwMCwNCj4gICAgICJwcmVmaXgiOiAibWV0cmljIg0KPiAgICAg
IyBEaXNwbGF5OiAxNDUgSw0KPiANCj4gICAgICJ2YWx1ZSI6IDEuNmUtNywNCj4gICAgICJ1bml0
IjogInMiLA0KPiAgICAgInByZWZpeCI6ICJtZXRyaWMiLA0KPiAgICAgIyBEaXNwbGF5OiAxNjAg
bnMNCj4gDQo+ICAgICAidmFsdWUiOiA1LjEyZTUsDQo+ICAgICAidW5pdCI6ICJCIiwNCj4gICAg
ICJwcmVmaXgiOiAiYmluYXJ5IiwNCj4gICAgICMgRGlzcGxheTogNTAwIEtpQg0KDQoNCkxvb2tz
IGdvb2QgdG8gbWUhIQ0KIC0tIFRpbQ0KDQo=
