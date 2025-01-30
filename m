Received: from mta157.mta2.hdems.com (mta157.mta2.hdems.com [35.78.62.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365253BBF2
	for <kernelci@lists.linux.dev>; Thu, 30 Jan 2025 00:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=35.78.62.12
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738198599; cv=fail; b=jDHD7wZQ4MKcTytuemX7S2hYJWbVquytlyqo+6Dws4CJ5e2OEDEx1nVltCInWctQb+pJCLknMcWibQr8cYADFP2zhU5SxbDRigyoBjf4rnzg6VhwcjGr8h9MRaaCWgWClO8ElmxF/E2MixOg2CcDUe237AbqOK/XFF6pwTddqnI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738198599; c=relaxed/simple;
	bh=eY/ZSJEAVevBoApPVIx+hUhEPWf7e7XOV5Vfqflz5no=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CkB/UH8VJ74wTo32JMxcKXwFetsq4sT6XfvGwsuL2JU3i/iG2unw+KG4UktgTjsqIYlW/WdjgAU6VdVmbh8df8UcQiDt3rwGLn9U6tEq+u952KaI5YLuoXS75qvYwlRV15dLpb6ulje/KLiw84YZZTb62ev1A4cVOfLiIF8mkhk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nds-osk.co.jp; spf=pass smtp.mailfrom=nds-osk.co.jp; dkim=pass (1024-bit key) header.d=nds-osk.co.jp header.i=@nds-osk.co.jp header.b=O4cdssuI; dkim=pass (1024-bit key) header.d=ndsosk2.onmicrosoft.com header.i=@ndsosk2.onmicrosoft.com header.b=g4SLynvu; arc=fail smtp.client-ip=35.78.62.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nds-osk.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nds-osk.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nds-osk.co.jp header.i=@nds-osk.co.jp header.b="O4cdssuI";
	dkim=pass (1024-bit key) header.d=ndsosk2.onmicrosoft.com header.i=@ndsosk2.onmicrosoft.com header.b="g4SLynvu"
Received: from mo.hdems.com (unknown [10.5.85.80])
	by mta157.mta2.hdems.com ('HDEMS') with ESMTPSA id 4Yk0hv59pFz499y
	for <kernelci@lists.linux.dev>; Thu, 30 Jan 2025 00:46:55 +0000 (UTC)
ARC-Authentication-Results: i=2; mta.hdems.com;
 arc=pass;
 spf=pass reason="matched ip" smtp.helo=OS0P286CU010.outbound.protection.outlook.com smtp.mailfrom=o_takuma.hayashi@nds-osk.co.jp;
 dkim=pass reason="Signature is valid" header.d=ndsosk2.onmicrosoft.com header.i=@ndsosk2.onmicrosoft.com
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=mta.hdems.com;
 s=arc-20230313; h=Date:From:To:Subject:Message-ID:DKIM-Signature;
 bh=eY/ZSJEAVevBoApPVIx+hUhEPWf7e7XOV5Vfqflz5no=;
 b=PoOLEkQ4iBNJZduqoI63JlKmkuD0JAiRg+b4IOaOzSoH91ATw3xIsRiCOSBOEfZINNnkCHqteTbv
 EDjIP9SFi4PGDDr9SFHV4zLEn7479H+IhC4nz6CKpKM5wu3SOa4IFyW5EFkPridjtEcv417VeHes8
 owiwbfZCKKoxqPHDDWwSKxz7J0m+GroQRwp34TAaaYCzDq68qMZu1J+5Mddlh5s+FSRD06lkap1X2
 lckIvSDWbVae4BghHHV7hI6X3I6VYJMo8Lam6X5LamVeZKFUE+GFpyuSctzmLtNrImTJ4OhTREdXA
 V9xs8bcQ06G6ojN174p7e5vDqnnthVfvsEw==
ARC-Seal: i=2; a=rsa-sha256; d=mta.hdems.com; s=arc-20230313; cv=pass;
 b=qs5LxkYr8rb1v/COHmzFi+4Vi4AnnGrRU1ASX0ox9y52x2iEy3GnweI+faUebVDB1H8D7SVW/zfw
 MiQ9C3YHfPxPnNo3a7CHeRpwLPRDYyYufE/jGZmzCAgKVp2LWJ5/GdtvBHJtqyVKWsdGIOpsqZiv+
 03QqIhP7yYq76bfmMGgH+1k8uY4KsVDy9vUdxX/U2VJlcMhZe1V8vqrSxECQBgx05xkagB+kr/IrL
 5G5gqDAemEP8QdlkA2aeV6FWv8GsqA0u5cSg1585mw1zWCQV/qPkD49mP9Q0eQEPnJNX71xSG/yzI
 D6EdMcD72S7qJdf6qAGG5g+nvzu55Fs/+Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nds-osk.co.jp; s=DKIM;
	t=1738198015; h=Subject:Message-Id:Date:From;
	bh=eY/ZSJEAVevBoApPVIx+hUhEPWf7e7XOV5Vfqflz5no=;
	b=O4cdssuI94TFQ7gQjfyR4LufFEH7wm6UqZL6YgV8kWssD7RX5Zd92NJGqm/QuilF/qUgizCqWd
	 64b0Ky6KLO7U3cBAvyU/NAVmet33GwG2ismOS1b4xTUqtZPwlpPoV7KV+EtYbPLpTG72LErotcmj
	 qU5mN6UM/jjAUFY7cKMdc=
X-HDEMS-MO-TENANT: nds-osk.co.jp
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazlp17011026.outbound.protection.outlook.com. [40.93.130.26])
	by gwsmtp.prod.mo.hdems.com with ESMTPS id gwsmtpd-trans-ac1b5f6c-fb25-44bc-911e-0fca9bed1ad3
	for <kernelci@lists.linux.dev>;
	Thu, 30 Jan 2025 00:41:46 +0000
X-HED-ARC-Validation-Result: pass
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvAhPPl8zM2TQfJIasb4xx9AMWe5K0WdJwiFv/mG85dIZUpek6hjnPRNoaha6qQPknYxRDUm1vbnOddlw0dz7Cv2GywRGSfoc/ombt442ZlynxxtT5IKtgKMLMAzd1N04rXICq7Jvz7wQQrXTQDBe4gPC+biVLQTZwlPsaCmYSyh49Oy2HcBa+LF/ru+PTZ4g1E3/Zs5eVIhzvPFkuV9kKf1qdPnYZwoKyhclu/CsMzLE6Ih3BOiE532wrgQUl6/xOydHoML8rtaWQQNnWWBqc2g4l/NKOCS1YeL98dMILJ45606PfSiYAZulYb/S/ZKoe3eW1HfXZ4H1xkWDFKhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY/ZSJEAVevBoApPVIx+hUhEPWf7e7XOV5Vfqflz5no=;
 b=g+6bGwVrIZLuWtbV2PmEjd52iqSSAHoSmCrku99RBd7NPti0h0GwLWUcGEthaF+/vBcNytXKNwFuS5NdJGgjjWr8KxImMbyzVFyuIyyG884bJqENH1dwHJOJJY823jeTWMgQ0/yJn9yqhqz0JTQNSXMRXS6Ktuv5LUVFiH0ax+HTw82iGihetQdjzEyZgs9DdHtIn5t1rB35YdOopQeIon0fGi6fI6r7v2WihHuTHrOVnjF4gGfu4uLJxUJ7esir8ulyKQdCgPhdA07DqSF0CcWjVuthV12FaTeZ0FyyZfa08TdYgvqdX+bX+3rhAGWJgr88NR7LMRg7TxnZ+5Akkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nds-osk.co.jp; dmarc=pass action=none
 header.from=nds-osk.co.jp; dkim=pass header.d=nds-osk.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndsosk2.onmicrosoft.com; s=selector1-ndsosk2-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY/ZSJEAVevBoApPVIx+hUhEPWf7e7XOV5Vfqflz5no=;
 b=g4SLynvuXNlhayXlBqIov4lCMW1Eszd3M905VG/nEL8ANCLouyA2kZ4fw7frXduAbUvHU1Yhzi7hdiTfnFWY65cS6gV9SIocj4fXEMPO56tJxofsyYdGjN7Rbj2JIAyRlX96jDb7sugUIIS3EfUHT0gsZj+yFF589oDIqeckUF4=
Received: from TYCPR01MB8788.jpnprd01.prod.outlook.com (2603:1096:400:18e::6)
 by TYWPR01MB12125.jpnprd01.prod.outlook.com (2603:1096:400:440::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 00:41:44 +0000
Received: from TYCPR01MB8788.jpnprd01.prod.outlook.com
 ([fe80::7eaa:9c6f:2f40:4958]) by TYCPR01MB8788.jpnprd01.prod.outlook.com
 ([fe80::7eaa:9c6f:2f40:4958%5]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 00:41:43 +0000
From: =?utf-8?B?5p6XIOaLk+ecnw==?= <o_takuma.hayashi@nds-osk.co.jp>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
CC: Denys Fedoryshchenko <denys.f@collabora.com>
Subject: FW: Questions about kernelCI tools
Thread-Topic: Questions about kernelCI tools
Thread-Index: AdtMTnhd3ZgThbtQQSuaHbv8aUQg0QAHmt0AB6aWZHAB6fv3wA==
Date: Thu, 30 Jan 2025 00:41:43 +0000
Message-ID:
 <TYCPR01MB878896C3005C58A79DE7D531B5E92@TYCPR01MB8788.jpnprd01.prod.outlook.com>
References:
 <OSZPR01MB878233DCFD867C7C54A941F4B53F2@OSZPR01MB8782.jpnprd01.prod.outlook.com>
 <0346291a3c0829f9a5008c828e6ba01223c7fa76.camel@collabora.com>
 <OSZPR01MB8782CC271F4C194691847691B5E72@OSZPR01MB8782.jpnprd01.prod.outlook.com>
In-Reply-To:
 <OSZPR01MB8782CC271F4C194691847691B5E72@OSZPR01MB8782.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-bromium-msgid: 3a576c7e-8121-4a60-a3b9-257fbecaecfe
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nds-osk.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB8788:EE_|TYWPR01MB12125:EE_
x-ms-office365-filtering-correlation-id: 56cac244-31cc-43ac-47e3-08dd40c6de9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZEFUYzYwYkFZaldxRzB4UHNtT01jUU5wMytUTmNUNW5wUlNJcW5kYWRVSUVK?=
 =?utf-8?B?WE5sNWhWRzlreDFWd0F4S2UvNTBpUlNIL0c0REdadG5aSm8xZFhCYWREbWxs?=
 =?utf-8?B?dGhUR3NLdHpDVG1tUVVTb05RbmsvRFoyRHgyY25zTzNEelp4NHB4V1B0aFgr?=
 =?utf-8?B?cVUwOTZsOGFVL1orUlN4SHlaL2FIcEk0d1VReFFCVnliekdkQW02bDNLZTcv?=
 =?utf-8?B?MER2R0hjWE43QXhNSUhFTFNWNzd4SDE1SG5LNHZJb0ZGTjIvR0JNclg3STJT?=
 =?utf-8?B?eEplSHNxcmpEMXlIQkZSWTJvdFZEcFI0eVdzQklScC9NTFRUZkxCSnRBNDVH?=
 =?utf-8?B?VlpPMGVDOE5PRDM5dXFsZHR0RWlweVo2VVRkSDJLMjZsZGlXcWh0UVRKdkE2?=
 =?utf-8?B?R2pUS0g3d1FWejlpeWpBWjROazZzVU01aHl0aHl5SEZVaHgwVFRIeWhMQWZz?=
 =?utf-8?B?U2lqc3lSZE5QYlJXdUNBWlNwTXR6aWhXTll3elNiRTRLYjhTUW9kZkhEYzF5?=
 =?utf-8?B?aEtncjZGSmdrc1l4eHJoNGM5UERrd1J2dE90MVIwWS9Ra1FnL3JrMEhTMXJW?=
 =?utf-8?B?VFdGMHJ6ZEdEcDBTTDdFbEd2SzVlbE10TGNYRjdYL08ycDhnOVhmalNLc2Vw?=
 =?utf-8?B?MHYySTBOWU5DT1VsY0hUUzN5WWYwQStFUzlHT3JTMHpyUEFvTG55Z0dXTVJY?=
 =?utf-8?B?YTZ3V0xZbXhSZ2FCTUpLelFXMTBTckd1MGZxRkxXZ2txcVJIc1hVVTUyNDZ1?=
 =?utf-8?B?QW41N2dMR0RQejRlS2J5ZW03alJEY3F1R2s0VVo5VFR4eVR1S0Y5ZkgyendL?=
 =?utf-8?B?aU04SzN2Nk9tNnl2d0RyVXZxaFNiaFk4cXJpSTU3aWpHcmJyUTRKeEM0citP?=
 =?utf-8?B?WHM0c2k0Yzc3NDNsMEozNHF2WldCcDF0bVpNVmZSRGhXVk5neEM2ZmRhTGdK?=
 =?utf-8?B?Z3U2djNmdVpnVU5zT2ZRbHJ2OGxZcHgvMGRDK1hjTzRNM0tNdFl4TUJvRHlo?=
 =?utf-8?B?OEYvemdQL1llMUtudnhSZmtIRDFvT1V6VlVpNW5rNXJzYk9mUG5LTW5QQksv?=
 =?utf-8?B?WHFPaTJ2TFpMYi94THd2MjArYzhNaGRJZWowSEhiUWN5dytpRHEvZ3BCOVEv?=
 =?utf-8?B?MFB3TkFFS0xyT3JBZThQY0l3WVFOOU9PcnUrNC9EemM1bTlPenR6dndnSDFX?=
 =?utf-8?B?dFBuQ2RnWk91Y2JHbjVwT1JVYlBQSmFXQU54LzNPeTZmaDd4THYwdUVMS0tL?=
 =?utf-8?B?M3pzWWpnYUlzaXFTZVJSZkJTSW5DaG95VDNXcHpab1VIZmsva1Z0WmlNL1Za?=
 =?utf-8?B?Rzd6SVY1aHlONFZoNVFLOXRWUmpFMFgyTjk0UFA1NmV1NGptOGRGdjR0QlRJ?=
 =?utf-8?B?U1R3UHBFNVplWVFnd2s2bjVIQnB4KzNxaWk0NDBDQjRLWHo3aXBPbVZsVWNw?=
 =?utf-8?B?ZTRCcnNkWER4NEs2eWZBZ2EvT2czNmlVSVZIUjcxdVNrdWpoeDFYd3E5SVBS?=
 =?utf-8?B?RlIxTWoxTU56SjhDU3BSZEp4eFVjZzU0ZjI2cVlKak8wcVEwMmE0SlJwSCth?=
 =?utf-8?B?M0ttbzdBeVFXbjZMa0lEeG5STEhJYmtVY3Z3R0xxaHZXS3ZoL2RvNzlnc2Q4?=
 =?utf-8?B?WERvMTJvd1pibk9RV3hRZi9ibWhLK0wwZGl3cDhTc2I5VkEwT0VjSUg0Y085?=
 =?utf-8?B?WHhCUE5VMWZmWHpOWWZNYnZOWEhCN1h5a1kzZFR3U3ZlNmdsSDdvNlZKS0oz?=
 =?utf-8?B?eDlIUTIvVFBQNXh3NlE1UHUwR1MvZFV1TGxvOTBLRVNmTy8rU21kaCtTMU1m?=
 =?utf-8?B?Z1Q3Yi8vSGVFVjFoYk5vbjVieWYrblZ1NDl3dUtwS05Lb3R1cU92Y1plRUNN?=
 =?utf-8?Q?6U1XxTRX3qwCl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8788.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWVWdzRFZCsySjVMNUdDRnRwQjM0ODRYV3ZzckVWbHpjSVNjQWM0cENocHVI?=
 =?utf-8?B?cFVMYWtEMTA2UitvaG03aHR0NGI0QzJFMVhhVERMVHd2SktUMk5pTlZTNlRU?=
 =?utf-8?B?cSt6R3lUWDI5M3dPTTEzWWRJL1hRTExxZXZSZGJNYmVKZDFITWE1TlR3M0xj?=
 =?utf-8?B?Qjg5TXhWaWFyb012d0srYmk3amI4eXlORWdrMDZjWG5UQWhQbU5UMkRJZ0pp?=
 =?utf-8?B?Qmh4dHZUemNVY1BBTkdqVndBVkNnKzk5RjVTOXNSMXRTTGo2d08zSFJ4TVFh?=
 =?utf-8?B?c0g2cU5QSzBBNzEzSmVJNEZmM21PcnZkRExON1lrNzAyemNCTWMyS0VzWmFK?=
 =?utf-8?B?QklUdUk0U1BYUWJ5SlBRbFB0TUM4amRMT3h3Zk5TV2RaNWkwYUJCdHkyMDVL?=
 =?utf-8?B?Wlc2ZzdZZnc0aFRWU3RrNnFlMkZLdjg5UHNjK3pvSUk5UmMvWEZZZ2JmNUNt?=
 =?utf-8?B?NWlCajFwajFaRDM4N214Y083OUp5a1RudmlLUG91cGlmLzV2d2dNQmdGdFhK?=
 =?utf-8?B?dDljZlJGY1FvcVg3MUVXNTI3RFE1cXdPZHFiVGh1UlNwTnpEK3lVZWxnNGJv?=
 =?utf-8?B?RzRLN1JwSlhjWXpySmNTem9kNVlvZDYvMGE1VXk4WFViTFM3SjZNeHpTRVFj?=
 =?utf-8?B?WE8zcjRzQkxZQU42clBaV3htWWFVNkNjbm9xN1VCTXhkVmVyKzNPdlYzU3RY?=
 =?utf-8?B?ejdTZ2tDWVNHNHVsWFh3WVh1N1VNM3IvZFlFZmt3bFBUSk1MSkxrYzZiOHJk?=
 =?utf-8?B?Z3JoUmxjZUgyalFoWmJ4cjY4ODNRMSsrKzdmMkNkOE5ydksrQ0t6bVZtTXBy?=
 =?utf-8?B?WDVsYUpzMGE5N1lTZXFOL1l1a0RjcWtZeW5EZ0l2OHNWczg0MmNBVmlSUXhq?=
 =?utf-8?B?UVV3cDd1aTB4d21hY2xVSHBwUnI3VFl1Zm1WdDBzUnJvdmN2bS9TUFpzbkUv?=
 =?utf-8?B?T2Fad1ZBQVpwSzl6TXhTdk5USkZod2xQanMvMmJsL2toUWF5elVnbmFvTkZM?=
 =?utf-8?B?c0RaSDR6Vm9HMWtKaHlRNWJTbjgreG5qbjAyTnBUS2U4YXE2RERWUTFNOVA0?=
 =?utf-8?B?b3pDclJabEsvUHExNEN5eTVuaFYveUxCSFgyOUVwSHJ0clBiVkY4dW9xQVVY?=
 =?utf-8?B?dS9FYWNxZkVvckx2dVhSNnRjejV0Z3c3ZE1BSThhemFka29JS1pFVDBLMUha?=
 =?utf-8?B?WXlYTVFNSk0wdjZEQTdUTHFidjA2SEp1NENRRDRnTEs3S0Z4bjlvUG42aEEy?=
 =?utf-8?B?WHA5aUZNMkpkUVlISndiMnVjUW1iUVFhNlZOdFAwUEpURUZUMCszNUtqaDBp?=
 =?utf-8?B?K25UOG9HRkhjMkhoSzFGdzhxZUNIVDdpYkZFUXI0WDhjSjJ1M2NFTmNVYnBp?=
 =?utf-8?B?LzhWT21wK3Brcnh1dEtHTWxLNWFlY2dIRis1b3dEdko2THVoUVVXcTRDcy9y?=
 =?utf-8?B?WkowRHRuSEVWR1NRRHVnZHcxT3VtaEVaby92RWhRYzVFWFI4SFZUYXM0dEdZ?=
 =?utf-8?B?akNza0hLWEtic3NXdU9jS2NybGF1VS9ZWXA4N2plZEJFWU9TbDJtSEJFWlg2?=
 =?utf-8?B?ZGhMRFZTU1ZZNEIxcmtML0V6dStQTW93b0wzTjBlNFdMM1JET3RHNlpSMFp2?=
 =?utf-8?B?TUlHL3B5WHBEaXlCNG1salBWcU5NMFhIMm81RHM4RzBtMkZwMlBwamxodGVM?=
 =?utf-8?B?OWo5U0xBQUZOZmdhNkx5eU5uUGZROW1VRXRIZ09Yb29PSEtMb2xJcjJnOVAz?=
 =?utf-8?B?SjlDM0NMenlSM3MrSm1DcUt5Wk14VytFWXhicitPK2huLzMxQXlHV3VaV0Q4?=
 =?utf-8?B?bCtVaDVBV2VJR0JXRDlvRkwveUxiT1VhOFpLUkRocGt2QUVaVThocExUVXpj?=
 =?utf-8?B?S0xBbForeW92MnNzQk1TQjEzem5GZ092bnU5NCswd0FkczFDZ0NFUHBvUzUz?=
 =?utf-8?B?cWU1VzVpd1dUU0lWQkV5YzVtcy9mRG1UN3FJR2k2RGEwbUlqYmVYbDVRRlgv?=
 =?utf-8?B?dXgvVm1wLzZETDBGaUtoZnRNWWIrRmora294VzQrUzRZeG5TVUQ5TmZ1Q0Vy?=
 =?utf-8?B?aDVQRjd5VEx2ZGdWUllRWEh1TlBhWkdSSWdBTk02NnlndVVoa0FrVkV0bHhV?=
 =?utf-8?B?Yys5Q01OdGhiWWk3RVVyUEkxR3RjZTZxUTNneXlhQjMwMEdPZTJlaTh5Q3Zt?=
 =?utf-8?B?VlE9PQ==?=
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
	ib6OTds17MrrRCzgOVGXGCSDAjTrhiPYQxrlQgb/1+8+QQzalXKp+VVHxz2VXAJ6Ws7O9usudDuJA9wzJNmY4f/0HeRLbOE0/ta0HnQjHX4qN8+67XTPk9uuOb/gsPTCqggWxoIDkx6yot1eOeOCATsDIXZGMTujuJVybEGmlOgG+eJkj9Bm6CK9IOhjMl1brvaxt/0OLnDeJwdCG+zy6xZ1dBB4jfyizDaARICsgAWDXr1P5F4o5PxqEDUQqb36CsSnSedXG0YJzvBhUwQaFNBWaTQx4wyuQ39LzKz9P+SGY5S5IsSLh/Z+mjaxid2xKcYfptAsxQFOnknHmnUPex95FEkMvBU99R14w8FyEEFixfMYG3+L/0o+Ah0C1LzJS0Gk+5l9x1rbUC42+bdzTj/WsL4e1crlOMIlfQfw8PgytrIsQZREAbniSidzglzzlc0ngX5Xemtjk0vUdFGVOXti3V0XkRMCfq85ZflNLqSGGgeMfsnYxalFS4giO8eqwsvqAXcQ4FpjXIUmErF8J7hj34gGo/MGeUIo72Xitw5TTFdaaku5DZyCI7ukpuLy7RSRX+I8NsbdKHWUlMH9mNtEJb9GKSqgS0CuXrCkHNA=
X-OriginatorOrg: nds-osk.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8788.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cac244-31cc-43ac-47e3-08dd40c6de9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 00:41:43.8934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53277b59-1e3c-4f28-81c0-97a49bdc7131
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J521Ab/7Bzgal1KmNYsZkCYg/P6iaIPHFSF+Q3nOMNBtof2XX7D8n1szXCY5tvwXtKhe9vvjvNd9h7RLST06v+gLu9vGZw7nLmtaEmf+HQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12125

VG86IEtlcm5lbENJIGNvbW11bml0eSAgIA0KQ2M6IERlbnlzIEZlZG9yeXNoY2hlbmtvDQoNCkRv
ZXMgYW55b25lIGhlcmUgYW5zd2VyIHRoZSBhZGRpdGlvbmFsIHF1ZXN0aW9uID8NCg0KPj4gSG93
IHNob3VsZCB3ZSBhdm9pZCB1c2luZyBLQ0lEQiA/IChidXQgd2Ugc3RpbGwgd2FudCBzZWxmLWhv
c3RlZCBkYXNoYm9hcmQpIFdlIGhhdmUgc2VlbiBhIGxlZ2FjeSB2ZXJzaW9uIG9mIHRoZSA/Pj4g
ZGFzaGJvYXJkIGZvciBLZXJuZWxDSSwgYnV0IEkgY291bGQgbm90IGZpbmQgc2V0dXAgZ3VpZGUg
bGlrZSAiZ2V0LXN0YXJ0ZWQiLg0KDQpUaGFuayB5b3UuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiDmnpcg5ouT55yfIA0KU2VudDogTW9uZGF5LCBKYW51YXJ5IDIwLCAyMDI1
IDQ6NDkgUE0NClRvOiBEZW55cyBGZWRvcnlzaGNoZW5rbyA8ZGVueXMuZkBjb2xsYWJvcmEuY29t
Pg0KU3ViamVjdDogUkU6IFF1ZXN0aW9ucyBhYm91dCBrZXJuZWxDSSB0b29scw0KDQpUbyBEZW55
cyBGZWRvcnlzaGNoZW5rby4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHF1aWNrIHJlcGx5Lg0KDQo+
PiBZb3UgY2FuIGZvbGxvdyBpc3N1ZSB0byBzZWUgd2hlbiBpdCBpcyBmaXhlZC4NCg0KSSBjaGVj
a2VkIGFuZCBhcHBsaWVkIHRoZSBwYXRjaCBvZiBodHRwczovL2dpdGh1Yi5jb20va2VybmVsY2kv
a2VybmVsY2ktYXBpL3B1bGwvNTkxIHRvIG15IGxvY2FsLg0KVGhlbiBJIGhhdmUgc2VlbiBpdCdz
IHdvcmtpbmcgZmluZS4gVGhhbmsgeW91IeOAgChCdXQgdGhlIGlzc3VlIGlzIG5vdCBjbG9zZWQg
eWV0Li4uKQ0KDQo+PiBUaGF0IHNhaWQsIHdl4oCZZCBsb3ZlIHRvIGhlYXIgbW9yZSBhYm91dCB3
aGF04oCZcyBtb3N0IGltcG9ydGFudCB0byB5b3XigJR3aGV0aGVyIGl04oCZcyBwcmlvcml0aXpp
bmcgdGhlIHNlbGYtaG9zdGVkIGFzcGVjdCBvciBhbnkgb3RoZXIgZmVhdHVyZXMuDQoNCk9uZSBv
ZiB0aGUgbW9zdCBpbXBvcnRhbnQgdGhpbmdzIGlzIHRoYXQgd2UgZG9u4oCZdCB3YW50IHRvIGV4
cG9zZSBhbnkgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGJvYXJkIHdlIGhhdmUgdW5kZXIgZGV2ZWxv
cG1lbnQgc3RhdGUuDQpJbiB0aGF0IHN0YXRlLCB3ZSBzdGlsbCB3YW50IHNlbGYtaG9zdGVkIEtl
cm5lbENJIHRvIG1hbmFnZSBvdXIgdGVzdCByZXN1bHRzIGFuZCBwdWJsaXNoIGl0IGZvciB0aGUg
bGltaXRlZCBudW1iZXIgb2Ygc3Rha2Vob2xkZXJzLg0KRmluYWxseSwgYWxzbyB3ZSB0aGluayB3
ZSBjYW4gc2VuZCB0aGUgTFRQIHJlc3VsdCB0byB0aGUgS0NJREIvZGFzaGJvYXJkIHRoYXQgaXMg
bWFpbnRhaW5lZCBieSBMaW51eCBmb3VuZGF0aW9uLg0KDQpTb3JyeSBpZiB0aGlzIGlzIGEgcmVw
ZXRpdGl2ZSBxdWVzdGlvbi4NCkhvdyBzaG91bGQgd2UgYXZvaWQgdXNpbmcgS0NJREIgPyAoYnV0
IHdlIHN0aWxsIHdhbnQgc2VsZi1ob3N0ZWQgZGFzaGJvYXJkKSBXZSBoYXZlIHNlZW4gYSBsZWdh
Y3kgdmVyc2lvbiBvZiB0aGUgZGFzaGJvYXJkIGZvciBLZXJuZWxDSSwgYnV0IEkgY291bGQgbm90
IGZpbmQgc2V0dXAgZ3VpZGUgbGlrZSAiZ2V0LXN0YXJ0ZWQiLg0KDQpUaGFuayB5b3UuDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBEZW55cyBGZWRvcnlzaGNoZW5rbyA8ZGVu
eXMuZkBjb2xsYWJvcmEuY29tPg0KU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDEyLCAyMDI0IDU6
MDggUE0NClRvOiDmnpcg5ouT55yfIDxvX3Rha3VtYS5oYXlhc2hpQG5kcy1vc2suY28uanA+OyBr
ZXJuZWxjaUBsaXN0cy5saW51eC5kZXYNClN1YmplY3Q6IFJlOiBRdWVzdGlvbnMgYWJvdXQga2Vy
bmVsQ0kgdG9vbHMNCg0KSGVsbG8g5p6XIOaLk+ecnywNCg0KMS4gSSBndWVzcyBpdCBpcyBhYm91
dCBLQ0lEQiwgd2UgaGF2ZSBpdCBwbGFubmVkLiBXZSB0b3RhbGx5IGdldCB3aHkgaGF2aW5nIGEg
ZnVsbHkgc2VsZi1ob3N0ZWQgS2VybmVsQ0kgc2V0dXAgd291bGQgYmUgdXNlZnVsLCBlc3BlY2lh
bGx5IGZvciB0ZWFtcyBsb29raW5nIHRvIGF2b2lkIGV4dGVybmFsIGRlcGVuZGVuY2llcyBsaWtl
IEdvb2dsZSBDbG91ZC4NCg0KTWFraW5nIEtlcm5lbENJIHNlbGYtaG9zdGVkIGlzIGRlZmluaXRl
bHkgb24gb3VyIHJvYWRtYXAuIFRoZSBnb29kIG5ld3MgaXMgdGhhdCB3ZeKAmXZlIGFscmVhZHkg
c3RhcnRlZCB0aGlua2luZyBhYm91dCBpdCwgYnV0IHdpdGggdGhlIG51bWJlciBvZiBmZWF0dXJl
cyB3ZeKAmXJlIGp1Z2dsaW5nIGFuZCB0aGUgc21hbGwgdGVhbSB3ZSBoYXZlLCBpdOKAmXMgdGFr
aW5nIHVzIHNvbWUgdGltZSB0byBnZXQgdGhlcmUuIEZvciBleGFtcGxlIG9uZSBvZiBmZWF0dXJl
cyB3ZSBhcmUgd29ya2luZyBvbiwgaXMgbWFraW5nIHN0b3JhZ2UgYmFja2VuZCBtb3JlICJjbG91
ZC1pbmRlcGVuZGVudC1mcmllbmRseSIuDQoNClRoYXQgc2FpZCwgd2XigJlkIGxvdmUgdG8gaGVh
ciBtb3JlIGFib3V0IHdoYXTigJlzIG1vc3QgaW1wb3J0YW50IHRvIHlvdeKAlHdoZXRoZXIgaXTi
gJlzIHByaW9yaXRpemluZyB0aGUgc2VsZi1ob3N0ZWQgYXNwZWN0IG9yIGFueSBvdGhlciBmZWF0
dXJlcy4gSWYgdGhlcmXigJlzIGludGVyZXN0IGluIGNvbGxhYm9yYXRpbmcgb3Igc3BvbnNvcmlu
ZyBjZXJ0YWluIGFyZWFzLCBpdCBjb3VsZCByZWFsbHkgaGVscCBzcGVlZCB0aGluZ3MgdXAuDQoN
CjIuVGhhbmsgeW91IGZvciByZXBvcnQsIHllcyBpdCBpcyBhIGJ1ZywgbGlrZWx5IGFwcGVhcmVk
IGR1cmluZyBvdXIgbGF0ZXN0IHB5ZGFudGljIHVwZ3JhZGUuDQpJIG9wZW5lZCBpc3N1ZSBhbmQg
d2lsbCB0cnkgdG8gZml4IGl0IHRoaXMgb3IgbWF4IG5leHQgd2VlaywgYXMgaXQgaXMgY3JpdGlj
YWwgZm9yIHVzZXIgbWFuYWdlbWVudCBidWcuDQpodHRwczovL2dpdGh1Yi5jb20va2VybmVsY2kv
a2VybmVsY2ktYXBpL2lzc3Vlcy81ODkNCllvdSBjYW4gZm9sbG93IGlzc3VlIHRvIHNlZSB3aGVu
IGl0IGlzIGZpeGVkLg0KDQoNCk9uIFRodSwgMjAyNC0xMi0xMiBhdCAwNDoyOSArMDAwMCwg5p6X
IOaLk+ecnyB3cm90ZToNCj4gSGVsbG8gY29tbXVuaXR5Lg0KPiANCj4gSSBhbSBjdXJyZW50bHkg
dHJ5aW5nIHRvIHJ1biBMVFAgdGVzdCBvbiBMYXZhTGFiIHdpdGggTWFlc3RybyBhbmQgDQo+IEtD
SURCLg0KPiBBbHNvIGhhdmUgY3VycmVudGx5IGNvbnNpZGVyZWQgYnVpbGRpbmcgYWxsIG1vZHVs
ZXMgb2YgS2VybmVsQ0kgIm9uLSANCj4gcHJlbWlzZSIuDQo+IHRoZW4gSSBoYXZlIHR3byBxdWVz
dGlvbnMgYWJvdXQgdGhlIHdheSBJIGFtIHRyeWluZy4NCj4gDQo+IFF1ZXN0aW9uIDHvvJoNCj4g
SXMgaXQgcG9zc2libGUgdG8gZ2V0IHJpZCBvZiB0aGUgZGVwZW5kZW5jeSBvbiBHb29nbGVDbG91
ZD8NCj4gKFNvIEkgYW0gbG9va2luZyBmb3IgdGhlIHJpZ2h0IHdheSB0byBidWlsZCBLZXJuZWxD
SSBvbi1wcmVtaXNlIG1vcmUgDQo+IHF1aWNrIGFuZCBlYXNpZXLigKYpDQo+IA0KPiBRdWVzdGlv
biAy77yaDQo+IEkgZW5jb3VudGVyZWQgdGhlIGVycm9yIGJlbG93IHdoaWxlIHRyeWluZyB0byBi
dWlsZCBNYWVzdHJvIGFuZCwgDQo+IHRyeWluZyB0byBnZXQgdGhlIEFQSSBhY2Nlc3MgdG9rZW4g
Zm9yIGNvbm5lY3RpbmcgdG8gdGhlIGtlcm5lbGNpLWFwaSANCj4gY29udGFpbmVyIGZyb20gdGhl
IHBpcGVsaW5lLg0KPiBGb2xsb3dpbmcgc3RlcHMgaGVyZSBJIGhhdmUgdHJpZWQ6IChSZWZlcnJl
ZCB0bw0KPiBodHRwczovL2RvY3Mua2VybmVsY2kub3JnL2FkbWluL2FwaS8pDQo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gU3Rl
cCAxLiBSdW4gYmFzaCBpbiB0aGUga2VybmVsY2ktYXBpIGNvbnRhaW5lci4gJCBkb2NrZXIgZXhl
YyA/aXQgDQo+IGtlcm5lbGNpLWFwaSAvYmluL2Jhc2gNCj4gDQo+IFN0ZXAgMi4gQ3JlYXRlIGFu
IGFkbWluaXN0cmF0b3Igd2l0aGluIHRoZSBhcGkgYXBwLg0KPiAkIHB5dGhvbjMgP20gYXBpLmFk
bWluID9lbWFpbCDigJw8YWRtaW5pc3RyYXRvci1tYWlsLWFkZHJlc3M+4oCdDQo+IMKgwqAgKHRy
YXBwZWQpIGVycm9yIHJlYWRpbmcgYmNyeXB0IHZlcnNpb24NCj4gwqDCoCBUcmFjZWJhY2sgKG1v
c3QgcmVjZW50IGNhbGwgbGFzdCk6DQo+IMKgwqAgRmlsZSAiL3Vzci9sb2NhbC9saWIvcHl0aG9u
My4xMS9zaXRlLSANCj4gcGFja2FnZXMvcGFzc2xpYi9oYW5kbGVycy9iY3J5cHQucHkiLCBsaW5l
IDYyMCwgaW4gX2xvYWRfYmFja2VuZF9taXhpbg0KPiDCoMKgIHZlcnNpb24gPSBfYmNyeXB0Ll9f
YWJvdXRfXy5fX3ZlcnNpb25fXw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIF5eXl5eXl5eXl5eXl5eXl5eDQo+IMKgwqAgQXR0cmlidXRlRXJy
b3I6IG1vZHVsZSAnYmNyeXB0JyBoYXMgbm8gYXR0cmlidXRlICdfX2Fib3V0X1/igJkNCj4gwqDC
oCBDcmVhdGluZyBhZG1pbiB1c2VyLi4uDQo+IA0KPiBUaGlzIGFib3ZlIGVycm9yIEkgZW5jb3Vu
dGVyZWQgZG9lcyBub3Qgc2VlbSB0byBiZSBmYXRhbCBhcyBmYXIgYXMgSSANCj4gcmVhZCB0aGUg
S2VybmVsQ0kgaW1wbGVtZW50YXRpb24uDQo+IHRoZW4gSSB3ZW50IHRvIHRoZSBuZXh0IHN0ZXAu
DQo+IA0KPiAzLiBPYnRhaW4gdGhlIHRva2VuIG9mIHRoZSBhZG1pbmlzdHJhdG9yIGluIHRoZSBh
cGkgYXBwLg0KPiAkIGtjaSB1c2VyIHRva2VuIGFkbWluDQo+IEVycm9yOiBLZXJFcnJvcjogVmFs
dWUgbm90IGZvdW5kIGZvciBOb25lDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gSXMgdGhlcmUgYW55IG1pc3Npbmcgc3RlcHMg
SSBzaG91bGQgZG8gYmVmb3JlPw0KPiANCj4gVGhhbmsgeW91Lg0KPiBIYXlhc2hpDQo+IA0KDQo=
