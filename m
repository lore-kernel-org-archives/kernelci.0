Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589C52E9737
	for <kernelci@lists.linux.dev>; Thu,  9 Oct 2025 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018339; cv=none; b=CLmykYE1QNvBjGU+devVRhcF5znJkBbwVNnlkktONBuhqYnwoCT8QWUOnwOFVrel2ku/eB9M5hjLIIdeqWd/nJpIvd0PtMS4gODEvfFDh0amfWBI0+SjrUEC7A2nTkOM8oqQEUyIZ0gJIIurxpzw9Swu4aTlB7E4uY5UWQVUWTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018339; c=relaxed/simple;
	bh=3AWdtBM7129pczqaNRuVvTNz4t0i5ESxoxlS+BpE1F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQK0ayzwJ9LU2Wp0gjI44bN/K0zEGVZ8rXMVXHqAQ2aZY/Es2FzAjdxTxLtpfL4e03SndFMq/cZV9NLNFjO5PdLolkS1qQmCX85FA+bmoxfYs7yPH2gUr9xvvWjRJ3l9j9DcGYmb11Aqyiv6Ruq1tPFtymIJDNQyH2EhDRko5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com; spf=pass smtp.mailfrom=miraclelinux.com; dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b=dgPPHUOJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraclelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=miraclelinux-com.20230601.gappssmtp.com header.i=@miraclelinux-com.20230601.gappssmtp.com header.b="dgPPHUOJ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3369dcfef12so1251795a91.2
        for <kernelci@lists.linux.dev>; Thu, 09 Oct 2025 06:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20230601.gappssmtp.com; s=20230601; t=1760018335; x=1760623135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PJxPcvVY/xv1iIMXQcdMXFMV85o0zu48+TTHbwoTsU=;
        b=dgPPHUOJLHuDfxpWvT3hweGLl9JZIRpMQ+hUloN0GRbrYhSIKB0lFh+YDbP97XLkMQ
         MWDoZYHgMcf+TZ8NuTLsfNqbasTfsIqSCHpivWlhlU3boPMuMSo6I5Yns87+8P0NwOo9
         xLtM68NJIMsr+O3uJZ8fjP2Wk0xsuNszX3bQLEwsYTxb/RNzsC0yroI/2p6Y+rhbcjTE
         4ihRiyDYGAICzDdEseJIJbD3AQb4ITho7wUu2aV9gVT8XR/qmW51yxzBRtUY4YaIEhuI
         2ystwnxZeVWmJDQgCfeHzscq/VJiRkQMDN1tw4yWCgP3uVBWD6l10tx4zIDUtcfMxom3
         f6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018335; x=1760623135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PJxPcvVY/xv1iIMXQcdMXFMV85o0zu48+TTHbwoTsU=;
        b=PmaY9nct09jCETaxhOet69k1Ic7nmk3OiR+mkZcNOs8fOYnV9Oyr0jZaeWtERDMzt+
         E8rLNQmt9W5D1SQ3y09rzzorXlAKmR/NwuEOQo8Y1X70924A/+Z2M+kcHt5fvJormZw/
         SUGqJDk1xGdmmAWspaPx3JORuZnCaL0YRRLfqg37vxQkS1z74ObEz8fT+kvgSAbgUyl4
         Tu2ZiOMqkF+q9VzXroDdgjSsOnGLbTBluGXtDKoLfjhiRI9axacm3wSb1RtNabYl4ANf
         VaVI4FyIsuOfP0Gx2QCb+4VUPFe+QKwYfARyjjpBMIWhnEDi8mY5eNDl3hknDHXshCvO
         StOg==
X-Forwarded-Encrypted: i=1; AJvYcCVGM3LwKgQhzh4oQry0aEHLXWQYyUD4aZBazVldi+FL8eGsY0RU/h6UDP3OBy9AK2x6CZiApfpNEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6rJinh4KLkLnOX/3DY2phKUrCHjI9I3XqHI6Uan5NAkcTmPfv
	etPQqxJiSn56ZLoeDI/wJyhLr7S9q7AGA+fWzCzWmr0NsXVpO1+MT993/m1KRcQZDXbyc5jFwFv
	wGVrENN4x1GKYYMPTpvD6Kn5rRi/I5y+3qq9yZwRj
