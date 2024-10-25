Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E518F2E8
	for <kernelci@lists.linux.dev>; Fri, 25 Oct 2024 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839451; cv=pass; b=isbgIJrDcuWvp3OVeSTCOU3Kv0VcrPN8XhyJliQq3GIQ8YIXkZ/t4N1D7zPFWVQlCXARMVGHM8aRWYiFjul+I4HuEqK6p+C5b+/Qcldj7x9cpTJhKEG9Dz0tYqyy4xKKIz7oY23UfMJrKUueIR4aQixWcoQoLJFvYAyB/0nzSpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839451; c=relaxed/simple;
	bh=bGv+kS/g/cN0i7pTUrgNGz2oTltQ3gWB+QNxsJiq9g4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q9ZEnWoSRYPeFBGOaVKBUJW62H1Ubc/7GQAolzkxCEcYsJTmBnyBPYx9vz51gWiJ8casTQ90Tf+DGHdArnY8Dw18wzaRyhbW2FL6kUFIDJIKwoGqcP977biP12eG8xuUL0Jj8Pwkp7Di7jr9i/6rTN8nXpjQnhpjjl/121pntNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=Twg3thV5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="Twg3thV5"
ARC-Seal: i=1; a=rsa-sha256; t=1729839447; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GsVSS9CVCB/WiyJ1KnjYQW/JrPnOm/uxm2KHaLcKtSbn2APPya4tZC+T6F9+G53NK5ZvEE/qwu11GX7A8NllMjbBFxvHhSm0kvXkJTaFFaPgbkkzHQOBwnL/GjbZB3N9daYtMzqjJryjf5Cq8UWbCkGB3o0JkUyGwD07v1YfEvQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729839447; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=bGv+kS/g/cN0i7pTUrgNGz2oTltQ3gWB+QNxsJiq9g4=; 
	b=l33+aTrR8pi8i3Iu10nPeJrahsVBDqjaVCzAqoPX6juDDq5pv+mnw8K67lXnUcmwZIKYFiyryv8MDGS3hVqIyfLw73Hsfz4Z2zPebtBkqZq8wAGTMNKxbJ5CdMGzdx7pROcDf3UoAr4ysjlPCeP+c667WcKogT/w8Xp+etvgwZA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729839447;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=bGv+kS/g/cN0i7pTUrgNGz2oTltQ3gWB+QNxsJiq9g4=;
	b=Twg3thV5hoVmcAeJ6eo0rwIVLjkqanaLzBGki5anWBfj6gv4hZcj4zvOURhl2bDg
	PYY7RK4uqnZFNra3DDfhkKqV9Rl9DWiGPHhs+iMgbZacDZQ/DbVm2pwMp5vu+jc4N7C
	lELRU+nXO0i/FW8Mf3vzBNy2kmmYn7DzbeoleSlU=
Received: by mx.zohomail.com with SMTPS id 1729839445743252.76426176053712;
	Thu, 24 Oct 2024 23:57:25 -0700 (PDT)
Message-ID: <e8212dc96afd1fc6531ee4d2388233bdf3fb650b.camel@collabora.com>
Subject: Re: kick kernelci tests?
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: Todd Kjos <tkjos@google.com>, Viktor Martensson
 <vmartensson@google.com>,  Betty Zhou <bettyzhou@google.com>,
 kernelci@lists.linux.dev
Date: Fri, 25 Oct 2024 09:57:21 +0300
In-Reply-To: <CAHRSSExUboorgLqnrRoAX_w8BNRpN6hh21Z8vscx+G=VPVirig@mail.gmail.com>
References: 
	<CAHRSSExUboorgLqnrRoAX_w8BNRpN6hh21Z8vscx+G=VPVirig@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

On Thu, 2024-10-24 at 16:28 -0700, Todd Kjos wrote:
> the old kernelci seems stuck again. No runs since 2 days ago:
> https://linux.kernelci.org/job/android/
>=20
> Can you give it a kick?
>=20
Yes, i will do manual kick now.
