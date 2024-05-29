Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2062.outbound.protection.outlook.com [40.107.114.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA59180A90
	for <kernelci@lists.linux.dev>; Wed, 29 May 2024 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996139; cv=fail; b=l42vOibbfSDGFYLoWZpz5PoGAptQo8+PRzbKe6x08OktLN52F5c/HRuuKBKGw8u6JPkJwFSHyhMdcTghbdrIxyEECmA8rNBOGXHFT5qpINHhJWaQz6HgIOpLr1FIJ5SC+wwlwzT/R3LoUVHlXCRRDlzb2+uzWDb6mdiufG4VKxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996139; c=relaxed/simple;
	bh=iFwN3YB29wC461zegCR2R0Pxs78X9ylDiYqDjjwvNdo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O1luJBRtw43nZZpHjJo0C2BpEdPqOsgjhuq7zd0xB7h3el+xBMbGeeEh7acYAFZbLQP3q9VofAY1xTm/dq/ACxXuy1wiYfttX2zIuK6stvmsANloP0imR484WG7s1C5dw1NjufbwasC7p92xV2npZ5NLH9LnUnCxSwO6HhtZyRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fREjmDB1; arc=fail smtp.client-ip=40.107.114.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fREjmDB1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt1EumTqoW7c3TPzR3LWmIuxpJXAz1MlyLfS4qQV2H4syg+O2uTa5I20wg8i7d3xX0izPL0cUuSh96vOKeAaRh1jp7k6lI3DLzBj5GswxRQI+P7UUJjk9H9qnCWh5k0tjYza5xS9jIL4gDnrOqBFnfI+p4ke5fqlXDp3Aynx6Wg8mBvfN5Wa9YMkj/GzYMqh9eGe0NRt+vYyRE1EyH6kYehu4lV9x1h5jUZ37k5dTfiSKKJnW3eJ1Ce2YhDsKkHY7VQBFi6GQDOrVfgLy57+GRpfmWjqHAMA14Ynb4ZHW1GeLpb8lz8qWUvPzizhilgEDVfyFBa/IKdY8wgRxAsBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFwN3YB29wC461zegCR2R0Pxs78X9ylDiYqDjjwvNdo=;
 b=kYSXrYPExltBsqvM3ZlfJoC2wc5By1/L4TEQ2ME2nvRt3LEC5xA2gFsuZOk0k+DZjZRkWrspaRnNToLWAFPutabK6bHS5Y1oJMiNIdZGHkUYaBuQE+i/mVIKL0Iv7kTzf7wFjM0XVinM7AaKhg2wCsjLvZEKDtb3+/f8wClwprqS7MJ9CUEXGK8apLXDNmMfBdAYSMCrkfv1LuYf1t/P/sxvRjLKxwpt/D1qoDeb3lsrGJHNf2Eu9AjNtRYQFguIjrWcrLy1acqsbR+3ygBYfU6KQxaURbcArHePH1E+KYSYNVbqT9vDYsRXnDlZjFIQdMbp+4WaS4Jt75PNIaAmZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFwN3YB29wC461zegCR2R0Pxs78X9ylDiYqDjjwvNdo=;
 b=fREjmDB1Ko7UL+LP16IX2znf398YJT+T+QgcGfqz+H+/wnGFIQsNjG5hHoPU27ju6Sh/AM4p7G0vE7StK1JEhpEt0Oknt6/8zIGNHvbPjkjSLJwSmMWz2RGiOGXIl9qz2/RXkNYT2w83sI2uhJq5S9UT44PHv9VIw9foprtj9o4=
Received: from TYWPR01MB11862.jpnprd01.prod.outlook.com (2603:1096:400:3fc::6)
 by OS0PR01MB5363.jpnprd01.prod.outlook.com (2603:1096:604:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 15:22:11 +0000
Received: from TYWPR01MB11862.jpnprd01.prod.outlook.com
 ([fe80::1bc:6d4b:6770:82c9]) by TYWPR01MB11862.jpnprd01.prod.outlook.com
 ([fe80::1bc:6d4b:6770:82c9%3]) with mapi id 15.20.7633.017; Wed, 29 May 2024
 15:22:11 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Subject: RE: [kernelci-tsc] New name for new "KernelCI"
Thread-Topic: [kernelci-tsc] New name for new "KernelCI"
Thread-Index: AQHarSmQiw+DoV9BYEWCkQsDpuvwkrGuWpIw
Date: Wed, 29 May 2024 15:22:11 +0000
Message-ID:
 <TYWPR01MB11862F1EF63C0FB9E410C80F4B7F22@TYWPR01MB11862.jpnprd01.prod.outlook.com>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
In-Reply-To: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11862:EE_|OS0PR01MB5363:EE_
x-ms-office365-filtering-correlation-id: 1c3c868e-dbac-4162-ef82-08dc7ff31cb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?bW95emFQM1RXcTkrR2pyTzZRT1NSc0FsMDJ2SGgzazkwRTU1NktBMlNXQXJX?=
 =?utf-8?B?UkpYZTI4ZTFCNi9ISFdsSjRscUhrNXJaeHpMZzc0THdxa203d1NXMVQ0djd6?=
 =?utf-8?B?bDdRaU9NaWZKWE9ZNXdxZktzbFJrV2ROWUZWNHBWL2VPdjRsUU5QSm1wL2Fn?=
 =?utf-8?B?Rnp0MGpHVnRZc2VoYUg1bUoybnJLbWQwYnFOOGpLVW1LdmMrL2RsS1ZYTGlI?=
 =?utf-8?B?VU5Rb05FYkR6ejFibkRUbE9VcTZYWmJnVkN1bDdZWGIvVXJPVXBIejZvcVB1?=
 =?utf-8?B?YXFMeG1MVEpTNzY2SEVRU2dxcE5oT040bmJyVnhRZmg1SEFtNXNvTWZ1UjRD?=
 =?utf-8?B?MGwxOW5kNjBEYkFwMlgyWDR3cDFCdmRGSC9vOGpFR1cyK05STGpnQzdXR0Zh?=
 =?utf-8?B?NHpPQS9lWis5UGtGTFNodHVpUUh5SGx2VDhxYUdpT1dsNk5hUDNkeGJMcHpH?=
 =?utf-8?B?WHhITENxbGkrMkNiWmc0Y21VWTNLUzRzT3RiazJhSVJWdjNycWhLbm9RS2dQ?=
 =?utf-8?B?bSs2SHVxeXBEUmdDQUlwVDRzVXFYelRRWEhJeGdOOFYyc3ZiWHZTT0gyYnpn?=
 =?utf-8?B?S2dMVExOamhzWHRtTndTT3JVaFJ4RXFYcXFjTno3ZnVqU1J1bUlZd2g3dHF4?=
 =?utf-8?B?NmkwT1pmTktFYmV6ajk1NlZMcEZRdHl2VjJtMk4zdzROUm5FQ290OVBxZE1y?=
 =?utf-8?B?NEZheVVwUE1oZUt2eGhCZXRxZmlKMDJFQXpQQitMUGRpa3o2OVhlMXBlRERi?=
 =?utf-8?B?VU9OeXNUY0UxVTVDTWVsNUZ3U25XN1p6SGdhL2pqbjdReFBRckx4ZmZaSUIz?=
 =?utf-8?B?TG9mWEcxcitHWTE0ZU1mZ2dDK01NRFJxejUwS2F4ZzE0bUNuaEZnMTdZeG53?=
 =?utf-8?B?RWRUa002UThRR2pxWjZUVE5adEl2Z1FqRlJwQUxtQ00zcGd1bStXUVFPcm81?=
 =?utf-8?B?YVg5ZmFNUm1zSHd0VDE4SEZXT3UyalpYSGpaWmNSQ1krMEhlMllmNnZGRlZs?=
 =?utf-8?B?bHdQc25XNVFUdnQrU0ZiNEhZZTN4TVJENjV0RFN6TkJEbXJsNE0yOXprY29S?=
 =?utf-8?B?WEYrcFVXNllIMUJPTENZSXJJRXY5TGVlY09UOWNNemUzYmFUUVNOelczdTRF?=
 =?utf-8?B?cDRHVndyNlJESk5UcDM4SmJLSU82NzBVU0ZGOHRFakNxVGNncVFETU45dnJH?=
 =?utf-8?B?TytpMFVCK3prcWJwWWNQYVBpZG5DS1pPQjkzQTE5MEpNMm4vSk1sRkNoM0Y5?=
 =?utf-8?B?R0ozcmVZN2EyYVJQV2ZjQWY5bHhGTnNjSEl1eXY3UzREN3BxU3FIUlA5ckVF?=
 =?utf-8?B?YkVUY216clM4eG82Tk9mNDVrU21yWVQvRmJ4bXp3TmJRRzNXbzlpWjBPSjNO?=
 =?utf-8?B?NWdjYlgwZEh6R1JXZXVPQlFhdXdwWk8yNkdmdHZxMEdtL2d5ZUYyUitBTGti?=
 =?utf-8?B?cWpteWttYVZYWFpiMFh6TFVWRy8vb3NQWTdwT015ZTljemVmUnlRcE9Ya3lU?=
 =?utf-8?B?UmZMb1pwTVVPdkttZitFeTJyclczeFArdmFRS1hueE5KSlQrZ2RIaWFqSTZx?=
 =?utf-8?B?MURyT0Zlbnp6M1p1NktRc0VQTHpqOEMrK29uQ2ZmdlB1WnlXSTBjUjNGS2tm?=
 =?utf-8?B?amp6ZjRIWXk2R0l2Q29GcnU3ZmZqd3cvdmcrUGJkMTIrMlduNlVtbXpiZjYv?=
 =?utf-8?B?ZVE3cnFvY0RYMkVEZ1JXZVRISTlRc3VhNm5UUjB5Q2x3YkY5R2xVSTlndCtP?=
 =?utf-8?Q?qsS+oCkTadRqQ6k6rM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11862.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGFoVzFZdWszMEprZjlCRkI5QkpqMS94L2tVSDI3Z25VVTlpUVAwNG53enFQ?=
 =?utf-8?B?M2VQdG8rZk50UUkxWXhocUt4VnV5K01VUW90aUJ6bVdTbnJLaWp5cDBtOElB?=
 =?utf-8?B?ekpLeG04S05PYU9IeDNjdlY1SXZhRkczY1VhVTdSTEZlaWkwa3FRQUIzRk9i?=
 =?utf-8?B?RVFtbDJ6bjlVVk1VcytKK1RxTGUwTkMwTHlZNGlTTFN5STkwQTkyMllORmw0?=
 =?utf-8?B?bHltS3gvSXpiK2xOdHV0UkxvejFFSGtZU3hsRU5acXVJOEs2U1N3bVh5NTVn?=
 =?utf-8?B?T3lkVGdoVGVvK3hwTkltL3pZQnV3blY0RnlpMFlrOTZnQk9keVBHeTdGaFJN?=
 =?utf-8?B?eVpzb1VQcUN1NC9BRHNFQlN5QmcwSldYUTEzMXNwSTlNaEswcGxXcUc4S09N?=
 =?utf-8?B?d0hISzZaeGVSZDJUOW9ZRGZhNTNnVll6cjBBMkdORzgzTTF5YXRML0ZjWFBh?=
 =?utf-8?B?ZWdsSmt0aksvd2o2dUZBWTFwN01tbTFtbW9mdjBSbGV4NDNsdzVubDNIUjdq?=
 =?utf-8?B?NzFYWHhXNUpWdllBZ3phVkhSdGp1MEpiZG9RVk55bktmRHlmdm5aY0t5RHpy?=
 =?utf-8?B?MnVldGxpQTBySmhJbmxuTFEzbW15aHc1M3g3MGlKaU9kaHBsSkt0cGFJMU4y?=
 =?utf-8?B?TTI4R282SktyQ0NFb0FITmM4b29mNUs1WjdmK09yR1lHejB5Uis2V3NFdkR2?=
 =?utf-8?B?bmM4RloyV1E2ZGVDOEtPdkRWZVJGdzl5NHBKaUM5aTQ0VEZGSjV1QzgvYng1?=
 =?utf-8?B?UzY2RzhlUVg0Z3NkcFcyeUl2NUZLZllmcVhNZXVqK3RCUGRJK0VTMzhRaG5k?=
 =?utf-8?B?TzVlRDNkejAwTWROek50SzBaYUUwUWtQajdIaktnckFzb2phZDBrb2JkVU94?=
 =?utf-8?B?T0VWRGlMcmp1a2FFY09vUVdPaGI0bGxmelErVStuRXFuWWN2d1dtTUU3cjdr?=
 =?utf-8?B?WXM1V1pnSDJrTkdjRkg3RHMweXFabHdIa3lvcU1GS3NqSitmNFJUN3kvU09E?=
 =?utf-8?B?c2s0eEpob0F2QVlkb2VjaXhxOGtxZGJEaWdJMytEQ1JBcVpBMjVNYmZtVVgv?=
 =?utf-8?B?UE9kaXByNm9GV1dlWTlSZ0dmYzg3eURKQjV6WU0wR09FSTRkcnNCZUdEZFNl?=
 =?utf-8?B?Tm9IK1lCQXNSbVRmcDhiWndrVmJoL0lRQ253cjB5eWtBb0FPTy9keFVLaFcy?=
 =?utf-8?B?Yy9hbW9EMjdQUXZwWGlKVnNIN0M1eXBJWXVUdXFyU2xKUGZFUTBLb2drU3JC?=
 =?utf-8?B?T1JuQmdieURmY2JoWkxjaHROdEp3SS9yYjRGZ2RrUW9sckZMSzdoRnZNU0VB?=
 =?utf-8?B?VmpVRml6ZTFCUXRPd1VKaUtQNTFaeGUwSS8wOE0wN2dhcFJiaks5VkZsVFhw?=
 =?utf-8?B?bDB1VUpOcmEwOFQ4MnV3Wit1ZjI3ZjdMOXVlbi9EV0h2Zy8xNmpnSzRXNnh4?=
 =?utf-8?B?RUh3YmxZenQ4OFBXMXJZeWZ1WDBQZDlkVnErZU13bUR0TUdYcWY5YVJob1Zh?=
 =?utf-8?B?Snl1Nk5YM1krY0wxRnQyYjA2TlJ3NDF3WXB0MktleC9ZTkJ1c210NTRMSTc2?=
 =?utf-8?B?ZEJTOEpEanI2K1dNWFllRkFodEZaT0h4anlycEVEMDVJdHU2N2U5QjVDYU9q?=
 =?utf-8?B?em1zSXlLRzJqSHZUQ1c0UzNxK0ptQzhNOTgzcTB2bDYwY1VZVGh6NjNqS3RM?=
 =?utf-8?B?S1RyL2pZSGpWKzdEeXkxcjM5MHpjRWZNS29SOVJNbVV3MWJybWpMbGNxbGk2?=
 =?utf-8?B?NGNmZ2gyL1lIYjNiaElhaWlwM3BWSDR3a2N4amwreGJIeGVtdk9Tb0x6Vk1J?=
 =?utf-8?B?ekVPL0piVEUyL0hkNTd6dEZ3SnV5d0I3U0FZcjNiTUtXd2YyTDJYYXE0OERF?=
 =?utf-8?B?bnprY2U5RkFjUW4wSEU4Q3dWWXROVlc1SEpLMjVQMFp1bnVRNDdQMitjbWQ5?=
 =?utf-8?B?RTVlbXZrbitaZDUxZy9FQ282OEg1bFhLNFpwWnZ5MFBvazdnbVd4NnVtSE0x?=
 =?utf-8?B?R3Y2YlpYVG1sRHVCbE5NQ0xadDJxV3ZjRFlvZ09vQkh3bHFTb2NETWV3UHBR?=
 =?utf-8?B?Ui9UVWhhbCtoTU9PMmVFNGI4OWFDU00rV01ZcEpkZmZQWW9Bd282MU0wSEJy?=
 =?utf-8?B?U2h1dWZnUHZFRi9qaDQ4M2hITi9KOFZNdTVJNFZsRHRIUU9pc3lFZ3Jua1Vz?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11862.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3c868e-dbac-4162-ef82-08dc7ff31cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 15:22:11.5178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71UMBqOJZiMKhDX087sOSi2L6TRb4lsFgEVhZ1hSj9pYm4084S0DBLL7tnfGIkI6LaaK8K85mE1h7wp76qfEEpLuzlhPk9LIQXLklJeQRHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5363

SGVsbG8gTmlja29sYWksDQoNClRoYW5rIHlvdSBmb3Iga2lja2luZyBvZmYgdGhpcyB0b3BpYyEN
Cg0KPiBGcm9tOiBrZXJuZWxjaS10c2NAZ3JvdXBzLmlvIDxrZXJuZWxjaS10c2NAZ3JvdXBzLmlv
PiBPbiBCZWhhbGYgT2YgTmlrb2xhaQ0KPiBLb25kcmFzaG92IHZpYSBncm91cHMuaW8NCj4gU2Vu
dDogVGh1cnNkYXksIE1heSAyMywgMjAyNCA0OjU1IFBNDQo+IA0KDQpbLi5dDQoNCj4gDQo+IEtl
ZXBpbmcgdGhpbmdzIHNob3J0LCBoZXJlIGFyZSBhbGwgdGhlIGlkZWFzIHNvIGZhciwgaW4gYWxw
aGFiZXRpYyBvcmRlcjoNCj4gDQo+ICogS2VybmVsQ0kgQW50aGlsbCAtIGJ1Zy1yZWxhdGVkLCBk
aXN0cmlidXRlZCwgY29tbWFuZGluZywgZm9jdXNlZA0KPiAqIEtlcm5lbENJIEFycm93IC0gZm9j
dXNlZCwgc2ltcGxlLCBwb3dlcmZ1bA0KPiAqIEtlcm5lbENJIEtyYWtlbiAtIHBvd2VyZnVsLCBl
eHBlcmllbmNlZCwgc2ltcGxlLCBmb2N1c2VkLCBkaXN0cmlidXRlZA0KPiAqIEtlcm5lbENJIExl
bnMgLSBmb2N1c2VkLCBwb3dlcmZ1bCwgc2ltcGxlDQo+ICogS2VybmVsQ0kgTGlnaHRob3VzZSAt
IGZvY3VzZWQsIHNpbXBsZSwgcG93ZXJmdWwsIGNvbW1hbmRpbmcsIGV4cGVyaWVuY2VkDQo+ICog
S2VybmVsQ0kgTWFlc3RybyAtIGZvY3VzZWQsIHBvd2VyZnVsLCBleHBlcmllbmNlZCwgY29tbWFu
ZGluZw0KKzENCg0KPiAqIEtlcm5lbENJIE5lZWRsZSAoaW4gYSBoYXlzdGFjaykgLSBmb2N1c2Vk
LCBzaW1wbGUsIHBvd2VyZnVsLCBleHBlcmllbmNlZA0KPiAqIEtlcm5lbENJIE51Y2xldXMgLSBr
ZXJuZWwtcmVsYXRlZCwgc2ltcGxlLCBwb3dlcmZ1bCAod2hlbiBzcGxpdCkNCisxDQpUaGlzIGFs
c28gaGFzIGdvb2Qgc3luZXJneSB3aXRoIHRoZSBLZXJuZWxDSSBsb2dvLg0KDQo+ICogS2VybmVs
Q0kgUHJpc3RpbmVDSSAtIHNpbXBsZSwgb3Blbg0KPiAqIEtlcm5lbENJIFB1bHNlIC0gZm9jdXNl
ZCwgc2ltcGxlLCBwb3dlcmZ1bCwgZXhwZXJpZW5jZWQNCiswLjUNCk9yIHBlcmhhcHMgIktlcm5l
bENJIFNlbnNlIg0Kb3IgIktlcm5lbENJIFNlbnNlaSIgLSBpdCAidGVhY2hlcyIgdXMgb2YgaXNz
dWVzLg0KDQo+ICogS2VybmVsQ0kgVGFtYW5kdcOhIChhbnRlYXRlciBpbiBTcGFuaXNoKSAtIGJ1
Zy1yZWxhdGVkLCBzaW1wbGUsIGZvY3VzZWQNCj4gKiBLZXJuZWxDSSBUcmFpbHMgLSBmb2N1c2Vk
LCBleHBlcmllbmNlZCwgZGlzdHJpYnV0ZWQNCj4gKiBLZXJuZWxDSSBXYXJkZW4gLSBmb2N1c2Vk
LCBwb3dlcmZ1bCwgZXhwZXJpZW5jZWQsIGNvbW1hbmRpbmcNCisxDQoNClRoYW5rcywgQ2hyaXMN
Cg0KPiANCj4gSSB3b3VsZCBhcHByZWNpYXRlIGFueSBhcmd1bWVudHMgYW5kIGlkZWFzIGFib3V0
IHRoaXMuIE9uY2Ugd2UgaGF2ZSBhbGwNCj4gdGhlDQo+IG5hbWVzIHdlIGNhbiB0aGluayBvZiwg
YW5kIHN0cmlrZSBvdXQgb25lcyB3ZSBkZWZpbml0ZWx5IGRvbid0IGxpa2UsIEknbGwNCj4gY3Jl
YXRlIGFuZCBwb3N0IGEgcG9sbCBoZXJlIHRvIHBpY2sgb25lLg0KPiANCj4gVGhhbmsgeW91IQ0K
PiANCj4gTmljaw0KPiBUU0MgQ2hhaXINCj4gDQo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20va2Vy
bmVsY2kva2VybmVsY2ktYXBpDQo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20va2VybmVsY2kva2Vy
bmVsY2ktcGlwZWxpbmUNCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBHcm91
cHMuaW8gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAu
DQo+IFZpZXcvUmVwbHkgT25saW5lICgjOTY5KTogaHR0cHM6Ly9ncm91cHMuaW8vZy9rZXJuZWxj
aS10c2MvbWVzc2FnZS85NjkNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2dyb3Vwcy5pby9t
dC8xMDYyNjUwMTcvODgxMTIwDQo+IEdyb3VwIE93bmVyOiBrZXJuZWxjaS10c2Mrb3duZXJAZ3Jv
dXBzLmlvDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2dyb3Vwcy5pby9nL2tlcm5lbGNpLQ0KPiB0
c2MvbGVhdmUvMTEwMjc5NzcvODgxMTIwLzc4ODI5ODc1OS94eXp6eSBbY2hyaXMucGF0ZXJzb24y
QHJlbmVzYXMuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K
