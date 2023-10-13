Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26046107A4
	for <kernelci@lists.linux.dev>; Fri, 13 Oct 2023 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="njpB/ZLy"
Received: from [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4] (unknown [IPv6:2a0d:e40:0:4000:a33d:5e2a:b8b4:d3c4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nuclearcat)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E4C0A660735A;
	Fri, 13 Oct 2023 12:01:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697194876;
	bh=v6kOMZo1PLxQQF5CscZcPq57OxQ+4qJSIcAVG7nkYjs=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=njpB/ZLynIplSl8vH7eLKNeKp1Y2QKhLcdXBrbt3U7H5admM//9/VxYAx/jNMaTli
	 2q2RvQuQQGm7Wn/1dTDanXruonSc/pfAmLLmJTr4j8Cp037kiHETztywgziZpH6nTE
	 MCmqHU9w5SroUSwhNB3wLSUNjAlHj37C5UmrkEBXRrmgYkQ37rRewCLDdRlIYZTyXK
	 K+tPa+dEtbsFwVgNjsUI7MrZ+YevdzccTZqNIhlfEoM4n2a5mk6BsLZ3zbLDPzRM7K
	 CJ5Q20ShdMmo1XOzCA8XOwB+La/AVj/qoKmLM+3bxY8/9sh3SbvwTnJ2YSW5svDsbZ
	 K7ij2TlX1BsdA==
Message-ID: <66a11715b05cc6bf2e0fb29f57fc6f0c4c22d04e.camel@collabora.com>
Subject: Re: ZDI-CAN-22317: New Vulnerability Report
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>, 
	"kernelci@lists.linux.dev"
	 <kernelci@lists.linux.dev>, "secalert@redhat.com" <secalert@redhat.com>
Date: Fri, 13 Oct 2023 14:01:06 +0300
In-Reply-To: <DM5PR0102MB34778BDC7668A45F8F55780180D3A@DM5PR0102MB3477.prod.exchangelabs.com>
References: 
	<DM5PR0102MB34778BDC7668A45F8F55780180D3A@DM5PR0102MB3477.prod.exchangelabs.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Nitesh Surana,

Thank you for bringing this security advisory to our attention. We have
revoked the exposed token and are working to provide early access users
with personal tokens and self-hosted solutions for uploading their
files.

While the exposed token did not pose a risk to users, as any files
published in this share are public and not used in a production
environment, we understand that this incident may have caused concern.

We will provide further updates via this public mailing list.

Thank you for your cooperation.

On Thu, 2023-10-12 at 21:44 +0000, zdi-disclosures@trendmicro.com
wrote:
> ZDI-CAN-22317: KernelCI SAS Token Incorrect Permission Assignment
> Authentication Bypass Vulnerability
> 
> -- CVSS -----------------------------------------
> 
> 8.2: AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:L
> 
> -- ABSTRACT -------------------------------------
> 
> Trend Micro's Zero Day Initiative has identified a vulnerability
> affecting the following products:
> KernelCI - KernelCI
> 
> -- VULNERABILITY DETAILS ------------------------
> * Version tested:  NA
> * Installer file:  hxxps://kernelci.org/
> * Platform tested: Azure
> 
> ---
> 
> ### Analysis
> 
> 
> We found an overly permissive SAS token mentioned in the GitHub
> repository for Kernel CI (an upstream Linux Kernel validation project
> under The Linux Foundation). The token allows for write access on the
> Storage Account, allowing anyone with the publicly available
> token+URL to possibly.
> 
> While checking for files on GitHub with possible SAS tokens having
> the expiry sometime after 2023 and having read and write permissions
> on the storage service (blob, file, queue), we come across the below
> code snippet
> 
> ```
> hxxps://github.com/kernelci/kernelci-
> project/blob/104f95d1909fcccd7389f4a42ffa11a4d8d30cc8/kernelci.org/co
> ntent/en/docs/admin/api.md?plain=1#L91
> ```
> 
> The over-permissive SAS token is: "sv=2022-11-
> 02&ss=bfq&srt=sco&sp=rwdlacpitfx&se=2023-12-03T00:00:00Z&st=2023-09-
> 04T00:00:00Z&spr=https&sig=g1lP2bLomBFr81hNnxi%2Bdi%2F8rvLI0aOZgzIgiZ
> NDnIg%3D"
> 
> ```
> - The SAS token expires on `2023-12-03`
> - The permissions `rwdlacpitfx` are over-permissive (Read, Write,
> Delete, List, Add, Create, Process, Immutability, Tag, Filter, Delete
> Version)
> - The storage types accessible are blob, file, queue
> ```
> 
> Using Azure Storage Explorer, we could read write and list the
> contents of all the storage types in the Storage Account.
> 
> 
> An attacker could modify any file on the File Share of the Storage
> Account and possibly impact users of Kernel CI. The expectation is to
> see that the SAS token allows for read, write and delete operations
> (based on the documentation at
> https://github.com/kernelci/kernelci-api/blob/b7a0f8f19fdba8f9649b282bd2d6fef874820efc/doc/early-access.md?plain=1#L149
> ). However, any user with the SAS token and File Share URL could
> control files on the File Share of the Storage Account.
> 
> 
> -- CREDIT ---------------------------------------
> This vulnerability was discovered by:
> Nitesh Surana (@_niteshsurana) of Trend Micro
> 
> -- FURTHER DETAILS ------------------------------
> 
> Supporting files:
> 
> 
> If supporting files were contained with this report they are provided
> within a password protected ZIP file. The password is the ZDI
> candidate number in the form: ZDI-CAN-XXXX where XXXX is the ID
> number.
> 
> Please confirm receipt of this report. We expect all vendors to
> remediate ZDI vulnerabilities within 120 days of the reported date.
> If you are ready to release a patch at any point leading up to the
> deadline, please coordinate with us so that we may release our
> advisory detailing the issue. If the 120-day deadline is reached and
> no patch has been made available we will release a limited public
> advisory with our own mitigations, so that the public can protect
> themselves in the absence of a patch. Please keep us updated
> regarding the status of this issue and feel free to contact us at any
> time:
> 
> Zero Day Initiative
> zdi-disclosures@trendmicro.com
> 
> The PGP key used for all ZDI vendor communications is available from:
> 
>   http://www.zerodayinitiative.com/documents/disclosures-pgp-key.asc
> 
> -- INFORMATION ABOUT THE ZDI --------------------
> Established by TippingPoint and acquired by Trend Micro, the Zero Day
> Initiative (ZDI) neither re-sells vulnerability details nor exploit
> code. Instead, upon notifying the affected product vendor, the ZDI
> provides its Trend Micro TippingPoint customers with zero day
> protection through its intrusion prevention technology. Explicit
> details regarding the specifics of the vulnerability are not exposed
> to any parties until an official vendor patch is publicly available.
> 
> Please contact us for further details or refer to:
> 
>   http://www.zerodayinitiative.com
> 
> -- DISCLOSURE POLICY ----------------------------
> 
> Our vulnerability disclosure policy is available online at:
> 
>   http://www.zerodayinitiative.com/advisories/disclosure_policy/
> 
> TREND MICRO EMAIL NOTICE
> 
> The information contained in this email and any attachments is
> confidential and may be subject to copyright or other intellectual
> property protection. If you are not the intended recipient, you are
> not authorized to use or disclose this information, and we request
> that you notify us by reply mail or telephone and delete the original
> message from your mail system.
> 
> For details about what personal information we collect and why,
> please see our Privacy Notice on our website at: Read privacy
> policy<http://www.trendmicro.com/privacy>
> 


