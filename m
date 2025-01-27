Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D2418A6A1
	for <kernelci@lists.linux.dev>; Mon, 27 Jan 2025 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004760; cv=none; b=mmUy2Ta7cruPm7bBbpjFS6BFYKVIYvF2MqwixvEzLev6DiJyTl64Lrl/2Y13/eXvkVWhTMidwpVEAGbrnAmRY9X3rvo6LTFPOIQBrJLHelDveJNC5c6rwkjBcWrJ9Fq5YQzSB7PJVW7wXi+DQIST7N4SZuisaIqSRm8IAZi6C1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004760; c=relaxed/simple;
	bh=HnTMoUG4dF2vVS5CZSVNz97wU/G3QgT1IJKqTX1YryY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q23vp+qRyf6mQLjGkD2UNCjj0wVOuAK7yOeEu22+hcs5BoIuQLRc6Nu7L4Ih018mQ7+9qTsXXe6Jt/xeB9AFfRL+PrrzOc4d8FbIqkutQZ6mBQh5f38y5Z/LrWoZnGjetnt9Yc+T1Hz2Lzf76vCLvWtoi2Nm/Yb+C012q4F0n6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8+MIWD9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8+MIWD9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so6409618a91.3
        for <kernelci@lists.linux.dev>; Mon, 27 Jan 2025 11:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738004757; x=1738609557; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FgpSNPeAjFZp+XVJ99wWjxWH+/lWeKYYdQIoeMWl0ls=;
        b=O8+MIWD9VjWBRjDUfECP4AmgY5NimCtH39wovsa7P0iigGWrIgzgmO8rU+1jh5xVli
         Y30LhEx7mRF389y/87bvLQmqS2ysOSrQtmoDJYeeINOQ+7G+Kau4Yht88bSDHsuu22m6
         OCopp4uKxdR5SOIanEwVTdnZ1IUGUCfZ/h+No8XxZ3Earkl2adFhxlEYLQEG56hEXU8G
         sOcyoLf6qia6crGOpUya5ARZL1zkzAguiQOOr2h4brNq7Iyv3kXqKKT9vE7zNrvYO6Tv
         IdWm6QSW9Mwo5vFrb4k4XRuOShNNKK5QowjDY0OrrhbuBRLCg0JyMKcF1bKUWwCCeXtB
         b+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738004757; x=1738609557;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FgpSNPeAjFZp+XVJ99wWjxWH+/lWeKYYdQIoeMWl0ls=;
        b=jl6f9eGpA6Cint/2W2P3avLv51DnQBIy0ZywGsLSDN1fPMYIgKCRfWrVUMTJ8pwVw4
         MfOeUclOd7tABm/dy2qGEXYYRRrSbgdkGlpaEZ63R7c+6wmEjb6f6lkWBNih74nAlrpj
         W6M+1yaeTyCnbEjKCXlrfhi3CGF21aRZ7vx9rhq9nUMWzUmO++uIDW6Gk6m+lJjFfLHA
         JtgBxmz5ON/aG42mx7Qis72oyoRfDq09CAMmuqQDw3hE00S6fepwePnb7vYXzMUlppAI
         Rori7xSqoBbixv8Ch131Z8mDfS0vpVQw5b0n2VWt2h5WlbusKsRpvS/oDQkPTX03h9lZ
         7iGQ==
X-Gm-Message-State: AOJu0YwQozpSxMnxkSB14GW/WDjXzCuaGYmA4ySDNRjbzuLufa3WPe7c
	VG4QEIT6RWBLKmg7TTiOghdp+M8mk5FKLUPJj2GAjvrPeSgXG39A+baRGchA
