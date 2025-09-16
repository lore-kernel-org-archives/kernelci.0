Received: from a27-203.smtp-out.us-west-2.amazonses.com (a27-203.smtp-out.us-west-2.amazonses.com [54.240.27.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459231BCA8
	for <kernelci@lists.linux.dev>; Tue, 16 Sep 2025 20:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758055567; cv=none; b=mPf67Dei8VrNLKUsXpx7Pc0ONLR9yALNLa3r4G3LuhY+PJIWcbBbFADaxMeN32F/Cci+Tg24D9ESVgSO2/Bvislno6AwYfdBebTWVgsGeI4SKFUagPIaD0qvbPbu31zaJiMFNafqN0ds35KWj0WB2SluQgmRt37AS62j/xWr6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758055567; c=relaxed/simple;
	bh=m3j9VoBJcpwg8Lvl4mMb0b/2Mf0v0jPJCCy1n/eoYgA=;
	h=To:Subject:Message-ID:From:Date:Mime-Version:Content-Type; b=MCHSWqSOBIl/kAVWOu98xAY0X9LUd0S6ePa6MRQz8PrIjWyy+e5eb9VuFw0Xs2JDN1PMwvaPoTswS61/ge4hqApKyETEbdDxDPpOPL4kCH2m7Ux7orA+hW98yQRaN/Gfb3OBtFl9hDBzKMijGcX09xx0wzSst5oK0mFIjE+SfN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lfx.dev; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (2048-bit key) header.d=lfx.dev header.i=@lfx.dev header.b=tkEaj72h; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=gJ3C04br; arc=none smtp.client-ip=54.240.27.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lfx.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lfx.dev header.i=@lfx.dev header.b="tkEaj72h";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="gJ3C04br"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=pp2uh5dccwerhoiltpmvlpyy4uxdnm63; d=lfx.dev; t=1758055560;
	h=To:Subject:Message-Id:From:Date:Mime-Version:Content-Type;
	bh=m3j9VoBJcpwg8Lvl4mMb0b/2Mf0v0jPJCCy1n/eoYgA=;
	b=tkEaj72hSZooyBcio8lXQHUOzwNhrp2tUWQoxsXL+jj5TDd7tyzX/vaWIX30uSeG
	8/pi89zM2eUEQgkU25i/wS8VNC3J5w9K655/sdGoiK1SwVS36+MI5eadyf8azxCMR9c
	IJ5XbycNxvzpk1DNgBDweOUOShdJeo1PyWgNRjMS9NOLuzqcSsTQLmTDhOGutjVaT6f
	pCWE6/v7uZ5OOyhPMuSHywF0h3/H6DuSsZj6qRbDHCAkSHm7wmN1qmUiGZBP4b88e50
	ZVNmJ9DXKaxmFHc0AfATwrZ7X/nYUd90rZStryBaKlXpwQz1hLqoiwjMqSeIN1jFLCs
	XaqRveq5EA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1758055560;
	h=To:Subject:Message-Id:From:Date:Mime-Version:Content-Type:Feedback-ID;
	bh=m3j9VoBJcpwg8Lvl4mMb0b/2Mf0v0jPJCCy1n/eoYgA=;
	b=gJ3C04brLUrcGtTjFAwYUWphqi0XBledPGNoQJzWtZSysRw+HrB+dod2zM134g8N
	9AR6XuaE5iP7+t8oJjIWBSF2slmKpm9fLmVtlEveEu5DQ9gaY/XrdP8lufskXYXzQmI
	BpiQU1de3xdZVTyxU4fzuDMIUP5xI+tqmNfrpE34=
To: kernelci@lists.linux.dev
Subject: Invitation: KernelCI Dashboard WG - bi-weekly
Message-ID: <010101995446f438-fc765dca-5997-41fb-87c9-7f10bab55d76-000000@us-west-2.amazonses.com>
From: kernelCI Initiative Fund - Meetings <meetings@lfx.dev>
Date: Tue, 16 Sep 2025 20:46:00 +0000
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary=6f042d18a9fa1c25732ecada16270141ff73541f232b5da05eb0be6c86af
Feedback-ID: ::1.us-west-2.38rwtV0514CR+dj3ljxDerAe+nCn9watSKvSUQn1rXA=:AmazonSES
X-SES-Outgoing: 2025.09.16-54.240.27.203

--6f042d18a9fa1c25732ecada16270141ff73541f232b5da05eb0be6c86af
Content-Type: multipart/alternative;
 boundary=249cdb93c1d295cc8592f8baf431f5ec62d8b9c1e113cbfb9b0fac888111

--249cdb93c1d295cc8592f8baf431f5ec62d8b9c1e113cbfb9b0fac888111
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8


Hello kernelci lists.linux.dev,

You have been invited to a recurring meeting for kernelCI Initiative Fund


Meeting: KernelCI Dashboard WG - bi-weekly
Next Meeting: Monday, September 22nd, 7:00



Repeats: Every 2 weeks on Mondays at 7:00 America/Los_Angeles





Meeting Description:

For anyone interested in discussing the future of the [KernelCI Dashboard],=
 in regard to new functionality, bug fixes and overall enhancement of usabi=
lity.
The KernelCI dashboard is a web platform (Django + React) which aims at pro=
viding an easy way for the community to look at the test results. It is sti=
ll under development and we are open to your feedback and feature requests.
If you=E2=80=99re interested in contributing ideas or simply learning more,=
 please feel free to join the discussions live every 2 weeks on Monday at 1=
4:00 UTC, starting 2025-09-22
Meeting notes: https://docs.google.com/document/d/1aoNpi69WRhn1nENbdAY1CPXY=
VkufbVnG_lFoGfA0aM4

Ways to join meeting:

1. Join from PC, Mac, iPad, or Android

https://zoom-lfx.platform.linuxfoundation.org/meeting/97717382678?password=
=3D4cdaf4f9-f132-4d79-94a6-56f8f03d22fb

2. Join via audio

One tap mobile:
US: +12532158782,,97717382678#,,,,*911276# or +13462487799,,97717382678#,,,=
,*911276#

Or dial:
US: +1 253 215 8782 or +1 346 248 7799 or +1 669 900 6833 or +1 301 715 859=
2 or +1 312 626 6799 or +1 646 374 8656 or 877 369 0926 (Toll Free) or 855 =
880 1246 (Toll Free)
Canada: +1 647 374 4685 or +1 647 558 0588 or +1 778 907 2071 or +1 204 272=
 7920 or +1 438 809 7799 or +1 587 328 1099 or 855 703 8985 (Toll Free)

Meeting ID: 97717382678

Meeting Passcode: 911276


International numbers: https://zoom.us/u/alwnPIaVT

--249cdb93c1d295cc8592f8baf431f5ec62d8b9c1e113cbfb9b0fac888111
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
            <h2>KernelCI Dashboard WG - bi-weekly</h2>
            <div>
                <div class=3D"tight-spacing">
                    <p>Next Meeting: Monday, September 22nd, 7:00 America/L=
os_Angeles</p>
                   =20
                       =20
                       =20
                            <p>Repeats: Every 2 weeks on Mondays at 7:00 Am=
erica/Los_Angeles</p>
                       =20
                       =20
				=09
                </div>
               =20
                <div>
                    <h3>Meeting Description:</h3>
                    <p>For anyone interested in discussing the future of th=
e [KernelCI Dashboard], in regard to new functionality, bug fixes and overa=
ll enhancement of usability.
The KernelCI dashboard is a web platform (Django + React) which aims at pro=
viding an easy way for the community to look at the test results. It is sti=
ll under development and we are open to your feedback and feature requests.
If you=E2=80=99re interested in contributing ideas or simply learning more,=
 please feel free to join the discussions live every 2 weeks on Monday at 1=
4:00 UTC, starting 2025-09-22
Meeting notes: https://docs.google.com/document/d/1aoNpi69WRhn1nENbdAY1CPXY=
VkufbVnG_lFoGfA0aM4</p>
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
nuxfoundation.org/meeting/97717382678?password=3D4cdaf4f9-f132-4d79-94a6-56=
f8f03d22fb">Join Meeting</a></button>
                        <p>If the button above does not work, paste this in=
to your browser: <a href=3D"https://zoom-lfx.platform.linuxfoundation.org/m=
eeting/97717382678?password=3D4cdaf4f9-f132-4d79-94a6-56f8f03d22fb">https:/=
/zoom-lfx.platform.linuxfoundation.org/meeting/97717382678?password=3D4cdaf=
4f9-f132-4d79-94a6-56f8f03d22fb</a></p>
                    </div>
                    <div>
						<h2>2. Join via audio</h2>
						<div class=3D"tight-spacing">
							<p><b>One tap mobile:</b></p>
							<p><b>US:</b> <a href=3D"tel:+12532158782,,97717382678%23,,,,*911276=
%23">+12532158782,,97717382678#,,,,*911276#</a> or <a href=3D"tel:+13462487=
799,,97717382678%23,,,,*911276%23">+13462487799,,97717382678#,,,,*911276#</=
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
						<p>Meeting ID: 97717382678</p>
					=09
						<p>Meeting Passcode: 911276</p>
					=09
						<a href=3D'https://zoom.us/u/alwnPIaVT'>International numbers</a>
					</div>
                </div>
            </div>
        </div>
    </body>
</html>

--249cdb93c1d295cc8592f8baf431f5ec62d8b9c1e113cbfb9b0fac888111--

--6f042d18a9fa1c25732ecada16270141ff73541f232b5da05eb0be6c86af
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
czoyMDI1MDkxNlQxMzQ2MDANCkRFU0NSSVBUSU9OOlxuWW91IGhhdmUgYmVlbiBpbnZpdGVkIHRv
IGEgcmVjdXJyaW5nIG1lZXRpbmcgZm9yIGtlcm5lbENJIEluaXRpYXRpdmUgRnVuZFxuXG5Gb3Ig
YW55b25lIGludGVyZXN0ZWQgaW4gZGlzY3Vzc2luZyB0aGUgZnV0dXJlIG9mIHRoZSBbS2VybmVs
Q0kgRGFzaGJvYXJkXVwsIGluIHJlZ2FyZCB0byBuZXcgZnVuY3Rpb25hbGl0eVwsIGJ1ZyBmaXhl
cyBhbmQgb3ZlcmFsbCBlbmhhbmNlbWVudCBvZiB1c2FiaWxpdHkuXG5UaGUgS2VybmVsQ0kgZGFz
aGJvYXJkIGlzIGEgd2ViIHBsYXRmb3JtIChEamFuZ28gKyBSZWFjdCkgd2hpY2ggYWltcyBhdCBw
cm92aWRpbmcgYW4gZWFzeSB3YXkgZm9yIHRoZSBjb21tdW5pdHkgdG8gbG9vayBhdCB0aGUgdGVz
dCByZXN1bHRzLiBJdCBpcyBzdGlsbCB1bmRlciBkZXZlbG9wbWVudCBhbmQgd2UgYXJlIG9wZW4g
dG8geW91ciBmZWVkYmFjayBhbmQgZmVhdHVyZSByZXF1ZXN0cy5cbklmIHlvdeKAmXJlIGludGVy
ZXN0ZWQgaW4gY29udHJpYnV0aW5nIGlkZWFzIG9yIHNpbXBseSBsZWFybmluZyBtb3JlXCwgcGxl
YXNlIGZlZWwgZnJlZSB0byBqb2luIHRoZSBkaXNjdXNzaW9ucyBsaXZlIGV2ZXJ5IDIgd2Vla3Mg
b24gTW9uZGF5IGF0IDE0OjAwIFVUQ1wsIHN0YXJ0aW5nIDIwMjUtMDktMjJcbk1lZXRpbmcgbm90
ZXM6IGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2RvY3VtZW50L2QvMWFvTnBpNjlXUmhuMW5FTmJk
QVkxQ1BYWVZrdWZiVm5HX2xGb0dmQTBhTTRcblxuV2F5cyB0byBqb2luIG1lZXRpbmc6XG5cbjEu
IEpvaW4gZnJvbSBQQ1wsIE1hY1wsIGlQYWRcLCBvciBBbmRyb2lkXG5cbmh0dHBzOi8vem9vbS1s
ZngucGxhdGZvcm0ubGludXhmb3VuZGF0aW9uLm9yZy9tZWV0aW5nLzk3NzE3MzgyNjc4P3Bhc3N3
b3JkPTRjZGFmNGY5LWYxMzItNGQ3OS05NGE2LTU2ZjhmMDNkMjJmYlxuXG4yLiBKb2luIHZpYSBh
dWRpb1xuXG5PbmUgdGFwIG1vYmlsZTpcblVTIChpT1MpOiArMTI1MzIxNTg3ODJcLFwsOTc3MTcz
ODI2NzgjXCxcLFwsXCwqOTExMjc2IyBvciArMTM0NjI0ODc3OTlcLFwsOTc3MTczODI2NzgjXCxc
LFwsXCwqOTExMjc2I1xuVVMgKEFuZHJvaWQpOiArMTI1MzIxNTg3ODJcOzk3NzE3MzgyNjc4I1w7
OTExMjc2IyBvciArMTM0NjI0ODc3OTlcOzk3NzE3MzgyNjc4I1w7OTExMjc2I1xuXG5PciBkaWFs
OlxuVVM6ICsxIDI1MyAyMTUgODc4MiBvciArMSAzNDYgMjQ4IDc3OTkgb3IgKzEgNjY5IDkwMCA2
ODMzIG9yICsxIDMwMSA3MTUgODU5MiBvciArMSAzMTIgNjI2IDY3OTkgb3IgKzEgNjQ2IDM3NCA4
NjU2IG9yIDg3NyAzNjkgMDkyNiAoVG9sbCBGcmVlKSBvciA4NTUgODgwIDEyNDYgKFRvbGwgRnJl
ZSlcbkNhbmFkYTogKzEgNjQ3IDM3NCA0Njg1IG9yICsxIDY0NyA1NTggMDU4OCBvciArMSA3Nzgg
OTA3IDIwNzEgb3IgKzEgMjA0IDI3MiA3OTIwIG9yICsxIDQzOCA4MDkgNzc5OSBvciArMSA1ODcg
MzI4IDEwOTkgb3IgODU1IDcwMyA4OTg1IChUb2xsIEZyZWUpXG5cbk1lZXRpbmcgSUQ6IDk3NzE3
MzgyNjc4XG5cbk1lZXRpbmcgUGFzc2NvZGU6IDkxMTI3NlxuXG5cbkludGVybmF0aW9uYWwgbnVt
YmVyczogaHR0cHM6Ly96b29tLnVzL3UvYWx3blBJYVZUXG4NCkRURU5EO1RaSUQ9QW1lcmljYS9M
b3NfQW5nZWxlczoyMDI1MDkyMlQwODAwMDANCkRUU1RBTVA7VFpJRD1BbWVyaWNhL0xvc19Bbmdl
bGVzOjIwMjUwOTE2VDEzNDYwMA0KRFRTVEFSVDtUWklEPUFtZXJpY2EvTG9zX0FuZ2VsZXM6MjAy
NTA5MjJUMDcwMDAwDQpMQVNULU1PRElGSUVEO1RaSUQ9QW1lcmljYS9Mb3NfQW5nZWxlczoyMDI1
MDkxNlQxMzQ2MDANCkxPQ0FUSU9OOmh0dHBzOi8vem9vbS1sZngucGxhdGZvcm0ubGludXhmb3Vu
ZGF0aW9uLm9yZy9tZWV0aW5nLzk3NzE3MzgyNjc4P3Bhc3N3b3JkPTRjZGFmNGY5LWYxMzItNGQ3
OS05NGE2LTU2ZjhmMDNkMjJmYg0KT1JHQU5JWkVSO0NOPWtlcm5lbENJIEluaXRpYXRpdmUgRnVu
ZDpNQUlMVE86bWVldGluZ3NAbGZ4LmRldg0KUlJVTEU6RlJFUT1XRUVLTFk7SU5URVJWQUw9MjtX
S1NUPVNVO1VOVElMPTIxMjQwOTIyVDExMDAwMFo7QllEQVk9TU8NClNVTU1BUlk6S2VybmVsQ0kg
RGFzaGJvYXJkIFdHIC0gYmktd2Vla2x5DQpUWklEOkFtZXJpY2EvTG9zX0FuZ2VsZXMNClRaTkFN
RTpBbWVyaWNhL0xvc19BbmdlbGVzDQpVSUQ6OTc3MTczODI2NzgNClVSTDtWQUxVRT1URVhUOmh0
dHBzOi8vem9vbS1sZngucGxhdGZvcm0ubGludXhmb3VuZGF0aW9uLm9yZy9tZWV0aW5nLzk3NzE3
MzgyNjc4P3Bhc3N3b3JkPTRjZGFmNGY5LWYxMzItNGQ3OS05NGE2LTU2ZjhmMDNkMjJmYg0KWC1N
RUVUSU5HLUlEOjk3NzE3MzgyNjc4DQpYLU9DQ1VSUkVOQ0UtSUQ6DQpYLVJFR0lTVFJBTlQtSUQ6
MDA1ZWZmNzAtMzM5Ni00YTllLWI4ODItNmJmZGIzY2Y3NjIyDQpFTkQ6VkVWRU5UDQpFTkQ6VkNB
TEVOREFSDQo=

--6f042d18a9fa1c25732ecada16270141ff73541f232b5da05eb0be6c86af--
