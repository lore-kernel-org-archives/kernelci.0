Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F31487EB
	for <kernelci@lists.linux.dev>; Fri, 12 Apr 2024 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712937029; cv=none; b=bP0v8ZDJF0AiJmuMvVy6HlGI5q+YIYUuAR23kSKO+qlcwW+AlPk4S0pN0VFQy+Ds8exHY2G5dgVSWuWelZf5SawfOBVRBPaCcmSz6rHS1OJYwN61IXVjapXWbeDgmsqljCqMpCfdRc6ENUT8BgiS41gNdJGpHc4T1XgLxlCQV+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712937029; c=relaxed/simple;
	bh=tXrgN2DXbsA3Yyl6Vc88yu8uPUqCVYLCCYbwq8+REaA=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=Kxt4aB51LZ/gcRWWYPbezU/XQqNekqDSHPhL8OMjmhLPsqO2zwcVVFxGB8d/UjL7jcFZOJPy1YlnXBXiSiA+nD0HPO/xDhlFUzateRBvSV3NVk8fMihxcpYH7tDfgM8wGfaMIuJYa6iOh0f9nN6Y0TKUGjf99qo6nC62Cm2ofjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from harlem.collaboradmins.com (harlem.collaboradmins.com [IPv6:2a01:4f8:1c0c:5936::1])
	by madrid.collaboradmins.com (Postfix) with ESMTP id 0CDC03782117;
	Fri, 12 Apr 2024 15:50:24 +0000 (UTC)
From: "Gustavo Padovan" <gus@collabora.com>
In-Reply-To: <9cce38df-de93-486c-bee6-1a866f8ac696@canonical.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <9cce38df-de93-486c-bee6-1a866f8ac696@canonical.com>
Date: Fri, 12 Apr 2024 16:50:24 +0100
Cc: kernelci@lists.linux.dev, lgoncalv@redhat.com, "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
To: "Joseph Salisbury" <joseph.salisbury@canonical.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <3deb2b-66195880-7f-7ed64100@24373438>
Subject: =?utf-8?q?Re=3A?= Kernelci Job Start Delays
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

I am glad that you reached out. It seems you are pointing out yet anoth=
er aging sign of our legacy system. For broad context on that, check ou=
r recent blog post[1].

The best way of solving your issues would be to move your testing to th=
e new system. The best plan for the legacy system right now is to shut =
it down in the coming months. As we said in the blog post, we are start=
ing small in number of tests and scaling it step by step, but always wi=
th community engagement to evaluate the results. If you want to come on=
 board with the rt testing, we would be happy to start a plan to make t=
hat happen.

Let me know if that is an avenue you would like to explore. If yes, I'd=
 be interested in knowing which tests you are running.

Best,

- Gus

[1] https://kernelci.org/blog/posts/2024/strategic-updates/

--=20
Gustavo Padovan
Kernel Lead
Collabora Ltd.

On Friday, April 12, 2024 11:30 EDT, Joseph Salisbury <joseph.salisbury=
@canonical.com> wrote:

> Hello,
>=20
> I've been seeing some long delays with the start of kernelci tests,=20
> after uploading v5.15-rt based kernels.=C2=A0 I think Luis Goncalves =
is=20
> seeing similar delays with other branches, so he is cc'd.
>=20
> For example, I uploaded v5.15.153-rt75 on April 1st, but kernelci is=20
> still not showing it.=C2=A0 That last kernel showing as tested is=20
> v5.15.148-rt74.
>=20
> Is there a known issue that may be causing these delays?
>=20
> Thanks,
>=20
> Joe
>

