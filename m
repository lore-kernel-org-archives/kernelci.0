Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF17E
	for <kernelci@lists.linux.dev>; Wed, 23 Nov 2022 16:16:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ANGGkCJ071793;
	Wed, 23 Nov 2022 10:16:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669220206;
	bh=rp753CsKEsWTf7nEU+7osqeeIpVjrcrRMwUTabxYvdI=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=mpHTXLa/SzzEgW59lOJWPSvum3p3sU8/zQ1B4bKc18Fpj2kWfHix4lgr9prvrPGIi
	 S5hltScRCdrw5uLFrwDBWuxLPSrRfDVAMfAi69MQ5lSCsdA4YkIczmiTAWgq0+AZTf
	 h6UOqnkTujiJ0+5uFe6wTaMbmTFWYHstK9gH5LH4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ANGGkl5028200
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Nov 2022 10:16:46 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 23
 Nov 2022 10:16:46 -0600
Received: from DLEE114.ent.ti.com ([fe80::bdc7:eccc:cd13:af84]) by
 DLEE114.ent.ti.com ([fe80::bdc7:eccc:cd13:af84%17]) with mapi id
 15.01.2507.016; Wed, 23 Nov 2022 10:16:46 -0600
From: "Hambardzumyan, Minas" <minas@ti.com>
To: Nikolai Kondrashov <spbnick@gmail.com>,
        "kernelci@lists.linux.dev"
	<kernelci@lists.linux.dev>
Subject: RE: Request for KCIDB access credentials
Thread-Topic: Request for KCIDB access credentials
Thread-Index: Adj+yWQZd4Yg/a1oSmCJLtkX9638ewAhykoAAAFA/sA=
Date: Wed, 23 Nov 2022 16:16:46 +0000
Message-ID: <b454141f3c3e494ba09236c1e050069f@ti.com>
References: <3a8d00c074504fcba308e1f212e5a1d4@ti.com>
 <90b1557e-2f26-f0dc-02bb-12b65eb2e27c@gmail.com>
In-Reply-To: <90b1557e-2f26-f0dc-02bb-12b65eb2e27c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [128.247.81.65]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

SGkgTmljaywgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2shDQoNClllcyBJIHVuZGVyc3RhbmQgd2Ug
d2lsbCBuZWVkIHRvIHByb3ZpZGUgdGhlIGtlcm5lbCBzb3VyY2UgaW5mb3JtYXRpb24sIHRoaXMg
c2hvdWxkIG5vdCBiZSBkaWZmaWN1bHQuDQoNCkNhbiBJIGdldCBhIGNyZWRlbnRpYWwgZm9yIGFj
Y2Vzc2luZyB0aGUgcGxheWdyb3VuZCBlbnZpcm9ubWVudD8gSSB3YW50IHRvIGV4cGVyaW1lbnQg
d2l0aCBjb21tYW5kcyB0byBiZXR0ZXIgdW5kZXJzdGFuZCBjaGFuZ2VzIHdlIG5lZWQgdG8gc3Rh
cnQgcHVzaGluZyBkYXRhIHRvIHByb2R1Y3Rpb24uDQoNClRoYW5rcywNCk1pbmFzLg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTmlrb2xhaSBLb25kcmFzaG92IDxzcGJuaWNr
QGdtYWlsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDIzLCAyMDIyIDM6MzEgQU0N
ClRvOiBIYW1iYXJkenVteWFuLCBNaW5hcyA8bWluYXNAdGkuY29tPjsga2VybmVsY2lAbGlzdHMu
bGludXguZGV2DQpTdWJqZWN0OiBSZTogUmVxdWVzdCBmb3IgS0NJREIgYWNjZXNzIGNyZWRlbnRp
YWxzDQoNCkhlbGxvIE1pbmFzLA0KDQpPbiAxMS8yMy8yMiAwMToyMywgSGFtYmFyZHp1bXlhbiwg
TWluYXMgdmlhIGdyb3Vwcy5pbyB3cm90ZToNCj4gTXkgbmFtZSBpcyBNaW5hcyBIYW1iYXJkenVt
eWFuLCBJIGxlYWQgdGhlIExpbnV4IENvcmUgU0RLIHRlc3QgYXV0b21hdGlvbiB0ZWFtIGF0IFRl
eGFzIEluc3RydW1lbnRzLiBXZSBhcmUgbG9va2luZyBpbnRvIHB1Ymxpc2hpbmcgVEkgTGludXgg
Q29yZSBTREsgQ0kgdGVzdCByZXN1bHRzIHRvIEtlcm5lbCBDSS4gVGhlc2UgcmVzdWx0cyB3b3Vs
ZCBiZSBiYXNlZCBvbiB0ZXN0IHJlcG9ydHMgd2UgY3VycmVudGx5IHB1Ymxpc2ggaGVyZToNCj4g
DQo+IGh0dHBzOi8vc29mdHdhcmUtZGwudGkuY29tL2xpbnV4LWNpY2QtcmVwb3J0L2luZGV4Lmh0
bWwNCj4gDQo+IExldCBtZSBrbm93IGlmIHlvdSBuZWVkIGFkZGl0aW9uYWwgaW5mbyB0byBhcHBy
b3ZlIHRoaXMgcmVxdWVzdC4NCg0KV29uZGVyZnVsISBXZSdkIGJlIGhhcHB5IHRvIHJlY2VpdmUg
eW91ciBjb250cmlidXRpb25zLg0KDQpJIHRvb2sgYSBsb29rIGF0IHlvdXIgcHVibGlzaGVkIHJl
c3VsdHMsIHRoZXkgbG9vayBnb29kIGFuZCBoYXZlIG1vc3Qgb2Ygd2hhdCB3ZSBuZWVkLCBleGNl
cHQgYW55IGRpcmVjdCByZWZlcmVuY2UgdG8gdGhlIGtlcm5lbCBzb3VyY2UgY29kZSB5b3UncmUg
YnVpbGRpbmcgYW5kIHRlc3RpbmcuIE9ubHkgdGhlIE9wZW5FbWJlZGRlZCAgaW5zdHJ1Y3Rpb25z
LiBEbyB5b3UgdGhpbmsgeW91J2QgYmUgYWJsZSB0byBwcm92aWRlIHVzIHdpdGggYSBVUkwgcG9p
bnRpbmcgdG8gdGhlIGtlcm5lbCBnaXQgcmVwb3NpdG9yeSwgYnJhbmNoIG5hbWUsIGFuZCB0aGUg
Y29tbWl0IGhhc2ggZm9yIGVhY2ggYnVpbGQ/DQoNClBsZWFzZSB0YWtlIGEgbG9vayBhdCBvdXIg
U3VibWl0dGVyIEd1aWRlIGZvciB0aGUgb3RoZXIgKG1pbmltYWwpIGRhdGEgcmVxdWlyZW1lbnRz
IGFuZCB3YXlzIHRvIHN1Ym1pdCBpdDoNCg0KaHR0cHM6Ly9rZXJuZWxjaS5vcmcvZG9jcy9rY2lk
Yi9zdWJtaXR0ZXJfZ3VpZGUvDQoNCkRvbid0IGhlc2l0YXRlIHRvIHNlbmQgYW55IHF1ZXN0aW9u
cyB5b3UgaGF2ZSB0byBvdXIgbmV3IG1haWxsaXN0IChrZXJuZWxjaUBsaXN0cy5saW51eC5kZXYs
IG9yIGp1c3QgcmVwbHktYWxsIHRvIHRoaXMgbWVzc2FnZSkgb3IgcmVhY2ggb3V0IHRvIHVzIG9u
IHRoZSAja2VybmVsY2kgY2hhbm5lbCBvbiBsaWJlcmEuY2hhdC4NCg0KVGhhbmsgeW91IQ0KTmlj
aw0K