X-Gm-Gg: ASbGncsIWIpqarJsXO3Nz0oeJnGOTrusNTY68p4ADoaIfjb34wiyIeE3cRGZ9xAhgp8
	oDiqvc+pi7qV9fhitojZiNw0RFA/R9d8S+wwD1scIiUR1Kh9FZSzrFGbg/olDOF0WWPnBOOLM1C
	psFBwP/Tl0fF9HgVIZSZbsYcVY5a0S5FdKFiLk7kSmPh+KRr+lSfo+vo4IlWwyT/rhJtvLIvN8c
	AmInSZk8fedXUtLFmUIfXzRkzhjxWivBwzCfCjYLXbZFFtG80g9ZoF1q7SU34HD9h5s1QZYpCk3
	pIp5VifFDOtJObY4A2JPtU8gF8ITWy7wWIj4OVIRST33OJ70eR0=
X-Google-Smtp-Source: AGHT+IGV7gPf93QQO1WJVtV/nW0FDXYUQssyR5CStDGifbGwwzQP3dnpV8mOxs8Y4y2sm2ikFERqIA==
X-Received: by 2002:a17:90a:d648:b0:2ee:3cc1:793a with SMTP id 98e67ed59e1d1-2f782d8c178mr8304612a91.29.1738004757474;
        Mon, 27 Jan 2025 11:05:57 -0800 (PST)
Received: from ?IPv6:2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb? ([2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf8f03sm7546423a91.39.2025.01.27.11.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 11:05:57 -0800 (PST)
Message-ID: <a6816a68e5e9aeb1d330b68f6a73decd2233c164.camel@gmail.com>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Vignesh Raman <vignesh.raman@collabora.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: kernelci@lists.linux.dev, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, 	mripard@kernel.org,
 linux-kernel@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, 	gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, 	tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org, 
	kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
	cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
	kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, 	daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com, 
	denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, 	hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, 	Tim.Bird@sony.com, broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, 	geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, 	jarkko@kernel.org
Date: Mon, 27 Jan 2025 16:05:47 -0300
In-Reply-To: <6ebd1551-017f-4b31-b235-829b2735d78f@collabora.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
	 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
	 <20250124081250.GA24731@pendragon.ideasonboard.com>
	 <6ebd1551-017f-4b31-b235-829b2735d78f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-01-27 at 13:02 +0530, Vignesh Raman wrote:
> Hi Leo,
>=20
> On 24/01/25 13:42, Laurent Pinchart wrote:
> > On Fri, Jan 24, 2025 at 02:11:26AM -0300, Leonardo Br=C3=A1s wrote:
> > > On Thu, 2025-01-23 at 19:23 +0530, Vignesh Raman wrote:
> > > > This patch series introduces "kci-gitlab," a GitLab CI pipeline
> > > > specifically designed for kernel testing. It provides kernel
> > > > developers with an integrated, efficient, and flexible testing
> > > > framework using GitLab's CI/CD capabilities. This patch includes
> > > > a .gitlab-ci file in the tools/ci/gitlab-ci/ folder, along with
> > > > additional YAML and script files, to define a basic test pipeline
> > > > triggered by code pushes to a GitLab-CI instance.
> > > > The initial version implements:
> > > >     =20
> > > > - Static checks: Includes checkpatch and smatch for code validation=
.
> > > > - Build tests: Covers various architectures and configurations.
> > > > - Boot tests: Utilizes virtme for basic boot testing.
> > > >=20
> > > > Additionally, it introduces a flexible "scenarios" mechanism to
> > > > support subsystem-specific extensions.
> > > >=20
> > > > This series also introduces a drm scenario that adds a job to run I=
GT
> > > > tests for vkms. This scenario includes helper scripts to build deqp=
-runner
> > > > and IGT, leveraging approaches from the drm-ci/mesa-ci project.
> > > >=20
> > > > We are working towards creating a generic, upstream GitLab-CI pipel=
ine
> > > > (kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI p=
ipeline
> > > > is designed with a distributed infrastructure model, making it poss=
ible
> > > > to run on any gitLab instance. We plan to leverage KernelCI [2] as =
the
> > > > backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
> > > > integration.
> > > >=20
> > > > For an example of a fully executed pipeline with drm scenario set,
> > > > including documentation generation,
> > > > see: https://gitlab.freedesktop.org/vigneshraman/kernel/-/pipelines=
/1350262
> > > >=20
> > > > Please refer to the documentation included in the patch, or check t=
he
> > > > rendered version, here:
> > > > https://vigneshraman.pages.freedesktop.org/-/kernel/-/jobs/69787927=
/artifacts/artifacts/Documentation-output/ci/gitlab-ci/gitlab-ci.html
> > > >=20
> > > > Differences from v1 to v2:
> > > > - moved to tools/ci as suggested by Linus on the previous version
> > > > - add arm64 containers for native compilation
> > > > - added boot tests using virtme: this is the base structure for boo=
t tests,
> > > >    next steps would be adding other tests such as kselftests/kunit =
tests
> > > > - added DRM scenario testing on vkms: this should replace current v=
kms test
> > > >    in drm-ci. This work shows how a test scenario can be used by di=
fferent
> > > >    subsystems to add their tests.
> > > > - update documentation
> > > >=20
> > > > For more details on the motivation behind this work, please refer t=
o the
> > > > cover letter of v1: https://patchwork.kernel.org/project/linux-ksel=
ftest/cover/20240228225527.1052240-1-helen.koike@collabora.com/
> > > >=20
> > > > [1] https://www.collabora.com/news-and-blog/blog/2024/02/08/drm-ci-=
a-gitlab-ci-pipeline-for-linux-kernel-testing/
> > > > [2] https://kernelci.org/
> > > > [3] https://docs.kernelci.org/kcidb/
> > > >=20
> > > > Helen Koike (3):
> > > >    kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
> > > >    kci-gitlab: Add documentation
> > > >    kci-gitlab: docs: Add images
> > > >=20
> > > > Vignesh Raman (2):
> > > >    MAINTAINERS: Add an entry for ci automated testing
> > > >    kci-gitlab: Add drm scenario
> > >=20
> > > Hi Vignesh Raman,
> > > I am very happy to see this project going forward :)
> > >=20
> > > It's been a few years since I first thought on finding a good way of =
helping
> > > kernel developers testing their patches, while making use of the free=
 runner
> > > minutes Gitlab offers. It can greatly simplify the testing for people=
 who are
> > > new to kernel development, or students trying to understand it better=
.
> > >=20
> > > And this patchset allows that to happen :)
>=20
> Thanks for testing the patch and providing feedback.

:)

