Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882011CBE
	for <kernelci@lists.linux.dev>; Mon, 28 Aug 2023 16:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2ACC433C8
	for <kernelci@lists.linux.dev>; Mon, 28 Aug 2023 16:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693240646;
	bh=5/rxVeG6x8nfv9WdsXwFM5Izp0kRg7av+TJmtt40YZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dEryC2PtnaWP4fKdHKnen//f81/NyciXir5OjQ3AGq2NKPv5k12MJkef/K1iCDj8m
	 vQq3UaW9+xFj4PIp0ilLQUJ5OzCR83XPre7KE98abqKqwsMIM6oW2glu886EsgddeH
	 /O/4NDhJsdaoziykk4I/LLmgIaFrMdOvNNGVe1FVzkm7JQfLCTZYVhkz3gKgGHiUFA
	 9ZuGjPkVbYRH+DbFhg12zQBvtiRyVBpNh9yZIvvOhbmhr2IJdWB8uvzzshr5UtZ/23
	 yBKMHRcVYcP1PKkw0uWxlfdUn6nL10M87WJYuG/YtpKQw1bLIyslYkCzQKbwvQS50t
	 1TaiMCnOdaBfQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b703a0453fso50468581fa.3
        for <kernelci@lists.linux.dev>; Mon, 28 Aug 2023 09:37:25 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz7R+bgZy0b99mrkrAOajQopOoM7hJ732YZCnpYKrv0LRlMAhl0
	mwmlV9EJ+cpr+UFLuyA6txZtUiXKu+CzKA7t9Q==
X-Google-Smtp-Source: AGHT+IHFxk8DWeEarqMDPvqi+IlBzRLuZt0EOmcKGY4FQSVxQ1otfV7rimOsurYef1JzMoJPiH7UCcrydqBfPG0VEMU=
X-Received: by 2002:a05:651c:154e:b0:2bd:bc9:4f71 with SMTP id
 y14-20020a05651c154e00b002bd0bc94f71mr3700640ljp.18.1693240643938; Mon, 28
 Aug 2023 09:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230817233635.2306377-1-nfraprado@collabora.com>
 <20230817233635.2306377-4-nfraprado@collabora.com> <CAL_JsqLyimRvcnL_O8sMB8SnezXv3Z431VckMC-26w-aT1nYmQ@mail.gmail.com>
 <12afe9a4-6d5c-4a0f-b5f8-6db346f60d08@notapiano>
In-Reply-To: <12afe9a4-6d5c-4a0f-b5f8-6db346f60d08@notapiano>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Aug 2023 11:37:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKroreUv7MviWe7c2fTU8wXRnXP7XSBNub6KgMZQiYiRw@mail.gmail.com>
Message-ID: <CAL_JsqKroreUv7MviWe7c2fTU8wXRnXP7XSBNub6KgMZQiYiRw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] kselftest: Add new test for detecting unprobed
 Devicetree devices
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Mark Brown <broonie@kernel.org>, kernelci@lists.linux.dev, 
	Guenter Roeck <groeck@chromium.org>, kernel@collabora.com, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 11:38=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Fri, Aug 18, 2023 at 10:05:00AM -0500, Rob Herring wrote:
> > On Thu, Aug 17, 2023 at 6:36=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> [..]
> > >  tools/testing/selftests/Makefile              |  1 +
> > >  tools/testing/selftests/dt/.gitignore         |  1 +
> > >  tools/testing/selftests/dt/Makefile           | 21 +++++
> >
> > Please add this path to DT maintainers entry.
>
> OK.
>
> >
> > >  .../selftests/dt/compatible_ignore_list       |  1 +
> > >  tools/testing/selftests/dt/ktap_helpers.sh    | 57 +++++++++++++
> >
> > As Mark said, looks common.
>
> Yes, I'll move it one folder up.
>
> >
> [..]
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/dt/.gitignore
> > > @@ -0,0 +1 @@
> > > +compatible_list
> >
> > Not sure on the selftests, but is this enough that it gets cleaned?
>
> I've just double-checked that compatible_list does get removed with make =
clean.
> Not because it is in this gitignore, but because it is listed in TEST_GEN=
_FILES
> in the Makefile.
>
> >
> [..]
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/dt/test_unprobed_devices.sh
> [..]
> > > +PDT=3D/proc/device-tree/
> >
> > This is considered the legacy path though we will probably never get
> > rid of it. Use the sysfs path instead.
>
> The /sys/firmware/devicetree/* entry in
> Documentation/ABI/testing/sysfs-firmware-ofw reads:
>
> Userspace must not use the /sys/firmware/devicetree/base
> path directly, but instead should follow /proc/device-tree
> symlink. It is possible that the absolute path will change
> in the future, but the symlink is the stable ABI.
>
> So is this information outdated?

No, my memory is just wrong...

Rob
