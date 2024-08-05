Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF6155351
	for <kernelci@lists.linux.dev>; Mon,  5 Aug 2024 17:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722877949; cv=fail; b=tq2Dh3ufyww+D9oQmEdGfB4iJ94u6rGp+HbejwUsBHSPqUn0kQV8ILUYH/6DmBLUL3Oto59qU2myEe8vo1HitTTil0RxbmMBRcI200un4GOuqaGLwbLkBhF+Bv2Hxqq6ZPhnqIpH4O2n2Zj06Q0z3rCcdRxkEZoEXW81dN12DaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722877949; c=relaxed/simple;
	bh=GAqnUyYm9wpoJcHPFFE+Q5gPyYF+C2brZGmMRtciRi4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=njeDzQX+FMxjhAP9B2vkDoR/MSBLlMLd2hmI9H0U6C4tUlDT1p5OJnIdMTNoILp/dvHeSt5G6jAawE6PdNt47d1DnNYJ27ZTyTtba82sX34f+7E9UVzkGLP63SwxfslLwISNMz9ArPTtNdnwIBzDwiklGk4DS0bULQHxmxg7KMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=gQsx15Pm; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="gQsx15Pm"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475GPMsa023679;
	Mon, 5 Aug 2024 17:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=mcgBk37
	8jgrR8Kmbp+Bx/whabLh7YMl7I4mUJQchYPQ=; b=gQsx15PmMheotIndG2MXufA
	M5dWOaWy5bJDhjn+ke5WBIuUpxtfzGt04cjbq39q7Np38eJtKAP/hnXX3ESfDdzS
	GPWFgX1uYGVAPvM/WCAAoTb/k1Y+KgbP+b4B+BunjSPIxTkWCG02MC8nHJe/iA68
	qRhAf2mPASNCFR1qHXnZ7GtToairMxiFSxER7rNzQgeSRL1vEFMyRoLu4QXb1JXK
	+E1jf2/8tnsdQvgMBIaWFHoocEJ/A73/E2MHULH5u1M/HDZYU6o4jyckHM5KWaPN
	opwOk1QnytELOYCG72iHiRkjV8ylQ5js/JjHkO6v0zViMTl2Gvl73FxVFbHAMOw=
	=
