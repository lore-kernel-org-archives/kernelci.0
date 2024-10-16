Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB97617CA1F
	for <kernelci@lists.linux.dev>; Wed, 16 Oct 2024 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729101631; cv=none; b=osl4/btnQv8G55f54xQZXfVZQ4qzXmYInbOr5T7M+yck0VUDp2Hg1kRr4bwY/GisUjZNyshx1LFWN01CBX16Xq5P3qamIcdjvpXRREHi70D5K7lGGo8yq9TUmDWSw7YDVZQWlcP/TAIy0zJZ4p9jO8T2elFQIv/duB+BfIlbISU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729101631; c=relaxed/simple;
	bh=r+DmvFoNHV+CnJHYXI7gzPRgz+47XKtZj3xP2+kaweE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgNRP+u+5bj/7eIKhf0ZN8oSMMGxHmJoGP4HdZ8aF9oOs7K+35uNAilizNlgoT/d1z3eP5lXB41yYpqttZLQ/VEBm4wHCURp5PWbwY+MHcpzT8OG8qD5NGvL2/2QUi/Yz/Uxn9FVhPF71dYF5aX10uZdn3G+ZQYjdse5JbMc/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ByC1IQ7t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ByC1IQ7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729101628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvuMUB+YxlmDY/Zh8jIKyjbgFDGsxUZWuqMUa3pIvIg=;
	b=ByC1IQ7tdH3S4oik0KqKX+dGZ6X8M6X9xCT277+ambPaauGyS156wG1RkvnUA3PH5lBFmb
	1eqUzgazc24+tnY6atztL7qK7oJO0wgAKhrId7AbYukM4CnmuMBvNnyVvEC0sVNUejQHrV
	9u1P6bTO1pePF2OkWzc2F0OGM79kGIU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-S2rWDvBhNaWsZEFfCAPLog-1; Wed, 16 Oct 2024 14:00:27 -0400
X-MC-Unique: S2rWDvBhNaWsZEFfCAPLog-1
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e28ef71f0d8so156453276.0
        for <kernelci@lists.linux.dev>; Wed, 16 Oct 2024 11:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729101625; x=1729706425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvuMUB+YxlmDY/Zh8jIKyjbgFDGsxUZWuqMUa3pIvIg=;
        b=HPzFQiPlK2V5iodYV3LseKvt0bER6IdwmnUPLRpsSjXCQ7Te5F2+Ah9g4h7W53gdJZ
         GFDB0ilZJRHi5c0PHqfQ/dDblT9CGbIYi/2IfJnSgfdPUPMrWzRpp+wn8zEMRSzNhLIU
         pnByknIHqe4GfnPPnbWc6o3Wpb/x2a4+YM37ph2uwzk1GJ1lSjWPVWgwxBL7JO7loJJ9
         OjO7qTCP2GW+rVtvwo3sb4e1hbFWSSrFTHXeQ1Fw/PxUj/0D/h5UUW7AIRs//iYE+8wP
         6aXqjYZ3NEQnAz5CVT0/wxngJbej1f+5X6YG2sTTEkDPhroRwKru0oZFtwJu3tIURYXu
         0OjA==
X-Forwarded-Encrypted: i=1; AJvYcCUSfB9Vn/jBIjqbPtDZ7MqLkgTwnhMb+QNdydTlK/0rpm2yvtvIVainh4b2DGsxOrNAnibA9c23gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGnGjGZYWB6buODq3jYS73yniycicDl8rh2LCjQ4AFtz8drc95
	5ThROxkdvh8O/cQnoeSNpMw450dv9QDTrBnfDflr4SozuAeD8K7JQZGCIlrDmAWf0a/gqBJOg08
	W5+mxEN8sAp7F5O5X53Wg2H/AGy/2Y8gfGfDlsTXKqP6pbMv9Itdel7lIrCCi37Pun+qPnSTUeO
	UIR/yF7KaUdl1X1coMFwFeJVHhqamOktQ=
X-Received: by 2002:a05:6902:c0f:b0:e29:27d:5ef3 with SMTP id 3f1490d57ef6-e2931dff424mr14365278276.49.1729101625268;
        Wed, 16 Oct 2024 11:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhz8e+7URFfxiW/PklUAF5rnrkDwYncm2dP2uHkzA3LG2V9PbPovLITgY/L/70RBjZGAhZeCG/lR9PRW6v/GQ=
X-Received: by 2002:a05:6902:c0f:b0:e29:27d:5ef3 with SMTP id
 3f1490d57ef6-e2931dff424mr14365229276.49.1729101624915; Wed, 16 Oct 2024
 11:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK18DXYitS7hL1mA3QsPLmW9-R0q6Kin0C5Uv9fj=uS90WSnxA@mail.gmail.com>
 <MW5PR13MB5632C443F9D7E658168BC77DFD452@MW5PR13MB5632.namprd13.prod.outlook.com>
