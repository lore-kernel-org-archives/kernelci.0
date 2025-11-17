Received: from bmail-169.transmail.net (bmail-169.transmail.net [135.84.80.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0474920C00A
	for <kernelci@lists.linux.dev>; Mon, 17 Nov 2025 23:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=135.84.80.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763421089; cv=pass; b=SUxU2rV9nBBkAUA71nJ+e8q35FHRp3kbclZck7WeRwGJgVhKYIA1wMeTjfjxbxEZQu/n9vHoEq4RUqxKYRhSbE+Zj/Q8/HDDSJC0FH/StuDMi1bZGLVo8Dl4Ye4pvgSWo/DZerIXsWy5vMWgdV3o0y+jegYaz5JZ9ei9TPeSnEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763421089; c=relaxed/simple;
	bh=DWedfCzRTl2Q9TQLEgYCybUyvNXB/USyZ2fBqAsO8RQ=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=Rab31YTp09AgLZXXkFVuN+m1flIB63FUipRQVaZv8EmeUtKeiEL+yP3CMqKQZLq6+i7Fd00CBNxvifpTFzYrYSH5acdtT8uGHI1FblpJ4lCQgAJRi4kEdTvBeyvSDypjM5WOzPseS4xFhYUB4/w0rIbyFim2y6kY5J/nrXrluDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=sender.zohocalendar.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.b=g+a4MW+q; arc=pass smtp.client-ip=135.84.80.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sender.zohocalendar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.b="g+a4MW+q"
ARC-Seal: i=1; a=rsa-sha256; t=1763421084; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=fQBNYuBTtEMlZIUdl790yRq6cB9Q5+NbIhYyP0MONXWsLNHsQSWyaRFenKBUgzo7qzpWCFcBxuR4g4dfalLZ/rv3eeGu+Uqy/prVjKcHMRI3i46uFoJ5BdvfLr8HpsYJqEK2oeu6B1QJHn2R0SgZ8Hn76mYn13bSe3+i39WhZ0A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1763421084; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=pHkhCkxrk/j+V0IyCvp/GRlnDq4BsW6Dl6wBFPDOaoY=; 
	b=YBw2aLjrKfBPRb8CduU1qqP0wkZ3pWZgdsrNoPzJcu5udrcFqj5yFDRolx6vj9DS4saX73kuX11wHVi3JQrajawctga9f+O3cJnkLSLFJUgwuKpBOwIaRNntM1zvlbE8VIgD8OtN1qFrPpZSDdLtD77XF6D3QPm4zPPHMdfHlh4=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=noreply+bb00bc30-c40a-11f0-8862-fae9afc80e45_vt1@sender.zohocalendar.com;
	dmarc=pass header.from=<denys.f@collabora.com>
Received: by mx.zohomail.com with SMTPS id 1763421082702133.5605425703285;
	Mon, 17 Nov 2025 15:11:22 -0800 (PST)
DKIM-Signature: a=rsa-sha256; b=g+a4MW+qCq3OgafwXciF351stR68hg8HY3IHKilysCM77IRDoPz4/4N0of/3SnaSxqZMZiqOxxIop7AquNhhS4EkvGJmEJjs4CtZATi7B5rwfMxZ8zAKmsJWiRfb9vJ/gzJT1yCCtvJNDnEtLN2lZIcllogX+TvGIvWBUvm2k9M=; c=relaxed/relaxed; s=1522905413783; d=collabora.com; v=1; bh=pHkhCkxrk/j+V0IyCvp/GRlnDq4BsW6Dl6wBFPDOaoY=; h=date:from:to:message-id:subject:mime-version:content-type:date:from:to:message-id:subject;
Date: Mon, 17 Nov 2025 15:11:22 -0800 (PST)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Message-ID: <zz080112401421fe7ac01fd4226d59981292fdcfd3621d138f569fc9567227b37f4682a8e5dc1b95f2f57e3fb00e7a1a735a5d1bfa6981226ed17be59f22d7a0af97ae45e4@sender.zohocalendar.com>
Subject: Invitation: Invitation: KernelCI Dashboard WG - Bi-weekly meeting @
 Tue Nov 18, 2025 01:15 am - 01:45 am (Asia/Beirut)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_900692_1948351213.1763421082642"
Original-Envelope-Id: 2d6f.3864fd7.m1.bb00bc30-c40a-11f0-8862-fae9afc80e45.19a94164f73
X-JID: 2d6f.3864fd7.m4.bb00bc30-c40a-11f0-8862-fae9afc80e45.19a94164f73
TM-MAIL-JID: 2d6f.3864fd7.m1.bb00bc30-c40a-11f0-8862-fae9afc80e45.19a94164f73
X-App-Message-ID: 2d6f.3864fd7.m1.bb00bc30-c40a-11f0-8862-fae9afc80e45.19a94164f73
X-Report-Abuse: <abuse+2d6f.3864fd7.m1.bb00bc30-c40a-11f0-8862-fae9afc80e45.19a94164f73@zeptomail.com>
TM-Message-ID: <2d6f.3864fd7.m1.bb00bc30-c40a-11f0-8862-fae9afc80e45.19a94164f73@sender.zohocalendar.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/263.339.75
X-ZohoMailClient: External

------=_Part_900692_1948351213.1763421082642
Content-Type: multipart/alternative; 
	boundary="----=_Part_900693_1045995774.1763421082642"

------=_Part_900693_1045995774.1763421082642
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


------=_Part_900693_1045995774.1763421082642
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/x=
html1/DTD/xhtml1-transitional.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8=
" />
    <title>Invitation Document</title>
    <script type=3D"application/ld+json">
        {"@context":"http://schema.org","@type":"Event","zmailInternalServi=
ce":"calendar",    "name":"Invitation&#x3a; KernelCI Dashboard WG - Bi-week=
ly meeting","startDate":"2025-11-17T23:15:00Z","endDate":"2025-11-17T23:45:=
00Z",    "potentialAction":[{"@type": "RsvpAction","handler":{"@type": "Htt=
pActionHandler", "url": "https://calendar.zoho.com/api/private/json/updateS=
tatus?eid=3Dzz080112301421fe7ac01fd4226d59981292fdcfd3621d138f569fc9567227b=
37f4682a8e5a75a2f09408a8706da2c1aa6a70bd061&akey=3Dzz080112308a4f9942a5be01=
40d0e08ea48bb711fa30efe16ea3560a144a30d78367625d53be8cdee7b1599cf83cdc44a3e=
82f767b&calid=3Dzz08011220d2c17ba2bf299e833d91468db3df363854df9c66f9769fe92=
5aa0e11c5600d73&res=3D1"},"attendance": "http://schema.org/RsvpAttendance/Y=
es"},{"@type":"RsvpAction","handler":{"@type": "HttpActionHandler","url": "=
https://calendar.zoho.com/api/private/json/updateStatus?eid=3Dzz08011230142=
1fe7ac01fd4226d59981292fdcfd3621d138f569fc9567227b37f4682a8e5a75a2f09408a87=
06da2c1aa6a70bd061&akey=3Dzz080112308a4f9942a5be0140d0e08ea48bb711fa30efe16=
ea3560a144a30d78367625d53be8cdee7b1599cf83cdc44a3e82f767b&calid=3Dzz0801122=
0d2c17ba2bf299e833d91468db3df363854df9c66f9769fe925aa0e11c5600d73&res=3D2"}=
,"attendance": "http://schema.org/RsvpAttendance/No"},{"@type": "RsvpAction=
","handler":{"@type": "HttpActionHandler","url": "https://calendar.zoho.com=
/api/private/json/updateStatus?eid=3Dzz080112301421fe7ac01fd4226d59981292fd=
cfd3621d138f569fc9567227b37f4682a8e5a75a2f09408a8706da2c1aa6a70bd061&akey=
=3Dzz080112308a4f9942a5be0140d0e08ea48bb711fa30efe16ea3560a144a30d78367625d=
53be8cdee7b1599cf83cdc44a3e82f767b&calid=3Dzz08011220d2c17ba2bf299e833d9146=
8db3df363854df9c66f9769fe925aa0e11c5600d73&res=3D3"},"attendance": "http://=
schema.org/RsvpAttendance/Maybe"}],"identifier":"zz080112301421fe7ac01fd422=
6d59981292fdcfd3621d138f569fc9567227b37f4682a8e5a75a2f09408a8706da2c1aa6a70=
bd061"}
    </script>
    <style>
        .zclet__table {
            border-color: #e5e5e5;
            background-color: #fff;
        }

        .zclet__header__title {
            color: #000000;
        }

        .zclet__header__info {
            color: #222222;
        }

        .zclet__link {
            color: #004ce6 !important;
        }

        .zclet__link--email {
            color: #004ce6 !important;
        }

        .zclet__container__separator {
            background-color: #f2f2f2;
        }

        .zclet__event__label {
            color: #666666;
        }

        .zclet__event__text {
            color: #000000;
        }

        .zclet__footer__text {
            color: #808080;
        }

        .zclet__primary__action {
            background-color: #184fc4;
            color: #ffffff !important;
        }

        .zclet__action--filled {
            background-color: #184fc4;
            color: #fff !important;
        }

        .zclet__action--outline {
            border-color: #184fc4;
            color: #184fc4 !important;
        }

        .zclet__action--link {
            color: #184fc4 !important;
        }

        .zclet__event__attachment {
            background-color: #f7f7f7;
            color: #4b4b4b !important;
        }

        .zclet__action__yes {
            border-color: #e5e5e5;
            color: #008433 !important;
        }

        .zclet__action__maybe {
            border-color: #e5e5e5;
            color: #cc7429 !important;
        }

        .zclet__action__no {
            border-color: #e5e5e5;
            color: #cc3929 !important;
        }

        .zclet__action__yes--active {
            border-color: #008433;
            color: #008433 !important;
        }

        .zclet__action__maybe--active {
            border-color: #cc7429;
            color: #cc7429 !important;
        }

        .zclet__action__no--active {
            border-color: #cc3929;
            color: #cc3929 !important;
        }

        .zclet__sep__bg {
            background-color: #f2f2f2;
        }

        .zclet__event__conf-wrapper {
            border-color: #e5e5e5;
            background-color: #fff;
        }

        .zclet__label__highlight {
            color: #cf3e3d;
        }

        .zclet__event__conf-wrapper {
            border-color: #e5e5e5;
            background-color: #fff;
        }

        .zclet__event__conf-name {
            color: #000;
        }

        .zclet__event__conf-link {
            color: #797979;
        }

        .zclet__header__info a,
        .zclet__header__title a,
        .zclet__event__text a {
            word-break: break-all !important;
            overflow-wrap: anywhere;
        }

        .zclet__event__text a[href] {
            color: #004ce6 !important;
            text-decoration: none;
        }

        .zclet__event__text--loc p {
            margin: 0;
        }

        .zclet__event__text--loc p a {
            color: #004ce6 !important;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <table cellpadding=3D"0" cellspacing=3D"0" class=3D"zclet__table" style=
=3D"
        margin: 0px auto;
        width: 540px;
        border-width: 1px;
        border-style: solid;
        font-family: inherit;
        font-size: 14px;
        text-decoration: none;
        table-layout: fixed;
        word-break:normal;
    ">
        <tbody>
            <tr>
                <td colspan=3D"2">
                    <div class=3D"" style=3D"height: 36px">
                        <img
                        src=3D"https://img.zohocdn.com/calendar/email-templ=
ate-assets/calendar-header-doodle-v1.png"
                        width=3D"100%"
                        height=3D"100%"
                    />
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan=3D"2" style=3D"font-size: 14px; line-height: 15=
px; padding: 0 30px; background-size: 100%">
                    <table cellpadding=3D"0" cellspacing=3D"0" style=3D"wid=
th: 100%; border-collapse: collapse">
                        <tbody>
                            <tr>
                                <td>
                                    <p class=3D"zclet__header__info" style=
=3D"margin: 0; line-height: 21px">
                                        <a class=3D"zclet__link--email" hre=
f=3D"mailto:denys.f@collabora.com"
                                            style=3D"text-decoration: none"=
>
                                            denys.f@collabora.com
                                        </a>
                                        invites you to be a part of Invitat=
ion&#x3a; KernelCI Dashboard WG - Bi-weekly meeting
                                    </p>
                                    <h3 class=3D"zclet__header__title" styl=
e=3D"
                                        font-size: 20px;
                                        margin: 0;
                                        line-height: 23px;
                                        font-weight: 500;
                                        padding: 10px 0px 24px;
                                        word-break: break-word;
                                    ">
                                        Invitation&#x3a; KernelCI Dashboard=
 WG - Bi-weekly meeting
                                    </h3>
                                </td>
                            </tr>
                            <tr style=3D"line-height: 16px">
                                <td colspan=3D"2">
                                    <table style=3D"width: 100%; border-col=
lapse: collapse" cellspacing=3D"0"
                                        cellpadding=3D"0">
                                        <tbody>
                                            <tr>
                                                <td style=3D"width: 24px; v=
ertical-align: middle">
                                                    <span
                                                    style=3D"
                                                        display: inline-blo=
ck;
                                                        padding-right: 10px=
;
                                                        width: 14px;
                                                        height: 14px;
                                                        vertical-align: -2p=
x;
                                                    ">
                                                    <img src=3D"https://img=
.zohocdn.com/calendar/email-template-assets/icon-time-v1.png"
                                                        width=3D"14" height=
=3D"14"/>
                                                </span>
                                                </td>
                                                <td>
                                                    <span
                                                    class=3D"zclet__event__=
label"
                                                    style=3D"display: inlin=
e-block;font-size: 14px;line-height: 16px">
                                                    Date and time
                                                </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan=3D"2" style=3D"padding: 10px 0p=
x 24px">
                                    <table style=3D"width: 100%; border-col=
lapse: collapse" cellspacing=3D"0"
                                        cellpadding=3D"0">
                                        <tbody>
                                            <tr>
                                                <td style=3D"width: 24px"><=
/td>
                                                <td>
                                                    <span class=3D"zclet__e=
vent__text"
                                                    style=3D"font-size: 16p=
x; line-height: 19px">
                                                    Tue Nov 18, 2025 01:15 =
am - 01:45 am (Asia/Beirut)=20
                                                </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr style=3D"line-height: 16px">
                                <td colspan=3D"2" style=3D"padding: 0px 0px=
">
                                    <table style=3D"width: 100%; border-col=
lapse: collapse" cellspacing=3D"0"
                                        cellpadding=3D"0">
                                        <tbody>
                                            <tr>
                                                <td style=3D"width: 24px">
                                                    <span style=3D"
                                                                    display=
: inline-block;
                                                                    padding=
-right: 10px;
                                                                    width: =
10px;
                                                                    height:=
 10px;
                                                                ">
                                                    <img src=3D"https://img=
.zohocdn.com/calendar/email-template-assets/icon-notes-v1.png"
                                                        width=3D"10" height=
=3D"10">
                                                </span>
                                                </td>
                                                <td>
                                                    <span style=3D"
                                                                    display=
: inline-block;
                                                                    font-si=
ze: 14px;
                                                                    line-he=
ight: 16px;
                                                                " class=3D"=
zclet__event__label">
                                                    Description
                                                </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan=3D"2" style=3D"padding: 10px 0p=
x 24px">
                                    <table style=3D"width: 100%; border-col=
lapse: collapse" cellspacing=3D"0"
                                        cellpadding=3D"0">
                                        <tbody>
                                            <tr>
                                                <td style=3D"width: 24px"><=
/td>
                                                <td>
                                                    <div style=3D"
                                                                    font-si=
ze: 14px;
                                                                    line-he=
ight: 21px;
                                                                    margin:=
 0;
                                                                    word-br=
eak: break-word;
                                                                " class=3D"=
zclet__event__text">
                                                        Hello kernelci list=
s.linux.dev, In today&#x27;s KernelCI Dashboard Working Group meeting &#x28=
;7 AM PDT&#x3b; 15&#x3a;00 UTC&#x29; we plan to talk about metrics, inspire=
d by last week&#x27;s TSC meeting. - Count submitters, labs, builds, tests,=
 regressions, platforms - Show thos
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan=3D"2">
                                    <div style=3D"line-height: 24px; paddin=
g: 0 0px 20px; margin-top: 6px">
                                        <a href=3D"https://calendar.zoho.co=
m/invitation/accept?akey=3Dzz080112308a4f9942a5be0140d0e08ea48bb711fa30efe1=
6ea3560a144a30d78367625d53be8cdee7b1599cf83cdc44a3e82f767b&eid=3Dzz08011230=
1421fe7ac01fd4226d59981292fdcfd3621d138f569fc9567227b37f4682a8e5a75a2f09408=
a8706da2c1aa6a70bd061&calid=3Dzz08011220d2c17ba2bf299e833d91468db3df363854d=
f9c66f9769fe925aa0e11c5600d73" style=3D"
                                                        text-decoration: no=
ne;
                                                        display: inline-blo=
ck;
                                                        margin-right: 20px;
                                                        padding: 10px 16px;
                                                        border-radius: 4px;
                                                        line-height: 16px;
                                                        font-size: 14px;
                                                    " class=3D"zclet__actio=
n--filled">
                                            View event</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan=3D"2" style=3D"padding: 0px 30px">
                    <div style=3D"height: 1px; max-height: 1px" class=3D"zc=
let__container__separator">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan=3D"2" style=3D"padding: 20px 30px 20px; backgro=
und-size: 100%; background-position: 0px 100%">
                    <table style=3D"margin: 0px auto; border-radius: 0; wid=
th: 100%; border-collapse: collapse"
                        cellspacing=3D"0" cellpadding=3D"0">
                        <tbody>
                            <tr>
                                <td style=3D"width: 38px; height: 38px">
                                    <span style=3D"
                                                    display: inline-block;
                                                    margin-right: 10px;
                                                    width: 38px;
                                                    height: 38px;
                                                ">
                                    <img src=3D"https://img.zohocdn.com/cal=
endar/email-template-assets/calendar-logo-v1.png"
                                        style=3D"width: 38px; height: 33px"=
>
                                </span>
                                </td>
                                <td style=3D"font-size: 11px; line-height: =
17px" class=3D"zclet__footer__text">
                                    <p style=3D"margin: 0">
                                        This calendar notification email wa=
s sent from Zoho Calendar by <a href=3D"mailto:denys.f@collabora.com" class=
=3D"zclet__link" style=3D"text-decoration: none; color: #004ce6">denys.f@co=
llabora.com</a>. If you believe this to be spam or junk, please report this=
 email to <a href=3D"mailto:abuse@zohocorp.com" class=3D"zclet__link" style=
=3D"text-decoration: none; color: #004ce6">abuse@zohocorp.com</a>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td style=3D"width: 38px"></td>
                                <td style=3D"padding: 8px 0 0" class=3D"zcl=
et__footer__text">
                                    <p style=3D"font-size: 11px; margin: 0"=
>
                                        =C2=A9 2025, Zoho Corporation Pvt. =
Ltd. All Rights Reserved.
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>

</html>
------=_Part_900693_1045995774.1763421082642
Content-Type: text/calendar;method=REQUEST;charset="UTF-8"
Content-Transfer-Encoding: 7bit
Content-Class: urn:content-classes:calendarmessage
Charset: UTF-8

BEGIN:VCALENDAR
PRODID:-//Zoho Corporation//Zoho Calendar-US//EN
VERSION:2.0
X-WR-TIMEZONE:null
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VTIMEZONE
TZID:Asia/Beirut
BEGIN:DAYLIGHT
TZOFFSETFROM:+0200
TZOFFSETTO:+0300
DTSTART:19700330T000000
RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU
END:DAYLIGHT
BEGIN:STANDARD
TZOFFSETFROM:+0300
TZOFFSETTO:+0200
DTSTART:19701026T000000
RRULE:FREQ=YEARLY;BYMONTH=10;BYDAY=4SU
END:STANDARD
END:VTIMEZONE
BEGIN:VEVENT
SUMMARY:Invitation: KernelCI Dashboard WG - Bi-weekly meeting
DESCRIPTION:Hello kernelci lists.linux.dev, In today's KernelCI Dashboard Working Group meeting (7 AM PDT; 15:00 UTC) we plan to talk about metrics, inspired by last week's TSC meeting. - Count submitters, labs, builds, tests, regressions, platforms - Show thos
DTSTART;TZID=Asia/Beirut:20251118T011500
DTEND;TZID=Asia/Beirut:20251118T014500
LOCATION:
UID:dedac2bb0b474146af26a077a20f4555@zoho.com
IMPORTANT:0
CLASS:PUBLIC
STATUS:CONFIRMED
TRANSP:OPAQUE
PRIORITY:0
CREATED:20251117T231119Z
LAST-MODIFIED:20251117T231119Z
DTSTAMP:20251117T231121Z
ORGANIZER;CN=Denys Fedoryshchenko:MAILTO:denys.f@collabora.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;RSVP=TRUE;PARTSTAT=NEEDS-ACTION:MAILTO:kernelci@lists.linux.dev
END:VEVENT
END:VCALENDAR

------=_Part_900693_1045995774.1763421082642--

------=_Part_900692_1948351213.1763421082642
Content-Type: text/calendar; charset=UTF-8; name=event.ics
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=event.ics

QkVHSU46VkNBTEVOREFSClBST0RJRDotLy9ab2hvIENvcnBvcmF0aW9uLy9ab2hvIENhbGVuZGFy
LVVTLy9FTgpWRVJTSU9OOjIuMApYLVdSLVRJTUVaT05FOm51bGwKQ0FMU0NBTEU6R1JFR09SSUFO
Ck1FVEhPRDpSRVFVRVNUCkJFR0lOOlZUSU1FWk9ORQpUWklEOkFzaWEvQmVpcnV0CkJFR0lOOkRB
WUxJR0hUClRaT0ZGU0VURlJPTTorMDIwMApUWk9GRlNFVFRPOiswMzAwCkRUU1RBUlQ6MTk3MDAz
MzBUMDAwMDAwClJSVUxFOkZSRVE9WUVBUkxZO0JZTU9OVEg9MztCWURBWT0tMVNVCkVORDpEQVlM
SUdIVApCRUdJTjpTVEFOREFSRApUWk9GRlNFVEZST006KzAzMDAKVFpPRkZTRVRUTzorMDIwMApE
VFNUQVJUOjE5NzAxMDI2VDAwMDAwMApSUlVMRTpGUkVRPVlFQVJMWTtCWU1PTlRIPTEwO0JZREFZ
PTRTVQpFTkQ6U1RBTkRBUkQKRU5EOlZUSU1FWk9ORQpCRUdJTjpWRVZFTlQKU1VNTUFSWTpJbnZp
dGF0aW9uOiBLZXJuZWxDSSBEYXNoYm9hcmQgV0cgLSBCaS13ZWVrbHkgbWVldGluZwpERVNDUklQ
VElPTjpIZWxsbyBrZXJuZWxjaSBsaXN0cy5saW51eC5kZXYsIEluIHRvZGF5J3MgS2VybmVsQ0kg
RGFzaGJvYXJkIFdvcmtpbmcgR3JvdXAgbWVldGluZyAoNyBBTSBQRFQ7IDE1OjAwIFVUQykgd2Ug
cGxhbiB0byB0YWxrIGFib3V0IG1ldHJpY3MsIGluc3BpcmVkIGJ5IGxhc3Qgd2VlaydzIFRTQyBt
ZWV0aW5nLiAtIENvdW50IHN1Ym1pdHRlcnMsIGxhYnMsIGJ1aWxkcywgdGVzdHMsIHJlZ3Jlc3Np
b25zLCBwbGF0Zm9ybXMgLSBTaG93IHRob3MKRFRTVEFSVDtUWklEPUFzaWEvQmVpcnV0OjIwMjUx
MTE4VDAxMTUwMApEVEVORDtUWklEPUFzaWEvQmVpcnV0OjIwMjUxMTE4VDAxNDUwMApMT0NBVElP
TjoKVUlEOmRlZGFjMmJiMGI0NzQxNDZhZjI2YTA3N2EyMGY0NTU1QHpvaG8uY29tCklNUE9SVEFO
VDowCkNMQVNTOlBVQkxJQwpTVEFUVVM6Q09ORklSTUVEClRSQU5TUDpPUEFRVUUKUFJJT1JJVFk6
MApDUkVBVEVEOjIwMjUxMTE3VDIzMTExOVoKTEFTVC1NT0RJRklFRDoyMDI1MTExN1QyMzExMTla
CkRUU1RBTVA6MjAyNTExMTdUMjMxMTIxWgpPUkdBTklaRVI7Q049RGVueXMgRmVkb3J5c2hjaGVu
a286TUFJTFRPOmRlbnlzLmZAY29sbGFib3JhLmNvbQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVB
TDtST0xFPVJFUS1QQVJUSUNJUEFOVDtSU1ZQPVRSVUU7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OOk1B
SUxUTzprZXJuZWxjaUBsaXN0cy5saW51eC5kZXYKRU5EOlZFVkVOVApFTkQ6VkNBTEVOREFSCg==

------=_Part_900692_1948351213.1763421082642--
