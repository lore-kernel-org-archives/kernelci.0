Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5D77E
	for <kernelci@lists.linux.dev>; Thu,  4 May 2023 12:45:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 344CaJio058678;
	Thu, 4 May 2023 07:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683203779;
	bh=TTL0Z2imtGM6lRZQnHb6gZrWUKf7XSC5ROv0wzHtWZg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=uv3eY1lwl22YqZxFm5mrSznEJw2rWFwDKI1BDQsb/7KTeeKt3phsY+9SFTWjeQUoO
	 X49D1a0DpY1JNUyfHJQEMwnDAlNBwVFs1P+XkHU+viL6gozC6dyUxXQwqTNjYGfLfO
	 YxcwBGb1GCKAe3gpi6nhRxSupkQPSC2tfM6xbFtI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 344CaJ9X088645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 May 2023 07:36:19 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 May 2023 07:36:18 -0500
Received: from DLEE114.ent.ti.com ([fe80::bdc7:eccc:cd13:af84]) by
 DLEE114.ent.ti.com ([fe80::bdc7:eccc:cd13:af84%17]) with mapi id
 15.01.2507.023; Thu, 4 May 2023 07:36:18 -0500
From: "Hambardzumyan, Minas" <minas@ti.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>,
        "Ram Jangir (QUIC)"
	<quic_rjangir@quicinc.com>,
        "kernelci@lists.linux.dev"
	<kernelci@lists.linux.dev>
CC: Stephen Boyd <sboyd@kernel.org>
Subject: RE: QCOM IPQ Boards Kernel CI Automation
Thread-Topic: QCOM IPQ Boards Kernel CI Automation
Thread-Index: Adl3c2gLii8ROdo6ROmA361z+zJZTAHFLwGAAADe2MA=
Date: Thu, 4 May 2023 12:36:18 +0000
Message-ID: <9bce32045fc741cd820f0664e03067ad@ti.com>
References: <SA1PR02MB851150DF6313550B809D8AE899649@SA1PR02MB8511.namprd02.prod.outlook.com>
 <445b1881-f53c-6f4c-2769-cab29011cd50@collabora.com>
In-Reply-To: <445b1881-f53c-6f4c-2769-cab29011cd50@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [128.247.81.248]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

