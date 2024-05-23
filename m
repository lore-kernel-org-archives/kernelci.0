Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595471F934
	for <kernelci@lists.linux.dev>; Thu, 23 May 2024 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716484355; cv=none; b=HFilmUDbA+v3LWPuA+EOlsV2SV+TdBtuZtR2hfl2QcLlo77neI27ABEwwnN7MkORFtuLG5vudGVGiyY2/k2RRH/uv5rrU/eEIUO0uqLvZR4XW0hHpEPc5Rr2hWfOG+9edQZXBweOZ75DencjXBguDyikT1ae3ReghlSE67Ngkxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716484355; c=relaxed/simple;
	bh=jZXlNH4S2i1fOsBTjIolzgAV4d5hMEPjumv4X1IxKu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N1HITsEoRHnv+4hfNs22UxyVqiQIRvW88Qa8lX2FChovU8OwJ+bcNu9BzYNCLDqwgK5jqbbI+j3/RlHGo8OKC+7A7KiZImR3D+9GZtiCgjVueQGT+6/wZ4v8IMcJ49m4E8Am2/xVQq39k2lWXhXjHWoxTN9i2JozZHY+DsR/sG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EnKCLZE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EnKCLZE+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NCiQ7J011589;
	Thu, 23 May 2024 17:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpANHK+NIgM88G70PoBGkL7KCt2FeX7O4ZWWdeGWfYs=; b=EnKCLZE+O1d+jfDz
	PqHGjMRaLKTjHRvC7cIc3NDm0WY4KE+qpOJbGCZM3fgJS7dSGFFFs8ibM7tdO6Wl
	yjd4xDLxPRP7ZUra17UQh66PRFBoBgaXjDiGzjraihOjIiPcCBRazm1Df07lcfJA
	mLwS3iyq0Inpx1aLvvMLVAWG9TRMAAdv/aZXu6oDYjqj3qYUO1TAeqEBVB8FGCM8
	e/OtBi7fNRpVNxQRVCuFRiY+5Mm343fbKCjqyeCkfxTOak7C9NL84Hhx0jHWPRuF
	AmwllIpuPn3EIWKrbocGG4DNwR8v+XtQdihghnKcYYwPz0g/aw7Q7Goh6Rojy+ZF
	Bjtkag==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9y29su07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 17:12:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NHCW3R021595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 17:12:32 GMT
Received: from [10.110.20.239] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 May
 2024 10:12:31 -0700
Message-ID: <6586e527-0d96-cc6a-413b-7df4f1fd321d@quicinc.com>
Date: Thu, 23 May 2024 10:12:31 -0700
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: New name for new "KernelCI"
Content-Language: en-US
To: Trilok Soni <tsoni@quicinc.com>, Nikolai Kondrashov <spbnick@gmail.com>,
        "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
        "kernelci-tsc@groups.io" <kernelci-tsc@groups.io>
References: <b51eab8a-41cd-4439-8434-076d09b60ed4@gmail.com>
 <BY5PR02MB67543462B27CBA2C56BE5249B0F42@BY5PR02MB6754.namprd02.prod.outlook.com>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <BY5PR02MB67543462B27CBA2C56BE5249B0F42@BY5PR02MB6754.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C4ZsTx9xlfc4ip0IYeyw4gQnKd1a_e7X
X-Proofpoint-GUID: C4ZsTx9xlfc4ip0IYeyw4gQnKd1a_e7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_10,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=624
 mlxscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405230119

On 5/23/2024 10:10 AM, Trilok Soni wrote:
> Nikolai,
> 
> How about Yuga? It means following. 
> 
> Yuga:
> Meaning: “Era” or “Age.”
> Attributes: Experienced (through time), powerful, and open.
> Context: Yuga represents cycles of time and evolution.

I have replied from my different email account so ignore the WARNINGs below. 

-- 
---Trilok Soni

