Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DB62E2663
	for <kernelci@lists.linux.dev>; Mon,  6 Apr 2026 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775480480; cv=pass; b=CYk8uFa9Ohv9heb0TiGeKnrgyHrPT8OTHczNLlnGHKknv9L5zT3Mlr9F6BiTDuDAXJ8H+28UM8ZFq4dV9UmlwOK3Gey9XMFIvD0t8MWoc/C7xAELaNbpNM96HddAlR/P9CmOoRqxQ6lvVl4O542SqfzXDZfLjLICk9Hm7vocXCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775480480; c=relaxed/simple;
	bh=FaZ3vZgpWIy4lw4XdNx9SMOCNVikz+8nabBYCnDrw/4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DtBVDwhudLfKL6SLU6IdlosdW6D3+VRvTJgXhF77AHaiymsp/2ldce1tE+NnIhS5eEVrrhCn/vMQh++EmhGtk8Lb4kjS3VZBpNShb/8BM6rk5JfjEz/N4IT8acJt6rDdHczU89FmmQbofAUsyxmb454kNr9VpLV0FsjfU4VSkUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b=WJJzLBIK; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion-mobi.20251104.gappssmtp.com header.i=@profusion-mobi.20251104.gappssmtp.com header.b="WJJzLBIK"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a365f1869so1729481fa.3
        for <kernelci@lists.linux.dev>; Mon, 06 Apr 2026 06:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775480477; cv=none;
        d=google.com; s=arc-20240605;
        b=jONqwAui0WtQSNbFig3/9hqWglAvPksIrKo0ruQkoXUh7M9gTAAFdVUFncbym23XSe
         EEH/ZyFBjYWMaV7sY/BXnlWfQ2owExisvbaIZQOusJnYJ8ideU1fnh3m+huwJ3cewQu0
         3XXbkVXDbQQmDDroh0VF2J4WSFucDSLmNbLRIPSY0+ZS7TAKfiEpE320/lDaf9K0VizV
         HGPRPM3lf8crS7+9RhtS2xtXz4y858Hg7ABcr1seEnf3aNAVndXlQfo4wgOo/dCzYXpK
         XGl2yt/8Vf7mM6QMfy0+e0vIr3voC7EiVHJAHTvGdySjAiIa9WYX19VBdlSkYPa99t4z
         QzCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=FaZ3vZgpWIy4lw4XdNx9SMOCNVikz+8nabBYCnDrw/4=;
        fh=qzvcxsfqD8rN09fwl35MGQKQrUWCJaPIRdHAJKA9IXY=;
        b=ZaJmA+8YoAv7OjR0AMMF08MurkAQu1z5q1GnXFXgk+ecFLEeLhCVIhT6B7RKkHk8G5
         GSs5dVAX8UTe+9wGPQeGqdZZ4xhPRiN8UWKjDvX24r0P+lZ6qjgDX8I4TBc2auCLYRoD
         sXOysGs2bwCl3YasLniiP1GyDH3YI6RJKXYaL2eGUN91vswMtlrE+gIKuugWoHhL0lmU
         C42UgbzhkqN0bNkofntQoZV8hFStjzWezbmOPEYC9U5c4Z+cGpYqLeO8WZ7YfYXGBaET
         scc42i5E/Gpo9bVuszS4EBpjBt0PN5a8TzUS4X/9ItgOTLsQjj61XsQSX97VCRhywb7L
         Jw+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion-mobi.20251104.gappssmtp.com; s=20251104; t=1775480477; x=1776085277; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FaZ3vZgpWIy4lw4XdNx9SMOCNVikz+8nabBYCnDrw/4=;
        b=WJJzLBIKhjhb7gxOatJzmsqzzYBHIjJ5TMaHHq24QvVEX6VZwfsIGP5rG4j3O0f1yJ
         Xrn8DIMRedzk1nPwCJjBzPJ/Tk7Z/BdQ8gpxn/Cm79v/F9ULW9IWRSwGZ86Q7JAghxrS
         ggkvpH+799GjVtg2zx9Sju5mDLThMnzysFthDfMQG1nVk4hVfzCGFNobsBrEojkHQgQp
         csqlrw+4JByR9aBUSM9O7kK44a0WMmAkr4uJj7g85ay2VawQ4br5dGuaVquD2+0EjkO9
         kJReH09+FYENW/2ElitMgxSju8nJ1pkdWQqEn5K8m+YsEkrDqQ0OWaT4AjIG6Tg3cmxz
         qL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775480477; x=1776085277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaZ3vZgpWIy4lw4XdNx9SMOCNVikz+8nabBYCnDrw/4=;
        b=Cp9GnfHRv4ujvyQIeCwQwtpKllOEB6xzfvds5+7c4lleBw70b8ELNT72+3vgG5Hocz
         MtjXyXmaR4A6iUP7Y+ED8CeDx34nY+lc/2AgOq8yHZ78friovAMOCCjCmqspHN8M6D1k
         MTbMBKvn3wJeiIhf2tawgzQgvKQtsqyDrzU20TSy5/0upbV3ge+LqUr7DYtSM22/xX3o
         Y+RknADbekU3hhN1aEhsipxUyklS4pAlHgnAaV0yDxG2XEIQ28/IDvKqFvLbuIxGYhkI
         n2W2V1YhoaYVCf5RH0qgHuqFJQj1Cxq3BN7+JBRItApuGG5wGHmWiMjYvil8lryWRdlN
         KNsA==
