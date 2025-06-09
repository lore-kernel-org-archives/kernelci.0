Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4298F40
	for <kernelci@lists.linux.dev>; Mon,  9 Jun 2025 20:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502769; cv=pass; b=C8Fw4JjRFwJfWyWwCnfLawfQ9xraYUNAYuxkIaESfYXzMa1/5Zih9ufg9AgopDtq8WcqRiRgIe+qLzkixBeUAfR2F08hWXW7z3fdrv31edRJmw/GIoRXVO/3qwAT+zRMnV1u0KJF4VHpCwsHjzq4d9FN/eiw5TdyrpJ+DxDuUVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502769; c=relaxed/simple;
	bh=kRvGMsvfnms20kVazcD5n4Ts5XfYRrA/4yVuM7pyxww=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=jInWklj4s5XYDGlepHnzyLfc63+f3FOgE5QDqGyqIFSgkuNkErc/EifCEVMstgVyjEc5i37+2RjG2NYXENdsXPwudaPKAhaKDkeqCe968QMNS6esmFbnfgDy9eqguTKt3MD9blLnz2wYPwIXSyFRK/iyLQHEKKJPasvWuLWkjQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=DgScKNkL; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="DgScKNkL"
ARC-Seal: i=1; a=rsa-sha256; t=1749502765; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nG9v1U471WjaOCrkBk22tfh8aTKD37Z1GPP+DfXHkRjIDk93S7flk5smVg1W/AFbSANKX/Mzsk0dLKUnHd1sbifixV2PpGQ2i3r7WpuOWJGLMj6z8vdFrvd+vA6+BYsDz6G8am2o08M/V0hPjpqjP7l5Xefc0Y9VOE55z/o8eY0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749502765; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=kRvGMsvfnms20kVazcD5n4Ts5XfYRrA/4yVuM7pyxww=; 
	b=Ltc2m4sJUN7VHJUXywcvJMwVXswEaRtGmwbPDGQYfRWy5OiF3qevwAJr2BaxmN5V5EMMWmF/W94xt+5/AsOJFnX1ZiJotVfV7zkBraWmT2luz0j2kMK5rxxJFe7yapfgEJkWQ5HKlP5xydvgjaboM80i6mUfnKNrqYoA5MFKmik=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749502765;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=kRvGMsvfnms20kVazcD5n4Ts5XfYRrA/4yVuM7pyxww=;
	b=DgScKNkLf9ex4fECrLG4dKatCh5NPXejwqXozrEGgxcH2H9mUokpwxECa2HzK/WD
	eUWg545+7hDT9++YrMupfgFA6egEKViLgCw3FslEgjKQMLz1O3cmOhBnL9t1CebOSBL
	NEiXQFCIwwnq0maoxJYP08HRZ8iLKXWyorSOMUP0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1749502763287572.0812432349892; Mon, 9 Jun 2025 13:59:23 -0700 (PDT)
Date: Mon, 09 Jun 2025 17:59:23 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"Automated Testing" <automated-testing@lists.yoctoproject.org>,
	"Linux Kselftest" <linux-kselftest@vger.kernel.org>
Message-ID: <197567da0c2.1113de94d1694560.75400530450526840@collabora.com>
In-Reply-To: 
Subject: =?UTF-8?Q?ATS_2025_Schedule_Now_Live_=E2=80=93_Register_Today!?=
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

Hello everyone,

The schedule for the Automated Testing Summit (ATS) 2025 is now live!
 You can now explore the full program and speaker list at:

=F0=9F=94=97 https://ats25.sched.com/

This year=E2=80=99s ATS will be packed with talks and discussions focused o=
n scaling test infrastructure, improving collaboration across projects, and=
 pushing the boundaries of automation in the Linux ecosystem.

=F0=9F=93=8D ATS 2025 will take place as a co-located event at the Open Sou=
rce Summit North America, on June 26th in Denver, CO.

If you haven=E2=80=99t yet registered, you can do so here:

=F0=9F=94=97 https://events.linuxfoundation.org/open-source-summit-north-am=
erica/features/co-located-events/#automated-testing-summit-2025

You can attend in person or virtually. We look forward to seeing you there!


Best regards,
 The KernelCI Team

--
Gustavo Padovan

Collabora Ltd.


