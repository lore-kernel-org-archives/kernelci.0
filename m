Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5272145B24
	for <kernelci@lists.linux.dev>; Thu,  8 Aug 2024 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723139782; cv=none; b=GEYd3R03FC/lduCJA1QZk56TPdXRCCvB8e4YpEdwJfj8YE/jHFelub9B1i1C6sCOVSvEcupPXyVdqlqrpDborenQyDisoMEawg3qE0MqRMzk2aEiyQmYyGtywYlqTkreQQDw7fSso5FOdb7WivMksmddx31kxaZO8hp41IUjktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723139782; c=relaxed/simple;
	bh=nsl1UFGpjnoH1zXZMgzKlb9CxKxKxOPkrnpjOUn1AJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LjccidmgkP8KpM9AohzBV8c/P/FUH3iA+vQw/sP7FozeMUE5M2cp1fZr4NjIGyfnTbtDkTpEdw0V4xtaT03Fs5u+hnFJ42gWTtFUN23f0RKX/mRkTmSjG3XKazN5R9araj8g7o9NPONWETOO8c8bvgiaISb73FwMfPbys02gnpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dj01NeLt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dj01NeLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723139779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M8cZZq6MQzlJRpSOoyeD1p2ryPpwUIuHe77w6NmGk1U=;
	b=Dj01NeLtZvxZqy3cUZA9ruuFPrY+5gc8f8FDwBnIwA23BZiFVWBM6SstGY3j7ia/MEWfel
	K9qYGSapoh8oZ3/l7WPeSmKMNl7iXaR3sd27NTbFzjILYrxvkADVXpQk7EkzHAoBidDTmL
	rcquNtFaHr46E64cwePIBCaJfDthV8g=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-f7R5l2wEPQSvz_-yLjkYOw-1; Thu, 08 Aug 2024 13:56:16 -0400
X-MC-Unique: f7R5l2wEPQSvz_-yLjkYOw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ef1ba2a5e6so12579601fa.1
        for <kernelci@lists.linux.dev>; Thu, 08 Aug 2024 10:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723139775; x=1723744575;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rE9mWSPjO6DpU5PHBZO1pbPuZwrnZbCoTQpsT9wj928=;
        b=TF6z+J9VF/JfJvvNHPxwqz2FVvmqHpMjYk5gZe75mKSFrVIS5oMwTMdOq5whJuPF/x
         jTUYlQWBSY4jkMXYv15xTQqsf8GmxWX8R1Yoxww93/wrGbJhkzfDVCFYdELZzZqxU45q
         2SnG5Ukq0WK1TQPvjfgVzYk5wY0w1y52yTc+f8f8N8TjHUGZU6hAGP85/BUnz5nc13EE
         J5gdVorUlNXlfPHR4dwPuePoPHP4Vi1QWJcZ/rYHEZjDzK4bkYKxxc3GrmIj8ph1np2P
         UUlslrUIlKkQFgb7aBiFi/nhNUV8pteOIQQieKddp5lVPWMX1KuQutsSViu8E6Mh3Ngm
         bk5g==
X-Forwarded-Encrypted: i=1; AJvYcCVjsEBlFpDPTNJZZsxoMXCNfyUMuHBa6F5x84IN3sCdAXY0ycI3jEmdnCrFJfQLDJumFy1wdtFrn73NNjTh3v1Y0GiDSkhUvtQ=
X-Gm-Message-State: AOJu0YyM1oDhJfEQCqUrSLBVSM7DocOYeyOfAL12RG0lyHo32Of9SFYm
	j1bSk7GhAvVRan8BV+q5Q2eWLoAqXITlDe/9lZmaPhso1mohXszouqpcZd+Q4vDiLizgYLV00ki
	Inj46PCk0EDXlybXDm7SVcztfEDFVgnFTOj5Di7x6fohsG0hzECxlA0qZ
X-Received: by 2002:a2e:be88:0:b0:2ef:268a:a194 with SMTP id 38308e7fff4ca-2f19de18ae4mr22872131fa.9.1723139774946;
        Thu, 08 Aug 2024 10:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVq0LThWGveMmWJLvmZQfoBkUZCn2E8IbRS3u04kRiPM7DvyjoHsEXMBXqu+53FRAiTFMQ5Q==
