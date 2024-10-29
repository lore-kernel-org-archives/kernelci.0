Received: from mailgw.nuclearcat.com (mailgw.nuclearcat.com [78.47.178.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835D26AFF
	for <kernelci@lists.linux.dev>; Tue, 29 Oct 2024 04:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.47.178.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730175368; cv=none; b=RBj4LwHd+Quj5UmaQ+L+pAwZx7jff1obno9PJNk9krCb3TyA5ftBY8FohZPhpAl6pqo3piKQShWf16sZwT48gV27d4MZa1D0QzTmSS7B00uoJrf15opt12sIXQOKG+kJdtt0llL62d1V8pd5qLVXhSMLH1sDtHWKHNWwYshrIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730175368; c=relaxed/simple;
	bh=kxLst7SF2L88tJNdZll/I2X0CRnBx7NmM/yZ7/n57So=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=oMVKSRfE8lJKhn7sBG6zOCBPdVkON8eUb0YIGOMHA5y5E0b3DHquek6h9FzCQishWY6booA0J4QAoDAZhES/J2VoJ2bL8i1Ta7nMC4skpWQI4lQx6qXlUSRpiEiXBH8FRaEGoeAuqD7VyXGzFGgxGCTjew9/qvQvgFDKuwH2MZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nuclearcat.com; spf=pass smtp.mailfrom=nuclearcat.com; dkim=pass (2048-bit key) header.d=nuclearcat.com header.i=@nuclearcat.com header.b=URl4HRv9; arc=none smtp.client-ip=78.47.178.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nuclearcat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuclearcat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuclearcat.com header.i=@nuclearcat.com header.b="URl4HRv9"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 15EB35F02B;
	Tue, 29 Oct 2024 06:10:44 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuclearcat.com;
	s=dkim; t=1730175044;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kxLst7SF2L88tJNdZll/I2X0CRnBx7NmM/yZ7/n57So=;
	b=URl4HRv9vXBG/fSMskjeAxaKhI6aaIPnMepB8fP4uu41QgzkAhRo9p0CeXcSsJVwGc/ast
	yWs3hTiWsUbw2XjM/xvScPUHjI4HXZb7DdnjIAvv03gRYArXElZndW49IWH/+sYBL8NB9s
	UfIHmn/MR4fg8L6iIOOOVV//msQ7qpH4I+E8PFLebM7jtpjtCbU+eFibTbqOA709I9c4tL
	am5s3JqL97fImrLmfjWAaBwXxTOd111SaLhN5XbizjTm/2YqwzNxu9adHyrW/lFu/56kZx
	4PGZqTJQLqGevTCe9A5TsDniiLlVIJYgcwsokx4m60Jo1T3S626SHdFwlqV9Fw==
From: "Denys Fedoryshchenko" <nuclearcat@nuclearcat.com>
In-Reply-To: <CAHRSSEyCAMtXogOHOUY=zVipGOrYSGcbe59OpGxr-1_RnK9+UA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <CAHRSSEyCAMtXogOHOUY=zVipGOrYSGcbe59OpGxr-1_RnK9+UA@mail.gmail.com>
Date: Tue, 29 Oct 2024 06:10:43 +0200
Cc: kernelci@lists.linux.dev, "Viktor Martensson" <vmartensson@google.com>, "Betty Zhou" <bettyzhou@google.com>
To: "Todd Kjos" <tkjos@google.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <44-67206080-b-17df13@5111824>
Subject: =?utf-8?q?Re=3A?= fix for kernelci =?utf-8?q?errors=3F?=
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None

On Tuesday, October 29, 2024 00:23 EET, Todd Kjos <tkjos@google.com> wr=
ote:

> I'm looking through the android kernel build failures using the new U=
I
> (still a little painful since it is missing some features compared to
> the old UI, but getting better). I have questions on 3 of our error
> cases:
>=20
> 1. android16-6.12 (gcc tools building *+allmodconfig):
> /bin/sh: 1: gawk: not found
> make[2]: *** [scripts/Makefile.vmlinux:47: modules.builtin.ranges] Er=
ror 127
> make[2]: *** Deleting file 'modules.builtin.ranges'
> make[1]: *** [/tmp/kci/linux/Makefile:1227: vmlinux] Error 2
> make: *** [Makefile:242: =5F=5Fsub-make] Error 2
>=20
> Is gawk missing on your build machines? How do we fix this?
PR with fix is already in the testing, likely will be merged today and =
pushed into production
https://github.com/kernelci/kernelci-core/pull/2723

>=20
> 2. android15-6.6 (clang tools building *+allmodconfig):
> drivers/i3c/master/svc-i3c-master.c:1100:29: error: variable 'reg' is
> uninitialized when used here [-Werror,-Wuninitialized]
>=20
> It looks like the stable kernels only have 1 clang build configured
> (x86=5F64=5Fdefconfig). Would it be possible to add an allmodconfig b=
uild
> using clang so we can compare our allmodconfig failures with the
> stable kernel?
Do you mean stable-rc kernels?

>=20
> 3. android-mainline
>=20
> Is there a reason that there are no allmodconfig builds of
> mainline.master? It would help us to know if we introduced an issue i=
f
> we could see the equivalent upstream build. It seems like it would
> also benefit upstream to see those issues early.
>=20
allmodconfig is quite heavy build, and as legacy is still running, we a=
re unable to use build capacity allocated for it, and Maestro-own build=
 capacity is limited. If it is just mainline master - we can try to run=
 it.

