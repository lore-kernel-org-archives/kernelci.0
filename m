Received: from a27-59.smtp-out.us-west-2.amazonses.com (a27-59.smtp-out.us-west-2.amazonses.com [54.240.27.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7FF4A2D
	for <kernelci@lists.linux.dev>; Mon,  8 Sep 2025 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757356377; cv=none; b=YIq/b6iXldLX9tSePpOgyiDGqwD1LnIU6pDuzudiYoI69M+YXHv/WqcBkc1ssT8pLMGAMmB7kHxxUf1wtIeGyNPPZ2YduegNfbhPnfuC6IUtI244tjinHVHDZ+/6yFJGvqs2M9CZkpqYHeyQVbJR423pvSZDvg2NQ2obyTnUVP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757356377; c=relaxed/simple;
	bh=iTm67Vf7F1+7BJoModd8kNO6VGkUVYLOUbngy3444PU=;
	h=Message-ID:From:Date:Mime-Version:Content-Type:To:Subject; b=JY29M54w+MS9yYqbafPBfQ+xPPGlIyXQvnSBtX3U+Z9llL9CK/CCV3BBCS8AB3Me2zju2u9EdBKHYtyHnHj1CVsZkfmt8WnpJXRpFkXdKnhLwotbTbALpOsegEcxf+H2NkVx4U1ndUPvTn47FXMDyR1KWrXj4hkcWQYz6Mx/BhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lfx.dev; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (2048-bit key) header.d=lfx.dev header.i=@lfx.dev header.b=nluqjxn1; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=UNwwP9CB; arc=none smtp.client-ip=54.240.27.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lfx.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lfx.dev header.i=@lfx.dev header.b="nluqjxn1";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="UNwwP9CB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=pp2uh5dccwerhoiltpmvlpyy4uxdnm63; d=lfx.dev; t=1757356375;
	h=Message-Id:From:Date:Mime-Version:Content-Type:To:Subject;
	bh=iTm67Vf7F1+7BJoModd8kNO6VGkUVYLOUbngy3444PU=;
	b=nluqjxn1NwWWPXsHV0cBTDRCaayuJnLUsg4Z8oFc/+QM5H+hqUJyj8cH9DcXAWva
	ihFD/H0CSkeajzWf49kv3V0brxEN8Rv9j0hb89gQjHS4/b9a/fKqGgcE4ZbFWNQ+ofi
	RidHk/q3K40P0L4xLawaooiS9QYcLDwBIVPbRodBJNyo+Lhsv9WoZjY7QrD4nMazUVc
	zU2Q/7xh5FD9SOSzXZGVixR91QAGxwgHPFXJGIJBRLWw1T8/qH2Y6pUzmSY8zluqhGT
	NbgCfB8lKdJTSZwOWGRMZP4TBSoD0h9Jq1w4g82a420Rnw0Bg3vwj3UNh4Imkg9njWd
	DAZFWJbraA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757356375;
	h=Message-Id:From:Date:Mime-Version:Content-Type:To:Subject:Feedback-ID;
	bh=iTm67Vf7F1+7BJoModd8kNO6VGkUVYLOUbngy3444PU=;
	b=UNwwP9CBNtYT2/rubioF3378wMlA2wJy8o0wIQU89nLGNQnCGlIgoKauLW49UCxp
	6F7U8viG42c5vO5LiCusNF0VhK/SuA9FYkLS2m/aHOvxECDQhYuyGvUmld1HrGbSzks
	xLoR+Gilw4FV+L9+TiqcM2PRpCbsyoy+LzD+nGSI=
Message-ID: <010101992a9a3b51-fdf26386-9ac2-4716-9e5c-12cf21bd1800-000000@us-west-2.amazonses.com>
From: kernelCI Initiative Fund - Meetings <meetings@lfx.dev>
Date: Mon, 8 Sep 2025 18:32:54 +0000
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary=492f17e34bd24c892226400e6ab2aed655bc0735a7f27b9323034dd10f6b
To: kernelci@lists.linux.dev
Subject: Invitation: KernelCI Labs WG - Bi-weekly meeting
Feedback-ID: ::1.us-west-2.38rwtV0514CR+dj3ljxDerAe+nCn9watSKvSUQn1rXA=:AmazonSES
X-SES-Outgoing: 2025.09.08-54.240.27.59

--492f17e34bd24c892226400e6ab2aed655bc0735a7f27b9323034dd10f6b
Content-Type: multipart/alternative;
 boundary=8b362972c3017cb38a2e3762646aab96f52ed7ae95fe34af85a9a75b27e9

--8b362972c3017cb38a2e3762646aab96f52ed7ae95fe34af85a9a75b27e9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8


Hello kernelci lists.linux.dev,

You have been invited to a recurring meeting for kernelCI Initiative Fund


Meeting: KernelCI Labs WG - Bi-weekly meeting
Next Meeting: Thursday, September 11th, 7:30



Repeats: Every 2 weeks on Thursdays at 7:30 America/Los_Angeles





Meeting Description:

Meeting notes: https://docs.google.com/document/d/1aoNpi69WRhn1nENbdAY1CPXY=
VkufbVnG_lFoGfA0aM4/edit?pli=3D1
## Working Group Scope
The Labs WG will focus on improving how KernelCI integrates with and manage=
s
hardware testing laboratories. Currently, we support only LAVA, but there's=
 growing
interest in expanding backend support and addressing various infrastructure=
 challenges.
## Key Areas of Focus
- Labgrid Integration: Design and implement labgrid backend support alongsi=
de existing
LAVA integration
- CI Ecosystem Labs: Better support for vendor labs (TI, Qualcomm, etc.) th=
rough improved
events API and shared rootfs images.
- Alternative Backends: Explore integration with other lab management syste=
ms like Tuxtest
for virtualized testing
- Lab Health Dashboard: Develop tools to monitor lab status and infrastruct=
ure issues
- Failure Classification: Improve detection and reporting of infrastructure=
 failures vs. actual
test failures
- Lab Admin Guidelines: Create standards for lab administrators on device t=
ype differentiation
and configuration facilitating accessing the same hardware across multiple =
labs.
- Job Prioritization: Implement smarter job scheduling
- Dependency Management: Avoid running dependent tests when prerequisites f=
ail (e.g.,
skip NFS-dependent tests if NFS boot fails)
The Labs WG will work closely with the Infrastructure Working Group and Tec=
hnical
Steering Committee to ensure our efforts align with KernelCI's overall arch=
itecture and goals.

Ways to join meeting:

1. Join from PC, Mac, iPad, or Android

https://zoom-lfx.platform.linuxfoundation.org/meeting/91757149717?password=
=3Dbbb24459-313b-4cb1-93ab-6c5e58a54c1d

2. Join via audio

One tap mobile:
US: +12532158782,,91757149717#,,,,*006125# or +13462487799,,91757149717#,,,=
,*006125#

Or dial:
US: +1 253 215 8782 or +1 346 248 7799 or +1 669 900 6833 or +1 301 715 859=
2 or +1 312 626 6799 or +1 646 374 8656 or 877 369 0926 (Toll Free) or 855 =
880 1246 (Toll Free)
Canada: +1 647 374 4685 or +1 647 558 0588 or +1 778 907 2071 or +1 204 272=
 7920 or +1 438 809 7799 or +1 587 328 1099 or 855 703 8985 (Toll Free)

Meeting ID: 91757149717

Meeting Passcode: 006125


International numbers: https://zoom.us/u/alwnPIaVT

--8b362972c3017cb38a2e3762646aab96f52ed7ae95fe34af85a9a75b27e9
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
                <p>You have been invited to a recurring meeting for kernelC=
I Initiative Fund</p>
           =20
            <h2>KernelCI Labs WG - Bi-weekly meeting</h2>
            <div>
                <div class=3D"tight-spacing">
                    <p>Next Meeting: Thursday, September 11th, 7:30 America=
/Los_Angeles</p>
                   =20
                       =20
                       =20
                            <p>Repeats: Every 2 weeks on Thursdays at 7:30 =
America/Los_Angeles</p>
                       =20
                       =20
				=09
                </div>
               =20
                <div>
                    <h3>Meeting Description:</h3>
                    <p>Meeting notes: https://docs.google.com/document/d/1a=
oNpi69WRhn1nENbdAY1CPXYVkufbVnG_lFoGfA0aM4/edit?pli=3D1
## Working Group Scope
The Labs WG will focus on improving how KernelCI integrates with and manage=
s
hardware testing laboratories. Currently, we support only LAVA, but there's=
 growing
interest in expanding backend support and addressing various infrastructure=
 challenges.
## Key Areas of Focus
- Labgrid Integration: Design and implement labgrid backend support alongsi=
de existing
LAVA integration
- CI Ecosystem Labs: Better support for vendor labs (TI, Qualcomm, etc.) th=
rough improved
events API and shared rootfs images.
- Alternative Backends: Explore integration with other lab management syste=
ms like Tuxtest
for virtualized testing
- Lab Health Dashboard: Develop tools to monitor lab status and infrastruct=
ure issues
- Failure Classification: Improve detection and reporting of infrastructure=
 failures vs. actual
test failures
- Lab Admin Guidelines: Create standards for lab administrators on device t=
ype differentiation
and configuration facilitating accessing the same hardware across multiple =
labs.
- Job Prioritization: Implement smarter job scheduling
- Dependency Management: Avoid running dependent tests when prerequisites f=
ail (e.g.,
skip NFS-dependent tests if NFS boot fails)
The Labs WG will work closely with the Infrastructure Working Group and Tec=
hnical
Steering Committee to ensure our efforts align with KernelCI's overall arch=
itecture and goals.</p>
                </div>
               =20
            </div>
            <div>
                <h3>Ways to join meeting:</h3>
                <div>
                    <div>
                        <h2>1. Join from PC, Mac, iPad, or Android</h2>
                        <button class=3D"join-meeting-btn"><a class=3D"join=
-meeting-text" style=3D"color: white;" href=3D"https://zoom-lfx.platform.li=
nuxfoundation.org/meeting/91757149717?password=3Dbbb24459-313b-4cb1-93ab-6c=
5e58a54c1d">Join Meeting</a></button>
                        <p>If the button above does not work, paste this in=
to your browser: <a href=3D"https://zoom-lfx.platform.linuxfoundation.org/m=
eeting/91757149717?password=3Dbbb24459-313b-4cb1-93ab-6c5e58a54c1d">https:/=
/zoom-lfx.platform.linuxfoundation.org/meeting/91757149717?password=3Dbbb24=
459-313b-4cb1-93ab-6c5e58a54c1d</a></p>
                    </div>
                    <div>
						<h2>2. Join via audio</h2>
						<div class=3D"tight-spacing">
							<p><b>One tap mobile:</b></p>
							<p><b>US:</b> <a href=3D"tel:+12532158782,,91757149717%23,,,,*006125=
%23">+12532158782,,91757149717#,,,,*006125#</a> or <a href=3D"tel:+13462487=
799,,91757149717%23,,,,*006125%23">+13462487799,,91757149717#,,,,*006125#</=
a></p>
                        </div>
						<div class=3D"tight-spacing">
							<p><b>Or dial: </b></p>
							<p><b>US:</b> +1 253 215 8782 or +1 346 248 7799 or +1 669 900 6833 =
or +1 301 715 8592 or +1 312 626 6799 or +1 646 374 8656 or 877 369 0926 (T=
oll Free) or 855 880 1246 (Toll Free)</p>
							<p><b>Canada:</b> +1 647 374 4685 or +1 647 558 0588 or +1 778 907 2=
071 or +1 204 272 7920 or +1 438 809 7799 or +1 587 328 1099 or 855 703 898=
5 (Toll Free)</p>
						</div>
						<p>Meeting ID: 91757149717</p>
					=09
						<p>Meeting Passcode: 006125</p>
					=09
						<a href=3D'https://zoom.us/u/alwnPIaVT'>International numbers</a>
					</div>
                </div>
            </div>
        </div>
    </body>
</html>

--8b362972c3017cb38a2e3762646aab96f52ed7ae95fe34af85a9a75b27e9--

--492f17e34bd24c892226400e6ab2aed655bc0735a7f27b9323034dd10f6b
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
czoyMDI1MDkwOFQxMTMyNTQNCkRFU0NSSVBUSU9OOlxuWW91IGhhdmUgYmVlbiBpbnZpdGVkIHRv
IGEgcmVjdXJyaW5nIG1lZXRpbmcgZm9yIGtlcm5lbENJIEluaXRpYXRpdmUgRnVuZFxuXG5NZWV0
aW5nIG5vdGVzOiBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzFhb05waTY5V1Jo
bjFuRU5iZEFZMUNQWFlWa3VmYlZuR19sRm9HZkEwYU00L2VkaXQ/cGxpPTFcbiMjIFdvcmtpbmcg
R3JvdXAgU2NvcGVcblRoZSBMYWJzIFdHIHdpbGwgZm9jdXMgb24gaW1wcm92aW5nIGhvdyBLZXJu
ZWxDSSBpbnRlZ3JhdGVzIHdpdGggYW5kIG1hbmFnZXNcbmhhcmR3YXJlIHRlc3RpbmcgbGFib3Jh
dG9yaWVzLiBDdXJyZW50bHlcLCB3ZSBzdXBwb3J0IG9ubHkgTEFWQVwsIGJ1dCB0aGVyZSdzIGdy
b3dpbmdcbmludGVyZXN0IGluIGV4cGFuZGluZyBiYWNrZW5kIHN1cHBvcnQgYW5kIGFkZHJlc3Np
bmcgdmFyaW91cyBpbmZyYXN0cnVjdHVyZSBjaGFsbGVuZ2VzLlxuIyMgS2V5IEFyZWFzIG9mIEZv
Y3VzXG4tIExhYmdyaWQgSW50ZWdyYXRpb246IERlc2lnbiBhbmQgaW1wbGVtZW50IGxhYmdyaWQg
YmFja2VuZCBzdXBwb3J0IGFsb25nc2lkZSBleGlzdGluZ1xuTEFWQSBpbnRlZ3JhdGlvblxuLSBD
SSBFY29zeXN0ZW0gTGFiczogQmV0dGVyIHN1cHBvcnQgZm9yIHZlbmRvciBsYWJzIChUSVwsIFF1
YWxjb21tXCwgZXRjLikgdGhyb3VnaCBpbXByb3ZlZFxuZXZlbnRzIEFQSSBhbmQgc2hhcmVkIHJv
b3RmcyBpbWFnZXMuXG4tIEFsdGVybmF0aXZlIEJhY2tlbmRzOiBFeHBsb3JlIGludGVncmF0aW9u
IHdpdGggb3RoZXIgbGFiIG1hbmFnZW1lbnQgc3lzdGVtcyBsaWtlIFR1eHRlc3RcbmZvciB2aXJ0
dWFsaXplZCB0ZXN0aW5nXG4tIExhYiBIZWFsdGggRGFzaGJvYXJkOiBEZXZlbG9wIHRvb2xzIHRv
IG1vbml0b3IgbGFiIHN0YXR1cyBhbmQgaW5mcmFzdHJ1Y3R1cmUgaXNzdWVzXG4tIEZhaWx1cmUg
Q2xhc3NpZmljYXRpb246IEltcHJvdmUgZGV0ZWN0aW9uIGFuZCByZXBvcnRpbmcgb2YgaW5mcmFz
dHJ1Y3R1cmUgZmFpbHVyZXMgdnMuIGFjdHVhbFxudGVzdCBmYWlsdXJlc1xuLSBMYWIgQWRtaW4g
R3VpZGVsaW5lczogQ3JlYXRlIHN0YW5kYXJkcyBmb3IgbGFiIGFkbWluaXN0cmF0b3JzIG9uIGRl
dmljZSB0eXBlIGRpZmZlcmVudGlhdGlvblxuYW5kIGNvbmZpZ3VyYXRpb24gZmFjaWxpdGF0aW5n
IGFjY2Vzc2luZyB0aGUgc2FtZSBoYXJkd2FyZSBhY3Jvc3MgbXVsdGlwbGUgbGFicy5cbi0gSm9i
IFByaW9yaXRpemF0aW9uOiBJbXBsZW1lbnQgc21hcnRlciBqb2Igc2NoZWR1bGluZ1xuLSBEZXBl
bmRlbmN5IE1hbmFnZW1lbnQ6IEF2b2lkIHJ1bm5pbmcgZGVwZW5kZW50IHRlc3RzIHdoZW4gcHJl
cmVxdWlzaXRlcyBmYWlsIChlLmcuXCxcbnNraXAgTkZTLWRlcGVuZGVudCB0ZXN0cyBpZiBORlMg
Ym9vdCBmYWlscylcblRoZSBMYWJzIFdHIHdpbGwgd29yayBjbG9zZWx5IHdpdGggdGhlIEluZnJh
c3RydWN0dXJlIFdvcmtpbmcgR3JvdXAgYW5kIFRlY2huaWNhbFxuU3RlZXJpbmcgQ29tbWl0dGVl
IHRvIGVuc3VyZSBvdXIgZWZmb3J0cyBhbGlnbiB3aXRoIEtlcm5lbENJJ3Mgb3ZlcmFsbCBhcmNo
aXRlY3R1cmUgYW5kIGdvYWxzLlxuXG5XYXlzIHRvIGpvaW4gbWVldGluZzpcblxuMS4gSm9pbiBm
cm9tIFBDXCwgTWFjXCwgaVBhZFwsIG9yIEFuZHJvaWRcblxuaHR0cHM6Ly96b29tLWxmeC5wbGF0
Zm9ybS5saW51eGZvdW5kYXRpb24ub3JnL21lZXRpbmcvOTE3NTcxNDk3MTc/cGFzc3dvcmQ9YmJi
MjQ0NTktMzEzYi00Y2IxLTkzYWItNmM1ZTU4YTU0YzFkXG5cbjIuIEpvaW4gdmlhIGF1ZGlvXG5c
bk9uZSB0YXAgbW9iaWxlOlxuVVMgKGlPUyk6ICsxMjUzMjE1ODc4MlwsXCw5MTc1NzE0OTcxNyNc
LFwsXCxcLCowMDYxMjUjIG9yICsxMzQ2MjQ4Nzc5OVwsXCw5MTc1NzE0OTcxNyNcLFwsXCxcLCow
MDYxMjUjXG5VUyAoQW5kcm9pZCk6ICsxMjUzMjE1ODc4Mlw7OTE3NTcxNDk3MTcjXDswMDYxMjUj
IG9yICsxMzQ2MjQ4Nzc5OVw7OTE3NTcxNDk3MTcjXDswMDYxMjUjXG5cbk9yIGRpYWw6XG5VUzog
KzEgMjUzIDIxNSA4NzgyIG9yICsxIDM0NiAyNDggNzc5OSBvciArMSA2NjkgOTAwIDY4MzMgb3Ig
KzEgMzAxIDcxNSA4NTkyIG9yICsxIDMxMiA2MjYgNjc5OSBvciArMSA2NDYgMzc0IDg2NTYgb3Ig
ODc3IDM2OSAwOTI2IChUb2xsIEZyZWUpIG9yIDg1NSA4ODAgMTI0NiAoVG9sbCBGcmVlKVxuQ2Fu
YWRhOiArMSA2NDcgMzc0IDQ2ODUgb3IgKzEgNjQ3IDU1OCAwNTg4IG9yICsxIDc3OCA5MDcgMjA3
MSBvciArMSAyMDQgMjcyIDc5MjAgb3IgKzEgNDM4IDgwOSA3Nzk5IG9yICsxIDU4NyAzMjggMTA5
OSBvciA4NTUgNzAzIDg5ODUgKFRvbGwgRnJlZSlcblxuTWVldGluZyBJRDogOTE3NTcxNDk3MTdc
blxuTWVldGluZyBQYXNzY29kZTogMDA2MTI1XG5cblxuSW50ZXJuYXRpb25hbCBudW1iZXJzOiBo
dHRwczovL3pvb20udXMvdS9hbHduUElhVlRcbg0KRFRFTkQ7VFpJRD1BbWVyaWNhL0xvc19Bbmdl
bGVzOjIwMjUwOTExVDA4MzAwMA0KRFRTVEFNUDtUWklEPUFtZXJpY2EvTG9zX0FuZ2VsZXM6MjAy
NTA5MDhUMTEzMjU0DQpEVFNUQVJUO1RaSUQ9QW1lcmljYS9Mb3NfQW5nZWxlczoyMDI1MDkxMVQw
NzMwMDANCkxBU1QtTU9ESUZJRUQ7VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVzOjIwMjUwOTA4VDEx
MzI1NA0KTE9DQVRJT046aHR0cHM6Ly96b29tLWxmeC5wbGF0Zm9ybS5saW51eGZvdW5kYXRpb24u
b3JnL21lZXRpbmcvOTE3NTcxNDk3MTc/cGFzc3dvcmQ9YmJiMjQ0NTktMzEzYi00Y2IxLTkzYWIt
NmM1ZTU4YTU0YzFkDQpPUkdBTklaRVI7Q049a2VybmVsQ0kgSW5pdGlhdGl2ZSBGdW5kOk1BSUxU
TzptZWV0aW5nc0BsZnguZGV2DQpSUlVMRTpGUkVRPVdFRUtMWTtJTlRFUlZBTD0yO1dLU1Q9U1U7
VU5USUw9MjEyNDA5MTFUMTEzMDAwWjtCWURBWT1USA0KU1VNTUFSWTpLZXJuZWxDSSBMYWJzIFdH
IC0gQmktd2Vla2x5IG1lZXRpbmcNClRaSUQ6QW1lcmljYS9Mb3NfQW5nZWxlcw0KVFpOQU1FOkFt
ZXJpY2EvTG9zX0FuZ2VsZXMNClVJRDo5MTc1NzE0OTcxNw0KVVJMO1ZBTFVFPVRFWFQ6aHR0cHM6
Ly96b29tLWxmeC5wbGF0Zm9ybS5saW51eGZvdW5kYXRpb24ub3JnL21lZXRpbmcvOTE3NTcxNDk3
MTc/cGFzc3dvcmQ9YmJiMjQ0NTktMzEzYi00Y2IxLTkzYWItNmM1ZTU4YTU0YzFkDQpYLU1FRVRJ
TkctSUQ6OTE3NTcxNDk3MTcNClgtT0NDVVJSRU5DRS1JRDoNClgtUkVHSVNUUkFOVC1JRDpmMjMz
OTI3Yy1hOTI4LTQzZDAtYjVjNy0zM2ZiYjgxNDNlYmYNCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5E
QVINCg==

--492f17e34bd24c892226400e6ab2aed655bc0735a7f27b9323034dd10f6b--