Received: from pps.reinject (localhost [127.0.0.1])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 40sb43hq6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Aug 2024 17:11:59 +0000 (GMT)
Received: from m0209318.ppops.net (m0209318.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 475HBxY7026686;
	Mon, 5 Aug 2024 17:11:59 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 40sb43hq6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 Aug 2024 17:11:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUKuKh4uPQblhchChNJuiUNsAMfvltHgD8/GeDUVaMEClGRh5gabwUxj/ALU78aytW+t1xgmZiDFm1zBT+TEZMqB2fB+ocEM5YMC5mXl9VH5FZmg6rHQNwxIfOC3JzskwDMbyUwG/V/jp+beuSeS4zjBxtIkAGyLvTsui2FDnq0QXoSZWltFY+2sajhJzrUerFH+kKFPoQXU37UNRXWLWkAjifk0zzmxkgM+YxMwvQ+6FQv8CudynTwpa8wPF3mE2Px5oTSW3JXBwaKH3E6hy5mgDv1tJTDh1dNLgFNqsJfsztCoYmSFRD9rXVgw7/5e/daUWkQ90kLVAFuH8GjSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcgBk378jgrR8Kmbp+Bx/whabLh7YMl7I4mUJQchYPQ=;
 b=sipTNe9WRcHhVR7Il0I9D7TrifFk+EcBnG1+JeKj6/g1FF1Rgy8kn7Y0Tj/TQc9MnfFR3DohaLdRtwMOwmSTUW8EpzW4v2LEoBrV0OujTs8F7tRdu4GEoVrjR27Vo2PCS1xW/7enTJx9VwRzPVTDGsjWtIjisqU3rnEh74IxA8Ewd34ddt302l5m9Fi1sCJr+zHka6OhEfbEcMXpAgxZXLYe0UHY0AUcqqYyTiIFfxUAiBEm4DQGhWTWgorZySs4Uc9Idh1w5g4oo39CYoiQYJ4DqLYWIHOwrl8/hK+zekJ9w91ZQ+Cb4CtjOwf0kPy2FL5OvPsauUplySowJiWcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BN6PR13MB3041.namprd13.prod.outlook.com (2603:10b6:405:7b::18)
 by BL3PR13MB5106.namprd13.prod.outlook.com (2603:10b6:208:351::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 17:11:47 +0000
Received: from BN6PR13MB3041.namprd13.prod.outlook.com
 ([fe80::3661:5a0d:34d0:7c4]) by BN6PR13MB3041.namprd13.prod.outlook.com
 ([fe80::3661:5a0d:34d0:7c4%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 17:11:47 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Mark Brown <broonie@kernel.org>, Nikolai Kondrashov <spbnick@gmail.com>
CC: syzkaller <syzkaller@googlegroups.com>,
        Dmitry Vyukov
	<dvyukov@google.com>,
        Vishal Bhoj <vishal.bhoj@linaro.org>,
        Alice Ferrazzi
	<alicef@gentoo.org>,
        "automated-testing@lists.yoctoproject.org"
	<automated-testing@lists.yoctoproject.org>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        Johnson George <Johnson.George@microsoft.com>,
        Veronika Kabatova <vkabatov@redhat.com>,
        Guillaume Tucker
	<guillaume.tucker@collabora.com>,
        "kernelci@lists.linux.dev"
	<kernelci@lists.linux.dev>,
        Don Zickus <dzickus@redhat.com>, Philip Li
	<philip.li@intel.com>,
        Denys Fedoryshchenko <denys.f@collabora.com>,
        Michael
 Hofmann <mhofmann@redhat.com>,
        Tales da Aparecida <tdaapare@redhat.com>,
        Aditya Nagesh <adityanagesh@microsoft.com>,
        Jeny Dhruvit Sheth
	<jeny.sadadia@collabora.com>,
        Sachin Sant <sachinp@linux.ibm.com>,
        "Hambardzumyan, Minas" <minas@ti.com>
Subject: RE: KCIDB: Support non-binary test outputs
Thread-Topic: KCIDB: Support non-binary test outputs
Thread-Index: AQHa5yqbcUF1g+nnlkWvpXGZOW+0KbIYmPiAgABLV/A=
Date: Mon, 5 Aug 2024 17:11:47 +0000
Message-ID:
 <BN6PR13MB3041EF1CCE58C02289F9AE6FFDBE2@BN6PR13MB3041.namprd13.prod.outlook.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
 <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
 <41f4f4df-7587-42c4-b7c4-9e69bbf7d74d@sirena.org.uk>
In-Reply-To: <41f4f4df-7587-42c4-b7c4-9e69bbf7d74d@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR13MB3041:EE_|BL3PR13MB5106:EE_
x-ms-office365-filtering-correlation-id: 2911d5f6-4871-4408-2431-08dcb571b035
x-proofpoint-id: d8690225-876f-412f-87c6-a7cb45557a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3TCG465XP7AJDqyt7EjxV+jNesGgWBWDN84My2lvUxo3T9E4gDdqhpkrFMm5?=
 =?us-ascii?Q?Z6axvYvjY8Onk1mtp0LlVWUTfRJbwb3ZO+yJ+9WYHmsfmyhhEhBt7r8au7lH?=
 =?us-ascii?Q?ln9/GP1L3ER//4LwtZ4++uuweTtVXItoATinaYHuV7v4OqTsWmzjL9kNLnsu?=
 =?us-ascii?Q?qgudbUvp9rWb8VlnIQpN8t52kqUEcfA7fGmday4hfF5gXwRBV6pAWrT9oYoo?=
 =?us-ascii?Q?rUFIbtjOtPCuZ94oQWhHRHjCjGFzDEDljLqJciD0g/Y8Tq6uSUU+79Y/l1sy?=
 =?us-ascii?Q?UDhiin49YFZqnKy1gR9ETXAWARCh83bU1vhRjLq20FJOUCqYusPNo3/BM4yK?=
 =?us-ascii?Q?8bgCovxpmu8aIc94Ex7dLTEu6iRDIavHW/uSOSwuEVB3fNf2v6VFjkDNEp9S?=
 =?us-ascii?Q?ShyBDcUWcljl1Arfbk3aSkuP8JdtL9UjJDdO/5TWZaYF5srtdcJ+miSN/jvY?=
 =?us-ascii?Q?lYDQPTyVDq8F7KqyEJ0s82oWMqQNsRZ5/zm7+IzaBdMPRS7z5cM3UwbfYxS/?=
 =?us-ascii?Q?N7Jx16N5xo1Xqx9pnMy7IJLkebiQk5gOf+cbEcu/4tDNgYfimK1n1s+xDnK3?=
 =?us-ascii?Q?qLN3E7AKDOZd+u1yFC+in72W/hA3THK4Hf6NIkUszQ1RZzQgGTckjeolhi4g?=
 =?us-ascii?Q?3n0tf8bO0MySCWWWU6/Jgh82o1Qs/H3RWGhuHjdWboSwDn63THoMwj32I3V+?=
 =?us-ascii?Q?PLWj/lfwfex577FRjARfZpcsY/iONHYsdKNrw9Q7eRgDUTvEiUeuPKK5VAa6?=
 =?us-ascii?Q?UKMKVnnIRCkaRAZkViK6xNNsBcrE9cfkOu6HIXynJzUCOM9VV6GaHOILeQ6s?=
 =?us-ascii?Q?M6o/c30Poo48WRdYxN5CMQpkwJ/VAI28IWt5nPXfEnR0zZWB4UPwyYXGDOxh?=
 =?us-ascii?Q?Yk6m0m9F9LkBvMhklRiA6OrKA++soyvfQL6+o8g2L1fcdtkztCPn23fA8hsI?=
 =?us-ascii?Q?d7r2zcpV64TXXKMN8e44wzelIbed/+/itQZU5YKJ5e22fTeHUjjd1M89nBcA?=
 =?us-ascii?Q?DLeNxRY9AmXgcUuLZczIxfW3erxmT8W4ozkMeJRRxTnfyqtng82Isy9USSUK?=
 =?us-ascii?Q?G6Qgb8Ga9xax01FfIN2auKDVYy5tXnEBAoNSmW8TSXnQngkvgXCkVYUmnPcq?=
 =?us-ascii?Q?CfiEM0BxPDYh9re3S0xyFSHZjIbNgs3MxVQjwGpeIKw1pzo/WhYEaM/t/5/U?=
 =?us-ascii?Q?WBWgEQ/TEJcZg+UvhCN8vf46n9C1RAznMKiS8rDtDMJv1+Gld1gWBKPfzd6+?=
 =?us-ascii?Q?5MZ5u+CSUgGDJF4dqbNi8cyUEBt2p0AgwsQEpD/HcTH50sLH7bdwzgdy5t5B?=
 =?us-ascii?Q?pNEes9XcbMpiAhXjZ4wklvxe3delvAfrbLCyQCnGiX7Gs6YLhM9Do+Cl149P?=
 =?us-ascii?Q?65nhhR5LYSKaKvZBlP6kLQOzRUzcarYcEfYHDgB/mIwDkTLHTg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR13MB3041.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6htpgStTgSygCAHIHqGve0M5GA/9lwuy6/2rD1QiGjswKZkf0/N1erkjlJve?=
 =?us-ascii?Q?oZFY2X7bKSQvXp/unvurlyr9i4Mxboafl+BRE4Hs+fi6L0+mXDUCHdC+kKJM?=
 =?us-ascii?Q?HzNgBLNYMsiQmSa1ueue06YcqGavJopM9SYW7amgjlVOxNJ0G6+ALPfGEyIu?=
 =?us-ascii?Q?BUjFcY/QojS3e0dBRdtHePdcfiNTCeBM6Ayl7FEH9d9qIDRcjI6/zlIEqjAu?=
 =?us-ascii?Q?TzUyOuW0dxLvBsdYozXJj6pxWLfTjRPUbBJG7aXc5rDZtNKBi6lWPsK5BqQp?=
 =?us-ascii?Q?oHWvzfSxY+Dbbs+SrCVIwO7kd2TywP44FoOkvs0mv7W2/t2tpbMeZHZSxQJ7?=
 =?us-ascii?Q?rzq9/QWcDRCclS+6Ql6u2fPnvNXwbiwuR2Ffp0g6GHzH2n4LBfCHlMoMEgu0?=
 =?us-ascii?Q?9a3EauI+vy1O2/TjNUVL7VHx2TmNNLS0PHadaCLbEUmElt1+6cbSOiDZ+nhz?=
 =?us-ascii?Q?tSW/4VfNVd/CrUbnPbrXiZ1jUf4ZjfSOzYfhGlRN87JAsiIaFSI7U1XwY6/w?=
 =?us-ascii?Q?PZvKhd0+l2PSWukCwSvDGaK+wXJHYMoEcqloS+i4x3GX2YN3bregWjVImePo?=
 =?us-ascii?Q?acbEFK/TTXoslcNYJDu7pdawm8lu32zqQXad6wVsi4VY8UVh7eVPktK9wCw8?=
 =?us-ascii?Q?aDroklkJIm9PpBjPdh3wc9ramkpp50oEAwQV4NFFSTpY4HaVrNokMmwAuDkW?=
 =?us-ascii?Q?4DtroNcOy3J+I+O1J+2YlYiYerqhzyME8z/J+FWC6TZ3nk/PJehJNvGpFKNz?=
 =?us-ascii?Q?av3kQR/MPJTEvCRHYSNzfAfl+drLNCOzWL2rTMS7V72rjrQzavBI+I8HwpKp?=
 =?us-ascii?Q?LvgHFUtnB4Eo7T8BhOBD/3ARzitCMebIaHarH/+4kNmr0gjeaErDpW4wDN5y?=
 =?us-ascii?Q?Ut2L6kWLlGR6HB9fJUhfanZdWEeieQ8AZ4fNV6RV66RMNsY/Ap6eW/GWSXHy?=
 =?us-ascii?Q?2cUsPU0iWN3SkKqvKDR6Aj+vjLnKMd3Yir6T1CrcV83OU2itMkKVvSJ9ZU21?=
 =?us-ascii?Q?m2Qweg4EDoaiUC6C5gCsbqeW2oeeWDAVapNcz/gne8qlgAG9njcnoIgz2Q1H?=
 =?us-ascii?Q?V1fSpApA65j2vTTtXIFoOdzSQ5BlEXbIPCyY0uOIWDq4ZTc5FfENbmZNo2+3?=
 =?us-ascii?Q?zlTIm6d5DmnC/a45o9sGpPFBa2/84YF0TBNDYhFreVilpEyybVXvw/W1q0Df?=
 =?us-ascii?Q?niWWKcy8S2Km6VzTGiX77UAQKpspGTgCEZccdfypbzWAfwZJDqpAIBJ7au46?=
 =?us-ascii?Q?16zzfqfOrHTMoPDJQsK4FrTG6XVMEP2d2dj2XI0IYbM9dc6o2qL9qdB3UyxR?=
 =?us-ascii?Q?z0Giml3/4X+UITWhRv5UfIQS4wrk5Z+nf6Am8LN2oxCmlEiOH1k4xHEglTdw?=
 =?us-ascii?Q?yw2wgsKSTusSK+FI3+I59Ha2dtLY5rabE5Xzq6KTM0SX4weGtaedKiq0n8XZ?=
 =?us-ascii?Q?HsmYLkfRxH8vPARmLM9konuXAXkV/ZX1Brj+Ye2l9+9l5yp3pceVfMwun+b4?=
 =?us-ascii?Q?/uW+yNtFoC+CIYh9uKnG49G322GCSjgaxJqPj5xyV0jpUfOHpHzJ2hOhfO8+?=
 =?us-ascii?Q?uc5qVcXRP/45J0z6rAs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2qcq46R4ZlOY1ivJSm/Elnqbo4WA5nxwtqfBAOw0MkRNyufLPqyuMfbz7P+uz4u+jV0M5UywjGSLotnoBMJscPGcSQt7m7Pldtp2nZI4SU3CT/f0yji9V7fZdfg3PNMaUSpfFSby0jFJBjNhBLWQyjDCZzIiH1OrpqgSTaT75rrTyiAgXGb45mNCEYzZP+GG0sTmqSrvuVdwCjWaEsw+6e+1vABTSdzG0B77cg1ta1hYVjPmKAcq3EO1/GNplhkPmH7vR8V6ZFysqiMNFem5xEjeS1shTHD1rGx9Qco3M1ndCSLKgLrcTFrI8KXfAGqywEvAQoVa/3LtpWu+rB2cUPJhEgdVAlpTslX+Q4oG4wxfwGGY79dd7J+NihD5UDp10WZjhjmBJsgCdU/f9DQpN2sPu4V6j8SnglRN1Usck0yGtxtFw6Cs2NUEjuG/C2Mv/ILo3KAFzBPjxt+5b4D6YU/ViqREJ4A1MpZGoSXRgYkx9W9cOBSjTtwWEGUXcjCZCEV343sADD5SKbhh8M4UPN7j5KFlrnych2L846yZwqo76MKqDdc9+fTcWt8v7O6B681CmWB0nxM49ENHqEicMkkZKXUsKsrJMStBl6hQUkbC8pjkSRVb/o19nr8cGGpF
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR13MB3041.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2911d5f6-4871-4408-2431-08dcb571b035
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 17:11:47.1857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZSywRZw/gtRBlrKw4PR+vrpyS2mHxMV4HhaCIVx34+14e8O1jPFavHfBkEu3a+v11QclKjFkkdT4S9znWCduA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR13MB5106
X-Proofpoint-GUID: 7ymZE10CegvbCW16O_fbuMFxv4XNDaKK
X-Proofpoint-ORIG-GUID: w6bbBoXQQEhQTSd3Y5U2yqXALnuuCfKs
X-Sony-Outbound-GUID: 7ymZE10CegvbCW16O_fbuMFxv4XNDaKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_06,2024-08-02_01,2024-05-17_01



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, August 5, 2024 6:33 AM
> To: Nikolai Kondrashov <spbnick@gmail.com>
> Cc: syzkaller <syzkaller@googlegroups.com>; Dmitry Vyukov <dvyukov@google=
.com>; Vishal Bhoj <vishal.bhoj@linaro.org>; Alice Ferrazzi
> <alicef@gentoo.org>; automated-testing@lists.yoctoproject.org; Cristian M=
arussi <cristian.marussi@arm.com>; Bird, Tim
> <Tim.Bird@sony.com>; Johnson George <Johnson.George@microsoft.com>; Veron=
ika Kabatova <vkabatov@redhat.com>; Guillaume Tucker
> <guillaume.tucker@collabora.com>; kernelci@lists.linux.dev; Don Zickus <d=
zickus@redhat.com>; Philip Li <philip.li@intel.com>; Denys
> Fedoryshchenko <denys.f@collabora.com>; Michael Hofmann <mhofmann@redhat.=
com>; Tales da Aparecida <tdaapare@redhat.com>;
> Aditya Nagesh <adityanagesh@microsoft.com>; Jeny Dhruvit Sheth <jeny.sada=
dia@collabora.com>; Sachin Sant <sachinp@linux.ibm.com>;
> Hambardzumyan, Minas <minas@ti.com>
> Subject: Re: KCIDB: Support non-binary test outputs
>=20
> On Mon, Aug 05, 2024 at 02:28:24PM +0300, Nikolai Kondrashov wrote:
>=20
> > Here is the (abbreviated) schema for the new field:
>=20
> >     "value": {
> >         "type": "object",
> >         "properties": {
> >             "integer": {"type": "integer"},
> >             "number": {"type": "number"},
> >             "string": {"type": "string"},
> >             "boolean": {"type": "boolean"},
> >         },
> >         "minProperties": 1,
> >         "additionalProperties": False
> >     },
>=20
> > The meaning of the value itself depends on the particular test, that is=
 the
> > "path" field value. Each property inside the value corresponds to a dat=
a type.
>=20
> Might it be useful to directly specify units for use with "number" to
> help with normalising data between different CI systems or hardware -
> for example with boot times both seconds and miliseconds seem like
> reasonable units to use?  It might also be useful for UIs, though we
> could also do that with a separate table for the tests that they can
> query.  Perhaps I'm just worrying too much about specialist cases where
> it's likely that CI systems won't just be picking up an off the shelf
> suite that has standard units.

I'll second this.  A number of benchmarks output their values in different
units, depending on the performance of the system, and it's valuable
to be able to detect that different units are being used, in order to=20
compare results effectively.  For example, some IO tests will report KB/s
on a slow machine and MB/s on a fast machine, for the same measurement.

Tests sometimes need a policy for which unit to be the canonical one for th=
e
test (and to express reference values  in that canonical unit format).  Thi=
s
might require a test results parser to do units conversion, before comparis=
on
with reference values in order to detect testcase results.
 -- Tim


