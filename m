Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F23518AF0
	for <kernelci@lists.linux.dev>; Thu, 21 Sep 2023 20:30:37 +0000 (UTC)
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LJF5tT024040;
	Thu, 21 Sep 2023 19:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=nUA2Kpf0vSAIpOS2Z+qexvGrLwlMsK5zlCH/6g5fuyw=;
 b=kAok/yPQ2nhOzwsR8VxG/9OtqY3EWe99C1E3m9gq/5bF8T3vGXyDHs7At3I2EgM49EnS
 m9s4hd+fVJEP4St5JKZUf08gLe07Uejn/xEUlcqCPHtuG0WtJw/6diiF45yUzpGYYL3X
 TCKTjefY39KQiimOPBAaYH8STIWdH6CAM6ZLdTgyFBCSNb48C2VFCEBSiDf3OptKHAw7
 UZ2T0fMMPjR/OB1rDjueVGPkFgU1kzH5FLaoZwduB3pOpFrRcTwoOsXZdeLtBF9NBkEM
 6qO4LBcSW1k0TwGVl9qfFQrKC03/ZC4+bu2eepVO3LCyD3WFcsIbJ7RdvGM1/MGsg9ID BQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 3t8ts3826g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Sep 2023 19:42:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUhM5Gp6eCeyMM/EZ6vAZCPiosLPWCJv1emGNfVjfLhZbZyH+kl78ohxkkeMCsCpBxesbJzZ8V3SUh5OreG33CFCjq8TgbbBU5rX/cWmZvole/qNe0Gy++a7AfQZ+hBnhraq3wz8V3TWuFZgvfALG2RkKbbn0kdDW7rq71Nu/tHQtSypYNXBSfiN9xzwzisK4AnVefejgVwHZm3qIrgBF9BxDSF+ImRDJjIyJyG0a4NBThbLf5I/C2fINtXwmxDtWlfC+SOMXZmsVFKixX5NGNYS6YfnunTE2/BXwNFmPA0pMPSxV7CAAEG2zbg7HYLF9YUqmsM36EIl4Q8YAPfXdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUA2Kpf0vSAIpOS2Z+qexvGrLwlMsK5zlCH/6g5fuyw=;
 b=aEud2ujYcgLZzPcLWPAExu9GrXCp1rdxjCTG0eT+QqPxpfHQbGHaR23SM9bjXexQ0Gn7uz1RaQgbNvtqX9Bl5kjc35gIU2UyPrF7TZ+Jvvb+gh3sw4d5tnw6ov4xzQV1G+B1hVBThK/eCCfSHE4bvfbHLUhAddiR6MONLeqkQnCLXZNQ91Z3dSGo5xTMA+iwVSAFWeqgBntIWm0DOWiEM0WqtXhlfRUjkz2hxX9jGJBILfyrz8N5euJNrqcU8YI34LivkzMut7O/PD0iAMMy7uKfsewQBgxrs5kHvPu3TuJleNHp8lVAvKf+Qz6rPLJWjkcm1Y0+M46pGJ440YPZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BYAPR13MB2503.namprd13.prod.outlook.com (2603:10b6:a02:cd::33)
 by BL3PR13MB5196.namprd13.prod.outlook.com (2603:10b6:208:343::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 19:41:57 +0000
Received: from BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::7cdf:18ea:7644:334b]) by BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::7cdf:18ea:7644:334b%7]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 19:41:57 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
        "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
CC: "automated-testing@lists.yoctoproject.org"
	<automated-testing@lists.yoctoproject.org>
Subject: RE: [Automated-testing] kci command line poll: Click or Typer?
Thread-Topic: [Automated-testing] kci command line poll: Click or Typer?
Thread-Index: AQHZ7Gn0fLsxKxVdYEmdYZc1A3JrubAlp6dw
Date: Thu, 21 Sep 2023 19:41:56 +0000
Message-ID: 
 <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
