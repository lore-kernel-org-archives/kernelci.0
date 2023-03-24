Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E3C360
	for <kernelci@lists.linux.dev>; Fri, 24 Mar 2023 08:31:16 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32O8BgCS032761;
	Fri, 24 Mar 2023 08:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=0e1JPct0PV5qLc2uuBZtZz/MTun6DCifCDVF6FzhqAs=;
 b=lLwqWXyPmS8MgcqRbJehVMskzUMlIg/pPPXmfhp8gNFqDACdWVA4jX/Yv3Ougsg96mYE
 1mk2iuqwIDWOHGBm//9xDmQdERn7Y3mf7v5cavfYxngcZpTNzTKp0k6Ec501nA4TYrpZ
 Eiodr0Kqsrcu7vQY6YRPI+5WB2cfak0DdvU1WtpUpVwWSb12Y2QgQbt0qz27mvQaDb5P
 lH93oZV1lj+Wg1GsRCJ87eEiw79Q/xgdm07NGpH1s0vi5gBcmRV27/bFNlWF4eEg+kdY
 H3YB2Sh3BxQ1bNBleLEp1NqRrBh3vjizfbeCf372G6VbiA+3qY4Qfs7SZ0ELPMNNnv+/ YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ph84rrd28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 08:31:08 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32O8LC3k007137;
	Fri, 24 Mar 2023 08:31:08 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ph84rrcvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 08:31:08 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLKktF024788;
	Fri, 24 Mar 2023 08:30:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pgxkrrjy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 08:30:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32O8UmYR24773176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Mar 2023 08:30:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F1D62006A;
	Fri, 24 Mar 2023 08:30:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41DE02004B;
	Fri, 24 Mar 2023 08:30:47 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.22.236])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Mar 2023 08:30:47 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: Contributing Linux on Power test results to KCIDB
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <6192485a-0229-7469-0c2d-856cdea35fbe@collabora.com>
Date: Fri, 24 Mar 2023 14:00:35 +0530
Cc: Nikolai Kondrashov <spbnick@gmail.com>, misbahanjumn@ibm.com,
        "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <06240803-A229-4C5D-A5F0-57CE42B9429E@linux.ibm.com>
References: <26F2B8E1-8A69-42E9-B3DF-A7E7E847756E@linux.ibm.com>
 <aaaa8f94-d901-500f-338d-a39ea8e350eb@gmail.com>
 <6192485a-0229-7469-0c2d-856cdea35fbe@collabora.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 60hV9PxeD7fBey2bWk7XP-RTcCU0T67e
X-Proofpoint-GUID: ZN1yS76oaoEoJGWiSyOWxygMUn6iXTy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_04,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240070



> On 22-Mar-2023, at 6:37 PM, Guillaume Tucker =
<guillaume.tucker@collabora.com> wrote:
>=20
> +kernelci@lists.linux.dev
>=20
> Please use the new list, kernelci@groups.io is now closed.

Thanks for the information. I was not aware of it.
kernelci@groups.io email was mentioned on the KCIDB dashboard. I used =
the same.

I submitted a pull request against kcidb-grafana GitHub project to =
update the same.

- Sachin=
