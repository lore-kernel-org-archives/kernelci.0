Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD6F4AE8AD
	for <kernelci@lists.linux.dev>; Wed,  2 Sep 2026 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384296; cv=none; b=V3fDJ3FIPAHyqDaUR2zXEhUEFsP+yeClR7xsPOZVtvng+N2huOlak/n+7FVhrEwsA8378o46RRchi93w1r8EM9X/uLD09k/Gsjm4yI6n8HqRZjh1IeaM+2XAiV0/v5gYjykFW7s9XR+dbB48MiTS8sky/92PHg6AGYaUlDzGbAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384296; c=relaxed/simple;
	bh=bG9eK7IV/z0sYufLfLk/AhqH+PBHHmaj8aQo8OUzC3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITR6SYr1ghV2K87eunQOBDKGqjEO+RATB3mUvm9AFDQo6yAe/IToCh+zsAvrYi5IM6zQWf3WXRG2OzuEbsAXNjOoA+JTH//I1S+6Kca3TCjgu8nSu2ochmDE+zhylODsWcVC8/0kkJUremoBTdlfY4JIXQi1+577haqhDP6M6QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FVV/crEF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FVV/crEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788384289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nb5GQz80jpxP88BxAkfhnCDQ1bUosHVUulU5wn0czO8=;
	b=FVV/crEFjhb5EJwZi+ShKR/ObhpNA2iKNwAyrqpLKmqVdBj6UZprsseBfIo8OZFOTQCmqU
	z3ZsOzT0yWO2aOaIghg1O5Vy/AbA5sv2aTNBHdYwI7xn9giWXxlLmuiSOF+QHLB8EcK76n
	BLDMaftz0JKv3waPe1IqPBfjVlUp6Cg=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-GYt8H7plNSC6k_NEYMKrqA-1; Wed, 02 Sep 2026 17:24:48 -0400
X-MC-Unique: GYt8H7plNSC6k_NEYMKrqA-1
X-Mimecast-MFC-AGG-ID: GYt8H7plNSC6k_NEYMKrqA_1788384288
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7828cdd1214so265005137.3
        for <kernelci@lists.linux.dev>; Wed, 02 Sep 2026 14:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384288; x=1788989088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nb5GQz80jpxP88BxAkfhnCDQ1bUosHVUulU5wn0czO8=;
        b=cjXb1NtNItHDl0Rl3fbXi6WC/DWGjBJr3CYVFfznxPmT5cbAnf1oZq7n5uchbrcxLa
         4OZjtUDdqM2qQXWih/eenZQIMKfFAF5UhYRYSvq1nnQ+7TtPw3+jg2gjJ+/zsW0VlxaQ
         epeoRNfoPbxmJVxVBgG2Vym+2wNWFj5FYeBDokBBFsP3DAuTIYOfg/PmSu5JQkdgjrxA
         OBHA6BYF//a13vb8dLFCpXspSkX4V/5NgpYoMgZxXylQV4eZ/NxfXZ0t4XK55bTDAGYJ
         omIwtrWOd8mnbHooK+UjPz/G+8OHUnHiqAHOMYoNkZECiCXJio+b7+u3Nluqsb9xfks5
         pY4A==
X-Gm-Message-State: AFuF++lm0CG7CP4eVKyBcexTCfqJ2dGIXPT9+I+HG6JlEh1FNr99JIKN
	PvyMTgZfMqG8+K45dRxh4hvmeGSkaLFSmVPpeyR4jk95pRI6auX9g5tVPnvj1U8r3CsLOAooW45
	M136oQGhTxOrVcgzmMSVSFgFKlc2DUtIOL3PsRe/FXjf3IHwk48IaZpH4gYDy+thigX9QbU53Wc
	9zUpN6ikPElsIb3XINI5dBlX6xQMU+CUPQ9No=
X-Gm-Gg: AYBFou2N1dl1vm6v2BpGkM1uO/EnJ5xbBV01Ajh14n4q1bYNsrdfTvJ9p40wjsYLEac
	6AVMhcVrOVNM5csRUdb4x9yucxUSme4tyjDrgCeypLkpiRS6LUaLiQJd6uH1IfA4wY2mI+p7Wxh
	JUxjDM37LSnpHnMDc4zjDfbR4vcm4iI2vYMEYn9ghi1yAR3BpLsenwMbEKItDIZMc58qDllX+ru
	ibksAn1O1EBv2eLBK113GriHZRLQVjzMld8Z4qhhmwNTINweg==
X-Received: by 2002:a05:6102:fa0:b0:789:100e:3d1c with SMTP id ada2fe7eead31-78a1f26c9b1mr2530395137.5.1788384287909;
        Wed, 02 Sep 2026 14:24:47 -0700 (PDT)
X-Received: by 2002:a05:6102:fa0:b0:789:100e:3d1c with SMTP id
 ada2fe7eead31-78a1f26c9b1mr2530387137.5.1788384287412; Wed, 02 Sep 2026
 14:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKKBm2tcCasKYq72u=dBxzKxPUhK7tJWtxThEht2Hpd+bG9FrA@mail.gmail.com>
In-Reply-To: <CAKKBm2tcCasKYq72u=dBxzKxPUhK7tJWtxThEht2Hpd+bG9FrA@mail.gmail.com>
From: Tales da Aparecida <tales.aparecida@redhat.com>
Date: Wed, 2 Sep 2026 18:24:11 -0300
X-Gm-Features: AcwNN1W6ekTyZ49sF2Ir455IDiZB2skrRsLGAvSmJTaw8IalWKeFCwaE0ziMHVs
Message-ID: <CAPo4OxT0kiCP5uFSDXN-96a71iVao5A-iGvzzOT3sKdgYe9WNg@mail.gmail.com>
Subject: Re: Dashboard Updates: UX / CI improvements and Lab consistency.
To: Alan Zanoni Peixinho <alan.peixinho@profusion.mobi>
Cc: kernelci@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PcJbYgEjfB27a9OSArIDdz8IL_HlmWbLvgUFZMcFNgw_1788384288
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 6:18=E2=80=AFPM Alan Zanoni Peixinho
<alan.peixinho@profusion.mobi> wrote:
>
> Hello KernelCI community,
>
> We have deployed a few updates and fixes to the dashboard. You can
> check out the live site here: https://dashboard.kernelci.org.
>
>  UX
>     =E2=80=A2 Trees now have a Compare page: pick two checkouts and see s=
tatus
> summary counts, plus builds, boots, and tests that were added,
> removed, or changed status between A and B.

This is a fun one! Are you collecting feedback in a github ticket?

>     =E2=80=A2 Issue details now show first/last seen per tree, and a link=
 to
> the first good checkout after the issue appeared, so you can tell
> whether a failure is tree-specific and where it cleared.
>     =E2=80=A2 Cosmetic enhancements on the commit history plot.
>     =E2=80=A2 Bugfix on tests table to keep column widths stable while so=
rting
> and paging.
>     =E2=80=A2 Bugfix on stale frontend cache. Avoiding frontend crash on =
schema updates.
>     =E2=80=A2 Hardware revision selectors work correctly for cross-origin=
 builds/tests.
>
>   BACKEND
>     =E2=80=A2 Builds and tests are now tied to labs in the database, so l=
ab
> filtering and display should be more consistent as data backfills.
>
> CI
>     =E2=80=A2 Schema migrations are safer on large shared Postgres, a tim=
eout
> for lock avoid that new deploys cause a lock contention on production
> database.
>
>   Best,
>   Alan Peixinho
>   KCI Dashboard Team
>

--=20
Tales

