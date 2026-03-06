Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959534B663
	for <kernelci@lists.linux.dev>; Fri,  6 Mar 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810760; cv=fail; b=tw03ZklYSOitNAwsN/YrFwx5uUiepnOEoDinAvPl4PRZasC98jxhPiwbQTcOqxtnrSsfcr14z9PtmuwRCTitcnZxJLISvDQSmFqGK0FswTNyGw7GTtx891G87wNex+wr1XJpb1HbgbB4SswdmXN9356UFo9SQWFvr9mFTwhCJXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810760; c=relaxed/simple;
	bh=SxxeGN8o2HZktYUsJzuRgc+YwTOADq/tF/a7cOw+fsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cVq/XgEnHz8JDaV4aIDV3cftrMMhaJg+zTcXjPtVying7widxv5g8NbnP2Byl7263c3HGIq7hO0IGjtmMzXcSxr/AnAgWmVqHgeqTKsSQEEqOGuIv1it4UxNXvEOZlW/WttzoH93kaICjZBdywqc8B/m9qvrLeFCeOWxVmED6jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l888zZsT; arc=fail smtp.client-ip=40.107.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l888zZsT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYJyJovXjDux51MJQj8vnLNZGOwbCSCHQ548jb3gyEgEiOccnWHB1+FSCJc2glkSg9tnJ0cV+0KJFJMwGExgDeejieAKoSiKDFk2M2GWTHQ0fRSZK9VibWmWl1HWCVRRkbaQxVWVlOak1U1CAbISexwoXxRTjvTpTPtoBnzys3J7G8XNv42yz9G+HNxfYRnAxxbAgWGw+0sk+Nvxg1KZCOhB8gCZpR3Ibk5xg1C3ZcA7mVd0eL91pYqLLPVHibHesF4lo3f0nurCBMo1rY642at21TWkt1WuzzpWA3Lyv37kC5kDBSOMxULt3W+De7jIw7jS5ayJ6LDeIVMtL8nw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAqWXmhAmQUiaM2mGXlEr4u0xKgDiPY9JnA/LHNjnSI=;
 b=szWdDvGhhoodxtNH8ocGNtbVY3BdbHopmKqF+Pa80e6hVhtdzE1RNMlG2cCcy4+UsrE4cEj+U+XfIpxicTcD+2gynELDwGzPeCrByLIQyQ/+Sah3LeP9S9W5UEolKhKkuW59Gm+aJkaYCygtpF748hgUNaPSs47e93A2xRECdQE42+POCe3yUsPNxTa4jtvWD5CQaGWdYlchbIOYsyeGNNAIt0e/8+4LytAmdZsqoNgcytyMyHTFCK4vScwS2r34pEUA7z0RNu+w7UOBGzbOzPvLcviPeqk469IJwI1O62GsJZvHXddlSc/1vJbyS8LBpdmRbqsBUny1b8GubPL0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAqWXmhAmQUiaM2mGXlEr4u0xKgDiPY9JnA/LHNjnSI=;
 b=l888zZsTzmKkHQwfSRQoyMDWCGO5DG9PkVQwz8LO3eEVwjgq9EUvpyjTA/vYPtHMjfR9zLDi0MnG4iW+MsPBB94dzv4/kJTaj5QhLRvQjK91hy5toyx+CkM+hBhoMYnluSrkHZrBD+HfO05Irk5KjLKW/9LwsSUuah5E9rGUojU=