X-Received: by 2002:a2e:be88:0:b0:2ef:268a:a194 with SMTP id 38308e7fff4ca-2f19de18ae4mr22871761fa.9.1723139773865;
        Thu, 08 Aug 2024 10:56:13 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e25084asm23179971fa.99.2024.08.08.10.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 10:56:13 -0700 (PDT)
Message-ID: <3351c08b-7594-43ea-80f1-e0f35271115f@redhat.com>
Date: Thu, 8 Aug 2024 20:56:12 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kcidb access request
To: Bjorn Andersson <andersson@kernel.org>, kernelci@lists.linux.dev
References: <66qpsiapmqcpnbajfi34oxympjqk7svtygkdtdcby3yirijbvp@pesxnvj6qhhb>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <66qpsiapmqcpnbajfi34oxympjqk7svtygkdtdcby3yirijbvp@pesxnvj6qhhb>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------oGJ9vLEgwe5hhxR5IpzpLX95"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------oGJ9vLEgwe5hhxR5IpzpLX95
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bjorn,

On 8/7/24 6:49 PM, Bjorn Andersson wrote:
> I'm using api.kernelci.org for reporting test results from my kernelci
> lab, as well as scraping test reports for Qualcomm boards for local
> aggregation and presentation.
> 
> As part of the transition to the new KernelCI APIs, I would like access
> to KCIDB.
> 
> 
> My (custom) test reporting tool today uses the LAVA callback interface,
> and thereby follows this schema for the report, groups and cases. I can
> continue to follow this schema, or change the schema as you prefer.
> Please let me know.

Sorry for the delay with the answer!

Sure, you can get the access to the KCIDB database.

However, we don't have APIs, just the direct access to PostgreSQL, which keeps
six months of data. See the attached (abbreviated) schema dump. It largely
mirrors the JSON I/O schema, which you can see here:

https://github.com/kernelci/kcidb-io/blob/main/kcidb_io/schema/v04_03.py

Here's some more human-oriented introductory docs:

https://kernelci.org/docs/kcidb/submitter_guide/

Note, that at the moment we have no way to query for "Qualcomm boards", but we
have a schema change proposal being discussed to address that.

Also, when fetching your data you will need to be considerate of traffic and load.

You can explore the data on the dashboard (to be improved soon):
https://kcidb.kernelci.org/

If none of the above stops you, I can give you credentials and permissions for
querying.

Nick
--------------oGJ9vLEgwe5hhxR5IpzpLX95
Content-Type: application/sql; name="abbreviated_schema.sql"
Content-Disposition: attachment; filename="abbreviated_schema.sql"
Content-Transfer-Encoding: base64