R3VpbGxhdW1lLCBJIGFtIGFsc28gd29ya2luZyBvbiBzdWJtaXR0aW5nIFRJIHVwc3RyZWFtIHRl
c3QgcmVzdWx0cyB0byBLZXJuZWwgQ0kgLS0gVmluY2UgaXMgaGVscGluZyBtZSBhZGRyZXNzIHNv
bWUgb2YgdGVjaG5pY2FsIGlzc3VlcyBvZiBwdWJsaXNoaW5nIHRvIHRoZSBzdGFnaW5nIHNlcnZl
ci4gDQoNCkNhbiB5b3Ugc2VuZCB0aGUgaW52aXRlIHRvIG1lIGFsc28/DQoNClRoYW5rcywNCk1p
bmFzLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogR3VpbGxhdW1lIFR1Y2tl
ciA8Z3VpbGxhdW1lLnR1Y2tlckBjb2xsYWJvcmEuY29tPiANClNlbnQ6IFRodXJzZGF5LCBNYXkg
MDQsIDIwMjMgMjo1OSBBTQ0KVG86IFJhbSBKYW5naXIgKFFVSUMpIDxxdWljX3JqYW5naXJAcXVp
Y2luYy5jb20+OyBrZXJuZWxjaUBsaXN0cy5saW51eC5kZXYNCkNjOiBTdGVwaGVuIEJveWQgPHNi
b3lkQGtlcm5lbC5vcmc+DQpTdWJqZWN0OiBSZTogUUNPTSBJUFEgQm9hcmRzIEtlcm5lbCBDSSBB
dXRvbWF0aW9uDQoNCkhpIFJhbSwNCg0KT24gMjUvMDQvMjAyMyAxNDo0NCwgUmFtIEphbmdpciAo
UVVJQykgd3JvdGU6DQo+IEhpLA0KPiANCj4gV2UgYXJlIGZyb20gUXVhbGNvbW0uIFdlIGFyZSBh
Y3RpdmVseSB1cHN0cmVhbWluZyBzdXBwb3J0IGZvciBzb21lIG9mwqAgb3VyIElQUSAoUm91dGVy
IGNoaXBzZXRzLCBJUFE4MDdYLCBJUFE1MDE4LCBJUFE5NTc0LCBJUFE1MzMyKS4gDQo+IEhlbmNl
IHdlIHdhbnQgdG8gcnVuIHRoZSBrZXJuZWwgQ0kgdGVzdCBzdWl0ZXMgZnJvbSB0aGUga2VybmVs
IHRyZWVzIChsaW51eCwgbGludXgtbmV4dCkgLsKgIEJvYXJkcyBhcmUgdGhlcmUgaW4gb3VyIGxv
Y2FsIGJvYXJkIGZhcm0gaW5zaWRlIFFDT00uDQo+IFNvIHdhbnRlZCB0byB1bmRlcnN0YW5kIHRo
ZSBwcm9jZXNzIGludm9sdmVkIGluIHRlc3Rpbmcgb3VyIGJvYXJkcyBhbmQgDQo+IGdldHRpbmcg
dGhlIHJlc3VsdHMgcHVibGlzaGVkIG9uIHRoZSBrZXJuZWxDSSBkYXNoYm9hcmQuIENhbiB5b3Ug
cGxlYXNlIGhlbHAgdXMgaGVyZSA/DQoNClRoYW5rcyBmb3IgZ2V0dGluZyBpbiB0b3VjaC4gIEkg
YmVsaWV2ZSBTdGV2ZSAob24gQ2MpIG9uY2UgaGFkIGEgbGFiIGNvbm5lY3RlZCB0byBLZXJuZWxD
SSwgaXMgdGhpcyByZWxhdGVkIGluIGFueSB3YXk/DQoNCklmIHlvdXIgbGFiIGlzIGEgTEFWQSBs
YWIgdGhlbiBpdCdzIGZhaXJseSBlYXN5IHRvIHNldCB1cCwgdGhlcmUncyBhIGRvY3VtZW50YXRp
b24gcGFnZSBmb3IgaXQ6DQoNCiAgaHR0cHM6Ly9rZXJuZWxjaS5vcmcvZG9jcy9sYWJzL2xhdmEv
DQoNCklmIG5vdCwgdGhlbiBpdCdzIHBvc3NpYmxlIHRvIHNlbmQgcmVzdWx0cyBmcm9tIGFueSBh
cmJpdHJhcnkgbGFiIGJ1dCBpdCdzIGEgYml0IG1vcmUgdHJpY2t5LiAgVGhlcmUncyBjdXJyZW50
bHkgbm8gd2F5IGZvciBsYWJzIHRvIGdldCBub3RpZmllZCB3aGVuIG5ldyBrZXJuZWwgYnVpbGRz
IGFyZSBhdmFpbGFibGUgc28gc29tZSBraW5kIG9mICJnbHVlIGNvZGUiIGlzIG5lZWRlZCB0byBi
cmlkZ2UgdGhpcyBnYXAuDQoNCkhvd2V2ZXIsIHdlJ3JlIG5vdyB3b3JraW5nIG9uIGEgbmV3IEFQ
SSB3aGljaCBwcm92aWRlcyBhIFB1Yi9TdWIgaW50ZXJmYWNlIGZvciB0aGlzIGtpbmQgb2Ygc2Nl
bmFyaW8uICBUaGUgbmV3IEFQSSBpcyBsYWItbmV1dHJhbCwgaXQgZG9lc24ndCBtYXR0ZXIgaWYg
eW91J3JlIHJ1bm5pbmcgdGVzdHMgaW4gTEFWQSBvciBhbnl0aGluZyBlbHNlLiAgWW91IGNvdWxk
IGV2ZW4gcnVuIHRlc3RzIGJ5IGhhbmQgbG9jYWxseSBhbmQgZ2V0IHRoZSByZXN1bHRzIHNlbnQg
ZGlyZWN0bHkgdG8gdGhlIEFQSS4gIEl0J3Mgbm90IHF1aXRlIHJlYWR5IHlldCwgd2UncmUgaG9w
aW5nIHRvIGhhdmUgYSBwdWJsaWNseS1ob3N0ZWQgaW5zdGFuY2UgdGhpcyBTdW1tZXIgZm9yIHBl
b3BsZSB0byBzdGFydCB1c2luZyBpdCBhbmQgc3RhcnQgZGVwcmVjYXRpbmcgdGhlIGN1cnJlbnQg
c3lzdGVtLg0KDQpUaGVyZSdzIGEgc2VjdGlvbiBpbiB0aGUgZG9jdW1lbnRhdGlvbiBhYm91dCBp
dCwgd2hpY2ggaXMgYWxzbyBhIHdvcmstaW4tcHJvZ3Jlc3MuICBIZXJlJ3MgYW4gb3ZlcnZpZXc6
DQoNCiAgaHR0cHM6Ly9rZXJuZWxjaS5vcmcvZG9jcy9hcGkvb3ZlcnZpZXcvDQoNCklmIHlvdSBo
YXZlIGEgTEFWQSBsYWIsIEkgYmVsaWV2ZSBpdCB3b3VsZCBiZSBmaW5lIHRvIHN0YXJ0IGJ5IHVz
aW5nIHRoZSBjdXJyZW50IHN5c3RlbSBub3cuICBJZiBub3QsIHRoZW4gaXQgd291bGQgcHJvYmFi
bHkgbWFrZSBtb3JlIHNlbnNlIHRvIGRpcmVjdGx5IGxvb2sgaW50byB1c2luZyB0aGUgbmV3IEFQ
SSB3aXRoIGEgYml0IG9mIGhlbHAgZnJvbSBvdXIgY29yZSBkZXZlbG9wZXJzLiAgVGhlcmUncyBh
bHJlYWR5IGEgc3RhZ2luZyBpbnN0YW5jZSBhdmFpbGFibGUgdG8gc3RhcnQgZXhwZXJpbWVudGlu
ZyB3aXRoIHRoaW5ncywgYW5kIGhhdmluZyBjb250cmlidXRpb25zIGZyb20gcmVhbC13b3JsZCB1
c2VycyB3aXRoIHBhcnRpY3VsYXIgdHlwZXMgb2YgbGFicyBpcyBhIGdyZWF0IHdheSB0byBhY2Nl
bGVyYXRlIHRoZSBBUEkgZGV2ZWxvcG1lbnQgYW5kIGFkb3B0aW9uLg0KDQpUaGVyZSdzIGEgcHVi
bGljIEtlcm5lbENJIHZpZGVvIG1lZXRpbmcgZXZlcnkgVGh1cnNkYXkgYXQgMTE6MDAgVVRDIGZv
bGxvd2VkIGJ5IGFuIE9wZW4gSG91cnMgYXQgMTI6MDAgVVRDIHRvIGRpc2N1c3MgYW55IHRvcGlj
cywgSSBndWVzcyB0aGlzIHdvdWxkIGJlIGFuIGludGVyZXN0aW5nIG9uZSB0byBicmluZyB1cC4g
IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugd2FudCB0byBiZSBhZGRlZCB0byB0aGUgY2FsZW5k
YXIgaW52aXRhdGlvbnMuDQoNClRoYW5rcywNCkd1aWxsYXVtZQ0KDQoNCg==
