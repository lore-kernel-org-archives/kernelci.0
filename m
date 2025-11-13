Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012027.outbound.protection.outlook.com [40.107.200.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4012FFF8B
	for <kernelci@lists.linux.dev>; Thu, 13 Nov 2025 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038423; cv=fail; b=d68NHj7/u4ek++Ndkv1sJDL+Ez+HEdi5XTrsjf73lOq4STmLITP50XLX8iHPAuKaaUpMbSdr+D0qujFosEmBQP2ORV0saTdnAoam6OAav/93pCAg66NNYmueUJTjhLcUjovKYOQm0Iz+pAI41fu5pmHfQgOVqNzbDlYj8b943Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038423; c=relaxed/simple;
	bh=nN7H4kHxz9Rc6kOcYnoh9SQYFhRsfDQ4adyBgtdI7CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n6yOS8lvBNetk/lazsUPrKL1oDMTgssM6sdJmFVgdAfP+dDtK2GKt+ZD1bP+z6qvcNvO0yfKCzwhDHcGheMnGB1JfDpeAwgy0RhCT99viK1QMUkJWiBhLa0uCBmMcAkj7q/SLBDgb1XONClTJDGl11tWBVOFMnLgpqPL4Pgphpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kTHWbxvx; arc=fail smtp.client-ip=40.107.200.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kTHWbxvx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUDXE4flTH2+1U6Em564qmYyb7I85CjF8tJowMsW981xK3YzoJvv3ZOuR5qxqKICi7q9V62v7TZDX1x6QGC7YdhGuGB2jrv1RhQY5f5lxG3hWR67+0Jt1qk1D8sbzgUDBvYXatDsibBQyolQ4H4K8qjEGBAvvl/eEhadivTa1lT2r0MP2jJs5SEixUWdfOAoOZNy+MV4KukohRrj9bZg52J2G25Izoj4RpAPZJcyNFn9xo2GSb3mZs6rdjzAep7cVe3dL+fxFKvWUh3G6u4wvnSorUkCelrWThfcADkBF6PaR/HwfK7/njxmxn5H3xJS52xCINziK7IUzI5NyLipOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtgdjqqVePfUSJOhkfGGrAaCpheMAgN0pKeR6z8k6OY=;
 b=A9nFB5nLaXvWFB/IGXwBJG4hYJiUuWkam+cE4V/LQfd3meUbz4r24o1JQ3RWkrYLKDOxmLhviwKpSwJ2bL5L/iQjF77aZ/qaoiXlA8AfgX7qoXSjwm0H7HPtOO8ss1aXL8475ln/Du/ml30Ztf08Oi6J5ijz4aDnYAkufaDyuRLGZtTxX06QDLtQzbHYA8NdIZi8wJxKAiBPtbJek4MXUttMSsgW+uzjIIwb6uBRzbqJHwXzd+aRlxBtV1S1RyRSsWtcCREtvgquhJXoAT17OuoKnFrRtdiV823SGtRQGzCIN/VJWVYSC9lCckao+Vz+J5M83aFBVL0E0f4VMpVh2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtgdjqqVePfUSJOhkfGGrAaCpheMAgN0pKeR6z8k6OY=;
 b=kTHWbxvxvryrBf84oP0d8Nn9/Mk5Q7yvt00kqtwXDCjDGbjrM7t9JrCMCrYlhESJDDNfYR3kPEMRiqWA6W+RcXWCV2f2Pto+QLJAK/3K9v2dxuDsdCrnULPsBTY2CDqntDC/DcTSv/6W7FdRJctcQP+I2hPBXCt+l8d5uJ3PnZs=
Received: from PH7P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::23)
 by PH3PPF077CE0592.namprd10.prod.outlook.com (2603:10b6:518:1::785) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 12:53:37 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::9b) by PH7P221CA0025.outlook.office365.com
 (2603:10b6:510:32a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 12:53:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 12:53:37 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 06:53:35 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 06:53:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 06:53:35 -0600
Received: from [128.247.81.151] (uda0271612.dhcp.ti.com [128.247.81.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADCrZ76248836;
	Thu, 13 Nov 2025 06:53:35 -0600
Message-ID: <ceef491a-ebfe-b6c7-0f61-3c30736f3d53@ti.com>
Date: Thu, 13 Nov 2025 06:53:35 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Hardware registry schema proposal
Content-Language: en-US
To: Ben Copeland <ben.copeland@linaro.org>
CC: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>, "Menon, Nishanth"
	<nm@ti.com>, "Sheraw, Barry" <bsheraw@ti.com>
References: <4e471946538c47cd9d000fa7ba31044e@ti.com>
 <CAL0q8a5Wu0x2+bxnRCTEgfefPdsT2PvCvoQLAQ=2sMuWgXBhvQ@mail.gmail.com>
From: Minas Hambardzumyan <minas@ti.com>
In-Reply-To: <CAL0q8a5Wu0x2+bxnRCTEgfefPdsT2PvCvoQLAQ=2sMuWgXBhvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH3PPF077CE0592:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1f528b-f619-46fd-bdff-08de22b3a995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|3613699012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3laUEhEeEdwaHlTRTcwOEFsNTJGWnVpUWJyUXA4MlVaalhYalgrR0o3dkUr?=
 =?utf-8?B?YjdDSk9uYzB5eXE5Z3Z6dnQzWHE3Y1lrN2NuSzVQb2c4SWZBVDkrRFFTbmxP?=
 =?utf-8?B?d1NIMk53eE02WVZNOCtyU2lIandYNUh2NDBGQkRoZlhZckQvbi9pK2lmTDg4?=
 =?utf-8?B?MnJPMnd0VUg4N0UzclA0bG5qd1FlYjYyWjBzOENveHJRMTQwdDJhbFhRTzQ1?=
 =?utf-8?B?SUJYL2loUU4wYVo2ajMvT256YjdVaVBYckdKNnNzMXRoNUdGWkNoVHdHRnZW?=
 =?utf-8?B?dnl2NUd2WHl4ZzlpNFdseURUNWluUk5SMXdiNVB2NlU4eERPRkNVYktqcjJK?=
 =?utf-8?B?clVZRlFvclRxSElFSDVBLytucDRnTGVIVVIrVFhUVkM4WG01Tk5tMzE0d2hv?=
 =?utf-8?B?MHo4M0IzS2ZEeDlFMmtRVWJRYlZ2cyszLzhsLzFUTUpoTXN0MllqWGFNZTk2?=
 =?utf-8?B?R25KZGVCMFEzTkRhUE12QldpcE1pTi9aZFIvQm1LWEdFak5mMlZJM2JucEdR?=
 =?utf-8?B?c1E0ZkVxU2lJUmkreGJGWE1VNGZXZkRRU0NHa0VVSE9oamQ4YVM3N0Z2d0tS?=
 =?utf-8?B?a1B6QlN5aW9aL0Q5cXd5SjNSbUlQSytIVWF0TERmOC82Ni95Q1JQNkg0UkNP?=
 =?utf-8?B?QzNxci9ROWlxMzdwL1FYTFh4WWpzOEFSditnL2NDSU96bnM0MGlNN0lHSGIz?=
 =?utf-8?B?VGU2OGxVVkQ2T3JLVmFWaEVyWmJ1Mzd4bktNSkpFVVBHVERYdmF2WE5ncU5K?=
 =?utf-8?B?ZmozVkR4NERGc3JRL1R1UzMzOU8wbEFueUZzZVR4L1BZdjNXZm5DOVFUL1c5?=
 =?utf-8?B?Tk9mb3BHWEhYeGJ5SDhZeUxtUnYxK0Y5M1o5WEhRQjdSZVFEVkpxbkxXbWdt?=
 =?utf-8?B?NzBiaHFqU2JzM3ZBM2VPblJYMXBXQnpMUnVNdmVQRkUzT29TY21OTEt2TXBO?=
 =?utf-8?B?anFHc3JsMUhYTFZJNGV4M0grUDhCWTY0R0NHVjM1SFNEeExQejV5bEZKNzlX?=
 =?utf-8?B?ZGtUL2tCKzBSMXNDSlFmaHNUdXZXejR4RHN1cVk4WmZWcUpHS09DMkpCYnRL?=
 =?utf-8?B?QnB6cHE4Q05ydkQyY2ZIZGQ3YmdMbTcybVJmb0Y5WmtZU1BHTnZycVoreEYz?=
 =?utf-8?B?K2ZhTHp5bXVWdXJxQ3Q4aEVIcVlva0dWUTNxa1ZDemVIeW1ZdTZ5ZUlEWHk2?=
 =?utf-8?B?cFNNVGlPUUlNNndqd0o2WXV0UHpOTnVML2hyK09oa05jdWRWM004RWJBclJr?=
 =?utf-8?B?L001WEdqc0NPS1FsNDBOZEVkL0JnL2FGV3lIK1BSWmJsbTRmNDlTVnEyVVF4?=
 =?utf-8?B?TTZ2TlRIUCtReFptYzBKVlFveHN6UVR0dXpaZEhlWFAyYzM0V201NFprTytx?=
 =?utf-8?B?NGRyVzhyaGJDdmJyS3hYcDVQZFVQazl5RHRIazN5TS9lYjVuUmwzUzloWWoy?=
 =?utf-8?B?b2pkeS9XUlYyVXdBSGF0clpnUGpPMjRoOHloTWJZZjJ0Rk92cDU2YzZ4aTZL?=
 =?utf-8?B?Nk81VVJQKytKeTBIeVBxRWUxelhmajBoQndCWEg2M3lQN1I1bXBHRC9TMk90?=
 =?utf-8?B?Rkl5UEs0VGhDSC8wYzRWKzdHekxHcFh5cld2dVkzZ2lwSGMybEJzVDNlK3R6?=
 =?utf-8?B?MDh6TStacEs5d3lST3R2SitNd2kvUDZ2R2NSL2dMMjNIdHVOQ2EvakRwVkwy?=
 =?utf-8?B?THliQzhEdDExQTdhaG84TEtTb0ZsQ2YwampiNzk3VFRKeW9BV1hhRkQ0TE5z?=
 =?utf-8?B?ZlNMK1ZuWCtzekR6clNQeEVOaDlJbGVGYjk5b1JyTWREMGx0RDJmNVNZYU55?=
 =?utf-8?B?b3JwcHpkYTBuNzlBMVRZaU9NNTNJMS9ONndQUWVXcGxMb1hnZDVCOEV3U2Mw?=
 =?utf-8?B?WlFMam1nTDdrTEdOa21MVG4rTUJmTUdvaHhYSHRlTGoyY3dxTS9wcW9VbEVZ?=
 =?utf-8?B?OTE2RHA4SHByZ3JKYURkVWtLbWkxdVJZWWt6cXVTajg5cGNWbHpQdEhrczAz?=
 =?utf-8?B?eWJ6bEllZEpVRnFCNC9adnR1U2tBY0g2czllZVY0Y2NQcTRWTmZ1b3orUFBV?=
 =?utf-8?B?ZGtnZ0l2WWNYVnp2dWYwaFZKdEpxODRtUjZKTEdTRDZ3ZGx4NkJrSlkzcnpp?=
 =?utf-8?B?QUdoL1NRVnBPbG1XeXBnaDZBL0lISGVtUFpCWHlXYWVGNWRNSlk1ZzZoaFFz?=
 =?utf-8?B?aFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(3613699012);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:53:37.2055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1f528b-f619-46fd-bdff-08de22b3a995
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF077CE0592

Hello Ben,

On 10/9/25 03:19, Ben Copeland wrote:
> Hello Minas,
> 
> On Wed, 8 Oct 2025 at 22:20, Hambardzumyan, Minas <minas@ti.com> wrote:
>>
>> Hello,
>>
>> I signed up a couple of weeks ago to propose a schema for organizing information about the hardware tested in Kernel-CI labs.
>>
>> Please review and share your comments on a proposed schema here:
>> https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/main/hardware_registry/hardware_registry_schema.yaml
>>
>> along with an example yaml file here:
>> https://github.com/TexasInstruments-Sandbox/KernelCi-collaboration/blob/main/hardware_registry/hardware_registry.yaml
>>
>> In summary, the schema defines following main sections with cross references:
>>
>> * silicon_vendors: A collection of silicon vendors (processors, SOCs)
>> * platform_vendors: A collection of platform vendors (servers, laptops, boards, etc.)
>> * processors: A collection of processors used on tested platforms
>> * system_modules: A collection of system modules (SoMs, SiPs)
>> * platforms: A collection of platforms tested in labs
> 
> I think it would also make sense to add revisions in.
> 
> If you look at LAVA, you can see the messiness of not having revisions
> https://gitlab.com/lava/lava/-/tree/master/etc/dispatcher-config/device-types?ref_type=heads

I added version to the schema and example -- please review (committed at 
the same URLs above).

Minas

> 
> Ben
> 
>>
>> Regards,
>> Minas.
>>

