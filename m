Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1EEEC8
	for <kernelci@lists.linux.dev>; Thu, 24 Jul 2025 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383741; cv=pass; b=k839xGs6lX62MqjZGJiIdTFGwdYaKAXc/AHpKb+Nj1RB5dKIUQTKdtLHe0PVPjw/IjY1dVEC5IF8ygCdQEdUP2qVIh7VRQZ1HODxFyH9SgZHYhRkMHqt1MsaKNLUNhDwyAsskEOka9+FzhgNu1tZWf8wPJrc+H/qstW/eio1SZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383741; c=relaxed/simple;
	bh=sx1T9tCxIVZcFV8f7+gClNBWsH2j0G32iHFqMSjh7t8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TOLBeFFHInjotVGvGql55Q6cWOhgqmz3xko7iSE5o7GoiUhqgkTgPbQmmp+WZTideSvNaO/Me2eom/CS5MbFYNYayA+yCbcjcPmndSIowfJrW2wI+MXShWkpfYnlEfSukQM1vy7QWg/4BeudBY7vJAp8/K39f2GF1V/hvT8KY2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=Cmk8TRCW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="Cmk8TRCW"
ARC-Seal: i=1; a=rsa-sha256; t=1753383735; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JqM7nUSEj8EhZz+dn4qDKcfRd6kX56ADg6GLOiOJyYVA9ev9uwdtFLUZwAe8fSO3pZs59JiaGyhSGdgFS0gBSm8W4Gz15VF1wUN1vVonbX6oqc3sWgbWUTAvbrHBTFEkDxlHriOtSeB8pIVSMOgZqDP1jL2C4YUS9f47PErq97g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753383735; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PLlllJ5ug9RegIm4nV+laW2lHHBSQZbl1jZbX3LWUyM=; 
	b=lnb0b05GTvqldzOKosQYSJEMdE2/cW+gmIU7M1fPorKQOGHAMTNBhrmlRDyJ6QN/N5lcGe9F0sAX32GkpUi7nf9qApCECEV1HkifVw+vfggIpD88zEXRcOY9jnTJ1PxCDZdKiCJIxJzI04CI0k1eLGGG1oSaAFOpY1yGbqIpCK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753383735;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PLlllJ5ug9RegIm4nV+laW2lHHBSQZbl1jZbX3LWUyM=;
	b=Cmk8TRCWgBaG6pYZiqz7Fk7xGJCF+NIX5fg0YAv3RnbAmtWVS9Ti47w77NtMRUjO
	Bmt5UBrU9dA1hgU2/o6v3zKiOHGa392DAJNB2gqi2zsItCFGaQsmmwezxlOiIAdeoz0
	ZKmqcWzbYEovU+OyZV+mWZbx0MwOhBn4HVZqj15s=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1753383732876270.29847959713254; Thu, 24 Jul 2025 12:02:12 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:02:12 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci" <kernelci@lists.linux.dev>,
	"linux-mediatek" <linux-mediatek@lists.infradead.org>
Cc: "kernelci-results" <kernelci-results@groups.io>,
	"Laura Nao" <laura.nao@collabora.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Message-ID: <1983dd0867b.208185361696657.4359505113203740161@collabora.com>
In-Reply-To: <175332462466.152.13830549783020660308@ee9f968c8f28>
References: <175332462466.152.13830549783020660308@ee9f968c8f28>
Subject: [KernelCI] mediatek regressions on mainline/master - 01a412d06
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

Hello,

KernelCI found some regressions on mtk on mainline master.
I extracted the relevant excerpt below.

Best,

- Gus

--
Gustavo Padovan

Collabora Ltd.



---- On Wed, 23 Jul 2025 23:37:05 -0300 KernelCI bot <bot@kernelci.org> wro=
te ---

 >=20
 >=20
 >=20
 >=20
 > Hello,=20
 > =20
 > Status summary for mainline/master=20
 > =20
 > Dashboard:=20
 > https://d.kernelci.org/c/mainline/master/01a412d06bc5786eb4e44a6c8f0f465=
9bd4c9864/=20
 > =20
 > giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it=20
 > branch: master=20
 > commit hash: 01a412d06bc5786eb4e44a6c8f0f4659bd4c9864=20
 > origin: maestro=20
 > test start time: 2025-07-23 16:36:25.066000+00:00=20
 > =20
 > Builds:       59 =E2=9C=85    0 =E2=9D=8C    0 =E2=9A=A0=EF=B8=8F=20
 > Boots:       196 =E2=9C=85    1 =E2=9D=8C   84 =E2=9A=A0=EF=B8=8F=20
 > Tests:     16320 =E2=9C=85 6781 =E2=9D=8C 3733 =E2=9A=A0=EF=B8=8F=20
 > =20
 > ### POSSIBLE REGRESSIONS=20
 > =20
 > Hardware: mt8195-cherry-tomato-r2=20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97635=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97633=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97632=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97631=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97630=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9762f=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000 (=
defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODU=
LE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9762e=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgdec-master (defconfig+=
lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRES=
S_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97612=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgdec-master_jpgdec_1a04=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97611=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgdec-master_jpgdec_1a05=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee97610=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgdec-master_jpgdec_1b04=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9760f=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgenc-master (defconfig+=
lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRES=
S_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9760e=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgenc-master_jpgenc_1a03=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9760d=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpgenc-master_jpgenc_1b03=
0000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFI=
G_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee9760c=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000 (defconfig+=
lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRES=
S_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975e4=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000 (def=
config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_=
COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b9=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_vide=
o-codec_10000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=
=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b8=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_vide=
o-codec_2000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=
=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b7=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_vide=
o-codec_25000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=
=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b6=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000 (def=
config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_=
COMPRESS_NONE=3Dy)=20
 >  last run: https://d.kernelci.org/test/maestro:688127432ce2c1874ee975b1=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
 > =20
 > Hardware: mt8395-genio-1200-evk=20
 > - boot (defconfig+lab-setup+kselftest)=20
 >  last run: https://d.kernelci.org/test/maestro:688116fa2ce2c1874ee911d7=
=20
 >  history:  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9C=85  > =E2=9D=
=8C=20
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

