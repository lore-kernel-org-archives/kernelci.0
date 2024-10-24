Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437EE218594
	for <kernelci@lists.linux.dev>; Thu, 24 Oct 2024 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729804254; cv=none; b=rNJ1AanDPcPhigctOnrXCusLq5ktVVGGN2VisPkVsAlIH5OA/TNwVLJEGRGLulsJtY4t+LWSydsJo2UuZPjcehjoLBKUxS+91v1bEO6PAFnM4/ImZYcscOZ3nyEfhdwV+ywgCCY7lBV9I6STczJTD8oEFAYghLg07EU3rps5E8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729804254; c=relaxed/simple;
	bh=uxxv3rsrsDdIR4rVcpPQbE7R9mirjBXETmL27R5UO+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G9/PSD/oCiY+BOQLDoEnTHjW8AnZswAt68GaahnK3bA/ECpY4IorhNUXZi5CbXclx+6NLSZm0Y6/YrpdfYr4dihC1XtldrqD+5db0By1PiCTY9mvhFoRcn6HIW6j8vQ4cYniDqNfel0cWdSMzS9Lwob9pBHz7uGqpYN3Jpp5QCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MvH/a/+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MvH/a/+5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O9jaVY026205;
	Thu, 24 Oct 2024 21:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzHHaH4Kd02X0N5dS/4kGQMpiNXeC4k4wesEKpX/q38=; b=MvH/a/+5lDEknMGC
	tkp/DhgqVQIIcjkBAb9nY4tAi32wTBHnBnR03YhRF2xYnIvJgkg6g/waIAv19Ix7
	0l6IeJMXvPYmhpdzNWALuD9nCTVyfjYhvWVcVOaEgaFOorfyI7W3IJRG3uS2q9KW
	Ts1eknM2+WbZIgug9J911a/WYuQAMfyvA08M+hAMpWuBBUXPIc8HtwtR9qF23ywW
	uBrvy1Fo63N8aemJuCitp/E9UKmdXIUGHozYofcKDH0bO+tqgBnI+VbkUrVB5WCS
	MpaImmpciAx06qjo04+VPXQKnpNPKpaUDhiztw5PonDguW7Wky1oTuOv4tNOtszq
	yBwcMA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em40eywh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 21:10:49 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49OLAn85016088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 21:10:49 GMT
Received: from [10.110.38.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 14:10:49 -0700
Message-ID: <b4336093-9136-4a00-9191-d8946a594ff2@quicinc.com>
Date: Thu, 24 Oct 2024 14:10:37 -0700
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TSC Votes on Chat Choice
To: Nikolai Kondrashov <spbnick@gmail.com>,
        "kernelci@lists.linux.dev"
	<kernelci@lists.linux.dev>
References: <e84eac0b-f5de-47e1-9a1e-cb4ae1947b0d@gmail.com>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <e84eac0b-f5de-47e1-9a1e-cb4ae1947b0d@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6qmLlpuD0ApLjBeAycpxF97Fl0AlOoBU
X-Proofpoint-GUID: 6qmLlpuD0ApLjBeAycpxF97Fl0AlOoBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=743
 lowpriorityscore=0 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240173

On 10/21/2024 3:48 AM, Nikolai Kondrashov wrote:
> It seems that the majority would prefer moving to Discord, and have a bridge
> with IRC. Although there are "Matrix and IRC bridge" advocates too

I would prefer to use the Discord. Best part here is that I can install it on 
my mobile but can't install in my work computer due to restrictions. 

I like discord because it keeps me near to the technologies used
by my teenage son :).

-- 
---Trilok Soni