X-Gm-Message-State: AOJu0Ywup7ZlDV/awDtmAGpVg7OKw2b5t5r/EyTSkGKViDRJdblJgeHW
	57RcgIf5D6VAR0rWIjbstd8zgyP//z7sbkDxV4ZkCNNaXUHmIwwfcPTahxxRocd6CwixJp2pwdL
	z35PsCQKRhfWXVnh4MNiAqgcZyUawHfxNNsIcSP0JZE2n8KR1giGy4F8=
X-Gm-Gg: AeBDieulWr8l1+bOLYZSOJEeO+KrF9kthXdTffGsINX6hNtcWwlngL0tHS1JPNuHYHr
	8YXXARRWK5hKM8MVC62f9VJqoP/Uy683LKMrd/NyUlHKSNIOcbt1uo72WQB9EuWSPvFvTF50/dh
	AiXDMTNgIHvEOQCcei25plJHlqnAgjYth7FQgHOMEKsPOGAt7HTf43sTwzBkypfgb8BuzAPUpCw
	Pu8VYlLdpTQn/t+xB4n6QO4X52veq7+Fh9S+Nx6gh6M5itu6DrCkMHEM/7RSl6yQZCzeN/51tIP
	V8loyBM6
X-Received: by 2002:a05:6512:1302:b0:5a2:7798:9990 with SMTP id
 2adb3069b0e04-5a337551575mr1849755e87.1.1775480476622; Mon, 06 Apr 2026
 06:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marcelo Robert Santos <marcelo.santos@profusion.mobi>
