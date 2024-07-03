Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2558F5FDA5
	for <kernelci@lists.linux.dev>; Wed,  3 Jul 2024 05:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719985476; cv=none; b=m8AFFKQhtylP9CB094JXpfXKUftQkj68I+alHbi0gGVs2BaamYJftBaEnC/jK92N8/RXHTG6gf9h5c0vZHWj2D/NN4FbNJVqRljJreYDgahfB2/YVqQrincgM3cx6Rutcy14J1rVw4OTTxvTfDhYAI0WcCmKAGrFoJvwK5X5sy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719985476; c=relaxed/simple;
	bh=vwJXMXWGxA8tKMXagHorEmhIOTWZfGrNhz5r+X75+jY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=YuZOtVpK/QafgOOBg+gm6uQxXMxVlBUQgCDQWsMgYs0UnVsDS6OC0l+DzlKJS45Mdn8bUpePjeT+hVmFKFOyJbXWhkDYLt4w4Vob4FS7PPjBYS8ed63y2M5KwlZeG9oRey+dHyxTL8rl4zBKV6nkPRsrSZy73gY4geglLF0N/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BlPczt48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BlPczt48"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462MUfTH015390
	for <kernelci@lists.linux.dev>; Wed, 3 Jul 2024 05:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vwJXMXWGxA8tKMXagHorEm
	hIOTWZfGrNhz5r+X75+jY=; b=BlPczt481wBErlCpfGFhBXADFd1pI/uWoSdDZy
	eJnkwor56652s75aZ09o3qqhv1Bv8sFBm/OvqUrtc2qBU8yavB08MjBw6b2zmeFh
	FifxA2F2oR3nxc7kJ86vxGFocV1xWyO/138nYUSYAoGYg1Tt4FztgThXxSYFqHJX
	szHDDnjc0/Po6+kBV5rtp8R+q6eSQYh/K3B+5zKfDrVc9Yd8WDg0Rvrph8RTc24U
	5vUelioOCZNbjiI+xOqcCFehyq/qjqfaiZ2IVFn/FMkGoszoW9FFXBMDpYU0PIYN
	GA7eWVTma3lbhv8h/eJ6sIWBQsUlL3ehJGcjOnXHsrLfri2w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bejt509-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <kernelci@lists.linux.dev>; Wed, 03 Jul 2024 05:44:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4635iXjd017072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <kernelci@lists.linux.dev>; Wed, 3 Jul 2024 05:44:33 GMT
Received: from [10.214.66.101] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 22:44:32 -0700
Message-ID: <0d424743-dfab-4d14-a077-1864f642bdda@quicinc.com>
Date: Wed, 3 Jul 2024 11:14:12 +0530
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <kernelci@lists.linux.dev>
From: Yogesh Lal <quic_ylal@quicinc.com>
Subject: subscribe kernelci
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C5QNU2wQJ1VXd3A-thQ1bqCuI-53389S
X-Proofpoint-ORIG-GUID: C5QNU2wQJ1VXd3A-thQ1bqCuI-53389S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_02,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=360
 impostorscore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030040

subscribe kernelci
