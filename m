Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3622DC341
	for <kernelci@lists.linux.dev>; Tue,  2 Sep 2025 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818833; cv=fail; b=Or9c11P2+NOiBQGn8HQu+W3v7uMA36M10m9dGcoCF+3aO7vASEtYOXHvStIdRzH6YKItGLvmR5QncQe3JnGvraRd44BUtDZ5WYEiMNhtc2Pcn65eSfW/dZNkVFr5GCM465Sb2nZiVLvLn7PWtd1YH4E6M1FskQxNT5MGFVnP50c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818833; c=relaxed/simple;
	bh=nc5++Ix95I9iXFGttKYfO6xtj/SNQuwRIySTqv9OInU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XpfTPP+6cEDXhoGLHqvMHBA2m5BwdUxVB6KN+sZ2zxMJQUfHtX4WDkJur87xf/W0cWxq8EJ7QYbmRQU/cCCC81m387K7ZHG0YF5ZXQGUTr0bUYdDMaTIZ7rp27fUQLjhpdxyImy81SokrKH3ZU267IE9Xe4ABYJRNYgbyEdpC/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Sc68hIvy; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Sc68hIvy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHSNCvGv1i2IXXQLPTh3X+MIZ3Creh8svgj4w6wyoHI1Ssh4qhsS8kVgyvogEDie81fxfqsmENY4G64ZkVwinjJvo+OsDe9rFX66o2fIDIHPJnM/Q8y99U/gykTbXCzjqwfyw4DpBOn2zI8fSXqGmuR0mD+gfej5IcoXM0tOy+P785Ha/0/eP5j2uAx17NZcxiczaA/5Ks5pa4YqV2mCTakF6Y3rjJMbleQmdFrexdk4Rmz/Rd/BtxdKkgXYamum1Ba1Df10D7+OybVo3oQdcLsLRhxoZVplfiPFyk4RBTKPhcloD/iMBYHqLmnFNpG5mc78DT7qSngJvDYsc0OdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nc5++Ix95I9iXFGttKYfO6xtj/SNQuwRIySTqv9OInU=;
 b=B2nu22A2x5RmCgQCFVYt9+jCBbBng3zprbugULzpUBWEbIc/7Y4tqGxopQVuOD/qv/K5SRjgjVCZFvED8Ph0tWf0kWGgR3N5QGUZZ4xDIr/lC8FD2uqBeUbt/39MBkes80yrSunTVqQMG+6iRfltQVw5M2tPYwC59xO9+iUMnVsl/nx4I0GNVJp/oYt5v8twzZwONet4yc482x/M1ve6EGQ4/6uqmK+QumL9XPaGC80F7LdPGcfWAzxY9yFpqu+TfO9eUSPV5Nnqmx6E73115bn2s9CaJ8VMEiqM4NMxBy7mxgyjQRcygBYWHOMLrSSPuOQES574yUegGxYO1g7Xgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nc5++Ix95I9iXFGttKYfO6xtj/SNQuwRIySTqv9OInU=;
 b=Sc68hIvyqw07DC5sPTQcokuFxpN6jWT/CWkmv7QuqmkaZFG6jf//Hmtmk/dnt7B9O3qD++g6l/71TXPzy0pCBS9+9JAxqxn/D+ySiGHDBkWyD8G8oRESLovEt564AcF3Ew6Nu24Xn/kU7q3DgLTogNzgBmyv6179ni61TZJQ+So=
