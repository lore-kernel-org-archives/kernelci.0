Received: from sjdc-mailout4.udc.trendmicro.com (sjdcvmout04.udc.trendmicro.com [66.180.82.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6873D989
	for <kernelci@lists.linux.dev>; Thu, 12 Oct 2023 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trendmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trendmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=trendmicro.com header.i=@trendmicro.com header.b="Q55nuvt3"
Received: from sjdc-mailout4.udc.trendmicro.com (unknown [127.0.0.1])
	by DDEI (Postfix) with ESMTP id 8CBEA1621058;
	Thu, 12 Oct 2023 21:44:15 +0000 (UTC)
Received: from sjdc-mailout4.udc.trendmicro.com (unknown [127.0.0.1])
	by DDEI (Postfix) with ESMTP id 7CEAA1621054;
	Thu, 12 Oct 2023 21:44:15 +0000 (UTC)
X-TM-AS-ERS: 10.45.168.5-127.5.254.253
X-TM-AS-SMTP: 1.0 U0pEQy1FWENIMDIuZXUudHJlbmRuZXQub3Jn emRpLWRpc2Nsb3N1cmVzQ
	HRyZW5kbWljcm8uY29t
X-DDEI-TLS-USAGE: Unused
Received: from SJDC-EXCH02.eu.trendnet.org (unknown [10.45.168.5])
	by sjdc-mailout4.udc.trendmicro.com (Postfix) with ESMTP;
	Thu, 12 Oct 2023 21:44:15 +0000 (UTC)
Received: from SJDC-EXCH02.eu.trendnet.org (10.45.168.5) by
 SJDC-EXCH02.eu.trendnet.org (10.45.168.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 12 Oct 2023 21:44:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by exhybridnabu.trendmicro.com (10.45.168.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27 via Frontend Transport; Thu, 12 Oct 2023 21:44:12 +0000
Received: from DM5PR0102MB3477.prod.exchangelabs.com (2603:10b6:4:a1::19) by
 PH0PR01MB6136.prod.exchangelabs.com (2603:10b6:510:12::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.43; Thu, 12 Oct 2023 21:44:09 +0000
Received: from DM5PR0102MB3477.prod.exchangelabs.com
 ([fe80::ed40:6233:b47c:50a5]) by DM5PR0102MB3477.prod.exchangelabs.com
 ([fe80::ed40:6233:b47c:50a5%6]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 21:44:08 +0000
From: "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
	"secalert@redhat.com" <secalert@redhat.com>
Subject: ZDI-CAN-22317: New Vulnerability Report 
Thread-Topic: ZDI-CAN-22317: New Vulnerability Report 
Thread-Index: Adn9VS9HPeTkrgv3TnebwgmDziOiuQ==
Content-Class:
Date: Thu, 12 Oct 2023 21:44:08 +0000
Message-ID: <DM5PR0102MB34778BDC7668A45F8F55780180D3A@DM5PR0102MB3477.prod.exchangelabs.com>
Accept-Language: en-US, es-ES
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_ActionId=6d4961f2-90e0-4145-91f8-e5a8ed76c593;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_ContentBits=0;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_Enabled=true;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_Method=Privileged;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_Name=Public
 Information - no
 protection;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_SetDate=2023-10-12T21:43:34Z;MSIP_Label_fb50d67e-2428-41a1-85f0-bee73fd61572_SiteId=3e04753a-ae5b-42d4-a86d-d6f05460f9e4;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR0102MB3477:EE_|PH0PR01MB6136:EE_
x-ms-office365-filtering-correlation-id: 2c973b9a-744f-40ac-10bb-08dbcb6c5d4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qot9Ve85R25hoKjOcAenaOeTCG3BDuCHCIoSXg1N6G8L1+Ym5afKlYVfH5WJM8l623GCEFm1djZXbtVGDrNQLWKPFa9wT21bgAbfkxgYiMbBswiNehEHXTfafg9NRV/yF/GuYOOHqh0WUeoe3kAqR+fti71weHfm1gRuoJEUP/yAFg1RHuqXxZxVAruZFFAcG6tZWEZVkDMQvBVEhlV61sfeX1PX9QJl5IBXSMt62nYA42zW6nNTSWoHlKg+ocIgoTDr7BI4beFss4r2VBgH/IwiEgY28AjEJ68etFycZ93zcM9XgIFy9SLYxeNgDuKsnrHOaikvEe5w/7t7tURp01FinxpMYZI2tFBiezzbbLo8erh2th/pn3RNDXZRfgiSPsJ4W1Q7jojPtrgbL/0QPa576b+C+SBEsIzxDIii8wuoPoFFjrQNX9MQIoNJGU0ieQxgPG7oxi3AptXCWIp8hoZfN/+N8NNzBgYJ2NsfZVjdkpA+t776UFDVg8t6Y1aCnNMGNX4nTP4XweO6OgrSjeHmzE0t6oKaiCjqc5/4qi5E4HfuMhPn4Szqfjbo5dFD2HclPYVhfojC+uNg/M/Xs8B2KigBPYH183eLoTrmOCdWNY3hifp8JG1ZAZZlDJ56
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0102MB3477.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(966005)(478600001)(55016003)(71200400001)(66476007)(64756008)(66556008)(66446008)(316002)(110136005)(76116006)(66946007)(2906002)(8936002)(8676002)(38100700002)(5660300002)(41300700001)(82960400001)(52536014)(33656002)(122000001)(86362001)(38070700005)(4743002)(26005)(9686003)(83380400001)(6506007)(7696005)(574254001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CrL/Y2N2zDAY0i6DeIYNsmuO+g9ZO5MnVXPp93EDh5Ubj6NIj4buj8lXbYli?=
 =?us-ascii?Q?vdOcYgINhm1XAf1CkGUvmkqiAYvR+iPwejmmJMobXtR6XsuNLazA/C1nc9qu?=
 =?us-ascii?Q?FpSX8pUXte+9qWOC52DWtLi9ixNFiGMO4WnIGTYM5VyzJe2TU0yVZ/Fk31ci?=
 =?us-ascii?Q?2VD086T7KS6QzNYkf8h+ntV0YxUyCYr0mL34FLQMu7CCSlbvuy7kR+1zMRCj?=
 =?us-ascii?Q?rMOKTX9T450CahArs9ivc3EF2V01hxivR/IoKLkgw6kLlcYxygfV/YWsrKw8?=
 =?us-ascii?Q?HfLqnn103gonqJsv47WG9iiFqRpfIrTLDj10q5WxQOE0yE03Xwfo8maLrSEL?=
 =?us-ascii?Q?LT+/gp11Zo5m57KNyxkg1HFqv4QJMI/E+yhozJIyrQX9wrmqpZH8jJrhNLz+?=
 =?us-ascii?Q?e2/IGg5R/xkt+YgYscGOuQz8qoP2hGbvLMmQrSISg3Zz48gKyboVnIliFtq2?=
 =?us-ascii?Q?CFHPQQELzkeRf1bhUOalLBhfU9YuENly6Xr5NEVIwwdzgt30Yodk5BAhSJV6?=
 =?us-ascii?Q?ZDKyGPb4yZt7Jh0trFI5ozErbEkyBNCXTrLKNCHoCtwI7wF2sy8wA/iehFpN?=
 =?us-ascii?Q?dkbab7B32JCTdVjB64kmir6Vbs2S66/zBxCW8qZrIpIVKmzKhkaOOUaH3F4f?=
 =?us-ascii?Q?6ntTR1wftSA59w1rJEB8fpSQbMulXrgACp6/yC6eWpzbMQErQpelnX8cY7QE?=
 =?us-ascii?Q?TO6k6DYsuT3f3IrjByrkTOiNTFU6X9+DmrrUWFiFcY6op/tmPn4xefjbx34O?=
 =?us-ascii?Q?V1AWCb1Ks5MNJM3nzdhHhMQQNI5zYB/XukefO+yr6kDUsmo9v5n0fdb7ki50?=
 =?us-ascii?Q?CdXC2bLspFKa1rb+eqyTdvIzlzkwO2cunOA4bl28dQESKbJ/IVwlGd/2xEdG?=
 =?us-ascii?Q?n9FiQbxtsesC3eWsMbFzg790tPXmjxMqE3tQ5rfGQC8n8BoIZfnQi2l5t6kh?=
 =?us-ascii?Q?bXJOPWQ/1ZX9OW0L+qb99ZR7aRZZ1DzCohAebDDHTWk9wJnfmqLXNgkRiT77?=
 =?us-ascii?Q?Mt8zUh4To/mVHcgSOPWrYeImpiSJx1XvqwH9s25GRHx+cjK4A2de5wfTM2Lc?=
 =?us-ascii?Q?+B1Xl0uWqwfg7wz0zaY1Q7B/f3rOkNLq7tQXVxD4iAZNUo9l6wpzlDrXN6aa?=
 =?us-ascii?Q?f/SPauBxzfH80TLS6RxAiFoI2CEaG2dTBpW3hFozLWI7noUeAqplHu0JowvE?=
 =?us-ascii?Q?CiaVMsQ4erZdjFeg//XdAFLAGJ6yArVWySV7wIShgYbo2zzi7P/bfPTlbb+G?=
 =?us-ascii?Q?9yZEYj8i9TLQfeG619NM2Q45Zt8f/q3hiuzgruNhIuPMBAOWOmmwXf1I4HRO?=
 =?us-ascii?Q?GXXNHB9zFYevdbcCW6OHs7rxa+bo/VkEJIp9EpuO+fEwMHf804wShA+zJpKv?=
 =?us-ascii?Q?BOqtC+zEO2+SGaQjlHuw0zN7NfjdLSp9+MIfLEymA5MAFNdAgzL8Gw6Ke28g?=
 =?us-ascii?Q?2jUPEMUhTruVMzjB/yfOyn1SJthg2Tu/WKkNBMYXfru9x5fXESaLWTwWwD7+?=
 =?us-ascii?Q?n7kfjQTwylOkLjYJZ0U0SWL/Wpu+bakUE3I/W/0BaS1u45pktbh98czIu5IG?=
 =?us-ascii?Q?bC5dl1RZFmLszyuC3vBFf7SxSYz0gAmLdsdZ0Cy+2FuKkRdsIHGTcRFUthxj?=
 =?us-ascii?Q?zJOfg4ehahuKDBC8jLrAptQ=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHdea/AKNHtE3nOtgpWYlxxWx0HNceSOWtycYAZm/NSQ8xn938/V7Qmgd5a+pT/Cy7f94s9XcxguHT95TzuA7EUrG6mhNc6xckzI30AKAWUbK2rF37CMpmAgiM+W+tSSDFodEmHaRn8AkbLC30OQbYMnz1g7xQb/o/dMnxSu7bBwWVzSv/Rt+qs2Cv3XNMehjlW35ngwZsyP6djA4XtYgG41Nwn1LjdKl7mlY43M7p8JAagpU1M1nRrLnH0xqJwtFiNhxZ4EDCv5wr1HgBeg5LC0ERoLWx1488paJyPp9d7A2SlHcgIUKJkB28SANRQmczCVCLMHtYBFcpABj9yW1A==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBPD3Nmb52yKXFW/SEy+1xrsMVo63tCA8zg3kv7ft/4=;
 b=BeI0IQkdL9eI60tW4tGbXlcNMRteSymqqTE45cNbCf4gd33Zv5s3fBwvQv0PRKh3jK2qeDwqDjn3Cgm8eRt1wl8bc7ia0V+jKhiHCSw3loONkA29KTO8G6fW4OuDMfl2lq+X39viZgTpWODe8g48Bj1X7gDBPutlEhZ3YSJe8HA2mYCf9U41NNR9ZtgIklr4Bw95dM5vppqhIGVLQR1So2+/jcrgBkcFv46TSP+xXb5B4Nvcah4buw12UN11KTOFrhaANicLzG5KvLuNBxGbBqjCOlKgx0JEdw5ZDEyCvQVWJgjqLtVPQbGJHT91ENbo1A06VxU1nyWO4ivUGK6bzw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trendmicro.com; dmarc=pass action=none
 header.from=trendmicro.com; dkim=pass header.d=trendmicro.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: DM5PR0102MB3477.prod.exchangelabs.com
x-ms-exchange-crosstenant-network-message-id: 2c973b9a-744f-40ac-10bb-08dbcb6c5d4f
x-ms-exchange-crosstenant-originalarrivaltime: 12 Oct 2023 21:44:08.4823 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 3e04753a-ae5b-42d4-a86d-d6f05460f9e4
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: lpTVPazGU7tP5Ko6Ez4KPxJvwF/sLb7QKcF0MKdbmAS/DGXXXEfpX4dD7GX/Vo35TcGamrc2e3jdmoHaJ3VcfN/30FbCQy3y6VvG0kwDbZ4S0Al344NiYnGF4pcmUmks
x-ms-exchange-transport-crosstenantheadersstamped: PH0PR01MB6136
x-originatororg: trendmicro.com
x-tm-as-product-ver: SMEX-14.0.0.3092-9.0.1002-27932.002
x-tm-as-result: No-10--32.050300-5.000000
x-tmase-matchedrid: mFLWMtmDO5c2eFTDBkQySuL9GXA85E8rhA0VjIpLz68dGynCN4u9Jaht
	0Rw1bqeLwOmwAwmxBrptyF53q0C3wrodLR4phi1GGoiRlSCh4/WvUMFjL9dpNRafr+KSjLTCK35
	Pvco7iqkXjQchKpIrqmLC8SKrUfwz9XbKQ7vYkcHP01G0ZRd+fwO3/A5KGHP/JLfQYoCQHFafj8
	7KPslF2JgvVfiqe2AOG6QHkv9DE13CnmsJV55PC+adXXcOleEb247cdjquF4N9FCQjTriNth+Di
	3+4QSRc/N4MjAdHDFcXlxePCzMBLKXYVfEVIGs3KiJEqUFWRgi7DVUQPiujJsnJhTYnTng9WXnj
	x2ksVfPvCuo9xVBOu5CKmw0MhOPbi9TEw+umK6oAPmNKDWsW0IReuqEmBUhJDO+DX+rUwfYFNN6
	hnEBsqi90QyZh1BA1tzx3yJL2seEQnn4qR0Bq7i+6f/7y7+GzeLLCA0PD7agli8Y5a0svL8Z1F8
	8rHoscUVn0Hl7+DrCYhz+/N2Jn4vvlwQ3r+q9MpkmxzOTCfBAU1xbljbMa+f67wpKrIJNBVM2p/
	cRDyjH8nEUb00k+QKAVlP5PcZkSpU28g+J+pA4Fxov+3JYvY9L5WpA78Ye8CednjFOfspzQlSkR
	ZxZ1vZ6gFSkoBduPPt7mfphHpo+kW3QSKk74kArcxrzwsv5uwfhsYBdMfbsPa94jf+HCb9ftCrF
	2sVs+rdZLelE6wFvHkD3MU9pI3ZLK6Sl8R3+It8DAtqRQ3KmMl2kGKWjzWasQd9qPXhnJ/4rWvp
	j9UcgD/dHyT/Xh7Q==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--32.050300-5.000000
x-tmase-version: SMEX-14.0.0.3092-9.0.1002-27932.002
x-tm-snts-smtp: B946C15FE766202DBAB8440B8519FAFBCB1539C553B680750EF2F2B20992C8712000:7
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-TM-AS-ERS: 10.45.168.5-127.5.254.253
X-TM-AS-SMTP: 1.0 U0pEQy1FWENIMDIuZXUudHJlbmRuZXQub3Jn emRpLWRpc2Nsb3N1cmVzQ
	HRyZW5kbWljcm8uY29t
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=trendmicro.com;
	s=tmoutbound; t=1697147055;
	bh=Py9ZYYQlxMEDMe0YXkqKF3/p/lDCV0JdZ25GeFbtenE=; l=5001;
	h=From:To:Date;
	b=Q55nuvt3mDwGbI4UwMrSiuAvprtEOS5rYAltVFEkMHi/a5UIag5Dxp2cUJtzJsDsK
	 cpA+SnGxC7bX2gwJXqi+jq3EknmhqOGiy+fyVek8/FW/f8jtAU5svlAPxCpg0hryCg
	 HTuTZ3Ra9Q8t1YOQTqgBIMfFtleyhuPK6S/C838g=

ZDI-CAN-22317: KernelCI SAS Token Incorrect Permission Assignment Authentic=
ation Bypass Vulnerability

-- CVSS -----------------------------------------

8.2: AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:L

-- ABSTRACT -------------------------------------

Trend Micro's Zero Day Initiative has identified a vulnerability affecting =
the following products:
KernelCI - KernelCI

-- VULNERABILITY DETAILS ------------------------
* Version tested:  NA
* Installer file:  hxxps://kernelci.org/
* Platform tested: Azure

---

### Analysis


We found an overly permissive SAS token mentioned in the GitHub repository =
for Kernel CI (an upstream Linux Kernel validation project under The Linux =
Foundation). The token allows for write access on the Storage Account, allo=
wing anyone with the publicly available token+URL to possibly.

While checking for files on GitHub with possible SAS tokens having the expi=
ry sometime after 2023 and having read and write permissions on the storage=
 service (blob, file, queue), we come across the below code snippet

```
hxxps://github.com/kernelci/kernelci-project/blob/104f95d1909fcccd7389f4a42=
ffa11a4d8d30cc8/kernelci.org/content/en/docs/admin/api.md?plain=3D1#L91
```

The over-permissive SAS token is: "sv=3D2022-11-02&ss=3Dbfq&srt=3Dsco&sp=3D=
rwdlacpitfx&se=3D2023-12-03T00:00:00Z&st=3D2023-09-04T00:00:00Z&spr=3Dhttps=
&sig=3Dg1lP2bLomBFr81hNnxi%2Bdi%2F8rvLI0aOZgzIgiZNDnIg%3D"

```
- The SAS token expires on `2023-12-03`
- The permissions `rwdlacpitfx` are over-permissive (Read, Write, Delete, L=
ist, Add, Create, Process, Immutability, Tag, Filter, Delete Version)
- The storage types accessible are blob, file, queue
```

Using Azure Storage Explorer, we could read write and list the contents of =
all the storage types in the Storage Account.


An attacker could modify any file on the File Share of the Storage Account =
and possibly impact users of Kernel CI. The expectation is to see that the =
SAS token allows for read, write and delete operations (based on the docume=
ntation at https://github.com/kernelci/kernelci-api/blob/b7a0f8f19fdba8f964=
9b282bd2d6fef874820efc/doc/early-access.md?plain=3D1#L149). However, any us=
er with the SAS token and File Share URL could control files on the File Sh=
are of the Storage Account.


-- CREDIT ---------------------------------------
This vulnerability was discovered by:
Nitesh Surana (@_niteshsurana) of Trend Micro

-- FURTHER DETAILS ------------------------------

Supporting files:


If supporting files were contained with this report they are provided withi=
n a password protected ZIP file. The password is the ZDI candidate number i=
n the form: ZDI-CAN-XXXX where XXXX is the ID number.

Please confirm receipt of this report. We expect all vendors to remediate Z=
DI vulnerabilities within 120 days of the reported date. If you are ready t=
o release a patch at any point leading up to the deadline, please coordinat=
e with us so that we may release our advisory detailing the issue. If the 1=
20-day deadline is reached and no patch has been made available we will rel=
ease a limited public advisory with our own mitigations, so that the public=
 can protect themselves in the absence of a patch. Please keep us updated r=
egarding the status of this issue and feel free to contact us at any time:

Zero Day Initiative
zdi-disclosures@trendmicro.com

The PGP key used for all ZDI vendor communications is available from:

  http://www.zerodayinitiative.com/documents/disclosures-pgp-key.asc

-- INFORMATION ABOUT THE ZDI --------------------
Established by TippingPoint and acquired by Trend Micro, the Zero Day Initi=
ative (ZDI) neither re-sells vulnerability details nor exploit code. Instea=
d, upon notifying the affected product vendor, the ZDI provides its Trend M=
icro TippingPoint customers with zero day protection through its intrusion =
prevention technology. Explicit details regarding the specifics of the vuln=
erability are not exposed to any parties until an official vendor patch is =
publicly available.

Please contact us for further details or refer to:

  http://www.zerodayinitiative.com

-- DISCLOSURE POLICY ----------------------------

Our vulnerability disclosure policy is available online at:

  http://www.zerodayinitiative.com/advisories/disclosure_policy/

TREND MICRO EMAIL NOTICE

The information contained in this email and any attachments is confidential=
 and may be subject to copyright or other intellectual property protection.=
 If you are not the intended recipient, you are not authorized to use or di=
sclose this information, and we request that you notify us by reply mail or=
 telephone and delete the original message from your mail system.

For details about what personal information we collect and why, please see =
our Privacy Notice on our website at: Read privacy policy<http://www.trendm=
icro.com/privacy>
