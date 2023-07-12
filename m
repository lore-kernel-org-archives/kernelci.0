Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80272182
	for <kernelci@lists.linux.dev>; Wed, 12 Jul 2023 03:01:08 +0000 (UTC)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.17.1.19/8.17.1.19) with ESMTP id 36BMjdFt005447
	for <kernelci@lists.linux.dev>; Tue, 11 Jul 2023 20:01:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=s2048-2021-q4;
 bh=6Bayc7UfB6+2mMTlLDDoJ/fIyDkyHQefXlM4I9lXigA=;
 b=k1tzmnuQ1ahm4bo0Qvt1YrFrrlVik+ymjzK6dgSbta4vpu4tuv32t8ptBhjl6HlTEnSM
 ak+Fxq7RiOWrf76npWxYbudTkIXZrEz3oqUkI2u3LcBIlLXcgh2pL+8zJAswdJauZ1mc
 5+cozj9jC5rknrmyZ506GE8Wd2hNgyIEUWqJOWfp8skXH02dYa/aF3uMQJwj3et105mn
 laC7DIJEohIQBEyIpbM1P0ttkj4iCdErQ/s3+xlbepcIAsxSAr9aHr1Nu6uAPqIg2PfT
 8HMam2KhfzF1e/HEu1IJvkZhRjhmLCEygklgw4LVDzVhssi5zDsz/FULtrUW+Z5TJL/Q nQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by m0089730.ppops.net (PPS) with ESMTPS id 3rsg5d9e47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <kernelci@lists.linux.dev>; Tue, 11 Jul 2023 20:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ5YQmMl8bDqq1OT4d0lJDe9+zlWdddfHduOKoq6PSI05eqkNQ7DDK4ayKKu9zs6WFn2IYvDGsM9l8JgMzkr5JbxmoM+AiGj4plKKfAkXiM6L0Rg2D0Sbg3RUKKx9DDdiG9PcY1fzUjmx4edcqrrr8jgwcYsS6rP88ir1ezqVClDMw68PrkP1DaJoWN5e4dnrJGzIq/joB3xEodItiYBR7kguNm3DrVqlRFxp1BtSJ39Bk2NFDys5HEi13t7IBJHVqYwh7pqRBlwDuY3CM/aGMPPnMPfziKkckNdtmrjGmzQB+aE0kZbSdztgFJaeXnzNILBd/s04x1eS4wVAhtgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Bayc7UfB6+2mMTlLDDoJ/fIyDkyHQefXlM4I9lXigA=;
 b=AdRPvdzn95RjAFHGlxiE45euxT0ZOMLjEqnxvQ1g+POecjvnk338AKJZxlF2jDAsDQlvQjmfY7idLSOnHs3/3wv2b6GBoktFDNOMuuVXdmw8iUNjhjLB0A1AGIyjOUB7hW0ZDLKQYuYc8JltXgGB4rPPcV0n8wDg+fHbW6ocUEEABvsQMXYyDv/etZR/PH37v5y1XPmaarbAQRkako+9hxmagTZ9qEml0P/R06FcRIWI+SGMRr6FPPC/NCsgBnTqiqQRvS4tT4pmfnmJr0VE/14GQJES4NncJdYy1KRtGgLiuaPt5ZV5mDz2wJ2Xc0RzECtmvfenHcoyC4XPHtsdoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ0PR15MB4662.namprd15.prod.outlook.com (2603:10b6:a03:37b::18)
 by SA0PR15MB4079.namprd15.prod.outlook.com (2603:10b6:806:8d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 03:01:04 +0000
Received: from SJ0PR15MB4662.namprd15.prod.outlook.com
 ([fe80::6af7:3756:e09f:2b03]) by SJ0PR15MB4662.namprd15.prod.outlook.com
 ([fe80::6af7:3756:e09f:2b03%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 03:01:04 +0000
From: Nikolay Yurin <yurinnick@meta.com>
To: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Subject: BPF-CI integration with KernelCI
Thread-Topic: BPF-CI integration with KernelCI
Thread-Index: AQHZtG0YrHibSy4DvUKoaZe4qWZnTA==
Date: Wed, 12 Jul 2023 03:01:04 +0000
Message-ID: <87afa4a50985db47ee5681c4913514f0ce8bac1f.camel@meta.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR15MB4662:EE_|SA0PR15MB4079:EE_
x-ms-office365-filtering-correlation-id: 07d5a0e3-0a71-43da-b364-08db82843b77
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JPdemPoEd62uJCSTpk5aKCHTArMv/rz4Wx1KGHC2EEzmre/I1tkXEEeXR5v3DfJsZPygxbf4bi2mmPioSd8na0tnxitMSILxJb1Upwz91U7sH95jYMwG5nFcg1vl/UuudFjsBUHxu33JZT8K1w0hZ2EEhMaIcxYMdkDHnovHIzm7ncNlOfNhmD0ps/5fIhjFWfMpMCLhQPhFKu4t889yvE0+7w434H9tDejFPxhWF/LtcOA8c+plYJoETTc1PQTqUuXSWuxxwJHRbJYd4y8ROolSd1QcMso5Epqq3addjyasdg9UcCIu4iEVKbKqa+CzUxha8KMN/V/2Tq/jDwhYggxhfAQT6xd+pQAzH1Wxjixpj7djW4HleM7YdxGNl7zA+svrAJDDjoRxVPvcXXXvgpLJF72CB0wzAYckIis11UdSx4LSYA2TOOHw4iv5m4rtKAMHWjOCzUaiywlZi+iivIlkS0ATTwBBS7YD09hmS0FQqeP10N/zkDkvo4m1QS5xRxxwdnsmgNAnGHpS/uwI2G/CziDNfRzgT7G1vtfPqAD5gP1pifVd4IyCH/x1cAXqynka3ToKx+maD/yqsexqHFnq9k//10foRsiFNXOKGqg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4662.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(76116006)(478600001)(6486002)(71200400001)(6506007)(186003)(6512007)(966005)(2906002)(4744005)(66946007)(6916009)(41300700001)(66476007)(5660300002)(316002)(66446008)(8936002)(66556008)(122000001)(38100700002)(64756008)(8676002)(86362001)(38070700005)(83380400001)(36756003)(3480700007)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bVN3S3U2L0YzbTBkZEJQUlkwU2tGSGd0eXU3bDNkcmNjZy9JOHlYb2R4M3FD?=
 =?utf-8?B?MTlEKy91MS9nakxOMGZ4WHJ3bXhWRUFRYkhGUjFucEdtVmk1QUZpMlY3dmp1?=
 =?utf-8?B?TlczZnJLNFJSUmNPalFySm0yQkg1WjZKRTVFa0VIVHdRZEk0Y1hXcGFwaXpl?=
 =?utf-8?B?aE5jS2xVOHJPSXp6OS91WXVvaHpWU2xSNjA5UkMyTWlTazlNcEdlajZPTVVv?=
 =?utf-8?B?ZGJFUHhYMHFtS1lyR3duYjdmU3lDQjZ2eHF4WXBBUGhrZ3REQ2MrWlRKL01U?=
 =?utf-8?B?WW5nWlN4MDZ0M08zU0o4dkJ6aHRrZTBqNkxhKzJIOCtjb3BkTjRReG0vbjZ2?=
 =?utf-8?B?ZTRiSHdCeG1jQkU0K2dyMCtobmlFSjVpbmRCSGpQbzBzUXNLQW1sQlg4aXZE?=
 =?utf-8?B?YllyWUJKWC9xL2J5aGpCVDhHVzVIYVlqNVpSM3B4UEtXNmVCZ0lUakNVUGVJ?=
 =?utf-8?B?cSswLzVyQkkveGp1OEgyTXptY3FqRVNrKzJnd0JtdEVrQ0llUzBtcDJJenZT?=
 =?utf-8?B?VjBFWjFkN2Mrd2Y4V0hydVpqTUpISExweXk3a3VWUHdPZ0pqNVczZXU2QUdL?=
 =?utf-8?B?Y25qVDBZK3hSMk9oUFgzbzZaM2ZuVlovWklnWEswdlk0cUNjTWh0TkhNN1cz?=
 =?utf-8?B?bldUNWJDUm4rdHZqV0NWanJtdWFxY1ozT3hWdjhlTDRhNmlsK3FKWE5oRWNl?=
 =?utf-8?B?dUdYVm5KMk1leDFOWktkUytRai81K0k0VmRHakNCTW9mSXlibDRYYkRpYktp?=
 =?utf-8?B?TnN1V0RlbTBxWktQM0FBcWpFMzdrY1ByS0RGT3phNE16NDZUazFrZFREWnFh?=
 =?utf-8?B?RUpHd2N5RUhUdHlPM1ptMTdReVpRREVkQm82cG0vVXFJVWY2R25TMEtQNXho?=
 =?utf-8?B?SzVtWHVzSFN4ZlBPV2c2RnlHNGhiZGlWUzZVMVBBSnlwNGNjaDU0Z3ZoVk9V?=
 =?utf-8?B?bVJjR09tbHpHcEY5S3ZZUkRmSUN5Zy8xbUZmdzFoRCtLK1dhdUVFcStrZCt6?=
 =?utf-8?B?RU1JQTdUM1dsdjlzcE9KVWFKR3hPdlV3ZGVWZzVTNjg1MWk2Sll3NGJZMnhq?=
 =?utf-8?B?eEFHejRnSDYzbWpXQ2k5NURrQnAzRU50bHFvdG82V0pGRzlxYXlnOUU5YjUy?=
 =?utf-8?B?Q2JQd2JVSHF1TzhvWnV6b2pQLy91QjRsaTF2YlhoRi9ENjJyVTA0Qm0wL2tF?=
 =?utf-8?B?OWtsNERxZ2Ewc1FCd2NwbUQvNTVtMlhpcnRjbmhiU05pbHVkdWpZL2ZabkUz?=
 =?utf-8?B?S2EyQXpIOHhqakIyNjlCRGRJS0M3RnVzelphcjFnSlRYcXRheUswMmRCUktR?=
 =?utf-8?B?aTkzY1Q5SFdjazZWUXVCMytMdCtKWXZ1cUpBZjRxNXFwVWI1V2o0dS9VZE5D?=
 =?utf-8?B?ek0zY2c5QkVZZFh5QWgrS0E5STFVMWdsNFVHNFpRUlNRZWNHK2VmemQ4MjFP?=
 =?utf-8?B?Q2lNdU1IdVBIbU5PQWdDemsxY2Q0YVg2U053NFFxVW5Dekc1MTVTNU81WVpT?=
 =?utf-8?B?aVdVUjI4NHpUbzE0OGovcFdjQ0dOMzNxanIrMkFRQzVkajdWREJvbTdDWU4r?=
 =?utf-8?B?ZUt4amtYTGI3eGJpb09wQ0lpeFJyYnlrNWVueHBjN0lvbk9MREgwK2RvbmVn?=
 =?utf-8?B?TStwSmpLeHNkbXVyR0VuMEt3WktMK2twS3AwYWJWVWZxRTdqQ1lsbGFiZzVp?=
 =?utf-8?B?eTJnMTBFNzlzTGVtdkhsN1dSandxZG42c0NpUFE2OW42UHZYUXJQU3F0YU1o?=
 =?utf-8?B?b3B5cUErSmtTREZLcWRwcVhZSTZCcFNOUjR4V09waGZwODJNeW53WVdHWFlJ?=
 =?utf-8?B?SUFJZ2ZrZ2taYkxLVVlxTXFWVWU0N3UxVUVMNDdrdG9DelIrWTFoQjZLdFAv?=
 =?utf-8?B?RXlpSkVCSUlIdGhKR2k5eWpqLzYzS2FHN042SWJYM1JIQm0xWTdlVGwvayt4?=
 =?utf-8?B?bURYU2dJb0JmaE1QaE1XS2lEQ0VwNC9XRWV3YnZpZUFsSmpGZTRNZEMyR25l?=
 =?utf-8?B?VUFXdVhic3g5b0JoeFpjbHlHU0l0Y2xjbnQzcWdvVHNYU3pIRHNwQ2N4MUFW?=
 =?utf-8?B?R1RpUDNkUjVRU0NSOXovNkxTTUkyaVpTSjcwdXhrQ1NsMnFjNS8rMlJrV0x6?=
 =?utf-8?B?YitwK09Zem9WcCswS1p2UlVmdUVwMUNzenkzakFNZ25IeFA1MnI5aW9VMGNl?=
 =?utf-8?Q?DahaWe+9Cw3i+LvyIYrrU4I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4199A47C097F294CA7D887A51E3E9389@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4662.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d5a0e3-0a71-43da-b364-08db82843b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 03:01:04.7876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: io9KqmG6NXgCDWKsVZgK/+S189GCQpMqfmG9McUQ/SYwSrtglIJ+QUDDMCKIXlwkP84R5hc/9VZqyf/0Az8/Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB4079
X-Proofpoint-GUID: 0kLI5sXzT5AQgP4d97WltySoplE3ne5I
X-Proofpoint-ORIG-GUID: 0kLI5sXzT5AQgP4d97WltySoplE3ne5I
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_14,2023-07-11_01,2023-05-22_02

SGkgZXZlcnlvbmUsDQoNCkkgYW0gcGFydCBvZiB0aGUgS2VybmVsIFBFIHRlYW0gYXQgTWV0YSwg
d29ya2luZyBvbiBCUEYgQ0kgWzFdLg0KQ3VycmVudGx5IHdlIGFnZ3JlZ2F0ZSBwYXRjaGVzIGZy
b20gS2VybmVsIFBhdGNod29ya3MgaW50byBHaXRodWIgcHVsbA0KcmVxdWVzdHMgWzJdLCBydW4g
R2l0aHViIENJIGFuZCBzZW5kaW5nIHJlc3VsdHMgYmFjayBpbnRvIFBhdGNod29ya3MuDQpJJ2Qg
bGlrZSB0byBleHBsb3JlIHdheXMgdG8gaW50ZWdyYXRlIHdpdGggS2VybmVsQ0kgYW5kIHNlZSBo
b3cgaXQNCndvcmtzIHdpdGggb3VyIGN1cnJlbnQgc2V0dXAgYW5kIHRlc3RzLiANCg0KSSBzYXcg
Y29tbWVudCBieSBHdWlsbGF1bWUgVHVja2VyIFszXSBzYXlpbmcgdGhhdCBrZXJuZWxjaS1iYWNr
ZW5kIGlzDQp1bm1haW50YWluZWQuIENvdWxkIHlvdSBwb2ludCBtZSBvdXQgdG8gdGhlIHVwLXRv
LWRhdGUgZG9jdW1lbnRhdGlvbiBvbg0KaG93IHRvIHNldHVwIGxvY2FsIGluc3RhbmNlcz8NCg0K
SSdtIG9wZW4gZm9yIGZlZWRiYWNrIGFuZCBkaXNjdXNzaW9ucyBvbiB0aGUgZnV0dXJlIG9mIEJQ
RiBDSSwgZmVlbA0KZnJlZSB0byByZWFjaCBvdXQgdG8gbWUgaWYgeW91IGhhdmUgYW55IHF1ZXN0
aW9ucy4gVGhhbmtzIQ0KDQpbMV0gaHR0cDovL3ZnZXIua2VybmVsLm9yZy9icGZjb25mMjAyMl9t
YXRlcmlhbC9sc2ZtbWJwZjIwMjItYnBmLWNpLnBkZg0KWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9r
ZXJuZWwtcGF0Y2hlcy9icGYvcHVsbHMNClszXSBodHRwczovL2dpdGh1Yi5jb20va2VybmVsY2kv
a2VybmVsY2ktDQpiYWNrZW5kL2lzc3Vlcy8zMDEjaXNzdWVjb21tZW50LTE2MzAzODYyNjUNCg0K
LS0gDQpOaWtvbGF5IFl1cmluDQpQcm9kdWN0aW9uIEVuZ2luZWVyIHwgS2VybmVsDQpNZXRhIHwg
RW1haWw6IHl1cmlubmlja0BtZXRhLmNvbQ0KDQo=