In-Reply-To: <MW5PR13MB5632C443F9D7E658168BC77DFD452@MW5PR13MB5632.namprd13.prod.outlook.com>
From: Donald Zickus <dzickus@redhat.com>
Date: Wed, 16 Oct 2024 14:00:14 -0400
Message-ID: <CAK18DXZ64XwjgeMEJSBPE+Sunq-fK3TupcOw=5ynpzdTL5H6vg@mail.gmail.com>
Subject: Re: [Automated-testing] [RFC] Test catalog template
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	"automated-testing@lists.yoctoproject.org" <automated-testing@lists.yoctoproject.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, kernelci <kernelci@lists.linux.dev>, 
	Nikolai Kondrashov <nkondras@redhat.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, 
	kernelci-members <kernelci-members@groups.io>, 
	"laura.nao@collabora.com" <laura.nao@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

On Tue, Oct 15, 2024 at 12:01=E2=80=AFPM Bird, Tim <Tim.Bird@sony.com> wrot=
e:
>
> > -----Original Message-----
> > From: automated-testing@lists.yoctoproject.org <automated-testing@lists=
.yoctoproject.org> On Behalf Of Don Zickus
> > Hi,
> >
> > At Linux Plumbers, a few dozen of us gathered together to discuss how
> > to expose what tests subsystem maintainers would like to run for every
> > patch submitted or when CI runs tests.  We agreed on a mock up of a
> > yaml template to start gathering info.  The yaml file could be
> > temporarily stored on kernelci.org until a more permanent home could
> > be found.  Attached is a template to start the conversation.
> >
> Don,
>
> I'm interested in this initiative.  Is discussion going to be on a kernel=
 mailing
> list, or on this e-mail, or somewhere else?

I was going to keep it on this mailing list.  Open to adding other
lists or moving it.

>
> See a few comments below.
>
> > Longer story.
> >
> > The current problem is CI systems are not unanimous about what tests
> > they run on submitted patches or git branches.  This makes it
> > difficult to figure out why a test failed or how to reproduce.
> > Further, it isn't always clear what tests a normal contributor should
> > run before posting patches.
> >
> > It has been long communicated that the tests LTP, xfstest and/or
> > kselftests should be the tests  to run.
> Just saying "LTP" is not granular enough.  LTP has hundreds of individual
> test programs, and it would be useful to specify the individual tests
> from LTP that should be run per sub-system.

Agreed.  Just reiterating what Greg has told me.

>
> I was particularly intrigued by the presentation at Plumbers about
> test coverage.  It would be nice to have data (or easily replicable
> methods) for determining the code coverage of a test or set of
> tests, to indicate what parts of the kernel are being missed
> and help drive new test development.

It would be nice.  I see that as orthogonal to this effort for now.
But I think this might be a good step towards that idea.

>
> > However, not all maintainers
> > use those tests for their subsystems.  I am hoping to either capture
> > those tests or find ways to convince them to add their tests to the
> > preferred locations.
> >
> > The goal is for a given subsystem (defined in MAINTAINERS), define a
> > set of tests that should be run for any contributions to that
> > subsystem.  The hope is the collective CI results can be triaged
> > collectively (because they are related) and even have the numerous
> > flakes waived collectively  (same reason) improving the ability to
> > find and debug new test failures.  Because the tests and process are
> > known, having a human help debug any failures becomes easier.
> >
> > The plan is to put together a minimal yaml template that gets us going
> > (even if it is not optimized yet) and aim for about a dozen or so
> > subsystems.  At that point we should have enough feedback to promote
> > this more seriously and talk optimizations.
>
> Sounds like a good place to start.  Do we have some candidate sub-systems
> in mind?  Has anyone volunteered to lead the way?

At our meeting, someone suggested Kunit as it was easy to understand
for starters and then add a few other volunteer systems in.  I know we
have a few maintainers who can probably help us get started.  I think
arm and media were ones thrown about at our meeting.

>
> >
> > Feedback encouraged.
> >
> > Cheers,
> > Don
> >
> > ---
> > # List of tests by subsystem
> > #
> > # Tests should adhere to KTAP definitions for results
> > #
> > # Description of section entries
> > #
> > #  maintainer:    test maintainer - name <email>
> > #  list:                mailing list for discussion
> > #  version:         stable version of the test
> > #  dependency: necessary distro package for testing
> > #  test:
> > #    path:            internal git path or url to fetch from
> > #    cmd:            command to run; ability to run locally
> > #    param:         additional param necessary to run test
> > #  hardware:      hardware necessary for validation
>
> Is this something new in MAINTAINERS, or is it a separate file?

For now a separate file.  It isn't clear where this could go long
term.  The thought was to gather data to see what is necessary first.
Long term it will probably stay a separate file. *shrugs*

>
> > #
> > # Subsystems (alphabetical)
> >
> > KUNIT TEST:
> >   maintainer:
> >     - name: name1
> >       email: email1
> >     - name: name2
> >       email: email2
> >   list:
> >   version:
> >   dependency:
> >     - dep1
> >     - dep2
> >   test:
> >     - path: tools/testing/kunit
> >       cmd:
> >       param:
> >     - path:
> >       cmd:
> >       param:
> >   hardware: none
>
> Looks OK so far - it'd be nice to have a few concrete examples.

Fair enough.  Let me try and work on some.

Cheers,
Don

>  -- Tim
>

