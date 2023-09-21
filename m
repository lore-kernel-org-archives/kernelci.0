Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEE59CA47
	for <kernelci@lists.linux.dev>; Thu, 21 Sep 2023 21:46:29 +0000 (UTC)
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LJqONK001486;
	Thu, 21 Sep 2023 21:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : mime-version :
 content-type : content-transfer-encoding; s=S1;
 bh=IY8bRsBlrEgFpVn4EKCM5UehavYxy7gHPRat7whl6LI=;
 b=YWQIsRcEd4rKVUsnv8WE+jjmOMVbWBnfD8mDS315fvmxshX5MjPdMrnqMuajx7otudfB
 5d3n0A1K6IAfYW/1nHgkaAkNcjhVgvPTu/fGkD1uZkPJt982QDD9uinyEE+8RYg5x/r9
 nrHxLuMyqlqF5Nk7Lw59SLo7mGBfiMja6J8+aHotXCzzMF+mmZKdQg+bjP6KFkHp6gmi
 N69PCibN3TdhzDLgGAFTcr0j1Biu3p8Blx/vzh2HvhAZ9RbnskDIo8Z3841qor1QV2fz
 1jZ7QV4pLJ9w6Ut9HKZiTcYy/HyCG8AhjidI5YzZj/eUz+fNub/3wzPxZ7h7DIF4YKDa HQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 3t8trwg4u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Sep 2023 21:46:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+q0TL8Ec73Pjq1uGHyP3tECMXzYvWNE3RGBdVJmIS+8H/lBUBzw//V9bP/8GOmtaQdLb4V01ACi1PWPd5Am/LAh3KGARRUitowPcaDVlZa2jeyHbLifZqeCpclkcLLpbSmJuWMPX7ot8Vz5rFzmLESJNPU2dNezC+2nbMiTjBnDAp9gRHcAryMs/38vO3o27IoC1ySEEIlC/Y8BXiv6tcoknJig+5Wy1ghpeuLqx9HFLh7/5ab1EtSiCZ2oE3c+UUOVU8nNJ/p2qX+tyWX0R4Z7IU0ftfXGUWHhgn65avynMqB6c/Lf/Uuo3gkDnERzZX58s53ou/J7WxRSZRolNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IY8bRsBlrEgFpVn4EKCM5UehavYxy7gHPRat7whl6LI=;
 b=WflMjvX2Tnw4K3W4vM6MJFbudrJtoWcBAUzVGhAjyHVVbqgr1dILHqyeZabYkKe3Dgnkr28ElxWPPac1ZBMEawj+NBrkMv1CcGwt9L+RR8urjRmttMKBfe45IRSuqe+QT7yDk4LegVOm6ZR3vgDVUtcEGbWXnMUtOE79YVg95g6LcOL4PtskuR6QYYREkzE9ued0dgOz8iEe+ClHVpTo2laPQlVcl+SKW6sHsnuuo10y/HCvLfVRliGt5bUmsb99lMpCWCS5ZnmMKSb38uyIeS7jaG9+vQ/uX6+4I2d3aHxsQfoHdSIL+E3taQoOVU0dNinglFH/tHAI6b2ZbhtSuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BYAPR13MB2503.namprd13.prod.outlook.com (2603:10b6:a02:cd::33)
 by CH0PR13MB5115.namprd13.prod.outlook.com (2603:10b6:610:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 21:46:03 +0000
Received: from BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::7cdf:18ea:7644:334b]) by BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::7cdf:18ea:7644:334b%7]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 21:46:02 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Mark Brown <broonie@kernel.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
        "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
        "automated-testing@lists.yoctoproject.org"
	<automated-testing@lists.yoctoproject.org>
Subject: RE: [Automated-testing] kci command line poll: Click or Typer?
Thread-Topic: [Automated-testing] kci command line poll: Click or Typer?
Thread-Index: AQHZ7Gn0fLsxKxVdYEmdYZc1A3JrubAlp6dwgAAQrgCAAAjYgIAACwJQ
Date: Thu, 21 Sep 2023 21:46:02 +0000
Message-ID: 
 <BYAPR13MB2503C20593F85F7F641E42D1FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
References: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
 <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
 <b6743bf5808d43a48e9cc78ea0871fd8f23e1f6f.camel@linuxfoundation.org>
 <d5161b00-6688-4632-b878-90aa755a95dc@sirena.org.uk>