>=20
> > >=20
> > > Actually, I spoke to Helen last year, and to enable it to run on the =
free
> > > Gitlab-CI runners, there is a small extra patch which is needed:
> > >=20
> > > https://lore.kernel.org/all/20240327013055.139494-2-leobras@redhat.co=
m/
>=20
> Thanks for the patch.

Thank you for most of the work, it sure will be useful :)

>=20
> We can keep the variable name as KCI_CI_TAGS (like other variables) and=
=20
> add it in variables with default empty string.

Just tested, if it's an empty string, it will just be ignored, as it won't =
match
anything (that is not an empty string)

>=20
> >=20
> > Gitlab as an open-source software project (the community edition) is on=
e
> > thing, but can we please avoid advertising specific proprietary service=
s
> > in the kernel documentation ?
>=20
> Agree. We could remove the lines which mentions gitlab.com SaaS in
> commit message and documentation.

Done :)
Added a generic reason for needing better instance

>=20
> >=20
> > > Could you please apply it on top of your tree?
> > > Some stuff changed places, but I can send a v2 with that fix if you w=
ant.
>=20
> I will test your patch and we can add this for v3.

Thanks!
That's the v2 with the required changes:

https://lore.kernel.org/all/20250127185849.34131-1-leobras@redhat.com/T/#u

Please let me know if any further change is needed.

Thanks!
Leo

>=20
> Regards,
> Vignesh
>=20
> > >=20
> > >=20
> > > While I have yet to review this v2 patchset, I applied it on my repo =
for
> > > testing,=C2=A0and cherry-picked the patch on above link, triggering a=
 Pipeline:
> > >=20
> > > https://gitlab.com/linux-kernel/linux/-/pipelines/1638955600
> > >=20
> > > It seems to be working fine, please check it, as you may be more used=
 to the
> > > results.
> > >=20
> > > Thanks!
> > > Leo
> >=20

