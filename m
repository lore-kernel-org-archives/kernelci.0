Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023074.outbound.protection.outlook.com [52.101.127.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ECC22332E
	for <kernelci@lists.linux.dev>; Mon, 11 Aug 2025 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907091; cv=fail; b=KrnUvvYiMvcQ5qf6hYh157nd7KDahcAO1VywRlkuuC78ya7yqYtFGVDNEEfXmzo6y+P0TcEv91ZHElhHoMUA3xSxdMWY5fuIVYt2HFuTC7viYWThSOX5jEfg61GiOWiOMHV+AKKXGPlVV9A/uVnfUXXM41+iZzHGkIUsg3zkzXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907091; c=relaxed/simple;
	bh=C1PNEPA3JNJy+de3tGnxGRiJtNFZ87ez5RoG7DkbX1o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gwbKQQfm7SP/6OO6Frgb6//Mgw6JQCLvXihKNKzHiU0vug3/zygwE0hZy9nd0exsC8Oj5L74eDftkupg3ql2BZqy9AC4O97Ya559jR7B2+olXjIMg7lctXfl9P7XB/XqwHA1F2W8PbN9EoquE0J8E/ceXepTAs12HUrxaKWZ3ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=GLdgFSY7; arc=fail smtp.client-ip=52.101.127.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="GLdgFSY7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdRFk8jwWE9KTmTU7P/ff9GMP1/4BeIN1jSZvJ926zzYXTWxMYlaMyk1r5vhwv9Ic0HxmTjt/GEugzdGfnPXmYRYmofnHebppVfUvnBT+GP12jsw0jjbZyU28sS9P6MWuoRqBI1whCzFK+Ayif+7Kf5LnFSyJQsozoDPL0TPmiL8iCbgQi4nh12AHUpjx9oPTeA2ZQQ6+PpQCbkt2SUZVRjZLpxHrPAecxVTSfWua3z755HlCnkD5mZ7zM8upQZlb+aQc9BFH1iiZfn8VRNGhUtp1UkPrFtHKIouRrWWrpPJCHJU+pC1cXarpCXj0drbJJEWYHhGizkXEQ7PmsjQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1PNEPA3JNJy+de3tGnxGRiJtNFZ87ez5RoG7DkbX1o=;
 b=wVdlaD85YAzH0f0JJGoaFb9ti5oCXbDjE1LeHq7KR3frvEdoQyoz8h/rhCYt8mfcDXI5NoVSSX060dq12m6yKAKid9+MQiwVoReP85hRJULKWhU/ahGW8XEYNWAkTDNCQqXaO8DdDucYdO5QOBO/Wq1ODbbDr2PlAOxtUmJGRCA6oM6mZ0Mc1M2KvbUV1oanBSFvcQCXdZUmWHLHfzwYE3sUlH/5aQDdaX0ea+lFgL3m2Wrhfcc9bmtkK/E+8RN4OqTjPzWahTMhkfPZyGBRW8FuD7LjCVkRhejEgeiLP0vQ8SxC5ZoPFtl294Y+zcx32iBa2VsZU55qLUaDGGQ8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1PNEPA3JNJy+de3tGnxGRiJtNFZ87ez5RoG7DkbX1o=;
 b=GLdgFSY7zQX5TjnCP2LlImZZacjXB429EtKjtvf1hM5yddloXur7Nbu12s/CSQapTqTZIc0D+EbOLIA8PERbN3Jn09bv4OiMsx2vGKSbmBDSnwgwvkNztH4HhIU8RKjyyjKrjBVN6URTj+4faM/p1saoFZmQJ0sHsTN1IrzPwHJnMazIg6ZUWtW53ro0lJY/UbeEH21CqqqljTIn0JZwhaAlepIdFMZ9IRkRNieYRK47vxrWEmoJKiyeC2DlKbrWdiap25CEw9YLr9de2sCHE/wBUL6c6XtgefQlUgSzwCMalNvv/UsgOp1bRscrF8aMYcwPiH3ZPiOThholy2DTbw==
Received: from TYUPR06MB6121.apcprd06.prod.outlook.com (2603:1096:400:351::5)
 by PUZPR06MB5537.apcprd06.prod.outlook.com (2603:1096:301:ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 10:11:24 +0000
Received: from TYUPR06MB6121.apcprd06.prod.outlook.com
 ([fe80::dc97:a0e0:d408:e95]) by TYUPR06MB6121.apcprd06.prod.outlook.com
 ([fe80::dc97:a0e0:d408:e95%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 10:11:23 +0000
From: Liping Shen <liping_shen@aspeedtech.com>
To: Gustavo Padovan <gus@collabora.com>
CC: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Denys Fedoryshchenko <denys.f@collabora.com>
Subject: RE: Request KCIDB Submit Token for Test Result Submission
Thread-Topic: Request KCIDB Submit Token for Test Result Submission
Thread-Index: AQHb672F6xNJ74QawkCivVcTnnaNLbQgT/mAgD0Pn6A=
Date: Mon, 11 Aug 2025 10:11:23 +0000
Message-ID:
 <TYUPR06MB612168FA86F8CC9103C24FEFF328A@TYUPR06MB6121.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB612177D6F57D1A988ECD4C3BF343A@TYUPR06MB6121.apcprd06.prod.outlook.com>
 <197d033c065.10b26e217232212.3079559047099293962@collabora.com>
In-Reply-To: <197d033c065.10b26e217232212.3079559047099293962@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6121:EE_|PUZPR06MB5537:EE_
x-ms-office365-filtering-correlation-id: 35625282-cbc2-4b0c-ae30-08ddd8bf6ccd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bmlxQlZDUFZtSzNnN0lGRytxNUlxdGhrZjdZdDIvaUdiMEh0ajMxVlFUNXhi?=
 =?utf-8?B?TlpPT2pOYzdGZDd6bHV3eEhZeFoxNldjSmY5SFo5NzVmTExhMUNZV2lUOWxL?=
 =?utf-8?B?OEJ4NzZ2dHdMZVNmd2lkWnhUN1NKZnRzS2hQY0IrUzVDLzFIeGZQT1hlY3VK?=
 =?utf-8?B?bzBySEd2bDIyalVqMEQrWXpvV1hzVDVIVURsVXhOdjhPZDhoNW9id0RNMjJi?=
 =?utf-8?B?dXdIS3NhMzFBRDdoNmFJK3VjZDNtV2FNV2g0OGc4ZDlBUVVrYitsQjNyWnZJ?=
 =?utf-8?B?TDVvOWNxb3pvSGExbEtML3pGMnEvdHhVYmRlY0l2NSsyL1RreWVGQWljaE9m?=
 =?utf-8?B?eGNFZEdUKytWcmpQWkxJU3hiTUV2YVZsaHlZVDdmUWR6cFNyMlFjbmRuaXJo?=
 =?utf-8?B?S2lITVRodUhqdXdqcmZBN0gyM25DWjNpK0w1aVI1dytHd2JsTmFNWXgrVHFD?=
 =?utf-8?B?RFN0S25IeE0xVlFDemZ0bkZXZGRFbGEyMDkxMW9oUU50azJWTGxNUHh2UVZI?=
 =?utf-8?B?RkQ1WDEvZkMxZFBxNmFBNWlOOEpJRk9DUVVBSlQ5dFRpcVZYbDlraHg2R29E?=
 =?utf-8?B?SEhCNkpoa0FKRnRKVWRVMVphMXRuYlpwUGduLzhyaVdiRXZ1clVoSVBsSmFC?=
 =?utf-8?B?a3FkWnVRVjJ1U1Yrb2ZlSjJRQ1JLVVg3ZkluZUhyc1kzekV1cEpOVkhvbTZn?=
 =?utf-8?B?RFA5TEVBdFJBcmxVY0xaSmlZUFFTWmQxN0dxbjZYa2ZObmxUMHhIMVltMzM4?=
 =?utf-8?B?NXlRdm9TUi9wQnRpUzh6T0dnZVExUkZmYk5UaUZPajBZZjVGKzRvMXkwbmkx?=
 =?utf-8?B?OS9zRkZuQWZBUFhybyswc2Npcjg1b1RONkd0ZmxBQXBwZHV4dEVmQ1dTK0lC?=
 =?utf-8?B?Ryt0c0svNnd1bHc1SWUrVUJxaDdwaXFGMTR4UWJJRmtueW1uVndxditWY0NG?=
 =?utf-8?B?T2wrMkQ0bEVMR0VMSWdabkZTZUNWVHRIZ0tkN3E0Q3V0Yy9LU2lJV2VRZzFB?=
 =?utf-8?B?dGFtS3NtK01xNC9HTEZTUzZ0TGpQOVc2dHZsMWcxL3dVeGlKQjRVRXE4WUU5?=
 =?utf-8?B?dTNjSktQeGlJT1BaSVBqdnoxN3pkSTBFNTMvS0JrK3dROXRkeFRueWdzRkR5?=
 =?utf-8?B?c1h0N0hSYko2YmZYaStKdVprVGxxMG83czA2VnJIRkZXMityTmhmbUxYZnQy?=
 =?utf-8?B?eG16YkN3Z3lyQWk1cEhLL3JqQU5tM1RUdWlYS1JCcVR0UjQ5eXNYWXhXcnZ4?=
 =?utf-8?B?eXA2OW9KMWkwaEN1OW9jUHNHNWYrM0Y0SE9SUllpT3JVcm5INkpBRC9JbXpQ?=
 =?utf-8?B?VFptNGRtWUNYNTE5azFENDNQblNicVJCSHlBOUhjbWRlVitPLzFDRW1pbzEx?=
 =?utf-8?B?amw3eFlUdUl5eE5Tem0yd3lsYkJwTTNsOU5xY3pud0hQWlUxOEduMHpBM0lt?=
 =?utf-8?B?TlBicUQ2VlUwRjdWd2xmWE5TY0dIeWpkRVRDMzVSM2JIa1k0NHR3dnpYMCtH?=
 =?utf-8?B?RlJKcTdqdTR6Y21PM3F3ek44K3hqMlJQemlqSW1uTE9PK1VMTXRZM0pjLzl6?=
 =?utf-8?B?bml6QnhMZlZvZFpGbDhwTnh2eUdkRkhEY1Q2K1lqUlN6TkdEdVIwdWhZcEc0?=
 =?utf-8?B?UTNNRFdnME5kbWEycENhOUlXQjh3azQyS1RReWRxaXlwVzcrWFB2RWJIeDB3?=
 =?utf-8?B?eVFYOXpVcnRyemdTaXF4MFNTZWRSd014WnZHdGVQajhhVndSaUZyL0VUdi9y?=
 =?utf-8?B?bzIwUHNYaVB4UDRnTVZsQS92THF3eFFtUUd4ZnRsQlV2U3M0bk4xUWMvTTBj?=
 =?utf-8?B?SmVHeXoyc0o1Nk54UnpRcjlQbHdxTVk0VXZNR2xFZVZDd2RiY3dya2k0YWFj?=
 =?utf-8?B?M09zb0R5cEpFLzdsbXFBOE9oeGxISUV2bTErNzZNMndTdDZsNjRNdUd5eGNa?=
 =?utf-8?Q?TaZWbaZ8Xhw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6121.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnZoREUzczFmcHI0SFRPWEhlbXZZTkZIaHRuL0JBUmJZSEJ5SGN2dFgzejV3?=
 =?utf-8?B?eTN6VG9Zb1JOcEx0RXdOSmVIQWozV0tPekx4VWpuNUppMy9TWlgvNVVpNzhL?=
 =?utf-8?B?ZEticG1jL3Q4T2tvMVloUlZDbU5FSWZWVks1OUJSV2pUZG4wd1JmR1ZVZDZB?=
 =?utf-8?B?OStvODhRZkNUZzFSbG5sVUExa3Eyd2NxNTRXMjd4NTB1SmVHY21JSHpQK0dI?=
 =?utf-8?B?cFRlMXVCbjc3L0VQY2pEZ3UyVGFzanIzakZ6dVVKUWZ5cnQ0OGpHRmMveEVa?=
 =?utf-8?B?TXJDWVJ5YXZiRlowOC9qWlU5eUdKczkxY2czeEh1TDVndVNGem1kMEUzM3Na?=
 =?utf-8?B?K2hoanY2dDVKTk96K0VRWTF2K2laL2hKUWFhMlpmR2lURDA4SUZoaUFGVWxs?=
 =?utf-8?B?TWRYOEhucnl2RVRRZTRsMXJqNGU5d3JDZ1BFQWJRNkIveDdvWG1JUCs1czdh?=
 =?utf-8?B?OUw4V0crY2tpT002NDhnazdWUGUyVHBpYTM4R1Q1Y0RoSm5CcEIvOW1UUXB3?=
 =?utf-8?B?dkNUVWdLNzBWSndlcXZrQnBMb1p5bDZHU2krOElnckttY0lKV2N0OGFiODN1?=
 =?utf-8?B?cVhTWjVET28wRzROMHYvdlJOcHVVZkcrZHFIUTBNUUZaUWNxcm9UM2liWWdN?=
 =?utf-8?B?TnVqZ0RDOTFrTi9YREk5dzcrbnJuMXpxdUg2YlpmV3lxVXdrd0ZVbU1qejVI?=
 =?utf-8?B?VlBkQ3hOQXNBbFJ3KzA2K0hiMGRQeENFaTBaUGRQOHlpNVBSbDl2RUlyRklN?=
 =?utf-8?B?Um1DV0ZsU2czT3FOdG5zc1lBVGlXM3VhMDZINlhkYlNkNkNNZStNM3dNUFhD?=
 =?utf-8?B?K0JaYWQxcnVuM0lzM0k2djB0dzNwRG4vb1h1LzhGb2tkR1J0SU9VYUZIb01a?=
 =?utf-8?B?ekVFNS90RHFNVDZMT0hFNkVxN0RQL2RWczhFMkpvR21meW04N0t3RldSL3cr?=
 =?utf-8?B?TmZHM2dZL2dqVGJ5bFcrVDhEOEhRMEtYVjVSK2Q1TStTd1Zyb2tzTFd1WStS?=
 =?utf-8?B?Mmg0MllpYTBOY1FQdEV0TGFtd2FiNVNvMkpKUWE2dVp5QVA5TFY2THpEcGkw?=
 =?utf-8?B?YWZuTGszMndEU2wxZXliMVJTMENzcjQrOUM2WkgzbllhK1NuSWpQaks1amRH?=
 =?utf-8?B?WHJBcGE1VFFPc1JibHZSRUpVS3FPeGhtWTZQbU4zUUJGK0M3WnBuZ2g3UUU2?=
 =?utf-8?B?aEtZc1pNWDNnTEEvN1BDcGRQK21Xb2ZCSUZxRWVNcEdHUmVVb1l5cnBBOStE?=
 =?utf-8?B?ZlU2dmJFV0hvVlVCTHIzQXBjcnE0UnFGVURNM05ZZmRXS1RyaWtzdUhZWm5Z?=
 =?utf-8?B?YXI2V3djU1h4N1FvUnVoaG9SVDZ6TC9xbzdFT002NnY3LzRPTHJLajBRV3g5?=
 =?utf-8?B?QnVpT2pnQlNDNmlSTU5MMTkyaXRNNXJ4TVRvckFxdUN3bkZaek1qQXh1N0xH?=
 =?utf-8?B?bVZDTHh3a2lhbXhla0xFYjJxTHNMRk5RZ1NyZjlDa2tvRkd6blJGazV1ajBa?=
 =?utf-8?B?NVJ5T1RWcnpxK2drSkpzR3FmVE1TS3oycFN6aVMweFpWa0dPRHhtNFIzc1VL?=
 =?utf-8?B?Q2VRTUpOR0k3Y21Ha3RvempaeFozZzdoSG9leXJXYXNRYUVFb0FyU01XNEZn?=
 =?utf-8?B?WVNQMnIzRXh5bzZ5VlAxbmFhSER4cG5TY0RBMFlWeWxUYnNoalozbkJMS2Fk?=
 =?utf-8?B?VUJTUUpvVUp0aUg2WmFaR0NSMWZya3hWTlVNa04wd0xrVDFKN05saUxTNjZO?=
 =?utf-8?B?VytORlhlTmo1K3h5Rm9UZC9vcDRTYytaRS9ONnJiZC9NWVNFd21TUzFiSHBI?=
 =?utf-8?B?dlVGa2Z2Njc5TnpRSDZSUDlic1U2UFJuVlFPQkMzUXV0TVdqWHdORHdGeHIw?=
 =?utf-8?B?MzY2Vm8xZGEvQmtSdEs3cWJJMm1QS3RGY0JUbUxXM3p6REV5UlVNemZqZklk?=
 =?utf-8?B?SzRZQjBncFQ0TU5KZnV1RUxTQktvaEo2Sk9XNG13RElQY0M4UDI4VVdlWDRY?=
 =?utf-8?B?SzFtQThlMEFYZmpyNkJmT21UNlZhOWs0TlhWODdDQ0lYemtrYy8xS1FZYTkv?=
 =?utf-8?B?Vk5BSWIxNTQ3cDZYdjNHdFZFOTNzT2hQR1Iya1duSEZxTmlQQjYrQWlzc1hU?=
 =?utf-8?Q?IbYwlCjriD868StKAiMOLalfZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6121.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35625282-cbc2-4b0c-ae30-08ddd8bf6ccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 10:11:23.1723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qJWAO+pXVAfR+3A5V8fDJHbhPtVBV1z+0iTrWoiYzoWY3O6NS0ot4ehAH1t2cn6DzXLKwi+fqtzrUfOC/I2+wI9Q72+kfTrSteapd01iV8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5537

SGkgS2VybmVsQ0kgdGVhbSwNCg0KVGhhbmtzIGFnYWluIGZvciB5b3VyIGVhcmxpZXIgZ3VpZGFu
Y2UuIFdl4oCZdmUgc2V0IHVwIGFuIGV2ZW50IGxpc3RlbmVyLCBpbnRlZ3JhdGVkIGl0IHdpdGgg
b3VyIHN5c3RlbSwgYW5kIGFyZSBwZXJpb2RpY2FsbHkgZmV0Y2hpbmcgZXZlbnRzLCBkb3dubG9h
ZGluZyBpbWFnZXMsIGFuZCB0cmlnZ2VyaW5nIGJvb3QgdGVzdHMuDQoNCkkgaGF2ZSBhIGZldyBm
b2xsb3ctdXAgcXVlc3Rpb25zIHJlZ2FyZGluZyByZXN1bHQgc3VibWlzc2lvbjoNCg0KMS4gQXJ0
aWZhY3QgdXBsb2FkcyAobG9ncykNCklzIHRoZXJlIGEgc3VwcG9ydGVkIHdheSB0byBwdXNoIGJv
b3QgbG9ncyBkaXJlY3RseSB0byBmaWxlcy5rZXJuZWxjaS5vcmcgKGUuZy4sIHZpYSBBUEkpPyBJ
4oCZdmUgbm90aWNlZCB0aGF0IHVwbG9hZGVkIEpTT04gZmlsZXMgYWx3YXlzIGluY2x1ZGUgYSBs
b2dfZXhjZXJwdCBVUkwuDQpJZiBub3QsIGNvdWxkIHlvdSByZWNvbW1lbmQgdGhlIHByZWZlcnJl
ZCB1cGxvYWQgbG9jYXRpb24sIGFsb25nIHdpdGggYW55IGRpcmVjdG9yeSBzdHJ1Y3R1cmUsIG5h
bWluZywgb3IgbWV0YWRhdGEgY29udmVudGlvbnMgd2Ugc2hvdWxkIGZvbGxvdz8NCg0KMi4gU3Vi
bWl0dGVyIG5hbWUNCkNhbiB3ZSBjaG9vc2Ugb3VyIG93biBzdWJtaXR0ZXIgbmFtZSAoZS5nLiwg
YXNwZWVkKSwgb3IgZG9lcyBpdCBuZWVkIHRvIGJlIHByZS1yZWdpc3RlcmVkPyBBcmUgdGhlcmUg
YW55IGZvcm1hdCBjb25zdHJhaW50cyB3ZSBzaG91bGQgYmUgYXdhcmUgb2Y/DQoNCjMuIFBsYXRm
b3JtIChIYXJkd2FyZSkgcmVnaXN0cmF0aW9uDQpEb2VzIHRoZSB0ZXN0IHBsYXRmb3JtIChoYXJk
d2FyZSkgbmVlZCB0byBiZSBwcmUtcmVnaXN0ZXJlZCBpbiBLZXJuZWxDSSwgb3IgY2FuIGl0IHNp
bXBseSBiZSBpbmNsdWRlZCBpbiB0aGUgSlNPTiAoZS5nLiwgdW5kZXIgbWlzYyBhcyBkZXNjcmli
ZWQgaHR0cHM6Ly9kb2NzLmtlcm5lbGNpLm9yZy9jb21wb25lbnRzL2tjaWRiL3N1Ym1pdHRlcl9n
dWlkZS8jZXh0cmEtZGF0YSk/DQpJZiB0aGVyZSBpcyBhbiBleGFtcGxlIEpTT04gZm9yIHRoaXMs
IGNvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgaXQ/DQoNClRoYW5rcyBhZ2FpbiBmb3IgeW91ciBzdXBw
b3J0IQ0KDQpCZXN0IHJlZ2FyZHMsDQpMaXBpbmcgU2hlbg0KQVNQRUVEIFRlY2hub2xvZ3kNCmxp
cGluZ19zaGVuQGFzcGVlZHRlY2guY29tDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBHdXN0YXZvIFBhZG92YW4gPGd1c0Bjb2xsYWJvcmEuY29tPiANClNlbnQ6IFRodXJzZGF5
LCBKdWx5IDMsIDIwMjUgODoxMiBQTQ0KVG86IExpcGluZyBTaGVuIDxsaXBpbmdfc2hlbkBhc3Bl
ZWR0ZWNoLmNvbT4NCkNjOiBrZXJuZWxjaUBsaXN0cy5saW51eC5kZXY7IFJ5YW4gQ2hlbiA8cnlh
bl9jaGVuQGFzcGVlZHRlY2guY29tPjsgRGVueXMgRmVkb3J5c2hjaGVua28gPGRlbnlzLmZAY29s
bGFib3JhLmNvbT4NClN1YmplY3Q6IFJlOiBSZXF1ZXN0IEtDSURCIFN1Ym1pdCBUb2tlbiBmb3Ig
VGVzdCBSZXN1bHQgU3VibWlzc2lvbg0KDQpIaXkgTGlwaW5nLA0KDQpJdCBpcyBncmVhdCB0byBo
ZWFyIG9mIHlvdXIgaW50ZXJlc3QgdG8gdGVzdCB3aXRoIEtlcm5lbENJLg0KDQpJJ2xsIGFuc3dl
ciB5b3UgaW5saW5lLg0KDQoNCi0tLS0gT24gVGh1LCAwMyBKdWwgMjAyNSAwMzoyNzowOCAtMDMw
MCBMaXBpbmcgU2hlbiA8bGlwaW5nX3NoZW5AYXNwZWVkdGVjaC5jb20+IHdyb3RlIC0tLQ0KDQog
PiBIaSBLZXJuZWxDSSB0ZWFtLA0KID4gSeKAmW0gTGlwaW5nIGZyb20gQVNQRUVEIFRlY2hub2xv
Z3kuIFdl4oCZZCBsaWtlIHRvIHJlcXVlc3QgYSBLQ0lEQiBzdWJtaXQgdG9rZW4gc28gd2UgY2Fu
IHN1Ym1pdCBvdXIgdGVzdCByZXN1bHRzLg0KID4gT3VyIHNldHVwIGlzIG1vcmUgb2YgYSBsZWdh
Y3kgc3lzdGVtLCBhbmQgd2XigJlkIGxpa2UgdG8gY29ubmVjdCB0byBLQ0lEQiB1c2luZyBhIHBv
bGxpbmcgKyBzdWJtaXQgYXBwcm9hY2guDQogPiBPdXIgcGxhbiBpcyB0bzoNCiA+DQogPiAxLiBQ
b2xsIGZvciBLZXJuZWxDSS1idWlsdCBpbWFnZXMNCg0KWWVzLiAgWW91IGNhbiB0YWtlIHRoaXMg
ZXhhbXBsZSBjb2RlIHRvIGxpc3RlbiB0byB0aGUgZXZlbnRzDQoNCmh0dHBzOi8vZ2l0aHViLmNv
bS9rZXJuZWxjaS9rZXJuZWxjaS1waXBlbGluZS9ibG9iL21haW4vdG9vbHMvZXhhbXBsZV9hcGlf
ZXZlbnRzLnB5DQoNCiA+DQogPiAyLiBSdW4gdGVzdHMgKGJvb3QsIGV0Yy4pIG9uIEFTUEVFRCBw
aHlzaWNhbCBoYXJkd2FyZSAgPiAgPiAzLiBTdWJtaXQgdGVzdCByZXN1bHRzIHRvIEtDSURCIHVz
aW5nIHRoZSBrY2lkYi1zdWJtaXQgdG9vbC4gVGhlIGF0dGFjaG1lbnQgY29udGFpbnMgdGhlIHJl
cG9ydCBkYXRhIGZyb20gb3VyIGJvb3QgdGVzdHMgdXNpbmcgS2VybmVsQ0ktYnVpbHQgaW1hZ2Vz
Lg0KDQpEZW55cyB3aWxsIGdldCB5b3UgYSB0b2tlbiB0byBvdXIgc3RhZ2luZyBLQ0lEQi1uZyBp
bnN0YW5jZS4gV2UgYXJlIGluIHRoZSBtaWRkbGUgb2YgYSB0cmFuc2l0aW9uIHRvIG91ciBuZXcg
S0NJREIgaW5mcmEsIHNvIHRoZSBkb2NzIHdpbGwgYmUgYSBiaXQgaW5mbHV4IGZvciB0aGUgY29t
aW5nIHdlZWtzLiBXZSBhcmUgc29ycnkgYWJvdXQgdGhhdC4NCg0KID4NCiA+IFdl4oCZbGwgc3Rh
cnQgaW4gdGhlIFBsYXlncm91bmQgZW52aXJvbm1lbnQgYW5kIG1vdmUgdG8gUHJvZHVjdGlvbiBv
bmNlIGV2ZXJ5dGhpbmfigJlzIHZhbGlkYXRlZC4NCiA+IFdlIHdvdWxkIGFwcHJlY2lhdGUgYW55
IGFkdmljZSBmcm9tIHlvdS4NCiA+ICBMZXQgdXMga25vdyB3aGF0IGluZm9ybWF0aW9uIHlvdSBu
ZWVkIHRvIG1vdmUgZm9yd2FyZCwgYW5kIHdl4oCZcmUgaGFwcHkgdG8gcHJvdmlkZSBkZXRhaWxz
IGFib3V0ICB0ZXN0IGZsb3cuVGhhbmtzIGEgbG90IGZvciB5b3VyIGhlbHAhDQoNCkdyZWF0LiBJ
ZiB5b3Ugd2FudCB0byBqb2luIG91ciBjaGF0IGF0IERpc2NvcmQgdG8gYXNrIHF1ZXN0aW9ucywg
eW91IGFyZSBtb3JlIHRoYW4gd2VsY29tZTogaHR0cHM6Ly9kaXNjb3JkLmdnL0tXYnJiV0V5cWIN
Cg0KTGV0IG1lIGtub3cgaG93IGl0IGdvZXMsIEknZCBiZSBoYXBweSB0byByZXZpZXcgd2hhdCB5
b3UgZG8gYW5kIGhlbHAgeW91IHBvbGlzaCB0aGUgZGF0YSBzdWJtaXNzaW9uIHRvIEtDSURCLg0K
DQpCZXN0LA0KDQotIEd1cw0KDQoNCg0K
