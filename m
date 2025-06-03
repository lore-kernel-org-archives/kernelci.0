Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CFF22F16E
	for <kernelci@lists.linux.dev>; Tue,  3 Jun 2025 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952505; cv=none; b=EkS+V5Nptgx0XbX+LVxUDWWqGaqQgQYLXRSdlISplqpsjDBYwNCFdsfYzdvrdkNH3tFNZR2ZzNUIs/Py+yzaqIxpbciKL53ejoUGnilYLvbQivm9RJKYdWY+9VweK9/5Nfhj3oPquN1SdjDJiHWR4UQed+QGxHrLujNP1iVIufA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952505; c=relaxed/simple;
	bh=kfCil2CVYa+LX+SFIXvd+cw27kNeBXcgziYIbJT8WZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db8RLbYXRdMhUP6JTYZ84o4mjV3k45YGdMFaEVtHSRJvsmjnHvK8hwxdW7N4RAoFdCYh73WKE4Ttb/Uco5JJVBhrsSgwn4OYyJdupgjaA56r++MI57dLD/cPm2Y03OOmnWWmLFEmxWeLtU062SWDu7GRHq0hpYoVyw8n23zl67w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=owD70Kxi; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="owD70Kxi"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b10594812so6616949e87.1
        for <kernelci@lists.linux.dev>; Tue, 03 Jun 2025 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748952501; x=1749557301; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK/6l8zUvlHyE7rQQXkzIKvhYyY/fU4pIa9HT63NiP4=;
        b=owD70KxiJVsmxTUbRd+d1jhgU7k47TW/rixVeDOATBcQTUq2kFcnuRwobvdJZvBED7
         TJKyt0Tdr0ydR7W7dVfNYrs5yFSiuj7E2mGBYqaBbI9xZdMOys545kYezp0j0DqAcYLZ
         TBUaPucMzFtEKCLVQhiD1XSPa6ftKYpQCfjrRlakH2xmKwo6C2jOOZsVNQ24rOCdkvsY
         ljmi9DfHtoMyFIPpLlMApKSt41EEHpr7NNpFMVMJ51sfo/Hyg0TKfpDRl298abDAp39a
         nwcnq2O+NtkLUQik1Yk7/WcEpP7vh6OC2NWEG551RHXro/8PQybf9rCPx5N/p6xx4942
         k0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748952501; x=1749557301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK/6l8zUvlHyE7rQQXkzIKvhYyY/fU4pIa9HT63NiP4=;
        b=GptbrNKOPdvo/3e0uGZ5VUCjRJK0HhMvWrG8YdkAAjuPGXWRIZO4EXacVVwAI0N0kP
         +CptiT8P7kCTMUV5yBQiZN/+4gN/d5t6nWfuuxoblnIXdzQ77FHPENeLe6P67TXBUsUa
         zPo+zR0LgTVMetoZNZYe9sICqmF7GlxkoJAjZxe5pOKQVlcFzfnpiRBHHvV+muZ/joXh
         fyWs5if6p0mB3Oua1E/13r9oilX538lD0V7TTLgJhOmrEFOGuUJTE1rCgFGDXVPVhxi2
         sqmMv4aR3iLMONlaoV+Mb7UvhGbq3a0c6MAy1xsEBZOzXCKhZJx/X8i0XPFaHKAbGlGk
         tQ/A==
X-Gm-Message-State: AOJu0YwI6S57V1lHBF+t84AaBM5WO3IwrV7jvz/CJjWoJFKqy0xnsiaf
	z0AO8+iSM37y3qr0OdmvhlGHcSpj9ROctKgg55Mg4Zpi+5+m7zZ9RFugxfwmZWEuIenSQjywqLd
	5Dyc+w8wb7TM2cWsgyMavzhEVFCkrL8jNpdR2KB6pCg==
X-Gm-Gg: ASbGnctxMblpBPo9DNBzLl4ru07MI9cEw61tBBRsA8n68Y5N5kuLYYPNpf6hNPluBmg
	mH4b8PR/EwSa+S86AzHIo7B50WOItSaySQX8Gf3iwF53JvV7q2J0gPl7WfD/PmkFGTbQeJMoyTC
	Yz/goyAoFgvp+6OxCA1Df2mqhCCpUfmQ0=
X-Google-Smtp-Source: AGHT+IHWYmUmLicUOfypmOwmLixbkQK7FnlrmRwLFpYX0F1rdRPnnBd4O4STTw5LFEJmeyeFQgOLo6x6XEreb3j3dCo=
X-Received: by 2002:a05:6512:e98:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-55342f5d92bmr3259741e87.16.1748952500555; Tue, 03 Jun 2025
 05:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1973207707f.12474557a4721197.2962489771298840013@collabora.com>
