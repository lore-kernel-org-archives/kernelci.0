Received: from mta168.mta2.hdems.com (mta168.mta2.hdems.com [35.78.62.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007217D366
	for <kernelci@lists.linux.dev>; Thu, 12 Dec 2024 04:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=35.78.62.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733978490; cv=fail; b=HLRgQ5qZp5+1iF3h8N5VNKGzdvXA0Rm07DpWPmAza7W4Eyc8JYN9y0yJI0GbWLVphMDN3HG48/3FUuM0crdzmUhOY04bwrdVozX1OcBj+DvyER+yGD2/eFfA8rHEnOzPs1uiaSCL/hi8t//jypeHu91TwKCcUv1jwfOfuCJKXAA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733978490; c=relaxed/simple;
	bh=CNl4P3O10QTuSNXZS+Xuo4Lpn7UWbk4RE8issxS1foI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AQXS/M0Py0nhMxaVSe/vQROj3S1c4urtNLo51sUpNH6/BDF00l2TZNZAwjL+3mDeC23IgrloNhvPZan1BaZYzA5lYNfl0fo4bvfthhO5hF31ZJ99ca8pMvO8LTV3DOlDN4T92S9I46zj/voC3XQE7lbMP/ANWffSXW7Z5eF/ydI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nds-osk.co.jp; spf=pass smtp.mailfrom=nds-osk.co.jp; dkim=pass (1024-bit key) header.d=nds-osk.co.jp header.i=@nds-osk.co.jp header.b=q739xKco; dkim=pass (1024-bit key) header.d=ndsosk2.onmicrosoft.com header.i=@ndsosk2.onmicrosoft.com header.b=Nx1yRmzD; arc=fail smtp.client-ip=35.78.62.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nds-osk.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nds-osk.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nds-osk.co.jp header.i=@nds-osk.co.jp header.b="q739xKco";
	dkim=pass (1024-bit key) header.d=ndsosk2.onmicrosoft.com header.i=@ndsosk2.onmicrosoft.com header.b="Nx1yRmzD"
Received: from mo.hdems.com (unknown [10.5.21.141])
	by mta168.mta2.hdems.com ('HDEMS') with ESMTPSA id 4Y804r5D7Xz4LDh
	for <kernelci@lists.linux.dev>; Thu, 12 Dec 2024 04:35:08 +0000 (UTC)
ARC-Authentication-Results: i=2; mta.hdems.com;
 arc=pass;
 spf=pass reason="matched ip" smtp.helo=TYVP286CU001.outbound.protection.outlook.com smtp.mailfrom=o_takuma.hayashi@nds-osk.co.jp;
 dkim=pass reason="Signature is valid" header.d=ndsosk2.onmicrosoft.com header.i=@ndsosk2.onmicrosoft.com
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=mta.hdems.com;
 s=arc-20230313; h=Date:From:To:Subject:Message-ID:DKIM-Signature;
 bh=PRkYXEFy7ir9m6OMhW39HQk4wRt7fmN00xWAN5N/jPQ=;
 b=UUO59jjU9iOecBG4Wv5at2MHxtOwB3IyN/6CaRCTOe77CV4GTjrB0dMRHsiuCUAV4MWzXelIgC0a
 uqr8irwANVlKrACOGusFacFE75MEwj3xGxOflPYLMFnGDVnAf3f5rOEP0bAEY1HDlp0abQyhDEWtL
 EdxSOI+hE9mfB4YsXGjgZOi01tJpDhLCZdyl8BWmiWUglcUh+FrxQPlrR/LR+iC4h969XGLPV+kIh
 l3mUv64AuiKsix5rtlNl3fB4A1EA/Gg7FdmyoH/+5dvfSO55mMieRcHDncdTl25YHmA6J7EsBpK42
 6NCOj7cofA57SdNku1+3zsWtPd8+AOECnRw==
ARC-Seal: i=2; a=rsa-sha256; d=mta.hdems.com; s=arc-20230313; cv=pass;
 b=t7ZoSPEfHAWId9mL0alVvqsB89c7E2BFaeYbTpAkLF27bieeWDAk7l+C4WtL80ufPsQO/PIYDpJv
 Xv4t1IKiCvCINaZGTKtorcLeBjACvu72FzswROG0c50spnmWG0aIK4IAWBzr7XLZZdJmgyVYV+t1j
 liaDNgHDMHCaUVKEHj9VFmvK59rWRGEdqehjMIRImF/QuvAWw5llicSsLHEJ0vA4hibjWITWseFQL
 nQ3ZIo17EcS72XwSL53+cT31CtfQA20SLvho1IQFULGzpEsw/ZOHyp1bwo2i6lVPN/h0bU7JNnaeW
 Wt29/Ds4grK7i7ZbUyHAmjZqQhzfQfXCwZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nds-osk.co.jp; s=DKIM;
	t=1733978108; h=Subject:Message-Id:Date:From;
	bh=PRkYXEFy7ir9m6OMhW39HQk4wRt7fmN00xWAN5N/jPQ=;
	b=q739xKcolHHIYh4z54Y3T0Q/GVjomHTaHeh66AJSKpXzwpdLt47gQ/EchyitypYSpqi6fvPmq+
	 yQaAKswebBSvvYToYC6cgQAGAWZ6g5KoqontSYCW7z3JXLVOIN+s6FXJfT46t3rx88u3hJo3Vtmt
	 QTO+QaYQoGVvV30xtbIpU=
X-HDEMS-MO-TENANT: nds-osk.co.jp
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazlp17011028.outbound.protection.outlook.com. [40.93.73.28])
	by gwsmtp.prod.mo.hdems.com with ESMTPS id gwsmtpd-trans-e1aa37b1-6328-4152-a73e-ec9a5b27a928
	for <kernelci@lists.linux.dev>;
	Thu, 12 Dec 2024 04:30:01 +0000
X-HED-ARC-Validation-Result: pass
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpMtk4aeO1D1b6fhqCshoI59zpi81Mp2D+kaGcmfOitQ956Z50bY6OZce/hdGDbiSdUz8w2bVuVFfzm0mxgjV75/o62i3PDXiaSu7gvNuY3bJPPI+ycwXTlh1GJx4EcR9j5ytZ61CMe+A8qoUkL6oM9Gofv6XSvoKHLJHTas/nvx1Y3JcB557hb2GqdVCUbC3UU2l2A6KBcU7UZi+fd8k+MxGCZQjE5sceyHw2kGrMvWE4Fg7rxWZSOPROSX+5bNRvkGuJg3+jF8thtZhaaFTybd1kmGUJJKJJumzpJF9oCkzMCvtJ/Q0t9DVnQ259LSSmuqfTKcpCMSi8cVq2Iu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRkYXEFy7ir9m6OMhW39HQk4wRt7fmN00xWAN5N/jPQ=;
 b=w3nz/old7jXuBolZ+cMdAW/kKLNOuRuS3NoaA6NcJnkWcJRcToitk11a1WyhMEOWrrY3DXOsVFmg91KfZka2S8TPFn4AbBXvnZxQ55nIj4yZCSat7vOJrdE0s/CuIMb63xdbv0rqr1yEF80lfRSiL93q5qslR428NnV+Q8hrGx7MPNtnGg1tB27W6oVjNOvRrpfrSz3v9EWeoN8vECqqSVud8+ng39G1hxl2Rxl6U97WhkjDwIwSbqtseYMhkbjb8Uv64re7SRdwP+2rrqNBWqYIEgGxGjaL5itMYU1cZQYas6LVNfVlrg8/G9yTZNV5YZ99JH4R8iX5JshLIx/6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nds-osk.co.jp; dmarc=pass action=none
 header.from=nds-osk.co.jp; dkim=pass header.d=nds-osk.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndsosk2.onmicrosoft.com; s=selector1-ndsosk2-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRkYXEFy7ir9m6OMhW39HQk4wRt7fmN00xWAN5N/jPQ=;
 b=Nx1yRmzD4pdUParqAqhLgEX11DTRjZ5MajL6XJH+ESejgZQBj+qQAdkCLLXCt19Y5SZGXW+SnX/u/Bi58C0R4dh3jVg4v0JV4iKN0Y9a8vLTcVwl9BYb1W4/4DNTic68Cvl90cTVOd6fHmMXKgdeM1qpCsxW2FtDsM50BFgXWHw=
Received: from OSZPR01MB8782.jpnprd01.prod.outlook.com (2603:1096:604:157::12)
 by OSCPR01MB13008.jpnprd01.prod.outlook.com (2603:1096:604:336::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 04:29:59 +0000
Received: from OSZPR01MB8782.jpnprd01.prod.outlook.com
 ([fe80::b30f:a893:346:8926]) by OSZPR01MB8782.jpnprd01.prod.outlook.com
 ([fe80::b30f:a893:346:8926%6]) with mapi id 15.20.8230.008; Thu, 12 Dec 2024
 04:29:59 +0000
From: =?iso-2022-jp?B?GyRCTlMbKEIgGyRCQnM/PxsoQg==?=
	<o_takuma.hayashi@nds-osk.co.jp>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Subject: Questions about kernelCI tools
Thread-Topic: Questions about kernelCI tools
Thread-Index: AdtMTnhd3ZgThbtQQSuaHbv8aUQg0Q==
Date: Thu, 12 Dec 2024 04:29:59 +0000
Message-ID:
 <OSZPR01MB878233DCFD867C7C54A941F4B53F2@OSZPR01MB8782.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-bromium-msgid: 8a97cb8c-90f4-48ec-97cd-e021342b9055
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nds-osk.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8782:EE_|OSCPR01MB13008:EE_
x-ms-office365-filtering-correlation-id: 44be40e3-6eee-4174-9ce8-08dd1a65a3a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?UzVtcnJ1Z0xDdDlibndLZDlpTmhiUGIxZStUdzFnYTdYS2hqRDV0eEg4?=
 =?iso-2022-jp?B?bXh0TVJ2NXMzNjRFYll0L0hSU2NpbGNTTEV6WGhrZmdjYUtROFdUaFdt?=
 =?iso-2022-jp?B?djBhNWN3a3hHU1Z2ZVpMNkhudlJOWk5pSU5aUVErd1RPMlUxODZFMW1O?=
 =?iso-2022-jp?B?TW1UZDRrWnVzZGlaUjJOWHRqWm9OUWpDME1TamhDQ1d0TGNHRkpUeEdw?=
 =?iso-2022-jp?B?NTVreEx4d2JhcDlwWitRUkRvYlV1UzkxN0tCWFNkdTRQb2JoMUdHbEli?=
 =?iso-2022-jp?B?cEU4bkFBeHY0dTY3R3l5N0lROTYxTGp0YkdpMHkySUs2aTFmUHFpQ3RQ?=
 =?iso-2022-jp?B?OUgxVk01eTZCNEtlK0FyRzIzRW5rZStmYkFuU2lOeVFWYzZrYUlxQ2ZL?=
 =?iso-2022-jp?B?dHdNRVlUdWNFeEl0UEVqZ1JWdmQ3SG1xMGxmV2hmdjVHaFhqYUY4d1E4?=
 =?iso-2022-jp?B?MDVwOWpva3Q1SERmTTNDMXg2cVBIZzdQblVidFdieFhzdFhqcFRPWlRL?=
 =?iso-2022-jp?B?M0dXcE1aSHR4bmVweXFoOVJKb21SUzFpbXQvcGtEZUJ6SWw4MlE1WEd5?=
 =?iso-2022-jp?B?SkFwb3BXeWNoQm1zQi9zM1RwWENBWThsRWxiRHY1UXFNZFgveHpDbldU?=
 =?iso-2022-jp?B?RjFmT2JibkxpQXlwa2ZhaTdyZGs4bDNjb3c0ZFVzT0dPWlFCZHJCc2tM?=
 =?iso-2022-jp?B?QVBRMno5dEJCS3Q1ODVtbTB1Y3dpOE1rVEhTbHpQZFdCWVdzN0s5WmFL?=
 =?iso-2022-jp?B?ZDdHUE40d0ZRamhESVk3YW15T3RxbloxV0h4NmRoTFFiTFFyUnJRSlZF?=
 =?iso-2022-jp?B?U0JTRmpJNkFZbzRSaGJqUE84Q0pqdnAwdTkrOVhSOTZRRCtmQ1o5Tk1r?=
 =?iso-2022-jp?B?OEdrMGh4Tks3L1J0WFh1YmJ5OUJ3V0ljZTRlQ2xTaTJxV3gxY2x4c0JF?=
 =?iso-2022-jp?B?OHRDNExibWU0aVh1YjYrRGsrMUdvRHZtai9TSlNEVVNtdGsyWVJKcUYv?=
 =?iso-2022-jp?B?UnJxcis2blFKRWttWVFSKy9ReDMzdlFuUy9RRU90SnNnUnhzWjY1TTU0?=
 =?iso-2022-jp?B?S1ZucHZnQVNVQ0Iva3FxUFdSdmNubzFYcGwrc1RoUFpwb3E2ZVhINVMx?=
 =?iso-2022-jp?B?NmNILzdiaXhJVklNZGNXWHRSb3A0TDNIczQxRE9OMjdvTklsaWdqMHlh?=
 =?iso-2022-jp?B?aURGdWkzdFNCUWpMazhPYUswZUlCTmV0N1F6c1BkSWFJUHRKeXBGMGpt?=
 =?iso-2022-jp?B?eDVtKzFudEdhZXNOZmZQbFJsTDVMN29YMThrS1ZBa1plOWVqSUNmMVFv?=
 =?iso-2022-jp?B?V0RmeWdVeHpPcGUrUU5mYjJtcCtSa2JSc1diQVloS0pzdFNOdjd6czcy?=
 =?iso-2022-jp?B?YjYyY0R2cXUzVmlTWm12SlA3RHBQWTZmR0ZoS1VOc2xnbHhsUDZLeEkz?=
 =?iso-2022-jp?B?SE8xcU9rRkQ1blg5VmNiRXhPSXFuQVBsZ09JMHhqamRLTU1qbU8rTEo0?=
 =?iso-2022-jp?B?VndHMURoOE9PYXNkMmQ0TnNZd042UFVmdWhsa3BSMkFFSGJlay9vN3M0?=
 =?iso-2022-jp?B?VkduZU5lcjZKbDV3akR1aUhtWjEwRXI3ZlhzNnI4UXViNWtzVGVlbXND?=
 =?iso-2022-jp?B?M1krL2U5enVXRE9EQmZ1ZFp4RThHaVk4YnpXMEJmYjV3VDQyZjRMTWty?=
 =?iso-2022-jp?B?b215djc2QXV6ZDBxcW9RNWJrNlVPUGRHbUdndHk2YXhOdkhmQ3gzTVNW?=
 =?iso-2022-jp?B?SjlDWHBqUXFDNnJSL1lMb2N4Z25UTnlUdUU1U1FzclJjSGt5NXVVWEhz?=
 =?iso-2022-jp?B?ZmgzLzhQVUpDUDFEYnNoYlh3UXNTWDRVT0kxWTJOU0g5ZDd4bjdGNllS?=
 =?iso-2022-jp?B?RnhoTzFyRFkwU2w3S1JIYWh1VG4yU0lhdG1jTzZlT2ZaSFhpOUx2NTJ3?=
 =?iso-2022-jp?B?REtPWWVRNHRWeHFDNnI3SzNpbVNOMGd2MHNLUkRFN01VNnFkYzNYMWoy?=
 =?iso-2022-jp?B?VT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8782.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?WTl2VmFEQVJiNE5uWno2RkJndkE3amY0enhsMDlHSFhKb2lvVWZyZ2Fw?=
 =?iso-2022-jp?B?Snk1NWFhOEZnYVJudkM3SWQ5dWxmbTREbkNpUDdJOVFvZVhNNTFSQmg0?=
 =?iso-2022-jp?B?aHhZOE8rV0VxZDlHUFdMaDBSZnc2Rkw0LzZGc2dZV0puNkF6K0EweWpG?=
 =?iso-2022-jp?B?MHFveW1aQXNRNzZmdHNhTjhWekRVY1NnakFuU2UySzZESW9tZktGUytJ?=
 =?iso-2022-jp?B?aWFFYTg4TXBVVVhGU0dlSnhRQk5pNmJORFIyK1o4NURNMks4bHhVQlFG?=
 =?iso-2022-jp?B?NjdTMkpiREUrTkFMdWtvdEgwR1l0R2kwYWpVbjd2eWNvWW82VmtTT3c2?=
 =?iso-2022-jp?B?Q0FYa3dBbjUzVkliMHY0bEpVa3RjQ3B0YllZaVpaN2lzSDJ5eTBQYkVm?=
 =?iso-2022-jp?B?bGcvWEo5MmkwZmIxeHZmSSt5b2dGaDVsa3p5S1hHaXBKMlQ1YXAwajhM?=
 =?iso-2022-jp?B?aE1HcDdDZ0JDcnZqN2FOSnhKMG4zUWNBRHRsL1BHdG5HZzEyTFFvb2Na?=
 =?iso-2022-jp?B?S01tdFpQZzROZGJFMmx4U1pvSkpqaHlJU05WdlZ0aDJMOHNXbDNuTzQz?=
 =?iso-2022-jp?B?QkNEWEc2bXdCOE85ZWFYcGJxU2ttM2tFaUFXT3VmK2tzK1FCUitDcWJ4?=
 =?iso-2022-jp?B?Yk5JZ3VRSkxqQVBrOFV2U2x2c1hzSE9IbFZHby95L21KUlVuZFIyYVNw?=
 =?iso-2022-jp?B?R2lXaWRaMnZoMVB3TFM1UHpXc1YwZHdPM3pValNFWlJPeHBaYkdaZmgx?=
 =?iso-2022-jp?B?V3F1U1UxQVB1ZHBPTlR2dmQvaFRYQkRnb212d3VtUUJqTHhxOGRsbk1x?=
 =?iso-2022-jp?B?T0FobnhyYmJTTUVsRU9EY3FTZ0xQT0g3dE9WZjlwM0k4Q0dSOXROeEJR?=
 =?iso-2022-jp?B?NkhBNVN1RFhxQmlhOTUrNmZ6STRKaTJKRzFkR3lIUTc2WmFtUUZDTHEv?=
 =?iso-2022-jp?B?WTk4R0lPcDVXc1g5VHEya2lGWTY1SnQ3ZTh3dGp3U1NqRnBDYm1ZdkRi?=
 =?iso-2022-jp?B?NTBrVHIrZ3E3SDRpRTJzeEVJSDAzN1RmbTJYQ0hRMkMvTVJOSFROejRB?=
 =?iso-2022-jp?B?ekw0eWVDMTJ1QUdYaGxtS0tBLy9abFRrcTkvZTliYzliZlovT0J3RjZs?=
 =?iso-2022-jp?B?UXhYUHNKTEpDSi9vSUhsNGhqWXprNjRoUWEyT2tLeFc2QmNHQUtWenNk?=
 =?iso-2022-jp?B?ZnlTQjFRdGhEaEY3bUd1eHJlQmExZkhoQ3hpS1ZwYzRYODhMeGpkRnhl?=
 =?iso-2022-jp?B?WlZjMDVrdi9uM1ZlZ0JKcmhQaTBvN0N0NXY4Sk5scnhHR3dWSWo0anB1?=
 =?iso-2022-jp?B?TlZlMklMb3J0LzR2VG9jN3VDTWxIbVF2VDdVaFUvMUxHWld6OXpaaGlN?=
 =?iso-2022-jp?B?UklYZjBObHBrV1dUVWY2QjZVR29iL284MUdXVVRXRXl2SVhNbmJMVTMv?=
 =?iso-2022-jp?B?eGUvSCtqbDNLVS9NMHl3NnBMVTI2K01rOVFydnpFbzJST013clZmWjFO?=
 =?iso-2022-jp?B?UDczWlVQOHJWK0RYbllwU2svbDJ5MEt0V1I2c2JIK25QNUxBNUh2bDlu?=
 =?iso-2022-jp?B?UnRseTdJR203QWFJdy82Ymg2QTNyQk9ZMHY5QXpacXgrWGswbkRSbTkr?=
 =?iso-2022-jp?B?eXRmNERUdzB2SmRXQ09RTGEyRjdCT0lJT0ZoODRPODJpWENhVGVKLzFs?=
 =?iso-2022-jp?B?YVNYUmNGSTAxcTJyeUdwR2NOUE42WHh0OXBLeVoxaTZQUy83NGpicnFa?=
 =?iso-2022-jp?B?YUxaM1l6dkljT2ErNDdiTHVYL25tQ0hTdUdMMTBTcEtzSXN3Q0dncXVT?=
 =?iso-2022-jp?B?OXlGK1h5L25kM25EZFNnSGpZa3RkRFl4SXpKRVNsWnY3TUk4dUpTZU1o?=
 =?iso-2022-jp?B?ZEdjd3p2d3JYSWdHZHJ4TS9oSkdYYzlqNDR3RTRRVTVEVmp2WEpGRTVy?=
 =?iso-2022-jp?B?YzZwQ3MvbXJPNGJ1Ni90eDF0WFZrR2xsMjZKTTlnYkdNUjFZSXpyaGJW?=
 =?iso-2022-jp?B?ZjF5ZVdRRXpLR1BlTnBpSDUrbnpsclROcXJwM3FyL3FzYkRGSzBiRTBK?=
 =?iso-2022-jp?B?QWR4TlpkOTl2KzlKRFB5OXNMUVdZbk55bnRLaHhsRlQvcEJzanBwdG15?=
 =?iso-2022-jp?B?RjcrRHJWN2RPVkVhMFJqV3FoZDBPVDM4cmE0UHBQRWh0Ykx4V1JGQmE4?=
 =?iso-2022-jp?B?cE8yVC9Wc241VllHMzJReHdXOHdnQ0JZNjdIZVlZcnRpQ1RGZzB0eGR3?=
 =?iso-2022-jp?B?RmpGTC9SQnlKSkZpNStBcG5GbzJDZC9MbFUzaEtqS2V6VnZLTk9SL2V6?=
 =?iso-2022-jp?B?VGlFdnJoRUw5UTk1bVZWNmhHalI1VnpKSkE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iFlJi1our9H5y0/jaqaIXPzQguGus4ecMHscnLkLFldhoCVBAiVF/XDoOFTzoN0laKOy+GrSJahdQaLc8FHVbOyFkvBR5v2iw11LO0FUfL7Bk7SCP4KqmgkESMYMIXI1xx5TegT14zdWdfRd0rF8PoOmiuJDHIDVPc6ZCqDWhx4iv1WfYGTBcEvKrTECpq6prEFr34qLpIlX4JTZr+nlXayBUyVYu5g05vf/aTLSxtBmjGdLFq7BeOgdSiEeY843hfxXk0TZMAOE2UE47SQGJ21YNSTI33ld82i4MDubkp2VSiV5wBXE+8QOb0ul+wL5U8o0U4npQqr5JsGEbNmLJmJCga1/FhL8+FjQbC0Np7eOUyhtk7rp8pQ8n42DNMIp2TxBGN2wDSb9Og56xv8GRBQ4ie5QCI9eaeEgGH/RWV33x2pDQ6TtV1VyqRco41m2aGcfXqS1UDO6YnUftxQ1obCO6D+7LSpuA+68MKlD5TrDIOSg5LOyxr1AX3bYxT88cr5Rd2ygenhcL8rajx045w/+py7RNzQ1nZB04nDqLrHBADsBN26wwC9dmgO2ZEXzFxv6HQbDD5VrkdE6abHgjjMBmH1D7ZTo2pBVPavyzws=
X-OriginatorOrg: nds-osk.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8782.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44be40e3-6eee-4174-9ce8-08dd1a65a3a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 04:29:59.5472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53277b59-1e3c-4f28-81c0-97a49bdc7131
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RGqNEqq8rmbHcPtHIePyhrxhkl55vJFiU4cAYoONdc/bVBPnXkhx2wJpv09fBaMUJx1fCeQ9vXFxpqpIxgd+NXx+66VSt+z533kJHJ4Tukg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13008

Hello community.

I am currently trying to run LTP test on LavaLab with Maestro and KCIDB.
Also have currently considered building all modules of KernelCI "on-premise=
".
then I have two questions about the way I am trying.

Question 1=1B$B!'=1B(B
Is it possible to get rid of the dependency on GoogleCloud?
(So I am looking for the right way to build KernelCI on-premise more quick =
and easier=1B$B!D=1B(B)

Question 2=1B$B!'=1B(B
I encountered the error below while trying to build Maestro and,
trying to get the API access token for connecting to the kernelci-api conta=
iner from the pipeline.
Following steps here I have tried: (Referred to https://docs.kernelci.org/a=
dmin/api/)
----------------------------------------------------------
Step 1. Run bash in the kernelci-api container.        =20
$ docker exec ?it kernelci-api /bin/bash

Step 2. Create an administrator within the api app.
$ python3 ?m api.admin ?email =1B$B!H=1B(B<administrator-mail-address>=1B$B=
!I=1B(B
   (trapped) error reading bcrypt version
   Traceback (most recent call last):
   File "/usr/local/lib/python3.11/site-packages/passlib/handlers/bcrypt.py=
", line 620, in _load_backend_mixin
   version =3D _bcrypt.__about__.__version__
                           ^^^^^^^^^^^^^^^^^
   AttributeError: module 'bcrypt' has no attribute '__about__=1B$B!G=1B(B
   Creating admin user...

This above error I encountered does not seem to be fatal as far as I read t=
he KernelCI implementation.
then I went to the next step.

3. Obtain the token of the administrator in the api app.
$ kci user token admin
Error: KerError: Value not found for None
----------------------------------------------------------
Is there any missing steps I should do before?

Thank you.
Hayashi
