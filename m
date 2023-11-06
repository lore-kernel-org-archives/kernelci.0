Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7B229CEC
	for <kernelci@lists.linux.dev>; Mon,  6 Nov 2023 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQaJvupT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369FCC433C9
	for <kernelci@lists.linux.dev>; Mon,  6 Nov 2023 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699290598;
	bh=UFzUofNNLBASgkPIJgDuNdjyCEGP5bQHseuE8TRa7W0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hQaJvupT4KjzsBJdf632gxvpFt08jPP2HUDi32DeJFMsVaQqfn9+Ll6lnsXFhbVsU
	 +b+Uav8d70GJwoVLBcWGbauVZbqJyurllHJlodYjkF6SDrEnGz3fnAOCBkBac+VmM2
	 phkpuBXi7HP8IMxpaip3rkmLqlZcM7mVARX6ASdBtDbHE+vnJaf+kRheCDZAmVo1ON
	 luwtZETkz9Wbr8zxDVN1wz4WWSh0J+fC7LZ4QWtWv/MT1K/1X5AcAZwsLPk40G7sB1
	 iEPNu4LejFDtl2mkefC5ZDw8eZsClBKglllw9L+IK68px2zWyh4hNO2BAaNrlk34XZ
	 7xZTEWkPoai4w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50931355d48so6319043e87.3
        for <kernelci@lists.linux.dev>; Mon, 06 Nov 2023 09:09:58 -0800 (PST)
X-Gm-Message-State: AOJu0YzoDRci/nxk7Kn6SrZ0PdKHazlZ0rZckJLzu/FA3uY1zbhFWKrQ
	EWOdBZfJKt+qHzffjdVs8yGXGVRTarFAvcFfMw==
X-Google-Smtp-Source: AGHT+IGpMZ2uYxaFKvHqjpiuPBw5ga6h3w246K/OsJC2VAWaxh57/wBNpyznpCnRCwVbLEpl1hL6RVNZkRP/FNRR2yI=
X-Received: by 2002:ac2:53ab:0:b0:507:ce2f:8f0c with SMTP id
 j11-20020ac253ab000000b00507ce2f8f0cmr22254953lfh.35.1699290596382; Mon, 06
 Nov 2023 09:09:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230828211424.2964562-1-nfraprado@collabora.com>
 <20230828211424.2964562-4-nfraprado@collabora.com> <e90cb52f-d55b-d3ba-3933-6cc7b43fcfbc@arm.com>
 <CA+G9fYsbq28w7m-sf6LhMscXHdPs0cGXU7kK6YzjKdUFKuQ+6A@mail.gmail.com> <e72e144a-c617-4a9e-adfb-e25ddabeb4c7@sirena.org.uk>
In-Reply-To: <e72e144a-c617-4a9e-adfb-e25ddabeb4c7@sirena.org.uk>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 6 Nov 2023 11:09:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL-3O6omPf4HcPFctgid+br04QW5p81qDx0CPMqh_eXTg@mail.gmail.com>
Message-ID: <CAL_JsqL-3O6omPf4HcPFctgid+br04QW5p81qDx0CPMqh_eXTg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] kselftest: Add new test for detecting unprobed
 Devicetree devices
To: Mark Brown <broonie@kernel.org>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Aishwarya TCV <aishwarya.tcv@arm.com>, 
	kernelci@lists.linux.dev, kernel@collabora.com, 
	Guenter Roeck <groeck@chromium.org>, Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Frank Rowand <frowand.list@gmail.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Nov 02, 2023 at 07:15:58PM +0530, Naresh Kamboju wrote:
> > On Thu, 2 Nov 2023 at 17:41, Aishwarya TCV <aishwarya.tcv@arm.com> wrot=
e:
>
> > > https://storage.kernelci.org/mainline/master/v6.6-9152-gdeefd5024f07/=
arm64/defconfig%2Bkselftest/gcc-10/logs/kselftest.log
>
> ...
>
> > May be due to, A loop of symlinks that are pointing to self / same file=
s ?
>
> Right, it does look like something bad is going on with symlinks:
>
> > > '/tmp/kci/linux/tools/testing/selftests/../../../build/source/build/s=
ource/build/source/build/source/build/source/build/source/build/source/buil=
d/source/build/source/build/source/build/source/build/source/build/source/b=
uild/source/build/source/build/source/build/source/build/source/build/sourc=
e/build/source/build/source/build/source/build/source/build/source/build/so=
urce/build/source/build/source/build/source/build/source/build/source/build=
/source/build/source/build/source/build/source/build/source/build/source/bu=
ild/source/build/source/build/source/build/source/tools/testing/selftests/p=
owerpc/vphn/vphn.c'
>
> > Please build by using tuxmake and validate builds are working.
>
> Note that tuxmake does an in tree build of kselftest:
>
>   make --silent --keep-going --jobs=3D8 O=3D/home/tuxbuild/.cache/tuxmake=
/builds/1/build INSTALL_PATH=3D/home/tuxbuild/.cache/tuxmake/builds/1/build=
/kselftest_install ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- CROSS_CO=
MPILE_COMPAT=3Darm-linux-gnueabihf- 'CC=3Dsccache aarch64-linux-gnu-gcc' 'H=
OSTCC=3Dsccache gcc' kselftest-install
>
> and does it's own tarball build too, whereas kernelci does an out of
> tree build and uses kselftest-gen_tar:
>
>   make KBUILD_BUILD_USER=3DKernelCI FORMAT=3D.xz ARCH=3Darm64 HOSTCC=3Dgc=
c CROSS_COMPILE=3Daarch64-linux-gnu- CROSS_COMPILE_COMPAT=3Darm-linux-gnuea=
bihf- CC=3D"ccache aarch64-linux-gnu-gcc" O=3D/tmp/kci/linux/build -C/tmp/k=
ci/linux -j10 kselftest-gen_tar
>
> and that the error is in the dt-extract-compatibles program which is
> part of the kernel (well, imported into the kernel from dtc upstream):
>
>   File "/tmp/kci/linux/tools/testing/selftests/../../../scripts/dtc/dt-ex=
tract-compatibles", line 107, in <module>
>     compat_ignore_list.extend(parse_compatibles_to_ignore(f))
>
> This all suggests that something to do with how the build is set up is
> resulting in the source symlink that gets created for out of tree builds
> blowing up, I guess it's not specifically the DT stuff that's blowing it
> up but rather that it's tripping over an existing bug.  Really does look
> like a legitimate bug though, the source link is set up by the in tree
> kernel build infrastructure.
>
> I did poke a bit at reproducing outside of the KernelCI scripts but
> didn't manage to yet.

I can repro with "make dt_compatible_check". The problem is with an
'out of tree' build within the tree. That's my normal setup, but the
difference is I have ".build" directories. If I use "build" instead,
then I can repro. The issue is the iglob will recurse into "build" but
not hidden directories (by default). There's no option to not follow
symlinks which would solve this (there is an open python issue since
2017 to add it). I don't see a simple solution in python other than
getting a full list with glob(), convert to absolute paths, and remove
duplicates. I imagine that will be somewhat slow.

A simple solution would be instead of passing the source tree root to
dt-extract-compatibles, pass 'arch', 'drivers', and 'sound' instead.
There shouldn't be compatibles anywhere else.

Rob