Received: from TYYPR01MB15132.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::10) by TYRPR01MB13916.jpnprd01.prod.outlook.com
 (2603:1096:405:216::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 13:13:44 +0000
Received: from TYYPR01MB15132.jpnprd01.prod.outlook.com
 ([fe80::3fd9:f47c:79c7:a6c6]) by TYYPR01MB15132.jpnprd01.prod.outlook.com
 ([fe80::3fd9:f47c:79c7:a6c6%7]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 13:13:44 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Gustavo Padovan <gus@collabora.com>, kernelci lists.linux.dev
	<kernelci@lists.linux.dev>
CC: ben.copeland <ben.copeland@linaro.org>, cfi <cfi@pengutronix.de>, broonie
	<broonie@kernel.org>, sjoerd <sjoerd@collabora.com>, khilman
	<khilman@baylibre.com>, f.pflug <f.pflug@pengutronix.de>,
	=?utf-8?B?IlBhd2XFgiBXaWVjem9yZWsi?= <pawiecz@collabora.com>, Tim Orling
	<tim.orling@konsulko.com>
Subject: RE: KernelCI Labs Working Group
Thread-Topic: KernelCI Labs Working Group
Thread-Index: AQHcG5N5D3Y3h/30fE63kBvJsAH5SLR/3x2A
Date: Tue, 2 Sep 2025 13:13:44 +0000
Message-ID:
 <TYYPR01MB15132FDECACE867523FC5F8CBB706A@TYYPR01MB15132.jpnprd01.prod.outlook.com>
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
In-Reply-To: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB15132:EE_|TYRPR01MB13916:EE_
x-ms-office365-filtering-correlation-id: df699f01-1276-4ec6-f7d4-08ddea228b84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NEV5RjVrNGRLOXNDM2piWWsxeFF6QzlKcEtEbXBmTUpiSlYyQ0lkaDA4UGU3?=
 =?utf-8?B?MWY4MDVJTC9ocmpEWXh3ZG5NT284M1FTVkRLTWVjOVF4V0hndlQxUVMxNCtw?=
 =?utf-8?B?R2p4RFJKcGczZElqQVlVZ094eTlxb0JrS1NvQTFqVE12RVNaS3ZQMUd6N2Mx?=
 =?utf-8?B?WnZjL0w5NnY3cTVvbEExWEhqelZLRk5tdnJMRzN0S3ZObXVEVm5VRjhUMVU4?=
 =?utf-8?B?djE1RnFKbVdGQUh0YVp0QUJSM2hQaXVqayt6NCt1R1BzRTVHamVtV0JpSDJV?=
 =?utf-8?B?amdsUHBSWG5qK0N2NFNaU2pjMkltN1BQZittS1VmRllnQWVkWkxNRW5KbVFt?=
 =?utf-8?B?V2VyN2ZvZjllcGlSQmtJZXB2QzNnN0pVNGdLVEVNZ0ZrZERsWW9sTXFid2Z2?=
 =?utf-8?B?T3pvMWh3ZDJ4S0RmL3lHMmpvTU51cTNrdkxiQys3dTNtUE50RlFJSHZGenFi?=
 =?utf-8?B?cVo5eEZ2S29yRmY4SEc1Mk8yTHZtT1kyNDJjVHFhK0VDaWhBN3Z5Y29HOGpa?=
 =?utf-8?B?dGwxNVcvWFdyNXdiT3RwT2NwcEdGUkdqUEYwOGFnQnFGTE1RZmFnaUQ2Um12?=
 =?utf-8?B?UFU1YjVWZnQ0UWdsRjBDZEN3clIxdHMvMU5iSFFYazdxMUVCWloyM2t2SzVN?=
 =?utf-8?B?RGErWE5KS2U2Kzd5ckdCN0YwaVVoQnE5TUVycWZmUzhCaG03L3B6QVFFb21K?=
 =?utf-8?B?Zmo0YWdlbzhXUm1wSDFiT1dYeElOcEJ2eDJKQnRYOXd5MmlsVWl6TFB1cVhJ?=
 =?utf-8?B?WnNDVlhwd2UySXlHbENsejJ6UEhWMFRobGF3NVpDenBKSWJPbEw1czFXTUUx?=
 =?utf-8?B?U1RRSWhrbTVjaGlhb0VxREJjL042ajVrNUE1THlqL2hMN1h2aEtMUmk0OHlX?=
 =?utf-8?B?bzJJK2lkRE1UQU9kUDFTdEd6WVFnYmN2V2tZenNlZEJvRmtqcFZrMjZPMDF4?=
 =?utf-8?B?aGp3YUFPQlQ1dnhOSXNFN1ZxTURHS1ZkWDlNRjJUb3RITXZDeHYvSFNIdWJz?=
 =?utf-8?B?eVlxb2xvdGttZldDQU5qdllxWlpDa1JDZ2s2MU1RSFlucEp4eWhUUkM4Nk1J?=
 =?utf-8?B?aDM1WmxXYk9FNU55cDBDSW93MTZNa05tTXpncWFERzFVQ1gvU3ZvY0lpNWdK?=
 =?utf-8?B?bDlJOWdhdzk5bmFYZkV3OG9QZGFrRllUeWtDRmxWZXR4M3VENFJwSDlvSjRY?=
 =?utf-8?B?QW1KMkg5T1VBZnZyRmRiSHFjY2tvcjdpcFY2NjVsNFQ2b3k5Rm5ETG1kVXla?=
 =?utf-8?B?SkhDWXlSaVN1SDJHSEF2VkRwYzYwdXhpaGhxNlFZL0VvNjMrall6a3VEc3Bo?=
 =?utf-8?B?eWttZTE5NURtU1h6bHBuK3Vpa0t6YnpRRjlFS2N4cTlWeXJoaUl3UDZueEEw?=
 =?utf-8?B?TkdyZFIyVkdiV0tXWmtYVnZYd2VMZ0xKRExLejRGZGJBZ0lGSHVtdXZuTnYy?=
 =?utf-8?B?RnRnMFAwWFdqc0xzQkJBQWZCZTVkOHBaOC9sNXgzREllZU9JdjdRRGh2L2hk?=
 =?utf-8?B?QWlRMExiUitzU01waGZiQzhmQjVJZEJVZndaQTVha2l4NWZ4cDRGRjA5Vkdi?=
 =?utf-8?B?dHlzOTFRdXQzNXAzUlVsOXhzMDlGZFdsQkpHZEJneXR3U0NmLzhBTzVnRFVz?=
 =?utf-8?B?cXlQOW1vK3ZidFMrcFVyUk80WFZ1a1kwQWJaL1ZNTFZsRE43N2FwNlNkNDJk?=
 =?utf-8?B?c2ZFMGp3QWdMY0VxY0IwQTZrL3YrNVZxTnN1UUYvWWYxS0ZtalVhSDNDeHYw?=
 =?utf-8?B?cEN4ZHc3NlB0UEJPODV1M3dzZzFGVG9VV2xvb2UyTktSd1BOclNwQTZON0NM?=
 =?utf-8?B?T0tMSGFSM2tzVlFiWXpNLzhhNHh1T0h3S3ZKRHl1cDZFcWVaS28xV2ZBLzln?=
 =?utf-8?B?ZEJHa2NucmxpTjV3Rzd4YXZpcUlNWnM1MXQrajhiVlhKTGsxQTNhWWJzd0gw?=
 =?utf-8?B?RjBpdkR4R2V5MEdESmVPYWxFK0NyZ3JZalk5TlR4eURKZXFZcHVSdGdmb0Mv?=
 =?utf-8?Q?+xkmtwf/FZYxbiYFgAel6h1ZFGpvHw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15132.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OS9OTkhDWjVaN0swdkpaZFVZM0NtbGRLcGtMNlJ0MHkwN2I1b2Q3MUlKeTBk?=
 =?utf-8?B?YUV1S2NST0NQU0JXN09tcVovRm0zZEtmelFVZVpUWlBNR3ZuT2RVU3J1aXVD?=
 =?utf-8?B?UW83ZnVlemwyMVZFeUFXMzlZWW9WeEpCd1FGL0lDd1c4aHpaUnJFK2xTVTll?=
 =?utf-8?B?OXhmekE0TlFTZWtoMC9JZlF3N1pSNHlwcGZuNHV2T21oVHN0YXVkWkQzSlJR?=
 =?utf-8?B?ZG92WFRIdk5GNzhPamZIaDBLTndRUFRQcHBGNmdwUWVQRE1yUjl3bGdOTlVV?=
 =?utf-8?B?UkZKbmovdVZ6ZHJTL1E1ZE5wMUpGRWdLQ2FYNEhlSEQ5NGJLTUU0SkRKVWNa?=
 =?utf-8?B?NXlqaVRFbUxFaHhlMlcxUFRPRHNITUZVMzY4bFNiM3lSQnBZOVFpVkpSNHJ3?=
 =?utf-8?B?dHUvS2Z4Zy9YTEFHTUQwbC8xNU9BQk9IZGE1MnRVSU8vTWRPb1FWaWt6amdS?=
 =?utf-8?B?djRtUEMwV0tRc2pFWi9DbTdGcS9jK3MzN3dhL1BkaGkvcENLTHRjTi8zbXhU?=
 =?utf-8?B?clBwTGZHWXN3QmI1UUdXZVdBSWZWMDZEdUtkbklsVW45RFYzWnhlY2dvcFhl?=
 =?utf-8?B?SHBqQVQ5UjNXOFFKcVlHQXZTT0NiUEZZdnlEWnFZUlVOSlUyWldyaVZCT0pu?=
 =?utf-8?B?a3JvQVhsbnByMDV6ME9iMW5uRnR6K3hYNXVRRWVnVGQxS2x2MkxmaWEyNTRq?=
 =?utf-8?B?Q1BBeEN6b2RuMkNVbmVqcWhheXh4NnR2QXk3VEdDWUtzYnJ5eVV2VDRxUm82?=
 =?utf-8?B?TWcvcWJxdUlqaTFxbjlTOUdJM1JTeE1uaWVZcXVoL05UeVRLZ1VYU1cxRVVi?=
 =?utf-8?B?cGtMOElGeWRNRlh0QzZMZGZBZlVMczhBMFdQYVdMazM0Y1VjTGF5S09DcG5n?=
 =?utf-8?B?L2o1Ym1abTNlL1JEMEg2cmtDUHdWS2Z2MmVVeTV1dzFmOVJCdDk5Rm1paUNt?=
 =?utf-8?B?RXJnQ2tIeGQwdkNjYmo2a0tDbTBRM3RPbXI3SFV1cmVHV005S3NZWXhOQ09M?=
 =?utf-8?B?L2puVkRDVUVndFFvVWVYWWtEOGlxUVlMZXJkMVY0UTB1QkdrYzExa3U1bW5H?=
 =?utf-8?B?ZXhaRWlRQ2JRTTQzSnFTMmtHTmJmWEhOMU94NUNBRS9IQU92RDlEQk9lQ1Vt?=
 =?utf-8?B?dVBJemwvNXJwUWUrVkQzUTNyWUR2cGlIRWxMeXdIdnRBS3pZb01qa29GQlZR?=
 =?utf-8?B?bDQrU0ErWmMyUHhQWUZEN3lBQUxJejlHZ2xxSE1HdUJmNzRvbm5MYmhkUXV5?=
 =?utf-8?B?Y3I2bTliSFZDMUVYaUhGek5XTXlyT0lpcTJWZzZqNlBEbkRldThlMXJnaEVu?=
 =?utf-8?B?OVh1N0VobzV3MWJ5R2hzaGxGcWloam92dCtmZTl6c24vSnVrYW9DRFFCOE1N?=
 =?utf-8?B?cjQvKzN5ankzRzdZbXo0WjNpRER2clRBRFRTL0F3eHZxMG5Ueno0NDhTMlRT?=
 =?utf-8?B?TGdzdEVnNjZqbUNHalFFRWx3eXJ4Z3lOOUV1bE9XZHAwUmlBVUF1VzFGa2ph?=
 =?utf-8?B?UkNjbGdZdDJnL0c0ZWJjTUw2dk50R0RnbHFTMExWZWZWUlFaT09xZTh2WFk3?=
 =?utf-8?B?SWpNT3ROSW9PMmg1SWlGQ2g3bDBrM0xRNmhHZ1RyRnNObzZIL3lWcW5rNlE3?=
 =?utf-8?B?Y2hXZWxnRFBrVkNjMkEzR2QrQithU2JVSGdDZDlZTWtYWHMwS2JiWVZsR3hs?=
 =?utf-8?B?Y2FhOFkrZnhGVGRvbkQ2U2o5QzZlS1FGbysyNnpxTW5vbnVYbHZGaXhFS1Z5?=
 =?utf-8?B?cCtObHpOQWhIcnRYUGlWbGpXRzcxVkNuVW9zeGo0VXRRemUrbEJ0ZDR5OEJ5?=
 =?utf-8?B?YmFhYUlQVGFONFY0VHJQWnJ3NHBhZDhadEVNR0VXRmpRWGRZeE1Vc3U1bDFM?=
 =?utf-8?B?ZmdTZmV4cTNXR1hnVkZoY1V0SXNYWkszK3haYkZGZWlNb1JlNkRpbnpLdmp3?=
 =?utf-8?B?SnBQSkt6azJjTDd0ZExWc2ROdVdraVpxaHA3SURjaU14SFlqVW5ES0FFUzM5?=
 =?utf-8?B?MlpWOUpMVThsc2FsdFUxanNnUG5DeDdFc0tQNTJmTDB3MWdvWmg5bWIxSzk3?=
 =?utf-8?B?YW03RWxCY2Q0dVNkMEZnVGJGakxoUnlVU040WUxydU03YllRK2RyYWJybUhX?=
 =?utf-8?B?blNXNTJURHZTSUttTVJqWUkrZDQ5c3h6bFptNzhaQ0VSMS9WV3FidzhxaG9Z?=
 =?utf-8?B?R1E9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15132.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df699f01-1276-4ec6-f7d4-08ddea228b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 13:13:44.6450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x2ul/BUTVTz7CDvsn7/5bpChhOY243TwDpuXmP3lJMENHmQFqVOU20bk5IK87d46B47Quybqakus2aJbJZsTXX+xwYIz8XAUSfNsjSw0iL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13916

SGVsbG8gR3VzLA0KDQo+IEZyb206IEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzQGNvbGxhYm9yYS5jb20+
DQo+IFNlbnQ6IDAxIFNlcHRlbWJlciAyMDI1IDIzOjU1DQo+IA0KPiBGb2xsb3dpbmcgZGlzY3Vz
c2lvbnMgYXQgdGhlIEtlcm5lbENJIFdvcmtzaG9wIDIwMjUgaW4gQW1zdGVyZGFtLCB3ZSdyZQ0K
PiBlc3RhYmxpc2hpbmcNCj4gYSBMYWJzIFdvcmtpbmcgR3JvdXAgdG8gYWRkcmVzcyB0aGUgY2hh
bGxlbmdlcyBvZiBleGVjdXRpbmcgdGVzdGluZw0KPiB0aHJvdWdoIGhhcmR3YXJlDQo+IGxhYnMg
aW4gS2VybmVsQ0kuDQo+IA0KPiAjIyBXb3JraW5nIEdyb3VwIFNjb3BlDQo+IA0KPiBUaGUgTGFi
cyBXRyB3aWxsIGZvY3VzIG9uIGltcHJvdmluZyBob3cgS2VybmVsQ0kgaW50ZWdyYXRlcyB3aXRo
IGFuZA0KPiBtYW5hZ2VzDQo+IGhhcmR3YXJlIHRlc3RpbmcgbGFib3JhdG9yaWVzLiBDdXJyZW50
bHksIHdlIHN1cHBvcnQgb25seSBMQVZBLCBidXQNCj4gdGhlcmUncyBncm93aW5nDQo+IGludGVy
ZXN0IGluIGV4cGFuZGluZyBiYWNrZW5kIHN1cHBvcnQgYW5kIGFkZHJlc3NpbmcgdmFyaW91cw0K
PiBpbmZyYXN0cnVjdHVyZSBjaGFsbGVuZ2VzLg0KPiANCj4gDQo+ICMjIEtleSBBcmVhcyBvZiBG
b2N1cw0KPiANCj4gLSBMYWJncmlkIEludGVncmF0aW9uOiBEZXNpZ24gYW5kIGltcGxlbWVudCBs
YWJncmlkIGJhY2tlbmQgc3VwcG9ydA0KPiBhbG9uZ3NpZGUgZXhpc3RpbmcNCj4gTEFWQSBpbnRl
Z3JhdGlvbg0KPiAtIENJIEVjb3N5c3RlbSBMYWJzOiBCZXR0ZXIgc3VwcG9ydCBmb3IgdmVuZG9y
IGxhYnMgKFRJLCBRdWFsY29tbSwgZXRjLikNCj4gdGhyb3VnaCBpbXByb3ZlZA0KPiBldmVudHMg
QVBJIGFuZCBzaGFyZWQgcm9vdGZzIGltYWdlcy4NCj4gLSBBbHRlcm5hdGl2ZSBCYWNrZW5kczog
RXhwbG9yZSBpbnRlZ3JhdGlvbiB3aXRoIG90aGVyIGxhYiBtYW5hZ2VtZW50DQo+IHN5c3RlbXMg
bGlrZSBUdXh0ZXN0DQo+IGZvciB2aXJ0dWFsaXplZCB0ZXN0aW5nDQo+IC0gTGFiIEhlYWx0aCBE
YXNoYm9hcmQ6IERldmVsb3AgdG9vbHMgdG8gbW9uaXRvciBsYWIgc3RhdHVzIGFuZA0KPiBpbmZy
YXN0cnVjdHVyZSBpc3N1ZXMNCj4gLSBGYWlsdXJlIENsYXNzaWZpY2F0aW9uOiBJbXByb3ZlIGRl
dGVjdGlvbiBhbmQgcmVwb3J0aW5nIG9mDQo+IGluZnJhc3RydWN0dXJlIGZhaWx1cmVzIHZzLiBh
Y3R1YWwNCj4gdGVzdCBmYWlsdXJlcw0KPiAtIExhYiBBZG1pbiBHdWlkZWxpbmVzOiBDcmVhdGUg
c3RhbmRhcmRzIGZvciBsYWIgYWRtaW5pc3RyYXRvcnMgb24gZGV2aWNlDQo+IHR5cGUgZGlmZmVy
ZW50aWF0aW9uDQo+IGFuZCBjb25maWd1cmF0aW9uIGZhY2lsaXRhdGluZyBhY2Nlc3NpbmcgdGhl
IHNhbWUgaGFyZHdhcmUgYWNyb3NzIG11bHRpcGxlDQo+IGxhYnMuDQo+IC0gSm9iIFByaW9yaXRp
emF0aW9uOiBJbXBsZW1lbnQgc21hcnRlciBqb2Igc2NoZWR1bGluZw0KPiAtIERlcGVuZGVuY3kg
TWFuYWdlbWVudDogQXZvaWQgcnVubmluZyBkZXBlbmRlbnQgdGVzdHMgd2hlbiBwcmVyZXF1aXNp
dGVzDQo+IGZhaWwgKGUuZy4sDQo+IHNraXAgTkZTLWRlcGVuZGVudCB0ZXN0cyBpZiBORlMgYm9v
dCBmYWlscykNCj4gDQo+IFRoZSBMYWJzIFdHIHdpbGwgd29yayBjbG9zZWx5IHdpdGggdGhlIElu
ZnJhc3RydWN0dXJlIFdvcmtpbmcgR3JvdXAgYW5kDQo+IFRlY2huaWNhbA0KPiBTdGVlcmluZyBD
b21taXR0ZWUgdG8gZW5zdXJlIG91ciBlZmZvcnRzIGFsaWduIHdpdGggS2VybmVsQ0kncyBvdmVy
YWxsDQo+IGFyY2hpdGVjdHVyZSBhbmQgZ29hbHMuDQo+IA0KPiBCYXNlZCBvbiB0aGUgaW50ZXJl
c3QgZHVyaW5nIHRoZSB3b3Jrc2hvcCwgd2XigJlkIG5lZWQgdG8gY292ZXIgdGhlIFdlc3QNCj4g
Q29hc3QgdGltZXpvbmUNCj4gYXMgd2VsbC4gU28gYW4gaW5pdGlhbCBwcm9wb3NhbCBmb3IgdGhl
c2UgbWVldGluZ3MgaXMgc3RhcnRpbmcgbmV4dCB3ZWVrDQo+IG9uIFRodXJzZGF5LA0KPiBTZXB0
ZW1iZXIgMTEgYXQgNzozMGFtIFBEVC80OjMwcG0gQ0VTVC4NCg0KVGhhbmsgeW91IGZvciBraWNr
IHN0YXJ0aW5nIHRoaXMgZ3JvdXAhDQpTYW1lIGFzIEJlbiBmb3IgbWUgLSBJIGFtIG9uIGhvbGlk
YXkgbmV4dCB3ZWVrIHNvIHdpbGwgbWlzcyB0aGlzIGZpcnN0IG1lZXRpbmcuDQpQbGVhc2UgaW5j
bHVkZSBtZSBpbiB0aGUgaW52aXRlIGZvciBmdXR1cmUgbWVldGluZ3MuDQoNCktpbmQgcmVnYXJk
cywgQ2hyaXMNCg0KPiANCj4gV2UgaW52aXRlIGFsbCBpbnRlcmVzdGVkIGNvbW11bml0eSBtZW1i
ZXJzLCBlc3BlY2lhbGx5IHRob3NlIHJ1bm5pbmcgb3INCj4gbWFuYWdpbmcNCj4gaGFyZHdhcmUg
bGFicywgdG8gcGFydGljaXBhdGUgaW4gdGhpcyB3b3JraW5nIGdyb3VwLiBQbGVhc2UgcmVwbHkg
dG8gdGhpcw0KPiB0aHJlYWQgaWYNCj4geW91J3JlIGludGVyZXN0ZWQgaW4gY29udHJpYnV0aW5n
IG9yIGhhdmUgc3BlY2lmaWMgdXNlIGNhc2VzIGFuZA0KPiByZXF1aXJlbWVudHMgdG8gZGlzY3Vz
cy4NCj4gDQo+IEJlc3QsDQo+IA0KPiAtIEd1cw0KPiANCj4gLS0NCj4gR3VzdGF2byBQYWRvdmFu
DQo+IA0KPiBDb2xsYWJvcmEgTHRkLg0KDQo=
