Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64580233724
	for <kernelci@lists.linux.dev>; Mon, 10 Mar 2025 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741631969; cv=pass; b=hQMJjlbrS27xa7OfR0+wj8/AOw8BC3KykU9daPoi8Bvrta0c/gNTqVc6Yp7wFIIU0Jup4yJidBxz0RpQyNHT8PscAWK3TFK7Un9J+/WfP6Vqr6iIgT7PmIZdWZZ85gzbrtPREKAvFnBPIV/xjruhoMbZ5ItB+F6Ham3BS5TYSKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741631969; c=relaxed/simple;
	bh=JodleHxU8auqOk7eKPgmUXmAmhSi5onV94LzG1GDay4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=gz2E+T/G2XyMCfTHZWLIkXHMMLKOI91DHG51MWu/0kiTWk7pkypmvdIyAoz/4hg5HDp9B+n+LPgzCtkA+/aDWWwCtLt/isb/yyduCjJa5sf4/dpuqkflkumyJ4uAUTU+7LSYg+zQ+3kbVQfy64Yg52dOqPPFUhNnm/Y7ZBzG7t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=fpzLhoXN; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="fpzLhoXN"
ARC-Seal: i=1; a=rsa-sha256; t=1741631963; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fVrlZTN7R0wHBUR+s/cLniXEW3JLR/6oSSXccumyt06An92elE0eeWsCRXlRYkN/N7Eut/NZWALZU8RVNqHfHgqn4BZI3cnICsnYcarh4RWYuefYzGnoW3WT5yNX+He0Myi73pVVvPXHZX3JRBTH5VGpIEks0lnLE4kl7BiNtSg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741631963; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=468sJrXZ+V4zuxgMEr1aqRkIj5cjIeNBfhaJ43Aw1xE=; 
	b=NlmH25+eIEBGByQVvkzgQKSWfRP6qKHN1I+h5+QWasnYYSzla6fykoMBAtURu1UaZnB55TGlSkhatzOi2xMolKBX4uwd3sALrJYCq8Z1b1jb+6U+/pQVitbFPaJBsPs2rgo5ctAlndj5X4Kv9gTFVG9701k6oZ+wSadM0Y1PV2o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741631963;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=468sJrXZ+V4zuxgMEr1aqRkIj5cjIeNBfhaJ43Aw1xE=;
	b=fpzLhoXNnlEFZfyPSFLpfwuep2VFFcDv5SVzjHNdOqm9Jmm+JYj91SOh+kRaR/OJ
	wlqdhvj8kkXmMPQg+MjMTQgoVUspMYb5oM+Ru6B3vLH/iYZ1pP9U3YuKPNftGwHG/cJ
	ir2owOok41gq4CSWH9laCJLCm/Kaz0yi18s4FfU0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1741631960605256.3645432837759; Mon, 10 Mar 2025 11:39:20 -0700 (PDT)
Date: Mon, 10 Mar 2025 15:39:20 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci" <kernelci@lists.linux.dev>
Cc: "KernelCI bot" <bot@kernelci.org>,
	"kernelci-results" <kernelci-results@groups.io>,
	"laura.nao" <laura.nao@collabora.com>,
	"shreeya.patel" <shreeya.patel@collabora.com>,
	"broonie" <broonie@kernel.org>
Message-ID: <195815ab607.bf540e76296063.33475753614546096@collabora.com>
In-Reply-To: <CACo-S-2=+1-ULWw+eym6mKRQw8===8BP_1njeZF28m+s7jrzuw@mail.gmail.com>
References: <CACo-S-2=+1-ULWw+eym6mKRQw8===8BP_1njeZF28m+s7jrzuw@mail.gmail.com>
Subject: Re: [STATUS] mainline/master -
 80e54e84911a923c40d7bee33a34c1b4be148d7a
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Our notifications code broke when we moved it inside the dashboard code,=20
so the test name mapping was incorrect. It is fixed now.

I'll resend this mainline report.  Sorry about this.

--
Gustavo Padovan

Collabora Ltd.