In-Reply-To: <d5161b00-6688-4632-b878-90aa755a95dc@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR13MB2503:EE_|CH0PR13MB5115:EE_
x-ms-office365-filtering-correlation-id: b825257f-db0e-4cd9-0156-08dbbaec26d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 U2FeGzeq7SCL0MvTWpm0dKqu9oMkfD6g05d9qRgsyyOauaa2MlCsiTNJT8lCs6dKCkDM70h+E03XcRA+s/EHsXPDPOAy8ghvIkoBjZberYOf5Swbr7MEc4aZGFoXTw7eUlPn5aRlb67POB0P+U5xGdTjUXg/v7f1CW3PQRwyVZnJYNqcx52EszVJaas+HisyvOznCPbejJ97zV99ujsFlyhayfkoMepR6dr5Tl+G9SAdMUQGJmusKmJ/9AYDAdF/PcPvK6WkQz7yLFnhBf5FfZq6AeLP0uNGvjeCjhHR+KCYpX6KbegvEInHcDIqC20LDcJn/lVFoGzzM8PJQzvqsniGAJbSeGmzr/+znknxEuFvZ/LrmBa/WK6OuxX+pkFw+S06QZwAWdLYSoDcun/5dK3UWGAl9S93iGDvkzYZULHuVNc4Js2bF2aH+hbZ8fkJD93Ez+81Hch0Knte+9WJJ8I2QClKDRbgtPaee8xk8dtqy4xfa3L71Hbmyk+oqMq23Y3e/LgaKA8Qh5e+DHE/G1MQBLCLKSS7ZfwBTSI2xsaYQ5eksfW1OS8Ms3tedCygfZVEoxJf05xzwsqL7OHTlIothxSvvd5drj3ZUUZ2ACo0D0AyU3FrN9EhZ5xel0tMliSI9dB1T0KtfasAgBQNQFLZiUKU1/X/ThttePXOQQA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR13MB2503.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(1800799009)(451199024)(186009)(2906002)(55016003)(66899024)(8936002)(8676002)(5660300002)(52536014)(41300700001)(4326008)(54906003)(66476007)(316002)(66946007)(66556008)(122000001)(64756008)(66446008)(110136005)(82960400001)(38070700005)(38100700002)(33656002)(26005)(76116006)(83380400001)(478600001)(71200400001)(7696005)(6506007)(9686003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PPR8AREHn4YBJCgvO/qLxkE+2AMxHUzskYanycUpLsJaoIEoKoLgFTXWmBqi?=
 =?us-ascii?Q?UxIucKZfAhxw168U5qCAnWk2BvF+uVnxYYPmZBou+zeysxJ8oiYpmwWWEh6v?=
 =?us-ascii?Q?fAZILVMAKGO3hx9n6JQHru0+i58DRaR/IoNkMpZ8Q0hnIpz9p/SlywkxN73A?=
 =?us-ascii?Q?MsDr1urEX7KqZvOBbr84tVQVy9FjT+jrzJiHTbFGMqfQpZ7B/EPUeK8CpqBZ?=
 =?us-ascii?Q?Mdzi6dttRcODwlnfIJ7uM17aHvQjTVNwTTBWzfsamhWSxlUvPc3dRbFTYjnj?=
 =?us-ascii?Q?8b7VfyMbinR7grp4KXrKKGZlM7wHMFQeRESBCfz5+n3jWtqq8l7+CSIQG/pD?=
 =?us-ascii?Q?RWGYbTdMF9+fZodNEE6wI7VolXElDhDWsrakYe/1K4doe78AypKycGYEEvIa?=
 =?us-ascii?Q?r0VPsPOqRJDR53NeUXpu2G5ZjoIRb0tdZaYBLhQ0Bum8lUnp7aPpZHcx4v5J?=
 =?us-ascii?Q?M/nRImSUPkAn00vCyskPYdYYDvyhwRgXAzA5zT3Q4sCiS/Q9hFNvoOf9HRbN?=
 =?us-ascii?Q?iuI+uvUVyxy5V2O1s4ZiuI8cR7N9zCwG1hUw37h9TUWvfd34ca4PY8uFKcHR?=
 =?us-ascii?Q?HJic00e4L3M22W5vOx5TXwx4QJ4qD87ZpZabPkj56/h44yeuOtuMdrvTGJ0V?=
 =?us-ascii?Q?rHIWaooEPa1Qg7r1jU59d2kKvzSY5OLy6pJJoyNspRTDsmS4PAMRTaruf9Pw?=
 =?us-ascii?Q?FNqINd8nOSrn4sq0Kk5EPx8AOQFtxeGIhuOtrzTAwU7g2rOWSR27vybmbug3?=
 =?us-ascii?Q?7mej/7DnNf3MXYEOTjxUJtwjpjDqtbOafbEknG06ajdAcosbx0TQRLTRjAhM?=
 =?us-ascii?Q?k3ZyjE8B/g8sX/k7e0qrZ3FT2XZYuKlgOR/oBFPc2argM3qVfnuuweWgr3hA?=
 =?us-ascii?Q?CUH2HcbEaY5dTMCS/Xd81cCaTlgORvQGjiOVT63fBff0jwEdc+2rg4ChnoqM?=
 =?us-ascii?Q?8euJOUEEA6vDO9uoK/8zEiD6y7ONWS8TcIrklkftTKAPpFuUw+qrYseqberq?=
 =?us-ascii?Q?phiYR8QE16bmlKecmIcZlhtqtbBJr5RQlYZ8b+H99UdR9gDMVvzMVz5MwhOP?=
 =?us-ascii?Q?J9dqrpUTTAzFMv230s0XEaQ4FK8eQZt3ublL1k4P1mtBSA/Lppn4M2URlOfB?=
 =?us-ascii?Q?f0m3wdXdz9UGEzwnd+qCkSLbr9aDm+7tlKeEiL9JmwPNHxoC9BeZwrhgGWHp?=
 =?us-ascii?Q?n/hPJb3w+kX2OvJp5W6FRfnaAj9zXODHLsExcGw+BLfPVc1+lBYN7/5E7OQA?=
 =?us-ascii?Q?8lzXqvNZZsdbqzjSnfXEg8yXYHiqnOZgsqAkIXPj8XT0BPeh6GYnZupOKKmP?=
 =?us-ascii?Q?SokoD7Vpnxm1yk8NdtC7HcJSb07oOXchis0WRbT+j8q2sgfG7CJq7h87HP6U?=
 =?us-ascii?Q?lPoo2yxhQM41Xc0KcBB6svMb9uhKTsZpp0CdHWGxWhlTOjLgsM/CyawlzK9T?=
 =?us-ascii?Q?h+YohB88FgqHJDaHw6iRtN+SJfAHNk/nVTPXv/J8ZmaOklUT93OFxOk/ibCA?=
 =?us-ascii?Q?Jkuklyy7vjWUlIoD8KJdz4WIivlRu4QJIuiizOwiSW0LOK693h8szUhqoCbQ?=
 =?us-ascii?Q?uF8rF9Ep4phCgNsl8dA=3D?=
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?us-ascii?Q?rQlCtMW2G6NOubkQ6U3daZ8IH7jwkuTIwL420dcxFv5hjlja3Lh2S13U+p8z?=
 =?us-ascii?Q?QvQLBh24TA4oHjZTMszlPKnvUlrQ8uzrb1Qa/TVIsOIl+Yzm95vA2/EQh4w3?=
 =?us-ascii?Q?AlJtEauEUrGdf/keziFsxsBh3eTYLc+5ARBByrhOm1D0IskPn6Gc5JcSm7Tb?=
 =?us-ascii?Q?SxKlDaYJSCqp7icTNsgQSu+zTdqF26CAzijVoyK1hth7CcPQd+PGM2C4C/CI?=
 =?us-ascii?Q?3u6M4J86mvGYz+hnd813hfwAIgO94EK2+UhvaqNgpn4/TOcVm9HPRSuAQFi9?=
 =?us-ascii?Q?km4CgVNqO3iW8B4450OFyq6xG14Yn4e9MROhzFLe2TPpeGGysiHErYi47AN0?=
 =?us-ascii?Q?34/lkv4R0SMTEV3e1ZvKdA8zMsvGZ+9yCzbqVmi7ez/L5eIxXzXIAIvXvQ2O?=
 =?us-ascii?Q?eY59qRlALU7QcyaxzatnxKatG4a7KBxM39jHfn7nrVfElx13SojTbYnFmUd3?=
 =?us-ascii?Q?Z30n9d+VKlttNrjYTcKU4NERg7ct9M6+dnEWwO6EvY3mSENGc7nVq/4i2/IE?=
 =?us-ascii?Q?6I5LgF5lCYrp6QZxIq6qpnkP7ceV5qdEwY3LXJmqlic0JkEMBhlUkU/SeYH0?=
 =?us-ascii?Q?S+XhklIyMYwpTOWZgeoNh3xW+TI9ky1kyWi3akLB8fhreoSOP4cKcmU1n3aD?=
 =?us-ascii?Q?3Bd6/jWzY0271eno7kU6SqCrItMwnsNG5eeOINBXxY+coRbW4QFOAOmHaRwe?=
 =?us-ascii?Q?xszGIG0bZrEwLA1K0O5dxFHV0kbgi/9IEuQXjF0BOwVoBk3I0JGH4jR+U+Le?=
 =?us-ascii?Q?zOs1gKuDywGUltd33xLs4B4I8ux/RmklT8HLNkZ8zrV8yQZDXdEg1DBxMuhs?=
 =?us-ascii?Q?rRmjKAQwUeHxMag24JLLC7CgF35kHdhHdvuGP3sFMDZJTU3KxHi4ucnvjsq8?=
 =?us-ascii?Q?OGxesy3OFmfJDpdjSzR3XrriEt9KJNWMbAQiNV7vOrJLm2+L1R+UAw9JdXRC?=
 =?us-ascii?Q?YJqSocn13qDrfpCIQYb/4w=3D=3D?=
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR13MB2503.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b825257f-db0e-4cd9-0156-08dbbaec26d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 21:46:02.9218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7DqnucvM4hoNesWAAAdIAR2MXdlaBQ7DGx8phbNVwq4wnot81Rmp/bsslhaAyNsV4GfRJMVCQNKOZ7iResAhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR13MB5115
X-Proofpoint-GUID: hUKpR4UqNh4zzJoyXfIZFhQfBw-nu692
X-Proofpoint-ORIG-GUID: hUKpR4UqNh4zzJoyXfIZFhQfBw-nu692
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Sony-Outbound-GUID: hUKpR4UqNh4zzJoyXfIZFhQfBw-nu692
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> On Thu, Sep 21, 2023 at 09:17:02PM +0100, Richard Purdie wrote:
> > On Thu, 2023-09-21 at 19:41 +0000, Tim Bird wrote:
>=20
> > > If the python community cared about backwards (and forwards)
> > > compatibility, they would not need
> > > the whole mess that is virtual environments.
>=20
> > years (Bitbake in case it isn't obvious). Admittedly we've tried to
> > keep it's dependencies minimal (much to the frustration of some) so
> > I've not had much exposure to the wider module ecosystem and I've point
> > blank refused to 'need' virtual environments for our use.
>=20
> FWIW assuming the issues Tim has run into are similar those I'm aware of
> then modulo the general stuff with the 2->3 transition (which was it's
> own special thing) the issues are all in the module ecosystem rather
> than the core language and standard library.

Actually, I need to state that I actually like Python a lot, and it's my pr=
eferred
choice for scripting languages.  The main command line tool (and most of
the other utility tools) in Fuego are in Python, and I've worked with it fo=
r
many years.  As Mark correctly says, it's the module ecosystem
that drives me nuts, not the language itself, or the core libraries.  But i=
t
does give me heartburn when the community decides to remove a core
library.  And the module ecosystem can't keep itself from using newer
versions of the Python language, so if you have a lot of module dependencie=
s
you will find yourself forced to upgrade your modules (and your own code)
along with the interpreter.

I just don't think that the lead developers have cared enough about backwar=
ds
compatibility, and I've made the mistake of using modules which the authors
have, over time, made backwards-incompatible changes to.  This is on the
authors of the individual modules, of course.  But I don't sense very good =
leadership
to avoid breaking backwards compatibility from the core language developers=
.

I absolute abhor the virtual environment stuff.  I'd seriously rather
monkey-patch an old library (which I've had to do a few times in Fuego), th=
an force my
users to deal with virtual environments.  Maybe I'm doing something wrong,
but about 50% of the time when I try to use virtual environments on some ra=
ndom
python code I want to play with, I end up having problems (sometimes, quite=
 deep-seated).
To be fair, this may be because I have locked down the versions of the dist=
ributions used
in my containers in Fuego (for various reasons too long to go into here), a=
nd they are starting
to show their age.  But it really has been a nightmare.

 -- Tim



