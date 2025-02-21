Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB621885C
	for <kernelci@lists.linux.dev>; Fri, 21 Feb 2025 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156839; cv=fail; b=nPwYmb2hjYnSDfQ+/xntZxiG37j+nSKfvo8TqEkS2kvZbjvambZXySo6qwZ2OBbT2A5TCm5B0jzx9o+4M8++M1qlyNPns5ELCC9VKYr7ZXiyeJZBgP84WlvuHgV/ixP8PpV2Gy2MBArztwwaSQQl3YDidLDbFiWM2rQMY48XTKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156839; c=relaxed/simple;
	bh=1/wSBqnrNtIWgZi/Vn98X3PchBFlmFaUBuYSho9REAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hjuqfbPPjTtLpOm+EX59Mk5yEXmmb365G11Pq9ryxnpOQqmqZJ/hVQgBNtcy3RZBt7cbuZZAq39KrtGSpmq5S9DtSSiYfHyorY8EwEBwblqs73g8xhllD/Nbpa/eRV6qDNrd6B9IFNEAUfg09t4fU8H243KXO9FBMTMn+Q6NKEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=adAF7XQE; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="adAF7XQE"
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LFlqIl030502;
	Fri, 21 Feb 2025 16:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=1/wSBqn
	rNtIWgZi/Vn98X3PchBFlmFaUBuYSho9REAo=; b=adAF7XQE8xVvVGTgKBwVHcg
	R7hYYdgoDI1f/AFQNJFFeIgkJwdeJUlRZ+8rp7HZvejpWZUNNQJs+YnFhLp+Spx5
	1suK6YhFP0++N6GQ4JVlOlBf5MuZ8uFfg8JF9kzoCJg8Az+6eNdHRvz8/MS1by4+
	OwtnnjHtscqlfvuh2OMa1P46U4iTGRrUMEz1jeIpACk+HMDX7JFHDZx59klG6wj9
	oimiafQaFcym8CyS0iPXxqh6v+Kq/q6yHQYGTCTAlpHASvZY6nk8UJcX9opn7lpD
	+C0GBoS3ABPYZbqvfqMUcdT5IoMwp5AyY++YjDO//W1C/w6CLapnT6SIBkFdFpg=
	=
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 44vyyf2x1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 16:53:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyee3fIyrVaMw1ozNYdymTOMZmB9kyKwHkIVEolUSM/Rz3w/7MDaTB10qu+C3tkV5FyphHALC3OMlcLHiLsAWdG+MAExcyrGFiaZlNrbt7b4RUCrdiAb7kbAJ+sr5M2zFfoEP9mLI9MfPkaIz2kt3/O9ESSE/VGFRTfpocQNPWCGeCdhE4jmH7LfOSzQbi/oRA7NWXV2Ple0EoEfN2DW6qBN2PEuFa/L9udVBPIZBcrhxA9BIlIxxuHDumzA+SSC1M1uz3ymy1K3eKYkzsDhhJSUlg6raVZ6CDVXEjgd5mdlvpGkTrSghd1BnExnHb2LRrV6JgA801GV//VbRdJx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/wSBqnrNtIWgZi/Vn98X3PchBFlmFaUBuYSho9REAo=;
 b=b0jrOw2wcLx5s8hnIYXP8fnSdISWiq1ewSPaoQsitkB8r4WrnNfaBkJe1NaUDM9dLDQUQFymIVylms/SpSxzwleh+NuYOR01BLECB7Of6/m4ZMpmd2Pa59YcCr0/2DYxefBf+2whytBVI2BbXeY6pwaGjwfHGU9AnkKsFj3uZrkEpeLn/ZivD8npC5/otrcgSMtis94hXUfhEOzLvL4A2C03vKtaW5oz2sa1gnlZ6F5qAndyDheWI44+o/93PgL1xq4rfDXUw7Xm37IJG5Ut8Rliy97psvSIA1XU1SMoibFkUYOgmiqx/mKBpGwn6oaCooat0Cy3nT8qustyeeiKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by CH3PR13MB7069.namprd13.prod.outlook.com (2603:10b6:610:206::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Fri, 21 Feb
 2025 16:53:47 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::df7c:a5b9:aa3e:9197%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 16:53:47 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "gustavo.padovan@collabora.com" <gustavo.padovan@collabora.com>
CC: Tim Bird via lists.yoctoproject.org
	<tim.bird=sony.com@lists.yoctoproject.org>,
        "automated-testing@lists.yoctoproject.org"
	<automated-testing@lists.yoctoproject.org>,
        kernelci lists.linux.dev
	<kernelci@lists.linux.dev>,
        Laura Nao <laura.nao@collabora.com>
Subject: RE: [Automated-testing] [boot-time] Call for boot time data!!
Thread-Topic: [Automated-testing] [boot-time] Call for boot time data!!
Thread-Index: AduD9wAYXeudenzXS8iuEAP2bI5VPgAAfXaAABYGUQAAC8TNIA==
Date: Fri, 21 Feb 2025 16:53:47 +0000
Message-ID:
 <MW5PR13MB563258539CC8345B0550C7CEFDC72@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <1826117EE2C56F0A.25123@lists.yoctoproject.org>
 <MW5PR13MB5632B7EB58214F663F45288FFDC72@MW5PR13MB5632.namprd13.prod.outlook.com>
 <1952832a4b6.d0d15aed1251473.1259835302068680712@collabora.com>
In-Reply-To: <1952832a4b6.d0d15aed1251473.1259835302068680712@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|CH3PR13MB7069:EE_
x-ms-office365-filtering-correlation-id: ff291aa9-7966-4391-1a7f-08dd52984f5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UU5xT2J1R0IvMmlDdjZpa3FxQzk1cG0yWDlSQ05qZ3Ywd1BDeXVBb0NsQzUz?=
 =?utf-8?B?bitPa0ptcWVENDE0T0I0WmRNYzdqdEFkUHN2SjVGZFFBTk5RVjBsd1Z1ZnBW?=
 =?utf-8?B?UnhzbnVUL1lnakR0d2ZLcUxhd1ZFTTllYUpmUjN2VXUrczlnRDAwdmNTb25v?=
 =?utf-8?B?N1dLcFVmQ2diT3lKNVFlOSt6MnZZZmRHdkpsaURPWGxGT1ZpM3FRdU1halJK?=
 =?utf-8?B?MGUzQ3BFZkpqWXFEcXlPU0l0ZWpqclU4Tk9DaVh6a3ZkVHEvc3l4NXpIUXZi?=
 =?utf-8?B?NGVxc3d0UGowQVJpS3VyQ0syYklmbEtycnpqYThWM1VkVTJTcXVoNjd0anlY?=
 =?utf-8?B?aGRGaW9uZjZ6S3RtUmxtZTF5b2I0YkRNVElMR1Y3QkExTm9nQk9YVFdzMXNq?=
 =?utf-8?B?dTBMZUdKa3RVbE9saWZOR0xkTXRtMlVvL3V5dVRUYjFyTTk1bnJsdmlzMmNw?=
 =?utf-8?B?cEVZbkNxRjZwRzdmN1ZiYVRIZXZmWisxMldRMFYyZktTTUJ6eVBoSjhFUzdB?=
 =?utf-8?B?MzBxZWN6VkxXU1ZBeWpQbnZwZXlnMmJnNjk1VDBtalhoR0NvQmxZaTViSzFI?=
 =?utf-8?B?VGNBYUduQm5VR1p4S1VHTjM4bG9JdWRFQTVHSzIzeG1GU3hvM3BTRzFzaGRt?=
 =?utf-8?B?amhLclBCNThLZFhxZjNKeG5rdHdDYldoalBZdlVEeDEwazdFbUhXdmJLN1dq?=
 =?utf-8?B?cGVwNHFGcnNIT05CT2pTK2xWY0ZlRHo5TXI2L3dUYkNHL2ZKdzhWa1d2TFBC?=
 =?utf-8?B?b1BHVEZtb0s0L3ZiWENPYWtpSy8zdUlNZHVCREtoMVpDd3Vwano0TlU3QWRL?=
 =?utf-8?B?cTVnZnJIYWtiZFErUW9TNWFrc3BuRy9uSmY0K0Y2U2JLNStXaHp2Nkk2d0pE?=
 =?utf-8?B?WkJ0ak82Y1o1VW52ZytnaGRzY093d1JVTHlVNk1lVXBrRStWQTFiVkxSNlpB?=
 =?utf-8?B?bjNhRUNMYm1VQXozUjBaMnFMcFMxSzgyUVRBaU5ZMnB3Znk3TFFDTWdmQys4?=
 =?utf-8?B?cUIvTE8vM1E3WHdMU2g2clJOblNoVVloWGorcEI5OHk0azc5V0FXNmZ3MW1Z?=
 =?utf-8?B?d3NCandFUTdsYkJKcGxqMXVZOU13RkR2d3duYkpZUDB5VXR4bXdWYWdvWXNy?=
 =?utf-8?B?N2Q2ZHRNK0VMZEhLc3ZpcnEwT0YxQUk4YTR0bVJjUTlUY3JyUmRuTnJLNnk3?=
 =?utf-8?B?cVhEMkMxeHZ1Z2tjekxjTzlzZXhzcEtnQzhqRVViL29iZC9mbENCK05TSVhX?=
 =?utf-8?B?TElsSG9DdG5zRXAyZzFGNGdSYW5Sd1dmZDhwdEdQcVg5WFdSTVVnUlpoalJ1?=
 =?utf-8?B?OGxhcnF5TUdGOVdJdGljR2h2ZVA1ZjN0SE14MzJSaHNGaWRwZEkzY1dJOE9L?=
 =?utf-8?B?NHJZbTRwUGY5eGpva3RFVWRmMzNTOW9tYjRwRk5SYUY5NlVBTkFIdUxXZEx0?=
 =?utf-8?B?QmppdU5oOEhLQXN2VDJXc2xaVTdYV2FRcCs0RWlML1NSckdyZkx3TVRwRlQy?=
 =?utf-8?B?aFJSS2lCVk5lT0FrZFM1UFVjb0t4aG5NTVd4US9ZeDdYekNZbmtwRytjWVFZ?=
 =?utf-8?B?Sjc5UWhPT3lQQjZ6czlMSGNzT3ZuMWpCUnZXdDFaMDFpS2ZnYlkyT2tGSFhw?=
 =?utf-8?B?d20rT25wd0kvR1NVNWp5U082K0VwQWVnOTN2cGgxMWorR3ZTeUNoNVBKMlRG?=
 =?utf-8?B?N3NxZmFZQzlqMG1BdmYzUTFxcFo3SVhEc1J1eFdGOXVSR3g0UThrYzBkeDJN?=
 =?utf-8?B?b0UvTXRVMVZXdFI0R2xaZ2k0dGR0WUVtazBacmpMMEJOcWhjMjFKNG14K2lI?=
 =?utf-8?B?MVZVRzN1MHR1dG41STRiOGFCMUQ0S2ZpU1lEMjlmTXdNcnh3U0JvUmlDYXd5?=
 =?utf-8?B?K2pmN042TlR0L25yUFZxSEREejBRODN4a2hkRTBvWlZqSnVBcm43WHRDZm01?=
 =?utf-8?Q?bv+hPDfbt0SCAATxyTIDJK1HBE7u9+1w?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sko2WDhveVhlb3psdXBheldSSkQycDRCK0c1TmtrVlhNRFlRa0lHTXFDd0lG?=
 =?utf-8?B?ODh1TElaaTlZTWxxcnhaRWNLTSt6TUpoMXV5bGdCYmtxWjBtWUo4bmFFMkhl?=
 =?utf-8?B?MnNFWk5kNGEzRVU2bjVVZURjc2NiSHIvZGV5cmtlcTg0eE1uQXhVMnpWSHJF?=
 =?utf-8?B?ZWhoTjUzTVhzbnNabGxpVSs4VGxlQ251UncyYnRJNDRhYXk3cnBUeTB5TkY2?=
 =?utf-8?B?VGh6RHA0Y1lYeUgzQXhoYlpGOFYvTzhCY2ViSGZmMkptSHgrVzk3Sk5RaEhL?=
 =?utf-8?B?VnkvTXFldWRUd29iOXJOQVR3NGhDOXlIdm1EMy9YVTFsUFRIOHk2MGtEeGFU?=
 =?utf-8?B?MzJZUXd3Tnl1dGs4d3ZyNHZHZmxIRWFqZ1ZZMWQ4Kyt4VXdDcjVweUdiSzdy?=
 =?utf-8?B?KzMrcjc1dHdwV3NMR1VuaDlkaStxZkhHTzcyak9nUUhCUW5GelJIMlFyYjJD?=
 =?utf-8?B?dmtEUElEVFowQ3FWWUVvZFNOQ2t6QVZ5cUJ6K1NIakpUdTZFUHpVYy9FNU1l?=
 =?utf-8?B?WmRvbU41UjUyK1gwVzlYc29wRCtwVG1zOUJZQlFlN3FwdVd0YzZIT2NFR2hE?=
 =?utf-8?B?Nm9zNzZpS2w4Tk5RbkhWM1VtSVBENVZwTWQxeS94MlhWTXpUcCtJQ1hyT2V4?=
 =?utf-8?B?L0FZakdEdit0aGpXUmVQdUZJbU8xdUNZbFFnZTRqQUFMeWZLTTQySERsVHFT?=
 =?utf-8?B?Z2QzMXVxVmhYam9NUkVBdEwwVFYxT0xwSDJ3YnhCUi9ETlIrNGpRRFNsUmtt?=
 =?utf-8?B?YVNVcUVCU0N5TE12eSt4bWFZaFNYTGxadzdXZXdtR21aNnJBTTVrb1A1eER2?=
 =?utf-8?B?Q21PaDZZanJrdnUyMng3LytlMHpsVW0zYlIvRDVHaDJUODhaWmtkK0RRaVJo?=
 =?utf-8?B?YXZCMnhGSjI5cDdqZkJYQjBDTnpNRUhDWTRUVW8rL3FFdWYxbzBjMGxJUDJi?=
 =?utf-8?B?K2dYVkkwNHZ5R1YxVU1KbHI1cFJ2b0dHTjFyNnV2ZVYvMHRDWFhiR2RBMUhP?=
 =?utf-8?B?dlgwN0g1SlIxaTB1OEJjc01ieWVGNnZJUGV1MHVKYUFyV2NZMjZ0elJZZ1V5?=
 =?utf-8?B?N3VXWVBja0VsT2l3bVU4VTZkUUtKMVVkZ3FVVmIxZWc1dUcwTkFiZGtTaVJ4?=
 =?utf-8?B?NkYwSzJic05rekFQcWl1RnRsUnlSZ1Y1Z0piTE5ORFVEMUFVRzRjL1d2TTFF?=
 =?utf-8?B?MGVURU91MkhlZ2xiRmlvVVo2cGFNUlR4QVB6S2lwUFc2OTd6ZzNmMDI1WWxy?=
 =?utf-8?B?WDBvakdrUkw2dk42bXlaeDNybE1jWkdYS2JOTTBHd0FiUlpwWEhILzkwK3Rm?=
 =?utf-8?B?STg3ci9HYUExbU4wYmJEb09zUzcwSmRUMkpNalZFTUF2NWNqUHoxcVFvUi81?=
 =?utf-8?B?VHpmdmV1aXBDOTQ4YjZHeklaZUZJK3R0SFlOR1lHVzJ2TmFQOS93UThkWkti?=
 =?utf-8?B?VFRnZFRGMlpBcElkOEYxZ0NZK0FDamd1Zm5tRHZuenk5ZXdGSGprUjh5dUl5?=
 =?utf-8?B?OFZFN1Z1RkM2RDdualpqbnRmazBocWlsa2ViR2tINXkvdVk3TDFaamZFSWQ5?=
 =?utf-8?B?d1ZtR2I5Nys2YVVQUVlzOGtNdVgxOVZKTlU4U0lraUJXVUxlUlIyQ05FSlph?=
 =?utf-8?B?UVdDVGhPZUVaUzdVYlZWSFNsaHBGaDFldmR0QUxjRHRneERLanJlTXFCSk9m?=
 =?utf-8?B?a055aFlUY1diY2d0bENIYWViZFpLaU15UUZtdlE2bHVLallQeDdzMWo0SXR1?=
 =?utf-8?B?b3BhcmZTOHRMN2JpSHpFaGhSTnZjSFI0eTBnSDA2RlNRMm41ZEZUSklQYzNv?=
 =?utf-8?B?UlQyTFhjUE94TW5sQkNYSWFIeUpHaWpsS3VSUEgrM0NwK3JaOEk1UHd5MXdS?=
 =?utf-8?B?NnFtQ0ZtQUd6UTVpRnRnQ1Z5NW1TOXBZNHpjTlhOVzVlU29hRkJRZ1JUTDZm?=
 =?utf-8?B?S3pQS1F2ekpXKzV4RU0zQTFJMUtwWnRuSzhFMGJtcjZYTCtTZkJ6RjFQNzV5?=
 =?utf-8?B?cmZLckpQejhXaE5Lb1B4U0xVRGFqK1pvcW9FcEgyYnlOeDg2MkZ1bTZqM3V2?=
 =?utf-8?B?UUExSzNYcW9ScDg5VW55WXRnN0VlZEsrZVB5WmNDZ0NjOWhjeXFabXFoazJN?=
 =?utf-8?Q?udXB+b8tsX8nwIDgvwIo46unB?=
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
	KBOPwUjh3ulnej4gwfNpgVX8US+0bgGP8LM+uOM3UQR2shR6gXjsemOYJdXuXebOKuMxa1sntVvuJ6wECtcZEj5UNECVR0Xkx55ubsRRkAI+OhSR6nV4evARiQNUUOryrmH/Xub5yTNC02zzftsn/vWWy6RJIFKvblTkvcwVieOwOJBO33WWMwVXboep+k3iGgJTlpkaLEU7M0yxAWHBDYQu9SdShuXYzCXxJhsqzSYL8YB3P/qsqXJKPdbMQORd/6O2lST4W+qfMTGV8GTR7WKW/EornV6KH30kt6g0OePdgPmg2UqlPdVbdT+Wd2M9uEpt09HphoFlzRog4TS7tTn8T7psrL5RMejuyKacNDfgl1DpZTkmO4FBEoJyHR6NZaEQC57yIYlip8nxFpGpGb/e20tcrLILAyYnhns4UWAImDTyQ30wUHiOgMMy+sc3UHSFbNWA2AO+gfXemDhGtoWR2cBaDEDnisPZLcrZaCLXgFB0AQmh8aAYVrVnHg1lb445VkU/WVs65Ue70qfTd0PERnoyh3sUP4XJE/tzwyB4lc4RVoPnYCcXN76fa5OTnGeXSLJChO43Ue0AWvSZ39ONGXt19YPzGzT8WrU/d7WqHdiR7pEU7Akwxeg7exLg
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff291aa9-7966-4391-1a7f-08dd52984f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 16:53:47.6346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Be2DFVMgjg/U06ytdd8QFsIdQ5uWgmv0bpcv+wX1s3lUlOtNmhA4Uhmbwg5RISf14RMPM9ppU+CXQ0IM/P2YNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR13MB7069
X-Proofpoint-GUID: kXGGlcE5HpSA9CYfJTWxyEB7iVMM1Zh2
X-Proofpoint-ORIG-GUID: kXGGlcE5HpSA9CYfJTWxyEB7iVMM1Zh2
X-Sony-Outbound-GUID: kXGGlcE5HpSA9CYfJTWxyEB7iVMM1Zh2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYXV0b21hdGVkLXRlc3Rp
bmdAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8YXV0b21hdGVkLXRlc3RpbmdAbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEd1c3Rhdm8gUGFkb3ZhbiB2aWENCj4gbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZw0KPiBIZWxsbywNCj4gDQo+IC0tLS0gT24gVGh1LCAyMCBGZWIgMjAyNSAy
MTo0MTozNSAtMDMwMCBUaW0gQmlyZCB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyAgd3JvdGUg
LS0tDQo+ICA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gID4gPiBGcm9tOiBhdXRv
bWF0ZWQtdGVzdGluZ0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIGF1dG9tYXRlZC10ZXN0aW5nQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBUaW0gQmlyZCB2aWENCj4gbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KPiAgPiA+IERlYXIgTGludXggdGVzdGVycywNCj4gID4gPg0KPiAg
PiA+IEkgY291bGQgcmVhbGx5IHVzZSBtb3JlIGJvb3QgZGF0YSBmb3IgdGhlIGluaXRjYWxsIGFu
ZCBib290IHJlZ2lvbiBhbmFseXNpcyBJIGFtIGRvaW5nLiAoSSdtIHRyeWluZyB0byBidWlsZA0K
PiAgPiA+IGEgc3lzdGVtIG9mIHJlZmVyZW5jZSB2YWx1ZSBmaWxlcyBmb3IgYW4gaW5pdGNhbGwg
ZHVyYXRpb24gcmVncmVzc2lvbiB0ZXN0IEknbSB3cml0aW5nIGZvciB0aGUgTGludXgga2VybmVs
KS4NCj4gID4gPg0KPiAgPiA+IElmIHlvdSBoYXZlIGEgbWFjaGluZSwgb3IgcGFydGljdWxhcmx5
IGFueSBlbWJlZGRlZCBkZXYgYm9hcmRzIChsaWtlIGEgYmVhZ2xlcGxheSwgYmVhZ2xlYm9uZSAo
KiksIHJhc3BiZXJyeSBwaSwgZXRjLiksIGl0DQo+ICA+ID4gd291bGQgaGVscCBtZSBvdXQgYSBs
b3Qgb2YgeW91IGNvdWxkIHJ1biB0aGlzIHRvb2w6IGdyYWItYm9vdC1kYXRhLnNoDQo+IA0KPiAN
Cj4gT25lIGNhbiBjcmVhdGUgYSBLZXJuZWxDSSBqb2Igd2l0aCB0aGlzIGluIHRoZSByb290ZnMg
YW5kIGdyYWIgdGhpcyBkYXRhIGZvciAqKmFsbCoqIGRldmljZXMuIFdlJ2QgYmUgaGFwcHkgdG8g
c3VwcG9ydCB0aGF0IGluIEtlcm5lbENJIGFzIHdlDQo+IHJlYWxseSB3YW50IHRvIGdyb3cgYm9v
dCB0aW1lIHRlc3RpbmcgY2FwYWJpbGl0aWVzLg0KDQpUaGF0J3Mgb24gbXkgbGlzdCBvZiByZXF1
ZXN0cy4gIEJlbmphbWluICBDb3BlbGFuZCByZXBvcnRlZCBhIGJ1ZyBvbiB0aGUgc2VydmVyIHNp
ZGUgdGhhdCBtYWRlIHRoZSB3aG9sZQ0Kc2l0ZSBmYWxsIG92ZXIsIGJhc2VkIG9uIGJhZGx5IHBh
cnNlZCBkYXRhIGluIG9uZSBvZiB0aGUgYm9vdCBkYXRhIGZpbGVzLiAgSSBmaXhlZCB0aGF0IHRo
aXMgbW9ybmluZywgYnV0IGl0DQpkZW1vbnN0cmF0ZXMgdGhhdCB0aGlzIGlzIG5vdCBxdWl0ZSBw
cm9kdWN0aW9uLWdyYWRlIHlldC4gIEFmdGVyIHNoYWtpbmcgb3V0IHNvbWUgbW9yZSBidWdzLA0K
SSdkIHJlYWxseSBsaWtlIHRvIGludmVzdGlnYXRlIGdldHRpbmcgdGhpcyBpbnRvIHNoYXBlIHNv
IHRoYXQgaXQgY2FuIGJlIHJ1biBhdXRvbWF0aWNhbGx5IGluIHBlb3BsZSdzIGxhYnMNCmVhc2ls
eS4NCg0KUmlnaHQgbm93IHRoaXMgaXMgYSBkYXRhIGdhdGhlcmluZyB0b29sLiBJIG5lZWQgbG90
cyBvZiBkYXRhIGluIG9yZGVyIHRvIHJlZmluZSB0aGUgdGVzdCBhbmQgbWFrZSByZWZlcmVuY2UN
CnZhbHVlIGZpbGVzIHRoYXQgd291bGQgc3VwcG9ydCBwdXR0aW5nIHRoaXMgaW50byB1cHN0cmVh
bSBrc2VsZnRlc3QuICBJIHJlY29nbml6ZSB0aGF0IG15IGVmZm9ydHMgYW5kIExhdXJhJ3MNCmVm
Zm9ydHMgaW4gdGhpcyBhcmVhIChib290LXRpbWUgcmVncmVzc2lvbiB0ZXN0aW5nKSBjb3VsZCBi
ZSBhbGlnbmVkIGJldHRlci4gIFdlIHNob3VsZCBoYXZlIGEgZGlzY3Vzc2lvbg0KYW5kIHNlZSBo
b3cgd2UgY2FuIGxldmVyYWdlIGVhY2ggb3RoZXIncyB3b3JrIGFuZC9vciBjb2xsYWJvcmF0ZSBv
biBhbiB1cHN0cmVhbSB0ZXN0Lg0KDQpUaGFua3MsDQogLS0gVGltDQoNCg0K
