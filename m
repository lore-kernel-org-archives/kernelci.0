Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAB57B
	for <kernelci@lists.linux.dev>; Tue, 25 Apr 2023 12:59:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PBaLdd011419
	for <kernelci@lists.linux.dev>; Tue, 25 Apr 2023 12:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=qcppdkim1;
 bh=wIhHdFw30jtNrogh8VThJjlKrf2ORhUfj3uRQK4OU8o=;
 b=KXpJcUxjRplzUzRCnUQkmU3rrtcVdSNDPkcyVf7Lnwm4oAv+H8zLKDhPkxWCfVZG0+TR
 L2vZrB8eFtCPsNAZDqOtTNIe5QQUoNN3HS/FyKnWJe9pUkXLt3/eyY7pAlo4i/pyarWv
 ptU9F3Jemx45Fs5ChwG5oEGhSgQ3gz7G1du1EN4Iaih4sbPl/ibjhXyb/M2zpNFD7wKj
 PrtZ+3KnQFU2ES5QDw5rTLIKAslNZvo/E8OkTlhsEGgtYwD267dmZZhpy37wgE4tsmjq
 Ek7xw0D5YG5E9UEXAS3wJaEH5uZ7bj9CBMIPEHCMo/PYBTq9etWSx3G4ro7ol1JXCNvo hw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6e4h04rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <kernelci@lists.linux.dev>; Tue, 25 Apr 2023 12:44:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZo5ERrptYlIqTFfzRkDCLqugQDR49JyYSjQMa89KBw5gOWmbU1Hh9RZzk32Dav7ydROdg8Lo43ebW3/UHospRm63JSFGIUAkHBFb+KWYxZf1YDiglYOVjM50ay5wthZ3gvDEWiSzauwUswcgb7rOK+ewUf3HIipIsZbdzcoesES3tF2c4Ba2ljDYv2jBmFW7TNpGb2iMtot7lLGsUQCY26FJAJOzUCMAERx2QMjvCsmirLQ/sSZfmtXbJMx5u5XGNTDj9Xn0LQTx/EZn+649t6vinZC7MMiMFWQVEs65Nj9/dfEB5oaN8FqjurVFrP0ErvqiCnKSYeSF7GB+DYJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIhHdFw30jtNrogh8VThJjlKrf2ORhUfj3uRQK4OU8o=;
 b=LK8wkZ9atTx/OT7sAQBOmRwgIOGI50p6IbuYeSFhwDz8iPakfQko4Zlj7VO4M+jAXvgfzGF60jmINy9Ku8lWxx48duUDpvQWSbAHKHv6YfuJ77R9TuQBgR5sT+GZ5/hstZDJcFmezFxhh4p++u17caJKcoPFZ8UCbn7RY3hISZEQLY9nYI28kd48TkBU9zCV5K7Mjzt/rpI/jflUpCCFiacWJWLwyV3QQ2Iwdca9113dSVxzbjZY3ihXD35Pt5TMMdAmO6cqT/0Ax3bW4JMuz0b0qph2eRdk52H6LJr/1SSO21G7iGxKk8TWsRHp7GgHmhXA72kEHfkiBmR9H9iREg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SA1PR02MB8511.namprd02.prod.outlook.com (2603:10b6:806:1fa::16)
 by BY5PR02MB6849.namprd02.prod.outlook.com (2603:10b6:a03:20c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Tue, 25 Apr
 2023 12:44:19 +0000
Received: from SA1PR02MB8511.namprd02.prod.outlook.com
 ([fe80::bd84:11e3:1ecc:6f58]) by SA1PR02MB8511.namprd02.prod.outlook.com
 ([fe80::bd84:11e3:1ecc:6f58%6]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 12:44:19 +0000
From: "Ram Jangir (QUIC)" <quic_rjangir@quicinc.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Subject: QCOM IPQ Boards Kernel CI Automation
Thread-Topic: QCOM IPQ Boards Kernel CI Automation
Thread-Index: Adl3c2gLii8ROdo6ROmA361z+zJZTA==
Date: Tue, 25 Apr 2023 12:44:19 +0000
Message-ID: 
 <SA1PR02MB851150DF6313550B809D8AE899649@SA1PR02MB8511.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR02MB8511:EE_|BY5PR02MB6849:EE_
x-ms-office365-filtering-correlation-id: f9a37243-97b0-4f05-80a0-08db458ac9a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 grCPHlDPLARtwW1zIttpL1MKw5zEeUpp46Futr5kXiyz5inI99hGUuL1rwaG6tjGQu1HGA2yMBajEXNhs+9hEmVTsx0nHPELciNBCr8PSj19hqFvD9sl58Z2ZLu0PL1QKuAq5OoVomeGmRrUbbd1jmsqFzdK3GjwHloi3Ay0IO46w5s+BcP4CUmgbOb8ZwTbXmajdkUjzREofCUiMcf1k8e8pLqWlmrk8Q6RyiUl5q5vJdiqa9WVqmt2IwOFUzvfUGeoAzMD9dtXJAagWd+Z5p7RafMK0NTTdBrnVWlmwvny5LUP2Qjxog7QZWUh1sG+l/5VNJEx4I/4uspVrjRilltwrYj0r5NaKaar7NuI/zno6Bm7V+EMJyCcBzFmOU6Ok0AJ+iVQCss0mESFFgxx2ebtEldhsjApfKr2F5dkMA65a1a0TpkfyadBHjY/xb253FLSlBfs+rSVhJr6XHiedmtJdPPqsYWzZ2VuGVYcsurErSl/HSrtsskeggTOlMkteCl6WUo/9O0N6H5sURJGGsqj6LWJsMP1FoVC5LDIns50iMMgDEj+fGR7Vg4RpmfMiIkSbzVTeBU2aItbmru9dlfoR1CkQagfGMBioevg5isyqkrDCqmJG5YtxPz1cULz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR02MB8511.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(66556008)(66574015)(86362001)(26005)(186003)(6506007)(9686003)(55016003)(122000001)(38100700002)(38070700005)(52536014)(6916009)(5660300002)(316002)(8936002)(41300700001)(8676002)(64756008)(7696005)(33656002)(71200400001)(66446008)(66476007)(66946007)(76116006)(478600001)(2906002)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?YJYmclsv7YEpTGfzSb9gZs23Vl6Y0+R+C53HzFLdVZDYqEyr+gcuHNHcfE?=
 =?iso-8859-1?Q?MYCGAI9H9uYy7YSmRKkPri/iZesLo0uoc9l3BbMZTVDBa4d7Lou9XYpNsU?=
 =?iso-8859-1?Q?oaymFE3WsOkavFm+TfUSVcpVtTW1YjwfEZ6vko5jRmUTtYudyJr/1nHfY2?=
 =?iso-8859-1?Q?dBbT10kzR607fUa3dbaLTbzZIka5EkST3cp+9SqKnIkNkv9k023iLkbF6D?=
 =?iso-8859-1?Q?D55a055zvT57J90aJbungfkEfViapZKS2/Uynn4atfMOA1rtqL9t7eJtDB?=
 =?iso-8859-1?Q?ODOGwoVvud8ppuuOkjWU4nWTV/N3U1/B/8KPhKOj3SRalNZ8po8wvhJwLr?=
 =?iso-8859-1?Q?agX3osh5Cd9mn9UhYEBjH8ryhU3TFc5VUBqGE7/BL4K+/BlWdq8Cdkhtof?=
 =?iso-8859-1?Q?fuulsxah0yDDI3EMhHqL393RPGm5EWtTEGOLUKbdMLbLXSCFrj1WLWZxNm?=
 =?iso-8859-1?Q?EYpHe/iQ9MCxQ7+Hc6bJajVwZkevpiyguTdfYSUrPPNFeEKABlu8xTd3BH?=
 =?iso-8859-1?Q?GTsQyOwn4m0K2wZnUb7Di1TOXPIHjTV4UOVMum3ZNvxpbOBXtG2StEayGd?=
 =?iso-8859-1?Q?jIdAoR4wkA3M0sQF5RnTs07tSD/SRtsDKOgMjFQPUw+/ecNygRi1qzzR6r?=
 =?iso-8859-1?Q?pXxlWYMdkgKc5rF3qqn6+WpBsi8dTObK2ggSiYzMotksiyPx4w4gb3qbcm?=
 =?iso-8859-1?Q?MTyOw/QmqzSWSYWbYMIEhoUaJ85dhrzOFAy+IHIkKsmy6gh4EywPPayQ+r?=
 =?iso-8859-1?Q?3GFiQY/seAw2DX3WeZsBhkF0c79lIvfckO0EAN/JLb1Zr48iGd2djYVauC?=
 =?iso-8859-1?Q?DVJr1Pn6wTHU9YpZ8mUV5LS6SwBXnzyK6y/BszAT6Jcjkr35lTlkzhlL8O?=
 =?iso-8859-1?Q?iN+VP4+sgI/HlpuJESB2cxTyltZB8wu20ieQfluBzqLBXLsYUKKDiEwtJi?=
 =?iso-8859-1?Q?IRXdxSg1kv5ylk9zYIJLWC89y5PBdi/dRYcKEtstKSE9bQ2e3n5T2IK6Rr?=
 =?iso-8859-1?Q?qEZfgZayjqFKYgQAPkkujgeNPpB4Hk35y8O4VaePHRPYOfHj1aCv9pFWpx?=
 =?iso-8859-1?Q?BBACmDxQISSNlgQkG2sAa9d4whllbn5PgL3V2snVuJ9qIkpfBGqM9U+b3o?=
 =?iso-8859-1?Q?mabCjy0TrzUgcuDInoAKatBPVAebryJRCbzj4juGpLF+kfLFnfavjkAOS/?=
 =?iso-8859-1?Q?1j5Aa0IqHzVKFrygvsqfSXzVH2YKRq2g4dc+alcCI2K6B4CiZ/nftccgxm?=
 =?iso-8859-1?Q?RJEACwPMCXZGLEF6dU7DacGLMuXqWLIW5H0Wq30JpVk/9Gloio7Apl0UwH?=
 =?iso-8859-1?Q?o8dEntEmFtFzMLE06f+gpdM8SVS1uMBTRDcVbC0pyQussCn+G8/qw9BWDk?=
 =?iso-8859-1?Q?MXAJXz0J/rDSfb12Y0PR3IpDx7ifC6J5BI5G+24fj4cL9eyKm3owYpBhz+?=
 =?iso-8859-1?Q?q7CPOs8bxzNe9tyea5Wb6vBgJZgbHi8MSeojCAuJrjkLMtgKET8cBr/OvQ?=
 =?iso-8859-1?Q?FwhefI3i+FtaFY8rBfzLaBpxxIIlXpVKHrE4yAiU6HVZwmlGsG2rJweA5T?=
 =?iso-8859-1?Q?7M/1FvU7usuaHr3jyQeTb5FLtg9lxb1lv8/wSY9s27M1ptoHSeZGQXsUBZ?=
 =?iso-8859-1?Q?Nhvrf/EsT6UInQR+9Tt8TyxKztz9o1LzX9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	cVZ/KuU8mdfDTT87upRHMBh30WfGeBxH8Rl3ClIM2LLhhMv2uFLTOhISCSlBYhOkw/ne9fSofaFCPEMRZMZFczoojXllmrBkhrSn18ZhptQTGSBojslAq3GRFYEphhzaeE3+p+MStyfE5oHXf8X54L9TlG8P8z+gdbpTVk0gsED9unYFquNY/utJ97yjIGo/SgPl7dlMDDeTv61W32k/SmUWOoqkQVUX1XdNyGeZcSD2Hd3hUcPal67VmUKUXtYBdx4B4R/M0Az3tJnA3DUTV2Ri22jClCzlc8d8SHebLE+AE9VDrxjaqNKfTybyJ2wMxMC/DQrGTCW00PhO3vCOBcNDEBoWtOBVuvgaoPqpcL2JZeYctjWWsrAmz49H9LD4mxz817y/DnOHmHU96hXSMO69JEHXBrYcUhKbXNqBy+Sfu3A99fei2JiS7mOPYLtHZfSZ08VHXfJeRy7okWL1WKQwumtTNTYQ9eA4I5gA3Hfe4l9HNDXLNODrdG4tSMxG9mu9y1trdigAz8LiEmA8uEX/5IjNdQpL1IRmWXGk9Gg2GzEkvgIM+XafnTw4XVtqARIL2D8mjejFQRFdMZ3FlchywTJ8r4Dt/DHjlcUdVlqiJD5Iq91w+Kq75MrRvPNUlGjKk9ToVGSpeWhGAuGhSDq3XI8AEXy+VmhGdsvnfhLy3Miw2P3gR5cALa7yVgyVtySuytWFx3uX6BV/IXE57F211O9ChwKteVzEf0fvK9h4SJFR9UnWOQVfKSXTyBSjwQthRaZfZ7wHmdrx8b3LD34ykM7YI4EXBpWtkeFQ/qs=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR02MB8511.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a37243-97b0-4f05-80a0-08db458ac9a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 12:44:19.3332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ylj/5liMMgcq73GhWX1uz02vywu/du9tR3FcvjOIH3x7Vstynw6QuANVINHn603yWzZB+Kb2nMlFmHN+492qkcTngwMgM2ME0DUJ88tf0pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6849
X-Proofpoint-ORIG-GUID: SAnhC9xrAksTKR5K2Y-A2-0plpxQgrws
X-Proofpoint-GUID: SAnhC9xrAksTKR5K2Y-A2-0plpxQgrws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_05,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=751
 adultscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250114

Hi,

We are from Qualcomm. We are actively upstreaming support for some of=A0 ou=
r IPQ (Router chipsets, IPQ807X, IPQ5018, IPQ9574, IPQ5332).=20
Hence we want to run the kernel CI test suites from the kernel trees (linux=
, linux-next) .=A0 Boards are there in our local board farm inside QCOM.
So wanted to understand the process involved in testing our boards and gett=
ing the results published on the kernelCI dashboard.=A0=20
Can you please help us here ?

Thanks,
Ram
