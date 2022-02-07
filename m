From: "Bird, Tim" <Tim.Bird@sony.com>
Subject: Re: [PATCH v2 1/1] Documentation: dev-tools: clarify KTAP specification wording
Date: Mon, 7 Feb 2022 17:06:07 +0000
Message-ID: 
 <BYAPR13MB2503C78EE66DBC27ECF3FE8AFD2C9@BYAPR13MB2503.namprd13.prod.outlook.com>
References: <20220207162813.3091899-1-frowand.list@gmail.com>
 <e795ad1a-ddb1-f0af-4a74-7c2c6a0a949a@gmail.com>
 <0de1426c-5b5d-9160-cd5c-00185fa516f5@gmail.com>
In-Reply-To: <0de1426c-5b5d-9160-cd5c-00185fa516f5@gmail.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-ID: <kernelci.groups.io>
To: Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Rae Moar <rmoar@google.com>, Brendan Higgins <brendanhiggins@google.com>
Cc: "rmr167@gmail.com" <rmr167@gmail.com>, "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>, "dlatypov@google.com" <dlatypov@google.com>, "kernelci@groups.io" <kernelci@groups.io>, "kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmsgUm93YW5kIDxm
cm93YW5kLmxpc3RAZ21haWwuY29tPg0KPiANCj4gT24gMi83LzIyIDEwOjM4IEFNLCBGcmFuayBS
b3dhbmQgd3JvdGU6DQo+ID4gT24gMi83LzIyIDEwOjI4IEFNLCBmcm93YW5kLmxpc3RAZ21haWwu
Y29tIHdyb3RlOg0KPiA+PiBGcm9tOiBGcmFuayBSb3dhbmQgPGZyYW5rLnJvd2FuZEBzb255LmNv
bT4NCj4gPj4NCj4gPj4gQWRkIHRoZSBzcGVjIHZlcnNpb24gdG8gdGhlIHRpdGxlIGxpbmUuDQo+
ID4+DQo+ID4+IEV4cGxhaW4gbGlrZWx5IHNvdXJjZSBvZiAiVW5rbm93biBsaW5lcyIuDQo+ID4+
DQo+ID4+ICJVbmtub3duIGxpbmVzIiBpbiBuZXN0ZWQgdGVzdHMgYXJlIG9wdGlvbmFsbHkgaW5k
ZW50ZWQuDQo+ID4+DQo+ID4+IEFkZCAiVW5rbm93biBsaW5lcyIgaXRlbXMgdG8gZGlmZmVyZW5j
ZXMgYmV0d2VlbiBUQVAgJiBLVEFQIGxpc3QNCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogRnJh
bmsgUm93YW5kIDxmcmFuay5yb3dhbmRAc29ueS5jb20+DQo+ID4+IC0tLQ0KPiA+DQo+ID4gUGxl
YXNlIGRvIG5vdCBhcHBseSB0aGlzIHZlcnNpb24gKHYyKS4gIEkgd2FzIHdvcmtpbmcgb2ZmIHRo
ZSBLVEFQIHNwZWNpZmljYXRpb24NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl4gVEFQDQoNCldoYXQ/Pz8NCg0KPiA+
IGZyb20gYSBkaWZmZXJlbnQgZ2l0aHViIHJlcG8gdGhhbiBJIHNob3VsZCBoYXZlIGJlZW4gcmVm
ZXJlbmNpbmcuDQo+IA0KPiBPSyB0byBwcm9jZWVkIHdpdGggdGhpcyB2ZXJzaW9uIG9mIHRoZSBw
YXRjaC4gIEkgd2FzIHJlZmVyZW5jaW5nIHRoZSBwcm9wb3NlZA0KPiBUQVAgdmVyc2lvbiAxNCwg
d2hpY2ggaXMgaW4gYSBkaWZmZXJlbnQgZ2l0aHViIHJlcG8gdGhhbiB0aGUgVEFQIHZlcnNpb24g
MTMNCj4gc3BlY2lmaWNhdGlvbi4gIEV2ZXJ5dGhpbmcgaW4gdGhpcyBwYXRjaCBpcyBjb25zaXN0
ZW50IHdpdGggVEFQIHZlcnNpb24gMTMsDQo+IGFzIHdlbGwgYXMgdGhlIHByb3Bvc2VkIFRBUCB2
ZXJzaW9uIDE0Lg0KDQpJJ20gY29uZnVzZWQgYnkgdGhpcyBtZXNzYWdlLg0KV2lsbCB0aGVyZSBi
ZSBhIHYzIG9mIHRoZSBwYXRjaCwgb3IgYXJlIHlvdSBzYXlpbmcgdG8ganVzdCBhcHBseSB0aGUg
b3JpZ2luYWwgdjIgb2YNCnRoaXMgcGF0Y2g/DQoNCkZvciB0aGUgb3JpZ2luYWwgKHYyKSBvZiB0
aGUgcGF0Y2gsIHdoaWNoIEkgYmVsaWV2ZSBpcyANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDIyMDIwNzE2MjgxMy4zMDkxODk5LTEtZnJvd2FuZC5saXN0QGdtYWlsLmNvbS8NCg0KeW91
IGNhbiBhZGQgYSAiUmV2aWV3ZWQtYnkiIGZyb20gbWUuDQogLS0gVGltDQoNCg==