Received: from BN0PR04CA0024.namprd04.prod.outlook.com (2603:10b6:408:ee::29)
 by DS7PR10MB4895.namprd10.prod.outlook.com (2603:10b6:5:3a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 6 Mar
 2026 15:25:55 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:ee:cafe::eb) by BN0PR04CA0024.outlook.office365.com
 (2603:10b6:408:ee::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 15:25:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 15:25:53 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 09:25:09 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 09:25:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 09:25:09 -0600
Received: from [128.247.81.151] (uda0271612.dhcp.ti.com [128.247.81.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626FP9fJ331833;
	Fri, 6 Mar 2026 09:25:09 -0600
Message-ID: <6e57a9b1-f54f-0062-af2c-f15d599af9bd@ti.com>
Date: Fri, 6 Mar 2026 09:25:09 -0600
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Meeting proposal for KernelCI Bisection
To: Yogesh Lal <yogesh.lal@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>
CC: Ben Copeland <ben.copeland@linaro.org>, kernelci lists.linux.dev
	<kernelci@lists.linux.dev>
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <7a042ff1-4360-4dcb-97df-7b49f3c5f8b1@sirena.org.uk>
 <CAOUSUDo-uFc88m4LkG=oM42frEpT27F_EYQE=KL-+-yNjyrn0A@mail.gmail.com>
Content-Language: en-US
From: Minas Hambardzumyan <minas@ti.com>
In-Reply-To: <CAOUSUDo-uFc88m4LkG=oM42frEpT27F_EYQE=KL-+-yNjyrn0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|DS7PR10MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1c360b-508b-4b0c-86ae-08de7b94a83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|34020700016|1800799024|3613699012;
X-Microsoft-Antispam-Message-Info:
	BRnBabgIHVvdu66UKfr0baEpkbndq5WwQzmPvZb5oVO/LsOwmHyNp28QQwKVvQ47OjQmCgLlKO2YpEzBN7DDkFcox8E4NxR1F+ZaXdn/MpLf639ovsD/96pdn1vgY8RokL6ywe2H37sxp4fYTrcC1SkYqs6ygq4d4FXEVgBcC4oiDX6iniFkjn/wPVF1a4ArIOJ7MifDbK49A/3q4KnJIlDgrLYakqde8JwJ34+MIZxYwF/RQCQ3JoG7z0SKHn1xuapojwiHXtTuelkpvrtnEBzznWEXv8AA1wCWuV1i+7DcqjeWpqYg2kYdnuZgGQsTATjvhH3e0g/8cO8lFqc/um7bCfOgdeAg9LyZLZKB1726SVdMF9RrNKRXp8D0nmKwGap2kIpAeeTPuWzIkj/rZxYnfKyXfvMJSbpMyryotGEjLR33x0QGLANyatlkQQP4ypLvC9kzKkftNicz3Xj9o7XZuKCRw+4emLU4+Os7HOz4DHQwGLpI7CceuKo7UZ9HpTkDx+/vhn7LKtLaaXST1xt0bQUv2h2BHMBg0Y+DLGUQChWs68tJkJIAJRpbPdvEFm0yjP7JcvuG9dg9VuHEyNcfQ3p8jXU1XPRIgILUJsb++YG9cZEDiBw2twqATLvyRMlPWvqzkkWO9+ZZvQGvJP6pz/hU6tIhynSbMKFYlm0mQ00XNWO89o/qT+qI4tc/VE7G5nC6iNQ3M144VpG+Y1yxC6KtVBOoQR8PhY5YavaGtyMCBLfDrDZj2xHMS1w8n2gvqWq7Sd8dygotww+6yfns4p/yJv1m4v+sNj05PMX1lS++5CddvuahO5JLL4doY2/C+p5eth3l7Pl7f36ryg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(34020700016)(1800799024)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ooEGGMjFNhENw22AvikFudTOpikslk3qdi5Bb2Z+NdEpybk49XoL1KpfuNe9BxqptnZ2c8F930DD3xlmhAiM437iGLaMq3ysQ1BrFDq18TurCGK+VukSpyrNInyDDgbzWQtZB8apzkccC/rLcsIvjPDbGUTc2+Njt5HIhaCOCXkg5LO00Xu0p2xoSgAbUMrQozZD4myfw6PtHaVgaV5JQufuAeOuWXnvnhnas4T/NrkietjkM0ELQ1nncCG80dRBrpTZvumWT9OUQ2DCxN+qiGav7Qf9pzQBbRXWZbkwF7eGy4rbpbt5iM8ajsAa6tOmBGHI1ahdosFySMz8wXjNa6EbGWm6UH7vIHoWU5Wp/7FlavpDh3pdPI02SdheEIchccSGhEMOMVlJojDHC6tG4WF+DNrZ7kgEUjTFDb3agh8Zl0Clc/PhtUzJQgVjUivE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:25:53.9993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1c360b-508b-4b0c-86ae-08de7b94a83e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4895

On 3/5/26 10:56, Yogesh Lal wrote:
> On Thu, Mar 5, 2026 at 10:19 PM Mark Brown <broonie@kernel.org> wrote:
>>
>> On Wed, Mar 04, 2026 at 05:28:06PM +0000, Ben Copeland wrote:
>>
>>> I have a list of people to include on a call. If you are interested,
>>> please let me know, and I will add you to the meeting.
>>
>>> I propose the meeting for Thursday, 19 March, at 15:00 UTC.
>>
>> That works for me.
> 
> I like to join.
> 

I'd like to join too.

Minas.