In-Reply-To: <1973207707f.12474557a4721197.2962489771298840013@collabora.com>
From: Tom Gall <tom.gall@linaro.org>
Date: Tue, 3 Jun 2025 07:08:08 -0500
X-Gm-Features: AX0GCFv5qVwjrI0iTuRA-eCQt9nBQkN4skE1gYB5vDeepJrPXRXG8CtFyaX6LVI
Message-ID: <CAOfXc9ESCFc_U5mtNbUaLCZB8B6bVDSrMaChf2tb+AEateC4wA@mail.gmail.com>
Subject: Re: [kernelci-members] KernelCI TSC Reset
To: kernelci-members@groups.io
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One thought I'd offer up is on the selection of the TSC Chair.

Rather than the "most votes", I would recommend that from those
elected to the TSC, the  TSC themselves after the election as their
first action should select from their own who their chair will be.
From my experience with other non-profits/boards, it's often best to
give the "job" to those that want it and will have the time.
Unfortunately that won't always be the person who gets the most votes.

On Mon, Jun 2, 2025 at 2:04=E2=80=AFPM Gustavo Padovan via groups.io
<gustavo.padovan=3Dcollabora.com@groups.io> wrote:
>
> Hello everyone,
>
> Recently, we have been discussion the current state of the Technical Stee=
ring Committee(TSC)
> in KernelCI. Over time, a disconnect emerged between the members of the T=
SC and the current
> active contributors to the KernelCI community and we didn't act in time t=
o correct course. That's
> part of the pains of a growing community.
>
> On the flip side, it opens the door for us to rethink the TSC structure f=
rom scratch - something the
> KernelCI Project Advisory Board jumped on and took a proposal for feedbac=
k to the weekly
> community meeting last week. Now, we want to share it with the wide commu=
nity to discuss any
> feedback people may have before we take this to final stages.
>
> Of course, just having a new structure is not the solution to all problem=
s. It
> will require engagement and commitment from TSC members to help the commu=
nity grow,
> keep an open collaborative space, seek alignment of technical roadmap to =
our main goals and
> mediate key strategic decisions.
>
>
> # Proposal for the new KernelCI TSC
>
> The current proposal was build taking inspiration from how other TSC (eg =
ELISA, Zephyr, Yocto)
> are structured today. It has two main spaces:
> * the TSC itself
> * the KernelCI Infrastructure Working Group(Infra WG)
>
> In a nutshell, the Infra WG is responsible for the core infra of the proj=
ect (Maestro, KCIDB, Storage,
> Web Dashboard) and the TSC drives the engament with the Linux kernel comm=
unity, bridging the
> gap between the user needs and infra roadmap development.
>
>
> ## TSC
>
> *  5 members total
>     -> 4 by community vote with 1 year term
>     -> plus the KernelCI Infrastructure WG Lead
> *  Most voted person elected TSC Chair for a 1 year term
> *  Max of two employees from the same company
> *  Any of the community members listed below are eligible to vote and be =
voted to the KernelCI TSC:
>    -> Contributors to KernelCI git repositories
>    -> Technical members of CI systems and labs connected to KernelCI
>    -> Upstream Linux kernel maintainer who interacts with KernelCI result=
s and/or give public feedback to the project
>
>
> ## KernelCI Infrastructure WG
>
> * Responsible for the software projects deployed as KernelCI services
>    ->Maestro, KCIDB, Storage, Web Dashboard
> * Manages the Sysadmin team. With the creation of the Infrastructure WG, =
the Sysadmin WG becomes a
>   team inside the Infrastructure WG with some people getting access to th=
e sysadmin secrets.
> * Initial member selection is based on key contributions and ownership
> * WG can vote new members in and out at any time
> * Members who haven=E2=80=99t contributed to the KernelCI projects for ov=
er 6 months are automatically removed from the WG
> * WG Lead shall preside for two years
> * Voting members for WG Lead include the WG members and TSC members
>
>
> ### Additional TSC responsibilities
>
> Beyond what is already listed in the Charter, the TSC should be responsib=
le for:
>
> * Seeking feedback from the Linux kernel community and company members as=
 driving the
>  creation of processes for improving the feedback process over time;
> * Setting up a process (e.g. RFC, PEP, =E2=80=A6) for decision making aro=
und important architectural
> decisions in the project. Such a process should be used whenever consensu=
s is not achieved
> trivially.
>
> ###  Final thoughts
>
> For reference, today's the current TSC structure is described in the proj=
ect charter[1] and any
> modification we will make to the TSC structure will require voting by the=
 Advisory Board.
>
> In the next steps, once we collect extra pieces of feedback here, the boa=
rd will evaluate and
> hold a voting for changing the charter. Once that happens an election pro=
cess can start.
>
> Let us know your thoughts,
>
> Best,
>
> - gus
>
> [1] https://docs.kernelci.org/files/KernelCI_Project_Technical_Charter_20=
181107.pdf
>
>
> --
> Gustavo Padovan
>
> Collabora Ltd.
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#1419): https://groups.io/g/kernelci-members/message/1=
419
> Mute This Topic: https://groups.io/mt/113434670/1547295
> Group Owner: kernelci-members+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-members/leave/14227279/1547295/=
138374994/xyzzy [tom.gall@linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


--=20
Regards,
Tom

Senior Director, Ecosystem
Linaro.org  (><) =E2=94=82 Arm Solutions at Light Speed
irc, slack, discord: tgall_foo
