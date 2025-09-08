Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FE5F4F1
	for <kernelci@lists.linux.dev>; Mon,  8 Sep 2025 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343098; cv=pass; b=O0XjmH+eHt3H7DaimNEmRORZzjV8/8sdvttEYWpeBiZG4qbdJe9N7NO09z+Fs16MTl3/a3G4hEzU2fJeJmaePdfzdSjWVaVMS9Q8GPl/n6FaJUQSQ2H9OtSGbduHPIQCNzMwtP4HNlBAcXJjdsD7sqrgujs3AUS+fP6EZass13I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343098; c=relaxed/simple;
	bh=QUzm7M13hPm/4ce0EDVwIkTmrlUZL0ZI763by25y5VM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=nOWgB8gYUpXnTmi0/zwe8f63yqJ+t3CD56H9Na3UyKUsSAn2FIO1S5ZbEE4lC14V6RNLiiduFRsy4Zd2Hk1Ujg8xNA5IvkibsXZvrxwWGoyrOZn4GWp9iegSKqS4aGS9rzYvLlWntRLFXQvisvEw9g3KOqEKcA8rKSV8JuqYWrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=ZmJB5DbO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="ZmJB5DbO"
ARC-Seal: i=1; a=rsa-sha256; t=1757343092; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aaDV81HjgTEdhewj9zU9S1IjFC0+25aeA0ubBCUp6a6PirHsR+sc8N2ru5UnkZsGk40Utg/76Z/sYl3m7s2skl8pVW0nn2KMJDNzLq7jPFbqyynBnC+s0+86CHwQ3f5aAshYS9x6cxz0hk7C62jSh9R8n7T7Fgp3lIWQuG01p+Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757343092; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mLEYhHqYslnWFSnqdNL24k84AqUICyA4WeVzgj1mpYs=; 
	b=nMrrNaf4J6F+WwHAuzmHr+tWKqPu69d4nkJ+TPtp661VE1vdW5wEQueCeMl8RMQMIArZjqhftLFVIJHukNATLI0XeTsqh1noDAlpWDWMSfLqG2HA+N8nqCHWFCHeN1oXVCw/7IpXEayRnukqXGyud9Ezf6PmY0umYHrJHeodakU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757343092;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mLEYhHqYslnWFSnqdNL24k84AqUICyA4WeVzgj1mpYs=;
	b=ZmJB5DbOYQrISKaEC9eqGY+iBvERTLNIVa1qhBcxpLVKspo2JT7Ewu+EhTay6shi
	zxRLsRRHq0YADUawmk2bVxEtefR64VLfhWVKI7s2DO5079G/UAz2AlgHlNgU8cHssyj
	eeDibJNVeSHm0B76m4xhINcCm2qKQ3x6+ABvg9XU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1757343091673259.06921203931574; Mon, 8 Sep 2025 07:51:31 -0700 (PDT)
Date: Mon, 08 Sep 2025 11:51:31 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Kevin Hilman" <khilman@baylibre.com>
Cc: "kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	"chris.paterson2" <chris.paterson2@renesas.com>,
	"ben.copeland" <ben.copeland@linaro.org>, "cfi" <cfi@pengutronix.de>,
	"broonie" <broonie@kernel.org>, "sjoerd" <sjoerd@collabora.com>,
	"f.pflug" <f.pflug@pengutronix.de>,
	=?UTF-8?Q?=22Pawe=C5=82_Wieczorek=22?= <pawiecz@collabora.com>,
	"Tim Orling" <tim.orling@konsulko.com>
Message-ID: <19929cf8b8c.280b13d3500933.1530159640283422004@collabora.com>
In-Reply-To: <CAOi56cVoV4GoidU=yP8w=p6KXL_8msye3mtmtxJnQFOzcmC6Rg@mail.gmail.com>
References: <199077d9fe2.7b4205005094745.5898848305828715448@collabora.com> <CAOi56cVoV4GoidU=yP8w=p6KXL_8msye3mtmtxJnQFOzcmC6Rg@mail.gmail.com>
Subject: Re: KernelCI Labs Working Group
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





---- On Thu, 04 Sep 2025 15:28:47 -0300 Kevin Hilman <khilman@baylibre.com>=
 wrote ---

 > On Mon, Sep 1, 2025 at 3:55=E2=80=AFPM Gustavo Padovan <gus@collabora.co=
m> wrote:=20
 > >=20
 > > Based on the interest during the workshop, we=E2=80=99d need to cover =
the West Coast timezone=20
 > > as well. So an initial proposal for these meetings is starting next we=
ek on Thursday,=20
 > > September 11 at 7:30am PDT/4:30pm CEST.=20
 > =20
 > I'll miss the first one due to travel, but generally speaking this=20
 > slot works fine for me.=20
 > =20
 > Is the goal for this to be weekly?  bi-weekly?  monthly?=20

Let's start with bi-weekly and see how it goes. We'll send out invites toda=
y.

Best,

- Gus