---- On Mon, 10 Mar 2025 09:30:18 -0300 KernelCI bot  wrote ---

 > Hello,=20
 > =20
 > Status summary for mainline/master=20
 > =20
 > Dashboard:=20
 > https://d.kernelci.org/tree/80e54e84911a923c40d7bee33a34c1b4be148d7a?ti%=
7Cc=3Dv6.14-rc6&ti%7Cch=3D80e54e84911a923c40d7bee33a34c1b4be148d7a&ti%7Cgb=
=3Dmaster&ti%7Cgu=3Dhttps%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkern=
el%2Fgit%2Ftorvalds%2Flinux.git&ti%7Ct=3Dmainline=20
 > =20
 > giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it=20
 > branch: master=20
 > commit hash: 80e54e84911a923c40d7bee33a34c1b4be148d7a=20
 > origin: maestro=20
 > test start time: 2025-03-10 01:31:01.317057+00:00=20
 > =20
 > ### POSSIBLE REGRESSIONS=20
 > =20
 > Hardware: mt8195-cherry-tomato-r2=20
 > - tast.video.PlatformVAAPIUnittest=20
 > (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_=
MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:67ce452318018371957dbf70=
=20
 >  history:=E2=9C=85  =E2=9C=85  =E2=9C=85  =E2=9C=85  =E2=9C=85  =E2=9D=
=8C  =E2=9D=8C  =E2=9D=8C  =E2=9D=8C=20
 > =20
 > Hardware: beaglebone-black=20
 > - tast.video.PlatformVAAPIUnittest (multi_v7_defconfig)=20
 >  last run: https://d.kernelci.org/test/maestro:67ce429218018371957d9e59=
=20
 >  history:=E2=9C=85  =E2=9D=8C  =E2=9D=8C  =E2=9D=8C  =E2=9D=8C  =E2=9D=
=8C  =E2=9D=8C  =E2=9D=8C  =E2=9D=8C=20
 > =20
 > =20
 > =20
 > ### FIXED REGRESSIONS=20
 > =20
 > Hardware: sun50i-h5-libretech-all-h3-cc=20
 > - tast.video.PlatformVAAPIUnittest (defconfig+arm64-chromebook+kselftest=
)=20
 >  last run: https://d.kernelci.org/test/maestro:67ce3f1618018371957d7a4b=
=20
 >  history:=E2=9D=8C  =E2=9C=85  =E2=9C=85  =E2=9C=85  =E2=9C=85=20
 > =20
 > =20
 > =20
 > ### UNSTABLE TESTS=20
 > =20
 > Hardware: mt8195-cherry-tomato-r2=20
 > - tast.video.PlatformVAAPIUnittest=20
 > (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_=
MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:67ce452318018371957dbf6d=
=20
 >  history:=E2=9A=A0=EF=B8=8F  =E2=9A=A0=EF=B8=8F  =E2=9A=A0=EF=B8=8F  =E2=
=9A=A0=EF=B8=8F  =E2=9A=A0=EF=B8=8F  =E2=9D=8C  =E2=9D=8C  =E2=9D=8C  =E2=
=9D=8C=20
 > =20
 > Hardware: acer-chromebox-cxi4-puff=20
 > - tast.video.PlatformVAAPIUnittest=20
 > (x86_64_defconfig+lab-setup+x86-board+kselftest)=20
 >  last run: https://d.kernelci.org/test/maestro:67ce3c0f18018371957d579f=
=20
 >  history:=E2=9C=85  =E2=9A=A0=EF=B8=8F  =E2=9A=A0=EF=B8=8F  =E2=9A=A0=EF=
=B8=8F  =E2=9A=A0=EF=B8=8F  =E2=9D=8C  =E2=9D=8C  =E2=9D=8C  =E2=9D=8C=20
 > =20
 > =20
 > =20
 > Sent every day if there were changes in the past 24 hours.=20
 > Legend: =E2=9C=85 PASS   =E2=9D=8C FAIL  =E2=9A=A0=EF=B8=8F INCONCLUSIVE=
=20
 > =20
 > --=20
 > This is an experimental report format. Please send feedback in!=20
 > Talk to us at kernelci@lists.linux.dev=20
 > =20
 > Made with love by the KernelCI team - https://kernelci.org=20
 >=20