LS0KLS0gUG9zdGdyZVNRTCBkYXRhYmFzZSBkdW1wCi0tCgotLQotLSBOYW1lOiBzdGF0dXM7IFR5
cGU6IFRZUEU7IFNjaGVtYTogcHVibGljOyBPd25lcjogcG9zdGdyZXMKLS0KCkNSRUFURSBUWVBF
IHB1YmxpYy5zdGF0dXMgQVMgRU5VTSAoCiAgICAnRkFJTCcsCiAgICAnRVJST1InLAogICAgJ01J
U1MnLAogICAgJ1BBU1MnLAogICAgJ0RPTkUnLAogICAgJ1NLSVAnCik7CgoKLS0KLS0gTmFtZTog
ZW5jb2RlX3VyaV9jb21wb25lbnQodGV4dCk7IFR5cGU6IEZVTkNUSU9OOyBTY2hlbWE6IHB1Ymxp
YzsgT3duZXI6IHBvc3RncmVzCi0tCgpDUkVBVEUgRlVOQ1RJT04gcHVibGljLmVuY29kZV91cmlf
Y29tcG9uZW50KHRleHQpIFJFVFVSTlMgdGV4dAogICAgTEFOR1VBR0Ugc3FsIElNTVVUQUJMRSBT
VFJJQ1QKICAgIEFTICRfJAogICAgU0VMRUNUIHN0cmluZ19hZ2coCiAgICAgICAgQ0FTRQogICAg
ICAgICAgICBXSEVOIGxlbl9ieXRlcyA+IDEgT1IgY2hhciAhfiAnWzAtOWEtekEtWl8uIX4qJyco
KS1dKycgVEhFTgogICAgICAgICAgICAgICAgcmVnZXhwX3JlcGxhY2UoCiAgICAgICAgICAgICAg
ICAgICAgZW5jb2RlKGNvbnZlcnRfdG8oY2hhciwgJ3V0Zi04Jyk6OmJ5dGVhLCAnaGV4JyksCiAg
ICAgICAgICAgICAgICAgICAgJyguLiknLAogICAgICAgICAgICAgICAgICAgIEUnJVxcMScsCiAg
ICAgICAgICAgICAgICAgICAgJ2cnCiAgICAgICAgICAgICAgICApCiAgICAgICAgICAgIGVsc2UK
ICAgICAgICAgICAgICAgIGNoYXIKICAgICAgICBlbmQsCiAgICAgICAgJycKICAgICkKICAgIEZS
T00gKAogICAgICAgIFNFTEVDVCBjaGFyLCBvY3RldF9sZW5ndGgoY2hhcikgQVMgbGVuX2J5dGVz
CiAgICAgICAgRlJPTSByZWdleHBfc3BsaXRfdG9fdGFibGUoJDEsICcnKSBjaGFyCiAgICApIEFT
IGNoYXJzOwokXyQ7CgoKLS0KLS0gTmFtZTogZmlyc3RfYWdnKGFueWVsZW1lbnQsIGFueWVsZW1l
bnQpOyBUeXBlOiBGVU5DVElPTjsgU2NoZW1hOiBwdWJsaWM7IE93bmVyOiBwb3N0Z3JlcwotLQoK
Q1JFQVRFIEZVTkNUSU9OIHB1YmxpYy5maXJzdF9hZ2coYW55ZWxlbWVudCwgYW55ZWxlbWVudCkg
UkVUVVJOUyBhbnllbGVtZW50CiAgICBMQU5HVUFHRSBzcWwgSU1NVVRBQkxFIFNUUklDVCBQQVJB
TExFTCBTQUZFCiAgICBBUyAkXyRTRUxFQ1QgJDEkXyQ7CgoKLS0KLS0gTmFtZTogZm9ybWF0X2Nh
Y2hlZF91cmwodGV4dCk7IFR5cGU6IEZVTkNUSU9OOyBTY2hlbWE6IHB1YmxpYzsgT3duZXI6IHBv
c3RncmVzCi0tCgpDUkVBVEUgRlVOQ1RJT04gcHVibGljLmZvcm1hdF9jYWNoZWRfdXJsKHRleHQp
IFJFVFVSTlMgdGV4dAogICAgTEFOR1VBR0Ugc3FsIElNTVVUQUJMRSBTVFJJQ1QKICAgIEFTICRf
JAogICAgICAgICAgICAgICAgICAgIFNFTEVDVCAnaHR0cHM6Ly91cy1jZW50cmFsMS1rZXJuZWxj
aS1wcm9kdWN0aW9uLmNsb3VkZnVuY3Rpb25zLm5ldC9rY2lkYl9jYWNoZV9yZWRpcmVjdD8nIHx8
CiAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuY29kZV91cmlfY29tcG9uZW50KCQxKTsKICAg
ICAgICAgICAgICAgICRfJDsKCgotLQotLSBOYW1lOiBnZXRfdmVyc2lvbigpOyBUeXBlOiBGVU5D
VElPTjsgU2NoZW1hOiBwdWJsaWM7IE93bmVyOiBwb3N0Z3JlcwotLQoKQ1JFQVRFIEZVTkNUSU9O
IHB1YmxpYy5nZXRfdmVyc2lvbigpIFJFVFVSTlMgaW50ZWdlcgogICAgTEFOR1VBR0Ugc3FsIElN
TVVUQUJMRQogICAgQVMgJCRTRUxFQ1QgNDAwNyQkOwoKCi0tCi0tIE5hbWU6IGxhc3RfYWdnKGFu
eWVsZW1lbnQsIGFueWVsZW1lbnQpOyBUeXBlOiBGVU5DVElPTjsgU2NoZW1hOiBwdWJsaWM7IE93
bmVyOiBwb3N0Z3JlcwotLQoKQ1JFQVRFIEZVTkNUSU9OIHB1YmxpYy5sYXN0X2FnZyhhbnllbGVt
ZW50LCBhbnllbGVtZW50KSBSRVRVUk5TIGFueWVsZW1lbnQKICAgIExBTkdVQUdFIHNxbCBJTU1V
VEFCTEUgU1RSSUNUIFBBUkFMTEVMIFNBRkUKICAgIEFTICRfJFNFTEVDVCAkMiRfJDsKCgoKLS0K
LS0gTmFtZTogZmlyc3QoYW55ZWxlbWVudCk7IFR5cGU6IEFHR1JFR0FURTsgU2NoZW1hOiBwdWJs
aWM7IE93bmVyOiBwb3N0Z3JlcwotLQoKQ1JFQVRFIEFHR1JFR0FURSBwdWJsaWMuZmlyc3QoYW55
ZWxlbWVudCkgKAogICAgU0ZVTkMgPSBwdWJsaWMuZmlyc3RfYWdnLAogICAgU1RZUEUgPSBhbnll
bGVtZW50LAogICAgUEFSQUxMRUwgPSBzYWZlCik7CgoKCi0tCi0tIE5hbWU6IGxhc3QoYW55ZWxl
bWVudCk7IFR5cGU6IEFHR1JFR0FURTsgU2NoZW1hOiBwdWJsaWM7IE93bmVyOiBwb3N0Z3Jlcwot
LQoKQ1JFQVRFIEFHR1JFR0FURSBwdWJsaWMubGFzdChhbnllbGVtZW50KSAoCiAgICBTRlVOQyA9
IHB1YmxpYy5sYXN0X2FnZywKICAgIFNUWVBFID0gYW55ZWxlbWVudCwKICAgIFBBUkFMTEVMID0g
c2FmZQopOwoKLS0KLS0gTmFtZTogYnVpbGRzOyBUeXBlOiBUQUJMRTsgU2NoZW1hOiBwdWJsaWM7
IE93bmVyOiBwb3N0Z3JlcwotLQoKQ1JFQVRFIFRBQkxFIHB1YmxpYy5idWlsZHMgKAogICAgX3Rp
bWVzdGFtcCB0aW1lc3RhbXAgd2l0aCB0aW1lIHpvbmUsCiAgICBjaGVja291dF9pZCB0ZXh0IE5P
VCBOVUxMLAogICAgaWQgdGV4dCBOT1QgTlVMTCwKICAgIG9yaWdpbiB0ZXh0IE5PVCBOVUxMLAog
ICAgY29tbWVudCB0ZXh0LAogICAgc3RhcnRfdGltZSB0aW1lc3RhbXAgd2l0aCB0aW1lIHpvbmUs
CiAgICBkdXJhdGlvbiBkb3VibGUgcHJlY2lzaW9uLAogICAgYXJjaGl0ZWN0dXJlIHRleHQsCiAg
ICBjb21tYW5kIHRleHQsCiAgICBjb21waWxlciB0ZXh0LAogICAgaW5wdXRfZmlsZXMganNvbmIs
CiAgICBvdXRwdXRfZmlsZXMganNvbmIsCiAgICBjb25maWdfbmFtZSB0ZXh0LAogICAgY29uZmln
X3VybCB0ZXh0LAogICAgbG9nX3VybCB0ZXh0LAogICAgbG9nX2V4Y2VycHQgY2hhcmFjdGVyIHZh
cnlpbmcoMTYzODQpLAogICAgdmFsaWQgYm9vbGVhbiwKICAgIG1pc2MganNvbmIKKTsKCgoKLS0K
LS0gTmFtZTogY2hlY2tvdXRzOyBUeXBlOiBUQUJMRTsgU2NoZW1hOiBwdWJsaWM7IE93bmVyOiBw
b3N0Z3JlcwotLQoKQ1JFQVRFIFRBQkxFIHB1YmxpYy5jaGVja291dHMgKAogICAgX3RpbWVzdGFt
cCB0aW1lc3RhbXAgd2l0aCB0aW1lIHpvbmUsCiAgICBpZCB0ZXh0IE5PVCBOVUxMLAogICAgb3Jp
Z2luIHRleHQgTk9UIE5VTEwsCiAgICB0cmVlX25hbWUgdGV4dCwKICAgIGdpdF9yZXBvc2l0b3J5
X3VybCB0ZXh0LAogICAgZ2l0X2NvbW1pdF9oYXNoIHRleHQsCiAgICBnaXRfY29tbWl0X25hbWUg
dGV4dCwKICAgIGdpdF9yZXBvc2l0b3J5X2JyYW5jaCB0ZXh0LAogICAgcGF0Y2hzZXRfZmlsZXMg
anNvbmIsCiAgICBwYXRjaHNldF9oYXNoIHRleHQsCiAgICBtZXNzYWdlX2lkIHRleHQsCiAgICBj
b21tZW50IHRleHQsCiAgICBzdGFydF90aW1lIHRpbWVzdGFtcCB3aXRoIHRpbWUgem9uZSwKICAg
IGNvbnRhY3RzIGpzb25iLAogICAgbG9nX3VybCB0ZXh0LAogICAgbG9nX2V4Y2VycHQgY2hhcmFj
dGVyIHZhcnlpbmcoMTYzODQpLAogICAgdmFsaWQgYm9vbGVhbiwKICAgIG1pc2MganNvbmIKKTsK
CgoKLS0KLS0gTmFtZTogaW5jaWRlbnRzOyBUeXBlOiBUQUJMRTsgU2NoZW1hOiBwdWJsaWM7IE93
bmVyOiBwb3N0Z3JlcwotLQoKQ1JFQVRFIFRBQkxFIHB1YmxpYy5pbmNpZGVudHMgKAogICAgX3Rp
bWVzdGFtcCB0aW1lc3RhbXAgd2l0aCB0aW1lIHpvbmUsCiAgICBpZCB0ZXh0IE5PVCBOVUxMLAog
ICAgb3JpZ2luIHRleHQgTk9UIE5VTEwsCiAgICBpc3N1ZV9pZCB0ZXh0IE5PVCBOVUxMLAogICAg
aXNzdWVfdmVyc2lvbiBpbnRlZ2VyIE5PVCBOVUxMLAogICAgYnVpbGRfaWQgdGV4dCwKICAgIHRl
c3RfaWQgdGV4dCwKICAgIHByZXNlbnQgYm9vbGVhbiwKICAgIGNvbW1lbnQgdGV4dCwKICAgIG1p
c2MganNvbmIKKTsKCgoKLS0KLS0gTmFtZTogaXNzdWVzOyBUeXBlOiBUQUJMRTsgU2NoZW1hOiBw
dWJsaWM7IE93bmVyOiBwb3N0Z3JlcwotLQoKQ1JFQVRFIFRBQkxFIHB1YmxpYy5pc3N1ZXMgKAog
ICAgX3RpbWVzdGFtcCB0aW1lc3RhbXAgd2l0aCB0aW1lIHpvbmUsCiAgICBpZCB0ZXh0IE5PVCBO
VUxMLAogICAgdmVyc2lvbiBpbnRlZ2VyIE5PVCBOVUxMLAogICAgb3JpZ2luIHRleHQgTk9UIE5V
TEwsCiAgICByZXBvcnRfdXJsIHRleHQsCiAgICByZXBvcnRfc3ViamVjdCB0ZXh0LAogICAgY3Vs
cHJpdF9jb2RlIGJvb2xlYW4sCiAgICBjdWxwcml0X3Rvb2wgYm9vbGVhbiwKICAgIGN1bHByaXRf
aGFybmVzcyBib29sZWFuLAogICAgYnVpbGRfdmFsaWQgYm9vbGVhbiwKICAgIHRlc3Rfc3RhdHVz
IHRleHQsCiAgICBjb21tZW50IHRleHQsCiAgICBtaXNjIGpzb25iCik7CgoKCi0tCi0tIE5hbWU6
IHRlc3RzOyBUeXBlOiBUQUJMRTsgU2NoZW1hOiBwdWJsaWM7IE93bmVyOiBwb3N0Z3JlcwotLQoK
Q1JFQVRFIFRBQkxFIHB1YmxpYy50ZXN0cyAoCiAgICBfdGltZXN0YW1wIHRpbWVzdGFtcCB3aXRo
IHRpbWUgem9uZSwKICAgIGJ1aWxkX2lkIHRleHQgTk9UIE5VTEwsCiAgICBpZCB0ZXh0IE5PVCBO
VUxMLAogICAgb3JpZ2luIHRleHQgTk9UIE5VTEwsCiAgICBlbnZpcm9ubWVudF9jb21tZW50IHRl
eHQsCiAgICBlbnZpcm9ubWVudF9taXNjIGpzb25iLAogICAgcGF0aCB0ZXh0LAogICAgY29tbWVu
dCB0ZXh0LAogICAgbG9nX3VybCB0ZXh0LAogICAgbG9nX2V4Y2VycHQgY2hhcmFjdGVyIHZhcnlp
bmcoMTYzODQpLAogICAgc3RhdHVzIHB1YmxpYy5zdGF0dXMsCiAgICB3YWl2ZWQgYm9vbGVhbiwK
ICAgIHN0YXJ0X3RpbWUgdGltZXN0YW1wIHdpdGggdGltZSB6b25lLAogICAgZHVyYXRpb24gZG91
YmxlIHByZWNpc2lvbiwKICAgIG91dHB1dF9maWxlcyBqc29uYiwKICAgIG1pc2MganNvbmIKKTsK
CgoKLS0KLS0gTmFtZTogYnVpbGRzIGJ1aWxkc19wa2V5OyBUeXBlOiBDT05TVFJBSU5UOyBTY2hl
bWE6IHB1YmxpYzsgT3duZXI6IHBvc3RncmVzCi0tCgpBTFRFUiBUQUJMRSBPTkxZIHB1YmxpYy5i
dWlsZHMKICAgIEFERCBDT05TVFJBSU5UIGJ1aWxkc19wa2V5IFBSSU1BUlkgS0VZIChpZCk7CgoK
LS0KLS0gTmFtZTogY2hlY2tvdXRzIGNoZWNrb3V0c19wa2V5OyBUeXBlOiBDT05TVFJBSU5UOyBT
Y2hlbWE6IHB1YmxpYzsgT3duZXI6IHBvc3RncmVzCi0tCgpBTFRFUiBUQUJMRSBPTkxZIHB1Ymxp
Yy5jaGVja291dHMKICAgIEFERCBDT05TVFJBSU5UIGNoZWNrb3V0c19wa2V5IFBSSU1BUlkgS0VZ
IChpZCk7CgoKLS0KLS0gTmFtZTogaW5jaWRlbnRzIGluY2lkZW50c19wa2V5OyBUeXBlOiBDT05T
VFJBSU5UOyBTY2hlbWE6IHB1YmxpYzsgT3duZXI6IHBvc3RncmVzCi0tCgpBTFRFUiBUQUJMRSBP
TkxZIHB1YmxpYy5pbmNpZGVudHMKICAgIEFERCBDT05TVFJBSU5UIGluY2lkZW50c19wa2V5IFBS
SU1BUlkgS0VZIChpZCk7CgoKLS0KLS0gTmFtZTogaXNzdWVzIGlzc3Vlc19wa2V5OyBUeXBlOiBD
T05TVFJBSU5UOyBTY2hlbWE6IHB1YmxpYzsgT3duZXI6IHBvc3RncmVzCi0tCgpBTFRFUiBUQUJM
RSBPTkxZIHB1YmxpYy5pc3N1ZXMKICAgIEFERCBDT05TVFJBSU5UIGlzc3Vlc19wa2V5IFBSSU1B
UlkgS0VZIChpZCwgdmVyc2lvbik7CgoKLS0KLS0gTmFtZTogdGVzdHMgdGVzdHNfcGtleTsgVHlw
ZTogQ09OU1RSQUlOVDsgU2NoZW1hOiBwdWJsaWM7IE93bmVyOiBwb3N0Z3JlcwotLQoKQUxURVIg
VEFCTEUgT05MWSBwdWJsaWMudGVzdHMKICAgIEFERCBDT05TVFJBSU5UIHRlc3RzX3BrZXkgUFJJ
TUFSWSBLRVkgKGlkKTsK
--------------oGJ9vLEgwe5hhxR5IpzpLX95--

