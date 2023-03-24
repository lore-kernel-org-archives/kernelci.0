Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6356C7E
	for <kernelci@lists.linux.dev>; Fri, 24 Mar 2023 08:25:10 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32O7s1KD023983;
	Fri, 24 Mar 2023 08:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=X0HP01LYwsyyWtHJF6wVChUA1e7FvZffcAusE5XWoLo=;
 b=UBTiLJLrtfNaWunfuN7qay7UqNWSy//YniDyBilqy/QqC7Duo0LWK2K8/wn2JyRBgvJn
 OnQysEMXNs06sgmuzgii+iXkjwao+6g+s7q/9ICpuR3ow9u6djkXTotdehYOfFiwB7/Y
 9xpFFTqDdTZQpUvNUgS8/jFNJRBUS0HoW2ZhTPfUDjs1T35G/MVpDJRBVOS3amwM9ST7
 x25d+yJYQUvpmYf3B5CTyWbqmkdfv7uhlHBB32NIctvNrlFt0PtowT/XIRsavm/U2neI
 rFHPe2iHJtt1bI+zjHn+OL7FzSnDMIJNh1Y5jYIZ/18vrHJnfavzpdXfHXAdT5oPTBvq UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ph7vcrpee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 08:25:02 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32O7saG7024956;
	Fri, 24 Mar 2023 08:25:01 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ph7vcrpdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 08:25:01 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLd37I016241;
	Fri, 24 Mar 2023 08:25:00 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3pgxv8gfbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 08:25:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32O8OvQW63766868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Mar 2023 08:24:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5D6C20040;
	Fri, 24 Mar 2023 08:24:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B85720043;
	Fri, 24 Mar 2023 08:24:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.22.236])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Mar 2023 08:24:56 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: Contributing Linux on Power test results to KCIDB
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <aaaa8f94-d901-500f-338d-a39ea8e350eb@gmail.com>
Date: Fri, 24 Mar 2023 13:54:45 +0530
Cc: kernelci@groups.io, misbahanjumn@ibm.com, kernelci@lists.linux.dev
Message-Id: <D1BDE6C5-D5A9-40EE-95EB-DA0FBEA0EF2A@linux.ibm.com>
References: <26F2B8E1-8A69-42E9-B3DF-A7E7E847756E@linux.ibm.com>
 <aaaa8f94-d901-500f-338d-a39ea8e350eb@gmail.com>
To: Nikolai Kondrashov <spbnick@gmail.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tRRNizOElb24ssXMBX8qjg5AMfim-0ld
X-Proofpoint-GUID: DOZGMb-YscDCAgJ8qdufKRx87qWMug8w
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
 definitions=2023-03-24_04,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240067



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
Thank you for the pointer. I will review this information.

> Then decide and tell us what the "origin" of your CI system should be, so=
 that we could identify it in the database, dashboards, and notifications.

Is there any consideration for the "origin" string?  Any unique value would=
 suffice?

>=20
> After that I'll send you credentials with permissions to submit to our "p=
layground" database, so that you could experiment and build up your data an=
d submission system iteratively and interactively. Once that is done, we wo=
uld give you permissions to submit to our "production" database.
>=20
> Don't hesitate to send any question you might have to this maillist, or t=
o our #kernelci IRC channel on libera.chat. If you need more help, we could=
 arrange a video call as well.
>=20
Thanks for the help. I will reach out via the mentioned channels for any fo=
llow-up questions.

- Sachin