X-Gm-Gg: ASbGncsAhHFRn66NEp6+Ou7wELwaXrJHVGzwtVrH6F/CUIHuH86+CCXymkH0CinSr8z
	3ZHVKG+eQrxSWcJq5JpvJ/1MzRm6yxzan3uUHZc+b48exdHt8e0mY669q8YtRrbRBLWP0hpaKlS
	QPApSGU4t/IEUhL+ePEjunfPa5Y6AgYwknFhp+ZG7SJLEP4UPIJXtREPTXz3IPY3DWOxTld9YQj
	D9FakBFbnWT3yKUGPSz7kvfgxEGBmI=
X-Google-Smtp-Source: AGHT+IGJ60aEXtqfVqrfqHocIsHLq1nkYetcGGZeRuTLmqKTBMB3k0YvFNIgHxYA5E6wm8qaIjVM9orKneZV1nAfw+c=
X-Received: by 2002:a17:90b:1b11:b0:32e:38b0:15f4 with SMTP id
 98e67ed59e1d1-33b51149231mr10335005a91.7.1760018335433; Thu, 09 Oct 2025
 06:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANgtXuN4i6WoQiAGv9PTPbzbVhQLDK6rCRGBV9YzddddzdY0cQ@mail.gmail.com>
 <2025100911-unloaded-showbiz-4639@gregkh> <199c90706a2.3a0ccb76917070.5373277751432418292@collabora.com>
 <2025100944-spinning-clicker-4c03@gregkh>
In-Reply-To: <2025100944-spinning-clicker-4c03@gregkh>
From: Arisu Tachibana <arisu.tachibana@miraclelinux.com>
Date: Thu, 9 Oct 2025 22:58:18 +0900
X-Gm-Features: AS18NWB-dinXyttmmfIGxKuK2TW2K5SmaRvr1pM-tVbKbjjat0ajLTQpf9FyAdQ
Message-ID: <CANgtXuNUm=5pyYwQ_Z1EfK_7oKkU7a-VhUkw8h_1Xg9=j8OVXg@mail.gmail.com>
Subject: Re: CRA compliance
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>, kernelci <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 10:06=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Oct 09, 2025 at 09:51:44AM -0300, Gustavo Padovan wrote:
> > Hi Greg,
> >
> > ---- On Thu, 09 Oct 2025 07:48:45 -0300 Greg KH <gregkh@linuxfoundation=
.org> wrote ---
> >
> >  > On Thu, Oct 09, 2025 at 07:43:08PM +0900, Arisu Tachibana wrote:
> >  > > Hello everyone,
> >  > >
> >  > > as per the discussion of last week,
> >  > > for moving on with the CRA compliance topic.
> >  > > I propose to create a private mailing-list called
> >  > > security@kernelci.org or security-kernelci@lists.linux.dev
> >  > >
> >  > > any objection ? or suggestion?
> >  >
> >  > Why is this needed?  Kernel.ci isn't going to be a "steward" of anyt=
hing
> >  > used in a commercial offering, is it?  If not, what would it be for?
> >
> > Indeed. Although KernelCI offer free testing services to the community,=
 we are not offering any
> > products or commercial engagements. So we don't need CRA per se.  Howev=
er, on a related front
> > we are working with LF Legal to protect the testing services surfaces a=
s stuff that KernelCI creates
> > gets to run in internal networks across the industry.
>
> That's great, but that has nothing to do with the CRA :)

right, that was my misunderstanding.
thanks for pointing it out :)

>
> > Then for security breaches in KernelCI, it would be a best practice to =
create kernelci-security@
> > mailing list for people to report issues and for us to community privat=
ely with parties running
> > KernelCI infra too.
>
> "communicate privately" =3D=3D "private communication channels" which ope=
ns
> up a TON of legal issues, as I am want to talk at length with :)
>
> Be VERY VERY VERY careful with this, there's a whole boatload of
> problems that you can get into when doing this as you are taking a
> public project's communications private to specific companies/entities.
>
> Anyway, having a security@ address is great to REPORT bugs to, but
> please refrain from using that to attempt to coordinate security fix
> rollouts.  That way lies a death by a thousand paper cuts and
> potentially talking to government entities when you least expect it.
>
> I can go into much more detail if people really want.
>

Would be nice to have more detail on this topic in the future.

--=20
thanks,
arisut
