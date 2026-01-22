Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358D73C1FC5
	for <kernelci@lists.linux.dev>; Thu, 22 Jan 2026 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080677; cv=fail; b=OHYSvn+YM0yukob+zpJHCfjoesRCRfKF1sFE70lHZM5yd0qsN/WC0YOohC3VENXyt4byV0V8Ktbl+qGjbhYl7POYSFFWgKAb7k0viotNCq4oGPRQxI3VDlPVfwJQXnyq3VMEIMrurpdDyNO9jOvl+LslUp3xol7SckXNFU3yvCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080677; c=relaxed/simple;
	bh=Mphl3f4RzSZGfyT48+0XxuANL087YJhgcUJcs8PdqLo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kx94FNnAKNpsxpLoKhlXp3kpIVpt8doDo3EXvd6uAcrxEg6Lxi4IAtgITMVJ+TIDhVuOLfJg2EAoqjHO10UxyUhjn4c3DPsAs7zWMFtsWf8rzAY7yZ276nXoawXrRi52rHZJX7dkj1s8HrcUsw0bjKgiDxImXrhdgOKPUR36BWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=R0qfA38C; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="R0qfA38C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCfOwR+g0I5Il6BmRoIXaj3ZsAaPXcFoN87zj9vQLU6Zv3Vmrybotg+Q3pybKilHITz65it9yr2fknRlIhbus+3Le65D5f0bPPy/FDxW9qVHJOAZQODxe66q0AiJ7R2wRRR3LT4VzTZNlkL5V1UVq26gspVAmFy2TNVg2nBXVmgkfyjjtXPsoPT2F8EmoNkNM8ODXqVqcw43IRxUbwx6ZpAGL+n+2mBq1Jm7ILfg7nOzjfD01tIp3C9PKsbIls48aGzpgDYmPqduCXRRGqezPCrl3hhkuOlgXKh1bbijus7Q47IyDgHNEhLsCKcNAdZ6gBUypDNIoz54udlQzXzp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mphl3f4RzSZGfyT48+0XxuANL087YJhgcUJcs8PdqLo=;
 b=b2T7vT5vs82+n7AU9LtHkltXSkid9xoZCb+DvVAudSXQvcJ0RRSL7VzGUbVOv2LWf+lG0v8QXfId5X1ICzMoZ/ySzKZhXRjEphnW3eYZwpeyMwBZrtoPpgpACNdwcfD32W954aVp+4rFomz4HNT2wmGYyMwmD6mrgr8JW+pRdE0Xqh2jd/45mJ32m5ir5yYEcQ+mBLeiGUjpBWDsyCGucL9reW+3V7JaK3zW4llGT9pEYPFyE//phweEUTUsmLltZRjnxHYfKbe47d9hOjiFugK6Rv1HlXeykL337xE2gHL/XHbU+WxPm8g72dQcqdTlSUVx8kyoYy8xgTF5RIvUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mphl3f4RzSZGfyT48+0XxuANL087YJhgcUJcs8PdqLo=;
 b=R0qfA38CcJHjNb4Aesgkcs/AtXKjGNCxu5V2XG9DiUev4iSbF7dCIxkIItqge+k29UQBJghCVVJ9B3aBa20TMGYDwPr2jL6vyZQJxfedAFB2dCmBA8YBLVeAdSR8o3ZPPKgeDGFpU2xOHGKgU9mNF7M7qI+JZVbcBpQnXg+Q/yc=
