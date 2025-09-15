Received: from a27-66.smtp-out.us-west-2.amazonses.com (a27-66.smtp-out.us-west-2.amazonses.com [54.240.27.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB5D1EA7C9
	for <kernelci@lists.linux.dev>; Mon, 15 Sep 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757949933; cv=none; b=JKrg8OVHH/YL8QDFxEXrLMDHNw6miUwM1F6tmpudAXHKB+1B2x1XB7AiB2pggpFRlD5M1nQ1ChZAqiYMitDk69LL11eZlWgOy4x5HB48h5lduvaKSFTRepfQEEYGiYxuZr7WLMjhI8k52u2mR8aIOFla5AReYqGNcNpzLVWBH+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757949933; c=relaxed/simple;
	bh=PWtv+eSt5w5hRklLNMxzACWiyeYxBGTJCqshyxa9QnA=;
	h=To:Subject:Message-ID:From:Date:Mime-Version:Content-Type; b=EiklYI5e02XqJyu6ZhgYZFF+1cjJug9HbsxPV/FTNOYBx6TPwGOhHqGk2DAGTq0H1xv3O+irYU0X+hiu/tnoa/u9tngitKMRNkXWhRiWiCdFHpM4lnOnfQlKZyiS0jaHsJZsfL0TOLREs0tQLxHEBvwbOtu9owraf5COtNm6Qoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lfx.dev; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (2048-bit key) header.d=lfx.dev header.i=@lfx.dev header.b=lFvqhPCJ; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=alxqZcsX; arc=none smtp.client-ip=54.240.27.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lfx.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lfx.dev header.i=@lfx.dev header.b="lFvqhPCJ";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="alxqZcsX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=pp2uh5dccwerhoiltpmvlpyy4uxdnm63; d=lfx.dev; t=1757949931;
	h=To:Subject:Message-Id:From:Date:Mime-Version:Content-Type;
	bh=PWtv+eSt5w5hRklLNMxzACWiyeYxBGTJCqshyxa9QnA=;
	b=lFvqhPCJlt6bmfvDnKS5Rcka2ykJG//iPHBhaIxtmBAZjpcNpGKbqOYdTr3tKxPr
	IFrivemUTz3S2db9dNKSR5tdCg6tg1F5Su1+mE2IP+N8R4OG/o2DIAWXLI05bGUNKtv
	Zex9GWizMtl/bwy5Bxwwu6Mco2WQ1nNWMIzSiDkrGwKmoDFuJLTyeAJ78QxlyDyCMHW
	HfJxK8wxkecqwbZQ3eRT/ZjqAYed+bFPwbrplsBBduVDZJpwqqi80QE79XCoC6HTw32
	BX463K7XYS30KILOwEgH+1i+WrUxLA4qlivJCjUQvQDBgigt9OAT7EPGQktvMy2LR45
	QpMxO05L1Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757949931;
	h=To:Subject:Message-Id:From:Date:Mime-Version:Content-Type:Feedback-ID;
	bh=PWtv+eSt5w5hRklLNMxzACWiyeYxBGTJCqshyxa9QnA=;
	b=alxqZcsXHpFSL1rU9U1b8B/o86nif8rcAdtfOh2oC+NhYWjGsz/a8F+vh5HxFTNi
	iczZpiGcojeKOMzYdHQGP6h4jr67FZ7YaoA7nwC/wR512op3hL989VPNjSrtiGc+VK8
	6wLolFv/hHYYjObtsqDjbSHaL3yQ7unHF/rDm8+w=
To: kernelci@lists.linux.dev
Subject: Invitation: KernelCI Labs - deep dive section
Message-ID: <010101994dfb2de6-404dd669-4930-4eec-a502-7f5140f72c1f-000000@us-west-2.amazonses.com>
From: kernelCI Initiative Fund - Meetings <meetings@lfx.dev>
Date: Mon, 15 Sep 2025 15:25:30 +0000
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary=3dadc5c631938251c5240ec42c1d95ec35d4f743090251d26608ad64021b
Feedback-ID: ::1.us-west-2.38rwtV0514CR+dj3ljxDerAe+nCn9watSKvSUQn1rXA=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.66

--3dadc5c631938251c5240ec42c1d95ec35d4f743090251d26608ad64021b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html>
    <head>
        <style>
        .join-meeting-btn {
            background: #0099CC 0% 0% no-repeat padding-box;
            border: 1px solid #0099CC;
            border-radius: 30px;
            opacity: 1;
        }
        .join-meeting-text {
            text-align: left;
            font: normal normal 600 14px/19px Open Sans;
            letter-spacing: 0px;
            color: white;
            text-decoration: none;
            text-transform: capitalize;
            opacity: 1;
        }
        .tight-spacing {
            letter-spacing: 0px;
            line-height: 10px;
            padding-bottom: 3px;
        }
        </style>
    </head>
    <body>
        <div>
           =20
                <p>Hello kernelci lists.linux.dev,</p>
                <p>You have been invited to a meeting for kernelCI Initiati=
ve Fund</p>
           =20
            <div>
                <h2>KernelCI Labs - deep dive section</h2>
                <div>
                    <p>When: Wednesday, September 17th, 18:30 America/Los_A=
ngeles</p>
                </div>
               =20
                <div>
                    <h3>Meeting Description:</h3>
                    <p>deep dive section to understand some of the Maestro =
internals for lab integration and the possibilities for labgrid integration
See https://lore.kernel.org/kernelci/1993ea3bbde.627334c2425860.78539704272=
32369784@collabora.com/T/#m17c07e8d790e12fc4874f79b03bb84ed9bc4f470
Notes at: https://docs.google.com/document/d/1aoNpi69WRhn1nENbdAY1CPXYVkufb=
VnG_lFoGfA0aM4/edit?pli=3D1</p>
                </div>
               =20
            </div>
        </div>
        <div>
            <h3>Ways to join meeting:</h3>
            <div>
                <div>
                    <div>
                        <h2>1. Join from PC, Mac, iPad, or Android</h2>
                        <button class=3D"join-meeting-btn"><a class=3D"join=
-meeting-text" style=3D"color: white;" href=3D"https://zoom-lfx.platform.li=
nuxfoundation.org/meeting/99980824166?password=3D2bce4530-30e1-4e5f-8eb2-7d=
4f57e369c3">Join Meeting</a></button>
                        <p>If the button above does not work, paste this in=
to your browser: <a href=3D"https://zoom-lfx.platform.linuxfoundation.org/m=
eeting/99980824166?password=3D2bce4530-30e1-4e5f-8eb2-7d4f57e369c3">https:/=
/zoom-lfx.platform.linuxfoundation.org/meeting/99980824166?password=3D2bce4=
530-30e1-4e5f-8eb2-7d4f57e369c3</a></p>
                    </div>
                </div>
                <div>
                    <h2>2. Join via audio</h2>
                    <div class=3D"tight-spacing">
                        <p><b>One tap mobile:</b></p>
                        <p><b>US:</b> <a href=3D"tel:+12532158782,,99980824=
166%23,,,,*620797%23">+12532158782,,99980824166#,,,,*620797#</a> or <a href=
=3D"tel:+13462487799,,99980824166%23,,,,*620797%23">+13462487799,,999808241=
66#,,,,*620797#</a></p>
                    </div>
                    <div class=3D"tight-spacing">
                        <p><b>Or dial: </b></p>
                        <p><b>US:</b> +1 253 215 8782 or +1 346 248 7799 or=
 +1 669 900 6833 or +1 301 715 8592 or +1 312 626 6799 or +1 646 374 8656 o=
r 877 369 0926 (Toll Free) or 855 880 1246 (Toll Free)</p>
                        <p><b>Canada:</b> +1 647 374 4685 or +1 647 558 058=
8 or +1 778 907 2071 or +1 204 272 7920 or +1 438 809 7799 or +1 587 328 10=
99 or 855 703 8985 (Toll Free)</p>
                    </div>
                    <p>Meeting ID: 99980824166</p>
                   =20
                    <p>Meeting Passcode: 620797</p>
                   =20
                    <a href=3D'https://zoom.us/u/alwnPIaVT'>International n=
umbers</a>
                </div>
            </div>
        </div>
    </body>
</html>

--3dadc5c631938251c5240ec42c1d95ec35d4f743090251d26608ad64021b
Content-Disposition: attachment;
 filename="invite.ics"
Content-Id: <invite.ics>
Content-Transfer-Encoding: base64
Content-Type: text/calendar; method=REQUEST

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6UkVRVUVTVA0KUFJPRElEOi0vL0xpbnV4IEZvdW5kYXRp
b24vL01lZXRpbmcgTWFuYWdlbWVudA0KVkVSU0lPTjoyLjANCkJFR0lOOlZUSU1FWk9ORQpUWklE
OkFtZXJpY2EvTG9zX0FuZ2VsZXMKTEFTVC1NT0RJRklFRDoyMDIyMTAyOVQwMjEwMjlaClRaVVJM
Omh0dHA6Ly90enVybC5vcmcvem9uZWluZm8vQW1lcmljYS9Mb3NfQW5nZWxlcwpYLUxJQy1MT0NB
VElPTjpBbWVyaWNhL0xvc19BbmdlbGVzClgtUFJPTEVQVElDLVRaTkFNRTpMTVQKQkVHSU46U1RB
TkRBUkQKVFpOQU1FOlBTVApUWk9GRlNFVEZST006LTA3NTI1OApUWk9GRlNFVFRPOi0wODAwCkRU
U1RBUlQ6MTg4MzExMThUMTIwNzAyCkVORDpTVEFOREFSRApCRUdJTjpEQVlMSUdIVApUWk5BTUU6
UERUClRaT0ZGU0VURlJPTTotMDgwMApUWk9GRlNFVFRPOi0wNzAwCkRUU1RBUlQ6MTkxODAzMzFU
MDIwMDAwClJSVUxFOkZSRVE9WUVBUkxZO0JZTU9OVEg9MztCWURBWT0tMVNVO1VOVElMPTE5MTkw
MzMwVDEwMDAwMFoKRU5EOkRBWUxJR0hUCkJFR0lOOlNUQU5EQVJEClRaTkFNRTpQU1QKVFpPRkZT
RVRGUk9NOi0wNzAwClRaT0ZGU0VUVE86LTA4MDAKRFRTVEFSVDoxOTE4MTAyN1QwMjAwMDAKUlJV
TEU6RlJFUT1ZRUFSTFk7QllNT05USD0xMDtCWURBWT0tMVNVO1VOVElMPTE5MTkxMDI2VDA5MDAw
MFoKRU5EOlNUQU5EQVJECkJFR0lOOkRBWUxJR0hUClRaTkFNRTpQV1QKVFpPRkZTRVRGUk9NOi0w
ODAwClRaT0ZGU0VUVE86LTA3MDAKRFRTVEFSVDoxOTQyMDIwOVQwMjAwMDAKRU5EOkRBWUxJR0hU
CkJFR0lOOkRBWUxJR0hUClRaTkFNRTpQUFQKVFpPRkZTRVRGUk9NOi0wNzAwClRaT0ZGU0VUVE86
LTA3MDAKRFRTVEFSVDoxOTQ1MDgxNFQxNjAwMDAKRU5EOkRBWUxJR0hUCkJFR0lOOlNUQU5EQVJE
ClRaTkFNRTpQU1QKVFpPRkZTRVRGUk9NOi0wNzAwClRaT0ZGU0VUVE86LTA4MDAKRFRTVEFSVDox
OTQ1MDkzMFQwMjAwMDAKUkRBVEU6MTk0OTAxMDFUMDIwMDAwCkVORDpTVEFOREFSRApCRUdJTjpE
QVlMSUdIVApUWk5BTUU6UERUClRaT0ZGU0VURlJPTTotMDgwMApUWk9GRlNFVFRPOi0wNzAwCkRU
U1RBUlQ6MTk0ODAzMTRUMDIwMTAwClJEQVRFOjE5NzQwMTA2VDAyMDAwMApSREFURToxOTc1MDIy
M1QwMjAwMDAKRU5EOkRBWUxJR0hUCkJFR0lOOkRBWUxJR0hUClRaTkFNRTpQRFQKVFpPRkZTRVRG
Uk9NOi0wODAwClRaT0ZGU0VUVE86LTA3MDAKRFRTVEFSVDoxOTUwMDQzMFQwMTAwMDAKUlJVTEU6
RlJFUT1ZRUFSTFk7QllNT05USD00O0JZREFZPS0xU1U7VU5USUw9MTk2NjA0MjRUMDkwMDAwWgpF
TkQ6REFZTElHSFQKQkVHSU46U1RBTkRBUkQKVFpOQU1FOlBTVApUWk9GRlNFVEZST006LTA3MDAK
VFpPRkZTRVRUTzotMDgwMApEVFNUQVJUOjE5NTAwOTI0VDAyMDAwMApSUlVMRTpGUkVRPVlFQVJM
WTtCWU1PTlRIPTk7QllEQVk9LTFTVTtVTlRJTD0xOTYxMDkyNFQwOTAwMDBaCkVORDpTVEFOREFS
RApCRUdJTjpTVEFOREFSRApUWk5BTUU6UFNUClRaT0ZGU0VURlJPTTotMDcwMApUWk9GRlNFVFRP
Oi0wODAwCkRUU1RBUlQ6MTk2MjEwMjhUMDIwMDAwClJSVUxFOkZSRVE9WUVBUkxZO0JZTU9OVEg9
MTA7QllEQVk9LTFTVTtVTlRJTD0yMDA2MTAyOVQwOTAwMDBaCkVORDpTVEFOREFSRApCRUdJTjpE
QVlMSUdIVApUWk5BTUU6UERUClRaT0ZGU0VURlJPTTotMDgwMApUWk9GRlNFVFRPOi0wNzAwCkRU
U1RBUlQ6MTk2NzA0MzBUMDIwMDAwClJSVUxFOkZSRVE9WUVBUkxZO0JZTU9OVEg9NDtCWURBWT0t
MVNVO1VOVElMPTE5NzMwNDI5VDEwMDAwMFoKRU5EOkRBWUxJR0hUCkJFR0lOOkRBWUxJR0hUClRa
TkFNRTpQRFQKVFpPRkZTRVRGUk9NOi0wODAwClRaT0ZGU0VUVE86LTA3MDAKRFRTVEFSVDoxOTc2
MDQyNVQwMjAwMDAKUlJVTEU6RlJFUT1ZRUFSTFk7QllNT05USD00O0JZREFZPS0xU1U7VU5USUw9
MTk4NjA0MjdUMTAwMDAwWgpFTkQ6REFZTElHSFQKQkVHSU46REFZTElHSFQKVFpOQU1FOlBEVApU
Wk9GRlNFVEZST006LTA4MDAKVFpPRkZTRVRUTzotMDcwMApEVFNUQVJUOjE5ODcwNDA1VDAyMDAw
MApSUlVMRTpGUkVRPVlFQVJMWTtCWU1PTlRIPTQ7QllEQVk9MVNVO1VOVElMPTIwMDYwNDAyVDEw
MDAwMFoKRU5EOkRBWUxJR0hUCkJFR0lOOkRBWUxJR0hUClRaTkFNRTpQRFQKVFpPRkZTRVRGUk9N
Oi0wODAwClRaT0ZGU0VUVE86LTA3MDAKRFRTVEFSVDoyMDA3MDMxMVQwMjAwMDAKUlJVTEU6RlJF
UT1ZRUFSTFk7QllNT05USD0zO0JZREFZPTJTVQpFTkQ6REFZTElHSFQKQkVHSU46U1RBTkRBUkQK
VFpOQU1FOlBTVApUWk9GRlNFVEZST006LTA3MDAKVFpPRkZTRVRUTzotMDgwMApEVFNUQVJUOjIw
MDcxMTA0VDAyMDAwMApSUlVMRTpGUkVRPVlFQVJMWTtCWU1PTlRIPTExO0JZREFZPTFTVQpFTkQ6
U1RBTkRBUkQKRU5EOlZUSU1FWk9ORQpCRUdJTjpWRVZFTlQNCkFUVEVOREVFO1ZBTFVFPVRFWFQ6
a2VybmVsY2lAbGlzdHMubGludXguZGV2DQpDUkVBVEVEO1RaSUQ9QW1lcmljYS9Mb3NfQW5nZWxl
czoyMDI1MDkxNVQwODI1MzANCkRFU0NSSVBUSU9OOlxuWW91IGhhdmUgYmVlbiBpbnZpdGVkIHRv
IGEgbWVldGluZyBmb3Iga2VybmVsQ0kgSW5pdGlhdGl2ZSBGdW5kXG5cbmRlZXAgZGl2ZSBzZWN0
aW9uIHRvIHVuZGVyc3RhbmQgc29tZSBvZiB0aGUgTWFlc3RybyBpbnRlcm5hbHMgZm9yIGxhYiBp
bnRlZ3JhdGlvbiBhbmQgdGhlIHBvc3NpYmlsaXRpZXMgZm9yIGxhYmdyaWQgaW50ZWdyYXRpb25c
blNlZSBodHRwczovL2xvcmUua2VybmVsLm9yZy9rZXJuZWxjaS8xOTkzZWEzYmJkZS42MjczMzRj
MjQyNTg2MC43ODUzOTcwNDI3MjMyMzY5Nzg0QGNvbGxhYm9yYS5jb20vVC8jbTE3YzA3ZThkNzkw
ZTEyZmM0ODc0Zjc5YjAzYmI4NGVkOWJjNGY0NzBcbk5vdGVzIGF0OiBodHRwczovL2RvY3MuZ29v
Z2xlLmNvbS9kb2N1bWVudC9kLzFhb05waTY5V1JobjFuRU5iZEFZMUNQWFlWa3VmYlZuR19sRm9H
ZkEwYU00L2VkaXQ/cGxpPTFcblxuV2F5cyB0byBqb2luIG1lZXRpbmc6XG5cbjEuIEpvaW4gZnJv
bSBQQ1wsIE1hY1wsIGlQYWRcLCBvciBBbmRyb2lkXG5cbmh0dHBzOi8vem9vbS1sZngucGxhdGZv
cm0ubGludXhmb3VuZGF0aW9uLm9yZy9tZWV0aW5nLzk5OTgwODI0MTY2P3Bhc3N3b3JkPTJiY2U0
NTMwLTMwZTEtNGU1Zi04ZWIyLTdkNGY1N2UzNjljM1xuXG4yLiBKb2luIHZpYSBhdWRpb1xuXG5P
bmUgdGFwIG1vYmlsZTpcblVTIChpT1MpOiArMTI1MzIxNTg3ODJcLFwsOTk5ODA4MjQxNjYjXCxc
LFwsXCwqNjIwNzk3IyBvciArMTM0NjI0ODc3OTlcLFwsOTk5ODA4MjQxNjYjXCxcLFwsXCwqNjIw
Nzk3I1xuVVMgKEFuZHJvaWQpOiArMTI1MzIxNTg3ODJcOzk5OTgwODI0MTY2I1w7NjIwNzk3IyBv
ciArMTM0NjI0ODc3OTlcOzk5OTgwODI0MTY2I1w7NjIwNzk3I1xuXG5PciBkaWFsOlxuVVM6ICsx
IDI1MyAyMTUgODc4MiBvciArMSAzNDYgMjQ4IDc3OTkgb3IgKzEgNjY5IDkwMCA2ODMzIG9yICsx
IDMwMSA3MTUgODU5MiBvciArMSAzMTIgNjI2IDY3OTkgb3IgKzEgNjQ2IDM3NCA4NjU2IG9yIDg3
NyAzNjkgMDkyNiAoVG9sbCBGcmVlKSBvciA4NTUgODgwIDEyNDYgKFRvbGwgRnJlZSlcbkNhbmFk
YTogKzEgNjQ3IDM3NCA0Njg1IG9yICsxIDY0NyA1NTggMDU4OCBvciArMSA3NzggOTA3IDIwNzEg
b3IgKzEgMjA0IDI3MiA3OTIwIG9yICsxIDQzOCA4MDkgNzc5OSBvciArMSA1ODcgMzI4IDEwOTkg
b3IgODU1IDcwMyA4OTg1IChUb2xsIEZyZWUpXG5cbk1lZXRpbmcgSUQ6IDk5OTgwODI0MTY2XG5c
bk1lZXRpbmcgUGFzc2NvZGU6IDYyMDc5N1xuXG5cbkludGVybmF0aW9uYWwgbnVtYmVyczogaHR0
cHM6Ly96b29tLnVzL3UvYWx3blBJYVZUXG4NCkRURU5EO1RaSUQ9QW1lcmljYS9Mb3NfQW5nZWxl
czoyMDI1MDkxN1QyMDAwMDANCkRUU1RBTVA7VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVzOjIwMjUw
OTE1VDA4MjUzMA0KRFRTVEFSVDtUWklEPUFtZXJpY2EvTG9zX0FuZ2VsZXM6MjAyNTA5MTdUMTgz
MDAwDQpMQVNULU1PRElGSUVEO1RaSUQ9QW1lcmljYS9Mb3NfQW5nZWxlczoyMDI1MDkxNVQwODI1
MzANCkxPQ0FUSU9OOmh0dHBzOi8vem9vbS1sZngucGxhdGZvcm0ubGludXhmb3VuZGF0aW9uLm9y
Zy9tZWV0aW5nLzk5OTgwODI0MTY2P3Bhc3N3b3JkPTJiY2U0NTMwLTMwZTEtNGU1Zi04ZWIyLTdk
NGY1N2UzNjljMw0KT1JHQU5JWkVSO0NOPWtlcm5lbENJIEluaXRpYXRpdmUgRnVuZDpNQUlMVE86
bWVldGluZ3NAbGZ4LmRldg0KU1VNTUFSWTpLZXJuZWxDSSBMYWJzIC0gZGVlcCBkaXZlIHNlY3Rp
b24NClRaSUQ6QW1lcmljYS9Mb3NfQW5nZWxlcw0KVFpOQU1FOkFtZXJpY2EvTG9zX0FuZ2VsZXMN
ClVJRDo5OTk4MDgyNDE2Ng0KVVJMO1ZBTFVFPVRFWFQ6aHR0cHM6Ly96b29tLWxmeC5wbGF0Zm9y
bS5saW51eGZvdW5kYXRpb24ub3JnL21lZXRpbmcvOTk5ODA4MjQxNjY/cGFzc3dvcmQ9MmJjZTQ1
MzAtMzBlMS00ZTVmLThlYjItN2Q0ZjU3ZTM2OWMzDQpYLU1FRVRJTkctSUQ6OTk5ODA4MjQxNjYN
ClgtT0NDVVJSRU5DRS1JRDoNClgtUkVHSVNUUkFOVC1JRDo1MDU4OWJmZS1hNDJkLTRiZTYtODYw
OS02ZGNhODg1YzhlNWYNCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==

--3dadc5c631938251c5240ec42c1d95ec35d4f743090251d26608ad64021b--
