Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF8C28F4
	for <kernelci@lists.linux.dev>; Mon,  3 Apr 2023 09:44:22 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3339Kgxe018101
	for <kernelci@lists.linux.dev>; Mon, 3 Apr 2023 09:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lmGCzl+YotnHMZKm6KV7rVUQAfVasTrfcuuC8dx2BVU=;
 b=VybFfoVPVcjp/NNHBXkZCK4Toa6O8jktm+yZJYBpxtYZv8q9qIuvyQ8pwk02SxBzYhL7
 L/xfkn3DUMgYCqbIUBAkHDGXPrZUPSGcnfrQ8mBw72Um4uw6ZEKxOZ7Z6Hz+ejT8RqXQ
 Xd0fSKlyRFwU8vuJiHn05P704/PzQgOipmfXZ8BfuCz3k/kvfRUz/Dmyt1zJad6Gh7/b
 JCkmYKKcPuIvv6xepS0zQXrQMWBGm7fPHbOVF2F4TZc2YqTTq/m1ZPFzsgMjHHnaZ9XP
 rcsYvvphloI+uFhUcGsYvXTBTwBgXG39WVU8iTNQE1FW9IhxNNSI2AVrnDQobUUXNwGq qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ppxgnj5eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <kernelci@lists.linux.dev>; Mon, 03 Apr 2023 09:44:15 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3339Hm5a006309
	for <kernelci@lists.linux.dev>; Mon, 3 Apr 2023 09:44:15 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ppxgnj5dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 09:44:14 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 332MwQqN027768;
	Mon, 3 Apr 2023 09:44:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3ppc86s4qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Apr 2023 09:44:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3339iAiL6947578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Apr 2023 09:44:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F8CF2004D;
	Mon,  3 Apr 2023 09:44:10 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E365A20043;
	Mon,  3 Apr 2023 09:44:08 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.56.224])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Apr 2023 09:44:08 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: Contributing Linux on Power test results to KCIDB
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <aaaa8f94-d901-500f-338d-a39ea8e350eb@gmail.com>
Date: Mon, 3 Apr 2023 15:13:57 +0530
Cc: misbahanjumn@ibm.com, kernelci@lists.linux.dev
Message-Id: <C9529E6E-E486-4F99-8889-39798857446D@linux.ibm.com>
References: <26F2B8E1-8A69-42E9-B3DF-A7E7E847756E@linux.ibm.com>
 <aaaa8f94-d901-500f-338d-a39ea8e350eb@gmail.com>
To: Nikolai Kondrashov <spbnick@gmail.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eFziBCJPB9hPpZomHgTJUAWqe6fKwSCY
X-Proofpoint-ORIG-GUID: dMKs_-PAb7VRcokDNLcsflFTg2eZdHus
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_06,2023-04-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=883 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304030073



> On 22-Mar-2023, at 12:40 AM, Nikolai Kondrashov <spbnick@gmail.com> wrote:
>=20
> Hello Sachin,
>=20
> We would love to have your data in KCIDB!
>=20
> You can start with reading our Submitter Guide:
>=20
> https://kernelci.org/docs/kcidb/submitter_guide/
>=20
> Then decide and tell us what the "origin" of your CI system should be, so=
 that we could identify it in the database, dashboards, and notifications.

The value to be used for "origin=E2=80=9D is =E2=80=9Cibm=E2=80=9D. This wi=
ll be used to identify Linux on Power test results.

- Sachin=