Received: from OSZPR01MB8123.jpnprd01.prod.outlook.com (2603:1096:604:165::7)
 by OSZPR01MB8734.jpnprd01.prod.outlook.com (2603:1096:604:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 11:17:51 +0000
Received: from OSZPR01MB8123.jpnprd01.prod.outlook.com
 ([fe80::f2ff:7635:979f:c31a]) by OSZPR01MB8123.jpnprd01.prod.outlook.com
 ([fe80::f2ff:7635:979f:c31a%4]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 11:17:47 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Gustavo Flores <gustavo.flores@profusion.mobi>, "kernelci@lists.linux.dev"
	<kernelci@lists.linux.dev>
CC: "kernelci-webdashboard@groups.io" <kernelci-webdashboard@groups.io>
Subject: RE: KernelCI Dashboard - Hardware Listing Behavior
Thread-Topic: KernelCI Dashboard - Hardware Listing Behavior
Thread-Index: AQHciwm/cHvCRU2kMkqiUmofpok1kLVeCVVA
Date: Thu, 22 Jan 2026 11:17:46 +0000
Message-ID:
 <OSZPR01MB81230BE51B22B72D9D2A1BB4B797A@OSZPR01MB8123.jpnprd01.prod.outlook.com>
References:
 <CAB31pVk5MsWzPxYc-ctAg8rfVGvYcVGzsxXNi+KEWkf_5B2qTA@mail.gmail.com>
In-Reply-To:
 <CAB31pVk5MsWzPxYc-ctAg8rfVGvYcVGzsxXNi+KEWkf_5B2qTA@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8123:EE_|OSZPR01MB8734:EE_
x-ms-office365-filtering-correlation-id: 00f5583f-604f-4177-7f8e-08de59a7df12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZHNFOXlQZVFVTUZtenVRd3RWWmhwRzZ0YzZtbVlpblNDdnZrRW9hZ0xTN091?=
 =?utf-8?B?U2kxSzBBMitxSHJGbzJUVlAvaFZmbHIzR0F0RnFkYmRGZ1Z3UmpLeXpzQk4r?=
 =?utf-8?B?S0Q3NGo1aW5kMEZORmYxL3ZEZG5lQVoxQ2FzeG1CblNlbkloaitFTWxCYmNY?=
 =?utf-8?B?LzBOYW1GVnh1NU55Zzc1czJVSit3VnZTTWxZN1U4S1RDK245QW8zZk1FSnlN?=
 =?utf-8?B?bktJc3ozTGxxOHY4Znh6LzgzQlBHVHd0bTFIanFyWkhxOGhvOUNSTzJKdWYw?=
 =?utf-8?B?M1JSNVFNNUdNSmp2dU9DUzdmS0loUFJSZ3lqUURxVjl1L044aDZPRHYxeVhr?=
 =?utf-8?B?SisvTkhIWVp1aENNOGcxSXJEaENIYjJCS1g2ZjRnUFN2SlExWjhJOFFjb2FO?=
 =?utf-8?B?Wk9mQlhlSGdHektYcWpzUmxtNUhxaERySHY1WVVtcHdtaE9mNnlQaU1VQmhm?=
 =?utf-8?B?bVd0a0haS0xDYUc0NVhLSVpnaExERk1jblRrRm53TVpQNzMzM0EzakE0Ym9N?=
 =?utf-8?B?SGwwRmlFTzZlTTBrMzJQemYxNGVkdjNCakRzSHNjT0NHQ1RMUCtScHhtVmEr?=
 =?utf-8?B?d3ZSNHR3MUtKWWJEVWp6VzV2eEtOdWJZV3p3L3ArTTE5QWVvbHFvWFRxdDNi?=
 =?utf-8?B?UytvVnF3KzVVYnkwdHdqOE10S3pjcXBGR01abnZHanpBYTh1M2RIQmlZK1hX?=
 =?utf-8?B?M2sranlNc0VNNjhOUXVVZ3F1djB4VFZHV3E1OWl3SGZYNEF1YzNnOVdUUmJ3?=
 =?utf-8?B?aTNPVDNRQjR1ei9JaDVjUjZTOVZNZ3MwQkRYaGRyajE5MGVYN3ZYVEw5Wkcv?=
 =?utf-8?B?ZDh0S2VKQkkvUjJxUnB3Y1ZxYXZLNzNlRW84U2Y5NkxsQW83aWlTNk5vOCt1?=
 =?utf-8?B?bzNwSXB1c3dXMkdHYk1VRzE0ZXBNc28wdkJaOHBKU05SbkhJZ2FHUVByOVZL?=
 =?utf-8?B?K0cvQ1VvZzBsSjhNOTFKRUtlQWptd2QyVG5MTm1qRlRIMXVMTmoxbzg3SVQ0?=
 =?utf-8?B?S3JkM2lrdWlUMW9SODcrSEc3aW1pQUhxWElkc21WZjhyNUJZeU1iVTJTa0p2?=
 =?utf-8?B?bVgyWUxkVXRkTVhMWGlpSng2ekJvOWNkblJOQUNxZGFPVkc1VnVaYUtLLyto?=
 =?utf-8?B?WXNKMVB6eDdqbmU5OGNCQkg4NlJ2QTFVWGx0RDk1TTNWeGgzcjZEMHkwa2VD?=
 =?utf-8?B?Z3dzMFNZUjg1TGdUbGQ1d243bGt2VFlKYmx2aGNTZkV2R09hQWlWdkY0b09v?=
 =?utf-8?B?RUdkdFZZQ1FGencySkNOL0MySm1CaE80TDNub0l3bytESGFFYmNObTJid2Y3?=
 =?utf-8?B?UmIxMmgzWjJvUU1KU2JNb2FBU1M1WHZERG1FQnBHOWhmOGhyc3psVTF0dXJ0?=
 =?utf-8?B?WEo2ZDREMElKTlpEeWNUVkd5dmIraTVydE5KblFuNDV5Y3Z6V0F4Rm5yMDhD?=
 =?utf-8?B?bldYYUJVL2V5VDNNVE5FUmxsQTd6U1VwQ05WVTVPNmpaUlRBOStFL0xmU1ps?=
 =?utf-8?B?dGx1eTFPakpjK0VoL2lZWk94VmZzTVFEY2xObGQ5M1VhN0Q5UWs5QkZOOFBm?=
 =?utf-8?B?ajNvQU9vOTd0bzJnQjRkYWtzaldWakdLcWxHZWErUmYzREpLVDExOTJ4ZUU3?=
 =?utf-8?B?SXR2dlFXZlNISXFnZGIwMGNjUVpCWEowT2xyQUsxVThFZ0E1em5OZEovdUdO?=
 =?utf-8?B?YU9tM3FNRXIwa3FnWCtGZnVNR3JYS21wVlZ0WjA0anJ4aEo3VkM3dnI3Nklv?=
 =?utf-8?B?eFhaNlZzN3dHQUZoekY0VlE1WGpGM0hqaVFFQXlEZ2RtNitVNDJZbzczZDc3?=
 =?utf-8?B?ZUZkYXpybkM2Y2FZVDRsdkg5Mjhkb2JKWjNQbHFRK0p0dCtBMElQMEgxa285?=
 =?utf-8?B?N3ltV0ZhVjFOQ3RoVmR2NkZEdHFJeHIxT1R4Q0NJbjBZbVpScVE4S3VNQndS?=
 =?utf-8?B?YUU1T0txN25TQ3RsNDVsNHVkdURYakFPUklLSnhWM1pXdjR5a2RON3JCdCtk?=
 =?utf-8?B?c0JBbFdNQkx3WnlwM1JqU1BsNWI3RUJzY1JrZVJ6ditYVlVEZ2dYVHRya2lR?=
 =?utf-8?B?Ty9vYWR6ZFBVeXJPUmdaTHdka3JPK3Npb01rSWFMMk00cjBiUUZrTmR4MjRo?=
 =?utf-8?B?VnljeEhzRzhWMWZqS2d2bndoNUF1Q1dRUDhyQ0VGTHViNy9HRjE4UkVLUFMx?=
 =?utf-8?Q?qzRVeLe02OvfsSO/a1N0RPw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8123.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTFBTDRJZ01JeENyem9SVWtwSXQ3QTF3cVVHSy9tend1cHZ0T2ZuVThLS2FU?=
 =?utf-8?B?bS8veng5Sm4vUUluWjl5dWcvcVd4Q040enpJK0IrK2RBTFBPZXFpcWZlUERE?=
 =?utf-8?B?b24rWUIvMDE5T0ptb3RFdVBnSzVRRW1sc3YxMVI2bHpGNEFTSnRoWUNaVzJW?=
 =?utf-8?B?VHozQjRzeFBmRmRGN0ZiL2N4b2Urd21rMlQva0NnNnNTbGhCY3VubGs3YXRl?=
 =?utf-8?B?Q2FTRkZYN3d3NlREdmhFd0gwVFc4cGFkNXVFTVJZM0VtMENNckpXVkdHSFc0?=
 =?utf-8?B?cmdKUmZlRyt2bzFTT0pydXZUT2liaHF2UFVIbktIaDVhZDNvQ3FGbmRHYzZK?=
 =?utf-8?B?NVdnZDNmOEMzUmZwRVRVL1EwOU1lSStoWlJSMmdpVG9mYjJpU0ZDSWE1a3F1?=
 =?utf-8?B?SFdKcTRpVmp6OFo5b1VSbUtTek9MZ1lGVi83S1dKNkRNMWtKc0ROKzNKOEI1?=
 =?utf-8?B?WEc2NU9ZR0hQWm01QjNTUy9jSnVzVmFWRGhkTEVKSDBncXcxckVSdFNGeUxk?=
 =?utf-8?B?OTZUTTFrZGd1T0Q4R295eFdOZTJ3SzZrUmZVWVkxMTNKbkJzZ0hsNGdld1VP?=
 =?utf-8?B?RllIaHNFc3lhZ05kNitvNnYxNlM1SnQvdElaOWcyR0g3SnpSNldnWUxvVXds?=
 =?utf-8?B?NTFCZllNZ1k4c2FYWndYUU5EREdkZEtXQ3hxbTZ0Mk1DNlNqWjIxYllsZ3Vn?=
 =?utf-8?B?VHozQVVYOStEbHllemZWSVRmUWlOUmhhdjJMYWlidVlqZUp4a1NMSGpOTmV0?=
 =?utf-8?B?dnE1Mnc4a014T0hlZkdVbnVPaUx2TC9Kb2hza0JnSDJjSDVKc2QzS1Bhck02?=
 =?utf-8?B?WE5YUTJza0pQMDMyZWMzTWllUVUwY0FFNnRwemljLzlQc1BBZHFYTFpSdzRG?=
 =?utf-8?B?ODRxNlpIdHdEWlRDMjQ3OTR2UXdzSzFKbkpGcXhnbEJxZXhUQzZXRzlINHNF?=
 =?utf-8?B?VFlPemNGYlZtTkxBbGRKTHU4UW1sUi9pT2J5RWU4cnhRSVduMi9XT1FNSnZo?=
 =?utf-8?B?UnRta1Q3SElnUDZNZ0lmb3YxQzNJOEV0dXRBTzQvLzYvKzJxb0JGYkdqNEtn?=
 =?utf-8?B?NGduUmtHOThkczB5ZFFtUUw2Y2JVeFZ5QlRMbFpiTmQwSDhaNEJPeC9Nblgw?=
 =?utf-8?B?TnlJMjNITVd3ZkM5aEEvT1JBS0N2ZjlTcnFockFUbVIvL0grVVlkMkhaQUhN?=
 =?utf-8?B?eEVGODBDczAyalduRUpoK0d4T3g1d0dkK0xycDIzOGVVeUxBTXVHMjV4ZUt0?=
 =?utf-8?B?UTlsOG43YWZxUk4zOG9mbmdzeFJvNjJiRmllMUxHZFpqb0MyNS83b2gvckpH?=
 =?utf-8?B?bkxSbzREc09BODIvdU9xdzg0amg2NGZQa1FDTGZ3elNPTVIrR1JTamN2RC9p?=
 =?utf-8?B?bk9zTVp3cHd1SnZNaTBmOXdQcmdVNWlTRlpndkpvRTdBcTBEY1QrUS9NZmow?=
 =?utf-8?B?cngyYjhCSmFVWXFJRE5pZTBVTTRHb0tac0ZsTUt0cndKM2RPWDVFektYTGhV?=
 =?utf-8?B?YjUwYTVBTitMTUNNKzgyei9SM0E0MFN3YktJZHc4cEtJbDlZbHJ3L3VobzZq?=
 =?utf-8?B?bmRTOTJ4dEMydzB5ditmSG1rVjI4dk40dXQ5U0tsYWF3U3dOWGV1UjVIRHdL?=
 =?utf-8?B?eWdmL0Q3TzdBeHJzOFdXWlBZTzJUVGNOUmNFbUh6Z3plaFR0bzNXaDR2SzQ1?=
 =?utf-8?B?YUFPaXhTMS9zOS9hVXdhaEQyVzNUQjV3emhSNENaODhEOHhYaXJJcHlYc2ow?=
 =?utf-8?B?byt1Q3lzZnh0UlRzNnV3aVlSRTByZm5jNnFrWXJIR1pINjJVV0tkaGF5a2Yr?=
 =?utf-8?B?OTU5Wi9wbm5mbGllL3UxdWFiWmlEUVFwTGMzQW5mcDMzc3NjN3ZLbzlYMllJ?=
 =?utf-8?B?QnREeE5qNy84UUlGWk5oODN5MlMrTDlseXorV2MzOGwzQkx3MUVHZThzd2xs?=
 =?utf-8?B?Wk16T1BMUFJ2c0tyeEJ4bTdHbnBSNEFkckRYUkVkb3RNd0VmMkFOTlNoR3J0?=
 =?utf-8?B?Y1AxUElvSW14bUdpaDRCTytrblNjVXN5U25tOGU2aWJrc1UwcnM5M1hmeWxy?=
 =?utf-8?B?amg4dDZoTXQ4OW8raUVnRE5KNXV3STlHUm1NdEozZUE5MzRRU3pHVE5RS0FS?=
 =?utf-8?B?dThHUFNwMUpCeUJwTTcwT2pySkwwQWppVjRRcGVvV2ppaVErMDVGejNmZ1J1?=
 =?utf-8?B?QUFBSFFqTVVXYXdhU3BDYlNDQkhwRFhCSFlBVEtTeDd0NDFNYjhqRTVBNWc4?=
 =?utf-8?B?blFXb2toZkJwWkZFOWVPTi9tWjNNUVZQbFVLRWI3OTFUS0tDRkJ1bC9yenlW?=
 =?utf-8?B?VXdBWVRxTHJvYUpoaDRJSWJicUFkKzFWSU5TTTN5ZS9WQ1BaV0tIUT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8123.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f5583f-604f-4177-7f8e-08de59a7df12
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 11:17:46.9641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6M7LfhIWvgyhtvd6YtRp7wzRf+UGZoDTwtKEnLla84fRck3xb6Ys8pNLP8E+KkQ1BYevep1a9mIYAyHjJoWMh84QlJGjXHgA1hhlYUpzRI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8734

SGVsbG8sDQoNCj4gRnJvbTogR3VzdGF2byBGbG9yZXMgPGd1c3Rhdm8uZmxvcmVzQHByb2Z1c2lv
bi5tb2JpPg0KPiBTZW50OiAyMSBKYW51YXJ5IDIwMjYgMTg6NTgNCj4gDQo+IEhpIGV2ZXJ5b25l
LA0KPiANCj4gV2UgYXJlIHdvcmtpbmcgb24gc29tZSBpbXByb3ZlbWVudHMgb24gdGhlIGRhc2hi
b2FyZCBhbmQgd291bGQgbGlrZSB0bw0KPiBoZWFyIHlvdXIgb3Bpbmlvbi4NCj4gDQo+IEN1cnJl
bnRseSwgdGhlIGhhcmR3YXJlIGxpc3RpbmcgYW5kIGRldGFpbHMgcGFnZXMgb24gdGhlIGRhc2hi
b2FyZA0KPiBvbmx5IHNob3cgaGFyZHdhcmUgdGhhdCBoYXMgdGVzdHMgaW4gdGhlIGxhdGVzdCBj
aGVja291dCBvZiBlYWNoIHRyZWUuDQo+IEFzIGEgcmVzdWx0LCBzb21lIGhhcmR3YXJlIGVuZHMg
dXAgYmVpbmcgZWZmZWN0aXZlbHkgImhpZGRlbiIgZnJvbSB0aGUNCj4gdmlld3MuDQo+IA0KPiBX
ZSBkaXNjdXNzZWQgdGhpcyBpbnRlcm5hbGx5IGFuZCBzZWUgdHdvIHBvc3NpYmxlIGFwcHJvYWNo
ZXM6DQo+IA0KPiAxLiBTaG93IGFsbCB0ZXN0cyB3aXRoaW4gdGhlIHNlbGVjdGVkIHRpbWUgZnJh
bWUgKGUuZy4gbGFzdCA1LzE1LzMwDQo+IGRheXMpLCByZWdhcmRsZXNzIG9mIGNoZWNrb3V0Lg0K
PiAyLiBTaG93IHRlc3RzIGZyb20gdGhlIG1vc3QgcmVjZW50IGNoZWNrb3V0IGluIHdoaWNoIGVh
Y2ggc3BlY2lmaWMNCj4gaGFyZHdhcmUgd2FzIHRlc3RlZCwgZXZlbiBpZiBpdCdzIG5vdCB0aGUg
bGF0ZXN0IGNoZWNrb3V0IG9mIGEgdHJlZS4NCg0KSSdtIG5vdCBzdXJlIE9wdGlvbiAyIHdvdWxk
IHdvcmsgc28gd2VsbCBpZiB0aGVyZSBhcmUgbW9yZSB0aGFuIG9uZSBjaGVja291dCBvbiBkaWZm
ZXJlbnQgdHJlZXMgdGVzdGluZyB0aGUgc2FtZSBib2FyZCBpbiBzaW1pbGFyIHRpbWVmcmFtZXMu
DQpTYXkgbGludXgtc3RhYmxlIGFuZCBsaW51eC1uZXh0IHBpcGVsaW5lcyBhcmUga2lja2VkIG9m
ZiBhdCB0aGUgc2FtZSB0aW1lLg0KVGhlIGxpbnV4LXN0YWJsZSBjaGVja291dCBtYXkgZmluaXNo
IGEgaG91ciBlYXJsaWVyIGhhdmluZyBmYWlsdXJlcywgdGhlbiBhbiBob3VyIGxhdGVzdCBsaW51
eC1uZXh0IGZpbmlzaGVkIGFuZCB3ZSBjYW4gbm8gbG9uZ2VyIHNlZSB0aGUgImxhdGVzdCBiYWQi
IHJlc3VsdCBmcm9tIGxpbnV4LXN0YWJsZS4gDQoNCldpdGggT3B0aW9uIDIsIHdvdWxkIGl0IGJl
IHBvc3NpYmxlIHRvIHNlZSB0aGUgaGlzdG9yeSBvdmVyIHRpbWUgZm9yIGEgc3BlY2lmaWMgYm9h
cmQ/DQpPciB3aWxsIHdlIG9ubHkgYmUgYWJsZSB0byBzZWUgdGhlIGxhdGVzdCByZXN1bHRzPw0K
DQpIb3cgZG9lcyBPcHRpb24gMiB3b3JrIGlmIHdlIGVuZCB1cCB3aXRoIG11bHRpcGxlIHRyZWVz
L2NoZWNrb3V0cyB0ZXN0aW5nIHRoZSBzYW1lIGJvYXJkIGluIGEgdmVyeSBzaW1pbGFyIHRpbWVm
cmFtZT8NCg0KRm9yIG1lLCBJJ2QgbGlrZSB0byBiZSBhYmxlIHRvIHNlZSB0aGUgaGlzdG9yeSBv
dmVyIHRpbWUsIHdoaWNoIHNvdW5kcyBsaWtlIE9wdGlvbiAxLg0KDQpNYXliZSB0aGUgZGVmYXVs
dCBib2FyZHMgdmlldyBzaG93cyB0aGUgdmVyeSBsYXRlc3QgcmVzdWx0cyAoT3B0aW9uIDIpLCBi
dXQgd2UgYWRkIGEgYnV0dG9uIHRvIGdvIHRvIGEgcGFnZSB0aGF0IGxpc3RzIGFsbCBjaGVja291
dHMgb3ZlciB0aGUgbGFzdCBYIGRheXMgZm9yIHRoYXQgc3BlY2lmaWMgYm9hcmQgKE9wdGlvbiAy
KzEpPw0KDQpLaW5kIHJlZ2FyZHMsIENocmlzDQoNCj4gDQo+IFdpdGggdGhlIGZpcnN0IGFwcHJv
YWNoLCB0aGUgbnVtYmVyIG9mIGRpc3BsYXllZCB0ZXN0cyB3b3VsZCBsaWtlbHkNCj4gaW5jcmVh
c2UgZm9yIGxhcmdlciB0aW1lIHdpbmRvd3MsIHNpbmNlIHdlIHdvdWxkIG5vIGxvbmdlciBiZQ0K
PiBmaWx0ZXJpbmcgYnkgY2hlY2tvdXQsIGJ1dCB0aGlzIHNob3VsZG4ndCBiZSBhIHByb2JsZW0u
DQo+IA0KPiBTaW5jZSB0aGlzIHdvdWxkIGNoYW5nZSB0aGUgY3VycmVudCBiZWhhdmlvciBvZiB0
aGVzZSBwYWdlcywgd2XigJlkIGxpa2UNCj4geW91ciBmZWVkYmFjazogd2hpY2ggYXBwcm9hY2gg
ZG8geW91IHRoaW5rIGJldHRlciBmaXRzIHlvdXIgbmVlZHM/DQo+IA0KPiBCZXN0LA0KPiBHdXN0
YXZvIEZsb3Jlcw0KDQo=
