Received: from outbound23.service-now.com (outbound23.service-now.com [149.96.6.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FC7125A0
	for <kernelci@lists.linux.dev>; Fri, 13 Oct 2023 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from app130155.ycg3.service-now.com (unknown [10.248.3.236])
	by outbound23.service-now.com (Postfix) with ESMTP id 4E5F54038493;
	Fri, 13 Oct 2023 04:03:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 outbound23.service-now.com 4E5F54038493
Date: Fri, 13 Oct 2023 04:03:57 -0700 (PDT)
From: Red Hat Product Security <secalert@redhat.com>
Reply-To: Red Hat Product Security <secalert@redhat.com>
To: security@redhat.com, kernelci@lists.linux.dev
Message-ID: <10938477.32355.1697195037303@app130155.ycg3.service-now.com>
Subject: Re: ZDI-CAN-22317: New Vulnerability Report
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_32353_3771767.1697195037302"
X-ServiceNow-Source: Notification-ec04d32213ede300196f7e276144b04e
X-ServiceNow-SysEmail-Version: 2
Precedence: bulk
Auto-Submitted: auto-generated
X-ServiceNow-Generated: true

------=_Part_32353_3771767.1697195037302
Content-Type: multipart/alternative; 
	boundary="----=_Part_32354_22740156.1697195037302"

------=_Part_32354_22740156.1697195037302
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hello!

INC2757115 (ZDI-CAN-22317: New Vulnerability Report) has been acknowledged.

Opened for:=C2=A0security@redhat.com
Followers:=C2=A0kernelci@lists.linux.dev

A Guest updated your request with the following comments:

Reply from: security@redhat.com [mailto:security@redhat.com]
=C2=A0Dear Nitesh Surana,
=C2=A0Thank you for bringing this security advisory to our attention. We ha=
ve
revoked the exposed token and are working to provide early access users
with personal tokens and self-hosted solutions for uploading their
files.
=C2=A0While the exposed token did not pose a risk to users, as any files
published in this share are public and not used in a production
environment, we understand that this incident may have caused concern.
=C2=A0We will provide further updates via this public mailing list.
=C2=A0Thank you for your cooperation.
=C2=A0On Thu, 2023-10-12 at 21:44 +0000, zdi-disclosures@trendmicro.com [ma=
ilto:zdi-disclosures@trendmicro.com]
wrote:
> ZDI-CAN-22317: KernelCI SAS Token Incorrect Permission Assignment
> Authentication Bypass Vulnerability
>=20
> -- CVSS -----------------------------------------
>=20
> 8.2: AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:L
>=20
> -- ABSTRACT -------------------------------------
>=20
> Trend Micro's Zero Day Initiative has identified a vulnerability
> affecting the following products:
> KernelCI - KernelCI
>=20
> -- VULNERABILITY DETAILS ------------------------
> * Version tested:=C2=A0 NA
> * Installer file:=C2=A0 hxxps://kernelci.org/ [http://kernelci.org/]
> * Platform tested: Azure
>=20
> ---
>=20
> ### Analysis
>=20
>=20
> We found an overly permissive SAS token mentioned in the GitHub
> repository for Kernel CI (an upstream Linux Kernel validation project
> under The Linux Foundation). The token allows for write access on the
> Storage Account, allowing anyone with the publicly available
> token+URL to possibly.
>=20
> While checking for files on GitHub with possible SAS tokens having
> the expiry sometime after 2023 and having read and write permissions
> on the storage service (blob, file, queue), we come across the below
> code snippet
>=20
> ```
> hxxps://github.com/kernelci/kernelci [http://github.com/kernelci/kernelci=
]-
> project/blob/104f95d1909fcccd7389f4a42ffa11a4d8d30cc8/kernelci.org/co [ht=
tp://kernelci.org/co]
> ntent/en/docs/admin/api.md?plain=3D1#L91 [http://api.md?plain=3D1#L91]
> ```
>=20
> The over-permissive SAS token is: "sv=3D2022-11-
> 02&ss=3Dbfq&srt=3Dsco&sp=3Drwdlacpitfx&se=3D2023-12-03T00:00:00Z&st=3D202=
3-09-
> 04T00:00:00Z&spr=3Dhttps&sig=3Dg1lP2bLomBFr81hNnxi%2Bdi%2F8rvLI0aOZgzIgiZ
> NDnIg%3D"
>=20
> ```
> - The SAS token expires on `2023-12-03`
> - The permissions `rwdlacpitfx` are over-permissive (Read, Write,
> Delete, List, Add, Create, Process, Immutability, Tag, Filter, Delete
> Version)
> - The storage types accessible are blob, file, queue
> ```
>=20
> Using Azure Storage Explorer, we could read write and list the
> contents of all the storage types in the Storage Account.
>=20
>=20
> An attacker could modify any file on the File Share of the Storage
> Account and possibly impact users of Kernel CI. The expectation is to
> see that the SAS token allows for read, write and delete operations
> (based on the documentation at
> https://github.com/kernelci/kernelci-api/blob/b7a0f8f19fdba8f9649b282bd2d=
6fef874820efc/doc/early-access.md?plain=3D1#L149 [https://github.com/kernel=
ci/kernelci-api/blob/b7a0f8f19fdba8f9649b282bd2d6fef874820efc/doc/early-acc=
ess.md?plain=3D1#L149]
> ). However, any user with the SAS token and File Share URL could
> control files on the File Share of the Storage Account.
>=20
>=20
> -- CREDIT ---------------------------------------
> This vulnerability was discovered by:
> Nitesh Surana (@_niteshsurana) of Trend Micro
>=20
> -- FURTHER DETAILS ------------------------------
>=20
> Supporting files:
>=20
>=20
> If supporting files were contained with this report they are provided
> within a password protected ZIP file. The password is the ZDI
> candidate number in the form: ZDI-CAN-XXXX where XXXX is the ID
> number.
>=20
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
>=20
> Zero Day Initiative
> zdi-disclosures@trendmicro.com [mailto:zdi-disclosures@trendmicro.com]
>=20
> The PGP key used for all ZDI vendor communications is available from:
>=20
> =C2=A0 http://www.zerodayinitiative.com/documents/disclosures-pgp-key.asc=
 [http://www.zerodayinitiative.com/documents/disclosures-pgp-key.asc]
>=20
> -- INFORMATION ABOUT THE ZDI --------------------
> Established by TippingPoint and acquired by Trend Micro, the Zero Day
> Initiative (ZDI) neither re-sells vulnerability details nor exploit
> code. Instead, upon notifying the affected product vendor, the ZDI
> provides its Trend Micro TippingPoint customers with zero day
> protection through its intrusion prevention technology. Explicit
> details regarding the specifics of the vulnerability are not exposed
> to any parties until an official vendor patch is publicly available.
>=20
> Please contact us for further details or refer to:
>=20
> =C2=A0 http://www.zerodayinitiative.com [http://www.zerodayinitiative.com=
]
>=20
> -- DISCLOSURE POLICY ----------------------------
>=20
> Our vulnerability disclosure policy is available online at:
>=20
> =C2=A0 http://www.zerodayinitiative.com/advisories/disclosure_policy/ [ht=
tp://www.zerodayinitiative.com/advisories/disclosure_policy/]
>=20
> TREND MICRO EMAIL NOTICE
>=20
> The information contained in this email and any attachments is
> confidential and may be subject to copyright or other intellectual
> property protection. If you are not the intended recipient, you are
> not authorized to use or disclose this information, and we request
> that you notify us by reply mail or telephone and delete the original
> message from your mail system.
>=20
> For details about what personal information we collect and why,
> please see our Privacy Notice on our website at: Read privacy
> policy<http://www.trendmicro.com/privacy [http://www.trendmicro.com/priva=
cy]>
>

How can I track and update my request?

To respond, reply to this email. You may also create a new email and includ=
e the request number (INC2757115) in the subject.

Thank you,
Product Security

Ref:MSG80461454
------=_Part_32354_22740156.1697195037302
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div><p style=3D"margin-top:0;margin-bottom:10px;"=
>Hello!</p><p style=3D"margin-top:0;margin-bottom:10px;">INC2757115 (ZDI-CA=
N-22317: New Vulnerability Report) has been acknowledged.</p><p style=3D"ma=
rgin-top:0;margin-bottom:10px;">Opened for:&nbsp;security@redhat.com<br>Fol=
lowers:&nbsp;kernelci@lists.linux.dev</p></div>
<p style=3D"margin-top: 10px; margin-bottom: 10px;">A Guest updated your re=
quest with the following comments:</p>
<div style=3D"padding: 10px 0 10px 10px; background-color: ivory;"><div>Rep=
ly from: <a target=3D"_blank" href=3D"mailto:security@redhat.com" rel=3D"no=
opener noreferrer nofollow">security@redhat.com</a></div><div>&nbsp;</div><=
div>Dear Nitesh Surana,</div><div>&nbsp;</div><div>Thank you for bringing t=
his security advisory to our attention. We have</div><div>revoked the expos=
ed token and are working to provide early access users</div><div>with perso=
nal tokens and self-hosted solutions for uploading their</div><div>files.</=
div><div>&nbsp;</div><div>While the exposed token did not pose a risk to us=
ers, as any files</div><div>published in this share are public and not used=
 in a production</div><div>environment, we understand that this incident ma=
y have caused concern.</div><div>&nbsp;</div><div>We will provide further u=
pdates via this public mailing list.</div><div>&nbsp;</div><div>Thank you f=
or your cooperation.</div><div>&nbsp;</div><div>On Thu, 2023-10-12 at 21:44=
 +0000, <a target=3D"_blank" href=3D"mailto:zdi-disclosures@trendmicro.com"=
 rel=3D"noopener noreferrer nofollow">zdi-disclosures@trendmicro.com</a></d=
iv><div>wrote:</div><div>&gt; ZDI-CAN-22317: KernelCI SAS Token Incorrect P=
ermission Assignment</div><div>&gt; Authentication Bypass Vulnerability</di=
v><div>&gt; </div><div>&gt; -- CVSS ---------------------------------------=
--</div><div>&gt; </div><div>&gt; 8.2: AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:L<=
/div><div>&gt; </div><div>&gt; -- ABSTRACT --------------------------------=
-----</div><div>&gt; </div><div>&gt; Trend Micro's Zero Day Initiative has =
identified a vulnerability</div><div>&gt; affecting the following products:=
</div><div>&gt; KernelCI - KernelCI</div><div>&gt; </div><div>&gt; -- VULNE=
RABILITY DETAILS ------------------------</div><div>&gt; * Version tested:&=
nbsp; NA</div><div>&gt; * Installer file:&nbsp; hxxps://<a target=3D"_blank=
" href=3D"http://kernelci.org/" rel=3D"noopener noreferrer nofollow">kernel=
ci.org/</a></div><div>&gt; * Platform tested: Azure</div><div>&gt; </div><d=
iv>&gt; ---</div><div>&gt; </div><div>&gt; ### Analysis</div><div>&gt; </di=
v><div>&gt; </div><div>&gt; We found an overly permissive SAS token mention=
ed in the GitHub</div><div>&gt; repository for Kernel CI (an upstream Linux=
 Kernel validation project</div><div>&gt; under The Linux Foundation). The =
token allows for write access on the</div><div>&gt; Storage Account, allowi=
ng anyone with the publicly available</div><div>&gt; token+URL to possibly.=
</div><div>&gt; </div><div>&gt; While checking for files on GitHub with pos=
sible SAS tokens having</div><div>&gt; the expiry sometime after 2023 and h=
aving read and write permissions</div><div>&gt; on the storage service (blo=
b, file, queue), we come across the below</div><div>&gt; code snippet</div>=
<div>&gt; </div><div>&gt; ```</div><div>&gt; hxxps://<a target=3D"_blank" h=
ref=3D"http://github.com/kernelci/kernelci" rel=3D"noopener noreferrer nofo=
llow">github.com/kernelci/kernelci</a>-</div><div>&gt; project/blob/104f95d=
1909fcccd7389f4a42ffa11a4d8d30cc8/<a target=3D"_blank" href=3D"http://kerne=
lci.org/co" rel=3D"noopener noreferrer nofollow">kernelci.org/co</a></div><=
div>&gt; ntent/en/docs/admin/<a target=3D"_blank" href=3D"http://api.md?pla=
in=3D1#L91" rel=3D"noopener noreferrer nofollow">api.md?plain=3D1#L91</a></=
div><div>&gt; ```</div><div>&gt; </div><div>&gt; The over-permissive SAS to=
ken is: "sv=3D2022-11-</div><div>&gt; 02&amp;ss=3Dbfq&amp;srt=3Dsco&amp;sp=
=3Drwdlacpitfx&amp;se=3D2023-12-03T00:00:00Z&amp;st=3D2023-09-</div><div>&g=
t; 04T00:00:00Z&amp;spr=3Dhttps&amp;sig=3Dg1lP2bLomBFr81hNnxi%2Bdi%2F8rvLI0=
aOZgzIgiZ</div><div>&gt; NDnIg%3D"</div><div>&gt; </div><div>&gt; ```</div>=
<div>&gt; - The SAS token expires on `2023-12-03`</div><div>&gt; - The perm=
issions `rwdlacpitfx` are over-permissive (Read, Write,</div><div>&gt; Dele=
te, List, Add, Create, Process, Immutability, Tag, Filter, Delete</div><div=
>&gt; Version)</div><div>&gt; - The storage types accessible are blob, file=
, queue</div><div>&gt; ```</div><div>&gt; </div><div>&gt; Using Azure Stora=
ge Explorer, we could read write and list the</div><div>&gt; contents of al=
l the storage types in the Storage Account.</div><div>&gt; </div><div>&gt; =
</div><div>&gt; An attacker could modify any file on the File Share of the =
Storage</div><div>&gt; Account and possibly impact users of Kernel CI. The =
expectation is to</div><div>&gt; see that the SAS token allows for read, wr=
ite and delete operations</div><div>&gt; (based on the documentation at</di=
v><div>&gt; <a target=3D"_blank" href=3D"https://github.com/kernelci/kernel=
ci-api/blob/b7a0f8f19fdba8f9649b282bd2d6fef874820efc/doc/early-access.md?pl=
ain=3D1#L149" rel=3D"noopener noreferrer nofollow">https://github.com/kerne=
lci/kernelci-api/blob/b7a0f8f19fdba8f9649b282bd2d6fef874820efc/doc/early-ac=
cess.md?plain=3D1#L149</a></div><div>&gt; ). However, any user with the SAS=
 token and File Share URL could</div><div>&gt; control files on the File Sh=
are of the Storage Account.</div><div>&gt; </div><div>&gt; </div><div>&gt; =
-- CREDIT ---------------------------------------</div><div>&gt; This vulne=
rability was discovered by:</div><div>&gt; Nitesh Surana (@_niteshsurana) o=
f Trend Micro</div><div>&gt; </div><div>&gt; -- FURTHER DETAILS -----------=
-------------------</div><div>&gt; </div><div>&gt; Supporting files:</div><=
div>&gt; </div><div>&gt; </div><div>&gt; If supporting files were contained=
 with this report they are provided</div><div>&gt; within a password protec=
ted ZIP file. The password is the ZDI</div><div>&gt; candidate number in th=
e form: ZDI-CAN-XXXX where XXXX is the ID</div><div>&gt; number.</div><div>=
&gt; </div><div>&gt; Please confirm receipt of this report. We expect all v=
endors to</div><div>&gt; remediate ZDI vulnerabilities within 120 days of t=
he reported date.</div><div>&gt; If you are ready to release a patch at any=
 point leading up to the</div><div>&gt; deadline, please coordinate with us=
 so that we may release our</div><div>&gt; advisory detailing the issue. If=
 the 120-day deadline is reached and</div><div>&gt; no patch has been made =
available we will release a limited public</div><div>&gt; advisory with our=
 own mitigations, so that the public can protect</div><div>&gt; themselves =
in the absence of a patch. Please keep us updated</div><div>&gt; regarding =
the status of this issue and feel free to contact us at any</div><div>&gt; =
time:</div><div>&gt; </div><div>&gt; Zero Day Initiative</div><div>&gt; <a =
target=3D"_blank" href=3D"mailto:zdi-disclosures@trendmicro.com" rel=3D"noo=
pener noreferrer nofollow">zdi-disclosures@trendmicro.com</a></div><div>&gt=
; </div><div>&gt; The PGP key used for all ZDI vendor communications is ava=
ilable from:</div><div>&gt; </div><div>&gt; &nbsp; <a target=3D"_blank" hre=
f=3D"http://www.zerodayinitiative.com/documents/disclosures-pgp-key.asc" re=
l=3D"noopener noreferrer nofollow">http://www.zerodayinitiative.com/documen=
ts/disclosures-pgp-key.asc</a></div><div>&gt; </div><div>&gt; -- INFORMATIO=
N ABOUT THE ZDI --------------------</div><div>&gt; Established by TippingP=
oint and acquired by Trend Micro, the Zero Day</div><div>&gt; Initiative (Z=
DI) neither re-sells vulnerability details nor exploit</div><div>&gt; code.=
 Instead, upon notifying the affected product vendor, the ZDI</div><div>&gt=
; provides its Trend Micro TippingPoint customers with zero day</div><div>&=
gt; protection through its intrusion prevention technology. Explicit</div><=
div>&gt; details regarding the specifics of the vulnerability are not expos=
ed</div><div>&gt; to any parties until an official vendor patch is publicly=
 available.</div><div>&gt; </div><div>&gt; Please contact us for further de=
tails or refer to:</div><div>&gt; </div><div>&gt; &nbsp; <a target=3D"_blan=
k" href=3D"http://www.zerodayinitiative.com" rel=3D"noopener noreferrer nof=
ollow">http://www.zerodayinitiative.com</a></div><div>&gt; </div><div>&gt; =
-- DISCLOSURE POLICY ----------------------------</div><div>&gt; </div><div=
>&gt; Our vulnerability disclosure policy is available online at:</div><div=
>&gt; </div><div>&gt; &nbsp; <a target=3D"_blank" href=3D"http://www.zeroda=
yinitiative.com/advisories/disclosure_policy/" rel=3D"noopener noreferrer n=
ofollow">http://www.zerodayinitiative.com/advisories/disclosure_policy/</a>=
</div><div>&gt; </div><div>&gt; TREND MICRO EMAIL NOTICE</div><div>&gt; </d=
iv><div>&gt; The information contained in this email and any attachments is=
</div><div>&gt; confidential and may be subject to copyright or other intel=
lectual</div><div>&gt; property protection. If you are not the intended rec=
ipient, you are</div><div>&gt; not authorized to use or disclose this infor=
mation, and we request</div><div>&gt; that you notify us by reply mail or t=
elephone and delete the original</div><div>&gt; message from your mail syst=
em.</div><div>&gt; </div><div>&gt; For details about what personal informat=
ion we collect and why,</div><div>&gt; please see our Privacy Notice on our=
 website at: Read privacy</div><div>&gt; policy&lt;<a target=3D"_blank" hre=
f=3D"http://www.trendmicro.com/privacy" rel=3D"noopener noreferrer nofollow=
">http://www.trendmicro.com/privacy</a>&gt;</div><div>&gt;</div></div>
<div><p style=3D"margin-top:20px;margin-bottom:10px;"><strong>How can I tra=
ck and update my request?</strong></p><p style=3D"margin-top:0;margin-botto=
m:10px;">To respond, reply to this email. You may also create a new email a=
nd include the request number (INC2757115) in the subject.</p></div>
<p style=3D"margin-top: 14px; margin-bottom: 0;">Thank you,<br>Product Secu=
rity</p><div>&nbsp;</div><div style=3D"display:inline">Ref:MSG80461454</div=
></body></html>
------=_Part_32354_22740156.1697195037302--

------=_Part_32353_3771767.1697195037302--