References: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
In-Reply-To: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR13MB2503:EE_|BL3PR13MB5196:EE_
x-ms-office365-filtering-correlation-id: 60ca68ac-5177-4c8f-bb0c-08dbbadad0a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QK8Af4npmFe1yPsKY/6bJHAYIDvYXLmfwJvvNqgY5ivKfaSVzyZKY3OeePj2smLFIGQV2CA5gYYGyFCQeZ4lEoNSWPAYSo1WQiBXexbodv7jsShC7t5KJCPLmvevG8iA/ZudwOeI+aom1gBU5IlS72QwL/ArybrZCTmjZeGTobKxCntmx5WjWCFWKwD1AicbbPL3RNgSQNhcBp95wp0zdK4BYYv2rq5lBI5CwZdIkABaRtXJPdsc/rzEaP/oX5iAoicY+b5jXr2NpSUfvnFhoBycDKuf0+w4m62D+HhJhDPyLE8MGkBbVvOT7EdolJdjal0hSksa2k8L6Aca51+SKyFYmhSiLi22/0F/t3jerAGmu/lEEe1D3efGmzvkbUI3APnZjAA8d601zmk8XWBT2LpFbxsEa38gUO0ufGFt+69c/8C653Y32YdMQ9+sxojhWW3eGZ/2oargbcC9Wu87SGVA1Zow+uieOTjEPatqyWGTyD8jAGD3pM433zET6OYYRSTSGgOWz61OQbIJiWPKdIZHJAZfqKEqUxWP3l16wqhrPikdj8sX+EY+fqZ2XKdfTWValGANGHg6GrBWijSfkrNy97vuhWk+G0vvQW07ZmpaXKEfq0GWoCIvuwYB+CA/8Z8lakYQyk1U356E8b42IA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR13MB2503.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199024)(1800799009)(186009)(41300700001)(5660300002)(26005)(2906002)(55016003)(122000001)(82960400001)(38100700002)(33656002)(4326008)(38070700005)(86362001)(8936002)(8676002)(83380400001)(478600001)(9686003)(52536014)(6506007)(7696005)(966005)(316002)(76116006)(71200400001)(110136005)(64756008)(66946007)(66446008)(66476007)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SnNuZ3Vqd0pDc05ZckpkTk1uVjBQeTEycFNsYkVaeW1SUlQwTHVIaTVrSEgv?=
 =?utf-8?B?azB6M005WUluWDRFMEJMYU1KQjV4cGlJd0VaNjVzSkt6K24rVkljYVlTYXo2?=
 =?utf-8?B?b1c3dzJxdWZKenRLaXFNQzBPMk9kbGw5bFVub2l2YTJ6YjBPWWhlK2hZR0xy?=
 =?utf-8?B?RngwMURzUWJ4QTlPN3lKZ2JuSnlhcHpBeTZyWXc0SzZFYThtY2V1U2wwcGhx?=
 =?utf-8?B?KzU4Vjloc3lhQWFnd1NtSE0xRVNvU3l0T2VvMWJ5RTB1T3ZCK3orbmk1cEVn?=
 =?utf-8?B?ZjhEVmlGMlJWd05kNllKd2pnY0YxWUhmZXZtS2RNYzZBbmdsL28zdW16YVdO?=
 =?utf-8?B?RDdGMlBlZG9jNXgwemFZaTZmaFhrMUFtYno2VTY5eHA3LzJjby9hNy9oMzI1?=
 =?utf-8?B?ZUMwZElVN2VjWHcweUpLWTZoaG1VU3p1dFZqemRCUDhySEpLQUlGNkw1RG5X?=
 =?utf-8?B?LzNnOGNkakUwTDZoM1k1cmF5c3oxYkFtdEo5bzJCS0Y5Qk9kVW93enNRZTFa?=
 =?utf-8?B?WjRyNEpzZmhVS0l0VWFaZlMvNExBM0hSMnV1TUJ0S2hzdFRPbFFSb0p4dkZX?=
 =?utf-8?B?dXh4K1hJaEhzVWRpSzdNdWdNTW9sRmErZUp4anhHZzdCQ2I3Y2JSdnJYaU92?=
 =?utf-8?B?WWkzbWJBZGd4RlkrY29VeDdsQ0lZSGh3dS9HT3NFa2Vrd0tEK2t3MTRZRmE5?=
 =?utf-8?B?NWxNak5yK2tvdHFNQnBnQ3BLaHFXQ1RqVVNVdFRYWXloak9LSHFDUlVnL0lZ?=
 =?utf-8?B?U3pmdXUrM1h5ZUtMQ0RacVpXbDdwUXltRWRQY1ljZ3orSFU1NE4xUm9RenFu?=
 =?utf-8?B?ZXJBUENBRVgxVVp0aGZMMlV1TE9CWUl0NlZjQk9NWVR6RUhUTmNRbnNPU1ZE?=
 =?utf-8?B?cHU2b1RyTEJVUVBLUnJ3ZDNRV2NNLysrUDZKL1hob0pPVXF2ekZLTlA4MWUz?=
 =?utf-8?B?ZzlnVjNNQ2tkeksyTnBSa2ovQm81T3dneEhxK044dWY2OW9OQnAzSmhKbDAz?=
 =?utf-8?B?QWV4Mk5nVDF5SXdoLzBUNFlxRmRIajBJS0V4aGllWldjREFQWDJYdlFSbUFH?=
 =?utf-8?B?UGE3WHZhakp4T09LbHpDYVArS090cll6bkxXMGdmejNhc2tFOUxKVS91SDU3?=
 =?utf-8?B?bnltK0R2aVl6eEtaZDdNd010eGRmcWUxWUhMdnVFcFRnenBuWlBhK1E4QVdE?=
 =?utf-8?B?Um1hZEdkanBPUm81RlE3amZldE5mTkNxRVNPRkFCeUhXRndYZlFQZmFzMzMy?=
 =?utf-8?B?ZmdUYUZHMVVTRFZOVlRwQXhxSGNkYUxCdFgydXBTUStEUmc4YXpEUXRpUG9w?=
 =?utf-8?B?eHA3Y2I3SzVkWExoSjlRT0k3aml4M2R5RU1meUd1TWpXYzhvUmVzRzZ1Rkpm?=
 =?utf-8?B?TmhWSzRIR3ZocDBLenUvRTYyaWQ0MWtrMHMrM0NQTVRaWkM5Ni9yMEluYXNN?=
 =?utf-8?B?bUhCQloxRGxpcHhQTU5aNDYrWmhvRmpMUHd2S1FnSnRBVEFKOXFwdHFmWjQx?=
 =?utf-8?B?YmcvbkI5QWFqc1dKWnk2a1JkRzhTcFA3SlFnRmZaUHY0R3lPcnV2eVBDd1Aw?=
 =?utf-8?B?ZW4zL0JTUldnNHhQbE5qbnh1Vm1UK2xiSTVzeXdvTEJWV1ZjalpMblNZQUx5?=
 =?utf-8?B?QmJ0WU5ubjcxa1BRNzRRanhJbG56LzkyNkZLazZjOVUyVzFTWXNLOVNHWTJZ?=
 =?utf-8?B?WW16bXZ6dlpWbkEzUHcvaTNUbTIvNGt0dHN0L09XTjlUMlBhVXYxN0N2ZEJC?=
 =?utf-8?B?T1pqak5BQzlpVzc3L1ViRDRienFWZHgyaVdSMURhUkJSQTNBT1NNaVJqd1FB?=
 =?utf-8?B?QkdnVmxEaWhXNkFoeGdINHZRL2hGelRaN3ZKNmdXWk1xVXdvbUp6ZEFzaTZH?=
 =?utf-8?B?bENPWnREd0FCZndpKzlsdng0OWZpOS9rL2MvelpnTDNyRFgwVUVmNzIyZVg2?=
 =?utf-8?B?bjg5NnJtYVlqTVA4Qlpjb3lmNGh4aWV3THpiNG1UbmFuUDkyOTE3aEp6eW9K?=
 =?utf-8?B?UDU3WFRxWUtocHQ3YkRNSCtmaDhXSU5sRXVJdFlZcjU5R2Y5dUtoSnBuVzNz?=
 =?utf-8?B?Y3UzYUNqVkZhYUZ4QzFOVUx5SG5KLzVIUGFMQlFkWHdkWXJEV2tnWXk3UElL?=
 =?utf-8?Q?FtxA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Jz00BSXe2gNbPNSVVblner1hVqQZBBI+ZGsg81WocSWV3emBGlqTQbz/s5u4UqdlikqI5brcPmgHu7sTPF9e9dYhAMSN1ZOKhadCx8k7SXg9plFQQxwYJQx7WrGrbp8baXwTkeLAeee2UcfcsUjaWZ7ireY0TvIBvNeLJVKc60JtDdNuX6x1Gugb6R+yh+6OnT+DGJWivnx0iYEpWU4pR4QfbsrjNFK3m25L7TpFYUxhSIhtZlMfO9Iqt+pwyK3+tQOPH/vKqtVrM/I6V+cgtMAPVCqSYlwEWUPEpsis9WZSufks2hWAxC0VOeP6WIuUAGT1kz92SNs7TnvhXNFDiwAP1iWW1u40hndulIrBUVpmOux0uqjr4OI1OGqiwDutBIOf/X0qrFCqto10YLbj97CAGX0ig4qjWF18+wK+kqf0LSP0opJn1jE7yO27sB0KeWWp5yLrwlekXuA9Q0IR/y/r8x9ytJgV1kLwy1AnIzzQ7lLSmlxCSiF2hc+gDCnG0upZmjrMEIXv0w5eTNdilIbOxb/GS5ACp5nSKi45BRAbfTsHguFy0g4664l91PW+vnldzA9jA2so51shgtzjuqVHsVfTab/eiTdDHQbOqc7800wy+SGYj+dV7bDts21aRQ5rbg2P14J/z+v5KPsR9lfu+MD3Uyu/3huGtcKAS7Zn2z0PSE1W+lTJf5CnVmSVaEgE6t0EHcBysvQRrLwWvxEY3jgwH8dy4Crm5GNFfuMMBafTgym2Zzunakw6qajwV0QxI0eRqlOKHRtWwMUrKY2UCVtYzCHCVVqjS2KOFympee+q8BRwbYmTAGn31JmV6cJVjyNpzSqKKMbG9kL/ta2dUm6CU72d670OXQPtPW/umIxp+fwVMY1YBj6/9/4r
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR13MB2503.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ca68ac-5177-4c8f-bb0c-08dbbadad0a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 19:41:56.8825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5NgfmS82rpYADiQeccsUJMRY4TU9AmXhzW5EU581kItoB5210HXRlIdiySMuGnTLt1UgTaJunx9aMqZ7hZQRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR13MB5196
X-Proofpoint-GUID: p2PpEb5AHH7K3ihwWHyUAtuslwL6XMq-
X-Proofpoint-ORIG-GUID: p2PpEb5AHH7K3ihwWHyUAtuslwL6XMq-
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Sony-Outbound-GUID: p2PpEb5AHH7K3ihwWHyUAtuslwL6XMq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhdXRvbWF0ZWQtdGVzdGluZ0Bs
aXN0cy55b2N0b3Byb2plY3Qub3JnIDxhdXRvbWF0ZWQtdGVzdGluZ0BsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnPiBPbiBCZWhhbGYgT2YgR3VpbGxhdW1lIFR1Y2tlciB2aWENCj4gQWxvbmdzaWRlIHRo
ZSBuZXcgS2VybmVsQ0kgQVBJIHdlJ3JlIGFsc28gd29ya2luZyBvbiB0aGUgbmV3DQo+IGNvbW1h
bmQtbGluZSB0b29sICJrY2kiLiAgT25lIG9mIHRoZSBrZXkgZGVjaXNpb25zIHRvIG1ha2UgaXMg
dGhlDQo+IGZyYW1ld29yayB0byB1c2UgZm9yIGl0cyBpbXBsZW1lbnRhdGlvbi4gIFRoZSBsZWdh
Y3kgS2VybmVsQ0kNCj4gdG9vbHMgdXNlIHRoZSBzdGFuZGFyZCBhcmdwYXJzZSwgbm93IHdlIG1h
eSBjb25zaWRlciB1c2luZyBDbGljaw0KPiBvciBUeXBlciBhcyB0aGV5IGFyZSBwb3B1bGFyIFB5
dGhvbiBhbHRlcm5hdGl2ZXMuDQo+IA0KPiBIZXJlJ3MgYSBzbWFsbCBwb2xsIHdpdGggZXh0cmEg
Y29udGV4dCB0byBoZWxwIHBlb3BsZSBtYWtlIHVwDQo+IHRoZWlyIG1pbmQgYW5kIHZvdGUgZm9y
IHRoZWlyIGZhdm91cml0ZSBjaG9pY2U6DQo+IA0KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9rZXJu
ZWxjaS9rZXJuZWxjaS1wcm9qZWN0L2Rpc2N1c3Npb25zLzI1OA0KPiANCj4gSWYgeW91IGRvbid0
IGhhdmUgYSBHaXRIdWIgYWNjb3VudCwgeW91IGNhbiBhbHNvIHJlcGx5IHRvIHRoaXMNCj4gZW1h
aWwgdG8gdm90ZSBpbnN0ZWFkLiAgRmVlbCBmcmVlIHRvIGFsc28gYnJpbmcgdXAgYW55IGRpc2N1
c3Npb24NCj4gdG9waWNzIGhlcmUgb3Igd2l0aCBHaXRIdWIgY29tbWVudHMgb2YgY291cnNlLg0K
PiANCj4gV2UnbGwgbG9vayBhdCB0aGUgcmVzdWx0cyBhdCB0aGUgZW5kIG9mIHRoZSBtb250aCBz
byB0aGVyZSdzIGENCj4gYml0IG1vcmUgdGhhbiBhIHdlZWsgbGVmdCB0byBhbnN3ZXIgdGhlIHBv
bGwuDQoNCk9rIC0gc29ycnkgYWJvdXQgdGhpcywgYnV0IGhlcmUgZ29lcy4uLg0KPHJhbnQgb24+
DQoNCkkgc2VlIGV4YWN0bHkgMCUgb2YgdGhlIHBlb3BsZSBzYXlpbmcgdG8gc3RheSB3aXRoIGFy
Z3BhcnNlLCBidXQgdGhhdCB3b3VsZCBiZSBteSByZWNvbW1lbmRhdGlvbi4NClRoZSByYXRpb25h
bGUgZm9yIHRoaXMgaXMgdGhhdCBhcmdwYXJzZSBpcyBvbGQgYW5kIHVubGlrZWx5IHRvIGJlIGNo
YW5nZWQgaW4gYW4gaW5jb21wYXRpYmxlIHdheSBpbg0Kc29tZSBmdXR1cmUgdmVyc2lvbiBvZiBQ
eXRob24uIA0KDQpNeSBvd24gcmF0aGVyIHVuZm9ydHVuYXRlIGV4cGVyaWVuY2Ugd2l0aCBQeXRo
b24gaXMgdGhhdCBpdCB1c2VkIHRvIGJlIGEgcmVsaWFibGUsIHN0YWJsZSwgcm9idXN0DQpsYW5n
dWFnZSB3aXRoIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5LCBidXQgdGhhdCBpcyBubyBsb25nZXIg
dGhlIGNhc2UuICAgUHl0aG9uIGtlZXBzIGFsdGVyaW5nIG1vZHVsZXMNCmluIGluY29tcGF0aWJs
ZSB3YXlzLCBpbnRyb2R1Y2luZyBuZXcgc3ludGF4IHRoYXQgaXMgbm90IGNvbXBhdGlibGUgd2l0
aCBwcmV2aW91cyB2ZXJzaW9ucyBvZiB0aGUgbGFuZ3VhZ2UsDQphbmQgZGVwcmVjYXRpbmcgbW9k
dWxlcyB0aGF0IGFyZSBpbiB3aWRlIHVzZS4gIEp1c3QgdGhpcyBwYXN0IHllYXIsIHRoZSBwb3dl
cnMtdGhhdC1iZQ0KaW4gUHl0aG9uIGRlY2lkZWQgdG8gZGVwcmVjYXRlIHRoZSAnY2dpJyBtb2R1
bGUsIGFuZCByZW1vdmUgaXQgZnJvbSB0aGUgY29yZSBweXRob24gbGlicmFyaWVzLiBJIGhhdmUg
c2V2ZXJhbA0KKGFkbWl0dGVkbHksIHZlcnkgb2xkKSBweXRob24tYmFzZWQgY2dpIHNjcmlwdHMg
dGhhdCB1c2UgdGhpcyBtb2R1bGUuICBJJ2xsIGxpa2VseSBoYXZlIHRvIHJld29yayB0aGVzZSBz
Y3JpcHRzDQppbiB0aGUgZnV0dXJlLCBqdXN0IHRvIGtlZXAgdGhlbSBmcm9tIGJyZWFraW5nLCBh
cyBuZXdlciB2ZXJzaW9ucyBvZiBQeXRob24gYXJlIGRpc3RyaWJ1dGVkIHdpdGggVWJ1bnR1IGFu
ZCBEZWJpYW4uDQpBIHNpbWlsYXIgdGhpbmcgaGFzIGhhcHBlbmVkIHdpdGggb3RoZXIgbW9kdWxl
cywgc3VjaCBhcyB1cmxwYXJzZSBhbmQgb3BlbnB5eGwuICBCb3RoIG9mIHRoZXNlIG1vZHVsZXMN
CndlcmUgcmVmYWN0b3JlZCBieSB0aGVpciBhdXRob3JzIGluIGEgbm9uLWJhY2t3YXJkcy1jb21w
YXRpYmxlIHdheSwgd2hpY2ggY2F1c2VkIGJyZWFrYWdlIGFuZCByZXF1aXJpbmcNCnJlZmFjdG9y
aW5nIG9mIG15IG93biBweXRob24gcHJvZ3JhbXMuICBJIGNhbiBhdHRlc3QgdGhhdCBrZWVwaW5n
IHB5dGhvbiBwcm9ncmFtcyBydW5uaW5nIHVubW9kaWZpZWQNCmZvciBsb25nZXIgdGhhbiAxMCB5
ZWFycyBpcyBhIHJlYWwgY2hvcmUuICBUaGUgc2FtZSBpcyBub3QgdHJ1ZSBvZiBMaW51eCBwcm9n
cmFtcyBhbmQgQyBsaWJyYXJpZXMsIHdoZXJlDQpiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBoYXMg
YmVlbiBhIHByaW9yaXR5IGZvciB0aGUgdXBzdHJlYW0gZGV2ZWxvcGVycy4NCg0KVGhlIGZhY3Qg
dGhhdCB0aGVyZSBhcmUgbm93IGFkZGl0aW9uYWwgYXJndW1lbnQtcGFyc2luZyBvcHRpb25zIGF2
YWlsYWJsZQ0KZm9yIFB5dGhvbiwgdGhhdCBvbmUgbmVlZHMgdG8gY2hvb3NlIGJldHdlZW4sIGtp
bmQgb2YgdW5kZXJzY29yZXMgbXkgcG9pbnQuICBXaGljaCBvbmUgd2lsbCBQeXRob24gc3RpY2sg
d2l0aD8NCldpbGwgcHl0aG9uIGRyb3Agc3VwcG9ydCBmb3IgYXJncGFyc2UsIGNoYXNpbmcgc29t
ZSBuZXcgIm1vZHVsZS1vZi10aGUtbW9udGgiIGZvciBhcmd1bWVudCBwYXJzaW5nPw0KVGhlIGZ1
dHVyZSBvZiBsb25nLXRlcm0gc3VwcG9ydCBieSB0aGUgUHl0aG9uIGNvbW11bml0eSBmb3IgYW55
IG9mIGFyZ3BhcnNlLCBDbGljayBvciBUeXBlciBpcywgSU1ITywgdmVyeQ0KbXVjaCBpbiBkb3Vi
dC4NCg0KSWYgeW91IGRvIHN0YXkgd2l0aCBhcmdwYXJzZSwgSSB3b3VsZCBwdWxsIGEgY3VycmVu
dCBjb3B5IG9mIHRoZSBtb2R1bGUgaW50byB5b3VyIG93biByZXBvc2l0b3J5LCBzbw0KeW91IGFy
ZSBub3QgZGVwZW5kZW50IG9uIHVwZGF0ZXMgb3IgZXh0ZXJuYWwgcmVwb3NpdG9yaWVzLg0KDQpG
b3IgbXkgb3duIHByb2plY3RzLCBJIGhhdmUgbXkgb3duIGFyZ3VtZW50IHBhcnNpbmcgZnVuY3Rp
b25zIHdyaXR0ZW4gaW4gbmF0aXZlIHB5dGhvbiwgc28gSSBhbSByZWxpYW50DQpvbiBhcyBmZXcg
Y29yZSBweXRob24gbW9kdWxlcyBhcyBwb3NzaWJsZS4gKFNvIG15IGFuc3dlciwgZm9yIG15IG93
biBwcm9qZWN0cywgdG8gdGhlIHF1ZXN0aW9uIG9mIHdoaWNoDQpleHRlcm5hbCBweXRob24gIG1v
ZHVsZSB0byB1c2UgZm9yIGFyZ3VtZW50IHBhcnNpbmcgaXMgIm5vbmUgb2YgdGhlIGFib3ZlIi4p
DQpUaGUgcHl0aG9uIGNvbW11bml0eSBqdXN0IGNhbm5vdCBiZSB0cnVzdGVkIG5vdCB0byBicmVh
ayB0aGUgbGFuZ3VhZ2Ugb3IgdGhlIGNvcmUgbW9kdWxlcyBpbiBhDQpiYWNrd2FyZHMtaW5jb21w
YXRpYmxlIHdheS4NCg0KSWYgdGhlIHB5dGhvbiBjb21tdW5pdHkgY2FyZWQgYWJvdXQgYmFja3dh
cmRzIChhbmQgZm9yd2FyZHMpIGNvbXBhdGliaWxpdHksIHRoZXkgd291bGQgbm90IG5lZWQNCnRo
ZSB3aG9sZSBtZXNzIHRoYXQgaXMgdmlydHVhbCBlbnZpcm9ubWVudHMuDQo8cmFudCBvZmY+DQoN
Ckp1c3QgbXkgMiBjZW50cy4NCiAgIC0tIFRpbQ0K