Date: Mon, 6 Apr 2026 10:01:05 -0300
X-Gm-Features: AQROBzBfAXZ6_hIaLrEHDsJTLVC4Rso03NK5XBCtkYF8DmWDS7wL21pm3LkKwSs
Message-ID: <CAMVAkEvAJ5V0=kbWRznxoGzdSEC-4zVvgA7XYaakgVroLB9=VA@mail.gmail.com>
Subject: Manual Update: KernelCI Metrics Report - 2026-04-06 12:53 UTC
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGVsbG8sIHdlIGhhdmUgdXBkYXRlZCB0aGUgS2VybmVsQ0kgbWV0cmljcyByZXBvcnQgZm9ybWF0
dGluZy4NCkl0IHdpbGwgc3RpbGwgcnVuIHdlZWtseSwgYnV0IGhlcmUncyBhIG1hbnVhbCB1cGRh
dGUgdG8gc2hvdyB0aGUgbmV3DQpmb3JtYXQgd2l0aCB0aGUgbGF0ZXN0IGRhdGEuDQoNCg0KS2Vy
bmVsQ0kgTWV0cmljcyBTdW1tYXJ5DQo9PT09PT09PT09PT09PT09PT09PT09PT0NClBlcmlvZDog
MjAyNi0wMy0zMCAxMjo1MyBVVEMgdG8gMjAyNi0wNC0wNiAxMjo1MyBVVEMNCg0KDQogIENPVkVS
QUdFDQogIC0tLS0tLS0tDQogICAgICAgICAgICAgICAgICAgICAgVGhpcyB3ZWVrICAgIExhc3Qg
d2VlayAgICBDaGFuZ2UNCiAgICAgICAgICAgICAgICAgICAgICDilIDilIDilIDilIDilIDilIDi
lIDilIDilIAgICAg4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSAICAgIOKUgOKUgOKUgOKUgOKU
gOKUgA0KICBUcmVlcyBtb25pdG9yZWQgICAgIDQyICAgICAgICAgICA0OSAgICAgICAgICAgLTcN
CiAgQ2hlY2tvdXRzICAgICAgICAgICAzLDk0NyAgICAgICAgNCwwNTggICAgICAgIC0xMTEgICgt
MyUpDQogIEJ1aWxkcyAgICAgICAgICAgICAgNyw4ODcgICAgICAgIDksMzM2ICAgICAgICAtMSw0
NDkgICgtMTYlKQ0KICBUZXN0cyAgICAgICAgICAgICAgIDQ4MSw0NTYgICAgICA0NDEsODU0ICAg
ICAgKzM5LDYwMiAgKCs5JSkNCg0KDQogIEJVSUxEIFJFR1JFU1NJT05TDQogIC0tLS0tLS0tLS0t
LS0tLS0tDQogIEEgInJlZ3Jlc3Npb24iIGlzIGRlZmluZWQgYXMgYSByZXBvcnRlZCBwcm9ibGVt
IGFmZmVjdGluZyAwIG9yDQptdWx0aXBsZSBidWlsZHMuDQoNCiAgT3JpZ2luICAgIFJlZ3Jlc3Np
b25zICAgICAgIEFmZmVjdGVkICAgICAgICAgICBBZmZlY3RlZCBidWlsZHMgYnkgdG9wIGlzc3Vl
cw0KICAgICAgICAgICAgKGtub3duICsgbmV3KSAgICAgQnVpbGRzICh0b3RhbCkgICAgICMxICAg
ICAgIzIgICAgICAjMw0KICDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIANCiAgbWFlc3RybyAgIDE2ICArIDIyICA9IDM4ICAgIDMwNSAgICAgICAgICAgICAg
ICA2MyAgICAgIDI4ICAgICAgMjYNCiAgcmVkaGF0ICAgIDEgICArIDEgICA9IDIgICAgIDkgICAg
ICAgICAgICAgICAgICA2ICAgICAgIDMNCiAg4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSADQogIFRvdGFsICAgICAxNyAgKyAyMyAgPSA0MCAgICAzMTQNCg0K
DQogIFRPUCBSRUdSRVNTSU9OUyBQRVIgT1JJR0lODQogIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQogIG1hZXN0cm86DQogICAgIzEgKDYzIG9jY3VycmVuY2VzKSAtICDigJhkb25l4oCZIGlz
IHVzZWQgdW5pbml0aWFsaXplZA0KWy1XZXJyb3I9dW5pbml0aWFsaXplZF0gaW4gZHJpdmVycy9j
cC4uLg0KICAgICAgRGFzaGJvYXJkOg0KaHR0cHM6Ly9kLmtlcm5lbGNpLm9yZy9pc3N1ZS9tYWVz
dHJvOmU4NGI2NjVkZGQ0NDI0ZWQ3MmE4YmJlZGU5MDYzNmJkY2UxODZmOTk/aXY9MQ0KICAgICMy
ICgyOCBvY2N1cnJlbmNlcykgLSAgJ0hNQUNfVXBkYXRlJyBpcyBkZXByZWNhdGVkDQpbLVdkZXBy
ZWNhdGVkLWRlY2xhcmF0aW9uc10gaW4gY3J5cHRvLy4uLg0KICAgICAgRGFzaGJvYXJkOg0KaHR0
cHM6Ly9kLmtlcm5lbGNpLm9yZy9pc3N1ZS9tYWVzdHJvOmNmYjdkYjdiYWQwMjZmNzg0YWI1MDkz
ZGY5MTUxNWUyN2M2MzRiMzQ/aXY9MQ0KICAgICMzICgyNiBvY2N1cnJlbmNlcykgLSAgaW4NCi90
bXAva2NpL2FydGlmYWN0cy9idWlsZC9rc2VsZnRlc3QvZHJpdmVycy9udHN5bmMvbnRzeW5jICgu
Li8uLi4uLg0KICAgICAgRGFzaGJvYXJkOg0KaHR0cHM6Ly9kLmtlcm5lbGNpLm9yZy9pc3N1ZS9t
YWVzdHJvOjM1YWI0YWMwNGFkMGFlZWRhZWQ2YzA0ZTk5YWViYWE4OTU0ZTZlYzI/aXY9MQ0KDQog
IHJlZGhhdDoNCiAgICAjMSAoNiBvY2N1cnJlbmNlcykgLSAgZXJyb3I6IHRhcmdldCBlbXVsYXRp
b24gdW5rbm93bjogLW0gb3IgYXQNCmxlYXN0IG9uZSAubyBmaWxlIHJlcXVpci4uLg0KICAgICAg
RGFzaGJvYXJkOg0KaHR0cHM6Ly9kLmtlcm5lbGNpLm9yZy9pc3N1ZS9yZWRoYXQ6YThiMDkwMDU2
ZDhlNmJjNGVlZTlmZmE0Mzg5OTQ2Yzk5MmE2ZTk4OT9pdj0xDQogICAgIzIgKDMgb2NjdXJyZW5j
ZXMpIC0gIOKAmGF0OTFfZGVmYXVsdF91c3Jpb+KAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbg0K
YSBmdW5jdGlvbikgaW4gZHJpdmVyLi4uDQogICAgICBEYXNoYm9hcmQ6DQpodHRwczovL2Qua2Vy
bmVsY2kub3JnL2lzc3VlL3JlZGhhdDplMzg1ZTUwNTAyODRlZjVkMTMwZGJiMDZmZmQ2MzNkYWRm
ZDgxYzE4P2l2PTENCg0KDQogIFRFU1QgTEFCUyBBQ1RJVklUWQ0KICAtLS0tLS0tLS0tLS0tLS0t
LS0NCiAgOCBsYWJzIHJlcG9ydGVkIHJlc3VsdHMgdGhpcyB3ZWVrICh1bmNoYW5nZWQgZnJvbSBs
YXN0IHdlZWspLg0KDQogIExhYnMgbWFya2VkIHdpdGggYW4gYXN0ZXJpc2sgKCopIGFyZSBuZXcu
DQoNCiAgTGFiICAgICAgICAgICAgICAgICAgIENvdmVyZWQgYnVpbGRzICBCb290cyAgICBUZXN0
cyAgICAgICAgICBDaGFuZ2UgKHRlc3RzKQ0KICDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIANCiAgbGF2YS1icm9vbmll
ICAgICAgICAgIDI0NiAgICAgICAgICAgICAxLDA5NiAgICAxNTAsNjE3ICAgICAgICAtNDAsODUz
ICAoLTIxJSkNCiAgbGF2YS1jaXAgICAgICAgICAgICAgIDMyMCAgICAgICAgICAgICA3NjEgICAg
ICAxNzEgICAgICAgICAgICArMTkgICgrMTIlKQ0KICBsYXZhLWNvbGxhYm9yYSAgICAgICAgNDUz
ICAgICAgICAgICAgIDIsNjU1ICAgIDE4OSw5NTAgICAgICAgICszOCwzNDAgICgrMjUlKQ0KICBs
YXZhLWZvdW5kcmllc2lvICAgICAgNzkgICAgICAgICAgICAgIDEwNCAgICAgIDAgICAgICAgICAg
ICAgIDAgICgwJSkNCiAgbGF2YS1rY2ktcXVhbGNvbW0gICAgIDQ4ICAgICAgICAgICAgICAxMDUg
ICAgICA3NCw5NTgNCis3NCw4MjkgICgrNTgwMDclKQ0KICBsYXZhLXBlbmd1dHJvbml4ICAgICAg
MTY4ICAgICAgICAgICAgIDQzOCAgICAgIDAgICAgICAgICAgICAgIDAgICgwJSkNCiAgb3BlbnRl
c3QtdGkgICAgICAgICAgIDE3ICAgICAgICAgICAgICA3MDggICAgICAzNSAgICAgICAgICAgICAr
MzUNCiAgcHVsbC1sYWJzLWRlbW8gICAgICAgIDI4NCAgICAgICAgICAgICAzOTQgICAgICA5ODMg
ICAgICAgICAgICAtMiw2NjggICgtNzMlKQ0KICDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIANCiAgVG90YWwgICAgICAg
ICAgICAgICAgIDEsNjE1ICAgICAgICAgICA2LDI2MSAgICA0MTYsNzE0ICAgICAgICArNjksNzAy
ICAoKzIwJSkNCg0KLS0NClRoaXMgaXMgYW4gZXhwZXJpbWVudGFsIHJlcG9ydCBmb3JtYXQuIFBs
ZWFzZSBzZW5kIGZlZWRiYWNrIGluIQ0KVGFsayB0byB1cyBhdCBrZXJuZWxjaUBsaXN0cy5saW51
eC5kZXYNCg0KTWFkZSB3aXRoIGxvdmUgYnkgdGhlIEtlcm5lbENJIHRlYW0gLSBodHRwczovL2tl
cm5lbGNpLm9yZw0K
