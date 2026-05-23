Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E54239E7E
	for <kernelci@lists.linux.dev>; Sat, 23 May 2026 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520926; cv=pass; b=WyZzrn55EwNwCkEScQqk+7O3mwaiLu3wd3I89YocpJ8I//bHtb1ywRMYjg+UiiEH4sIJ3TLYfroXY0jJzYT2ak9aQ8wzhAEK8bV+wrWigwKdGjYYe+UHIBo1Hfr5UJnzWjJgb7IvmqMbeH1y+q72D7JOgZ9Gc8h+ycLFE6BMqQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520926; c=relaxed/simple;
	bh=BbQRoXHVRldIv8v0zEmXGAsOPHjTtmdBF3G6vkkWU4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzZjH0MnsUoMB8o627BzuB7iQ/1PqY4kq2SfkgPNMxJseSprITUURrKFx5O8pC1ZKe3NGM53a8Y0twwVax7xEoy067mkE7QuvfJmexT9+2r7nsJaY33ybKbP14WVi1jmqsIZt3/OyuUbLI9L+AzvI4qvvMX0yOtfFGHHs04bl68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sFyd2fJY; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sFyd2fJY"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8bb09239328so62536626d6.3
        for <kernelci@lists.linux.dev>; Sat, 23 May 2026 00:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779520924; cv=none;
        d=google.com; s=arc-20240605;
        b=Be1FOHg9gzSlMQSWOKGs9AfS4Ug//oNB6EWR+eqxVqiIajkI+I6uIkC+k3jCm9YrCv
         uhUO77DckSDsfSSRjputVnoPyhpPfQt/Z5RUG5BmJTbJYKzqjzLP3rTV3gWK5EMYcWZo
         INSGQIxRAtDBLBOCmz4+Bu83dEQMPdZsLCxec+9XS+vSMvLmxrBQnibMbPkJ0U5tV2Bw
         PTLiWlFIrCD87oF1mx8Yo2opdSsTqtaLTQSkG6CaY6EnYz5yPJFWKmxLkKYy0HRmQ/GT
         0QNCNWykQfJB9Iw+hgw2mYTe/sSjfh6dyllg4VM7kK7Ff27yK672o7d4CnemNkSE5g9M
         3naA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BbQRoXHVRldIv8v0zEmXGAsOPHjTtmdBF3G6vkkWU4w=;
        fh=+Mbc0ruhQf32l4J0cA3U+p6Wwk32I4laq68aMyJ1uA0=;
        b=T+gfJbLwKLciHjWX9eScDaNMrLI1AyU6kB5GcTSFiTu0OB5h7dQiIHdBBsQQEU1iCP
         EGyv4w0Boq1OMLimII7k3QQOv+zRF146zkbUjJ7lG/jsoAfSIhWcQx+lhRp29SQlz+Mq
         x7gueXjtSiMNGoi0GdaWHfCzYJr+zKsrmpPLalWyfHv81kLogHE4Hwo2vNzEALYLBf87
         GY8elye/5J5FK70eucRGeaBKcVkQQ7WOm/KgDIjsk8jplal1e/9VDOyNRLVo4/7KQiPM
         GndqQwclvmOWUEe26c6Dqbl6dBJQOLcpH10eHTKI9E7Mhy2xP5hLTxMpVX1Qo94l43UR
         Qjjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779520924; x=1780125724; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BbQRoXHVRldIv8v0zEmXGAsOPHjTtmdBF3G6vkkWU4w=;
        b=sFyd2fJY9xE+iK4p+pqvrwM7Vfeb+h2oa+ajrhhAQ0FR7HxmtVR1MdQaOOliRsrNwp
         nS0aLlRfPy8EBRDr/nOhQOtMqyXHP962p+4hE3AZ/lzlul9KekF1eZT/PhlJDv1AnFNN
         wN5PB0GuwgvXO0n3gdXaUCPKfa/Bx6Ld1xYHswtGNyqtBnUD0zdTQ/lPwT3IWHoNs+s6
         noZglhp93LRILlvsRyMFEHYPSd26XPodmgXGSCXy8okvTLz/Dryx/u1pYN0lH6kMk56E
         X0ZpZ0BaNbhsPV6lH2YKmr00haqfUJdN5V4u2Gl8vboH+i6UwJ7ZryydjmcRwtAmwp8V
         uzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520924; x=1780125724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbQRoXHVRldIv8v0zEmXGAsOPHjTtmdBF3G6vkkWU4w=;
        b=TWcVBFMU+3EUSooTWbhinQI+4BW/RP18GsAdwgSmlUKvaHxPE+Xs8VENFD9jS42RNf
         JnU3HFieYnmLPWRTg9u5HU2rcn4Rd25UCru60/N+lpWB1tkrOPZU9s90zvoE8jdC9lbD
         IMqy9XiRBWrRmWVqno2sBHFqaYYg5aRyuf1u0epHT/Cp4OHBhcHfyGDb+mXNtzs5Q3Mk
         MdNZ4YNEIUbfB4oOHk/AA6jFfldDam9bf/T06Kb7x6P4DdMNvyvj9s2TcaZ/BSv7uiHS
         s179s6bwo+wRq7J9Y/yLmPtlzI6Csc+talleYwWKJZ/dC4iAgQmM2OyYoGJNXw9miyu0
         Yitg==
X-Gm-Message-State: AOJu0Yy1mH0qXL1+o3BTUo3HEoR51xj8mIXjdpLIZfF/DSIAMdtz/XJr
	i4zZcpYP2q0tER5hqMM0b6TPlTVZOKlkcn9sdawoshivt63guoa/BYF3YvPs0yspyyZWv9HPZ/3
	QS7g9vE8vuNBYEJ0jPGsB7tis+iJgIPgMzvh4SLq1M7Kruqs+4pOFdroIHzDhcg==
X-Gm-Gg: Acq92OFk9UHA7fcJ8Lwd8BsNPMOxcaFICnKGGcrR/RdZ0MveQmD28SIuqs7NbyW7Rsf
	EGy34A0Of2z3oqhEFnTyGcvZQU/2fGuS7hDzMYjc+jvuYwUhQDu3Xv8a4efpQZIXuCx2FwUsHVW
	Ftfk5eLwZeAx2lOT1fn86P8958PEtRUdl498H11R5K9tP7jhnfjCeTRxQl/maM/8aMWA8Q7RokH
	vQgSsNzG2o4G1EIHz2g+5qAlLx5hFzyNbxbnzouIJ234saB0qUP7a81eNCxmyvbH/2SJjrbAgE/
	wJm7Nbgp6gedoJlZpPxTn8O+UrBgfQKJMzG7czKt7aH/Qybzesu7DGxH1LJK
X-Received: by 2002:a05:6214:ccd:b0:8bb:2e70:7a2b with SMTP id
 6a1803df08f44-8cc7b60af4cmr113342136d6.15.1779520923540; Sat, 23 May 2026
 00:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEev2e-Rc=hhieAWmM59jAyNLc-o_ZVA27UQG=YkcbZAEnXYFg@mail.gmail.com>
In-Reply-To: <CAEev2e-Rc=hhieAWmM59jAyNLc-o_ZVA27UQG=YkcbZAEnXYFg@mail.gmail.com>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Sat, 23 May 2026 08:21:52 +0100
X-Gm-Features: AVHnY4L8bUoWwpwzDrzMKg7lGuiZMGqtvbJ-Et6tldcnuE4njdNyWFWpMlncNyk
Message-ID: <CAL0q8a7BAV7KgM2K4ii21qFXrhKieyJsM2wG7_Y=p459ec10jQ@mail.gmail.com>
Subject: Re: trixie riscv64 rootfs builds for kselftest
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello Anirudh,

Thanks for the email. I have opened a PR at
https://github.com/kernelci/kernelci-core/pull/3102 to add it here.

I tested it locally. If you want to give it a try beforehand, I can
send it over; it'll appear in the next production release.

Regards

Ben

On Sat, 23 May 2026 at 05:06, Anirudh Srinivasan
<asrinivasan@oss.tenstorrent.com> wrote:
>
> Hi,
>
> I see here [1] that there aren't any riscv64 debian rootfs images for
> NFS booting and running kselftest. Is it possible to add these builds?
>
> I've been doing test boots of linux-next on some riscv boards and was
> hoping to run kselftest on them too. This would be useful for that.
>
> [1] https://storage.kernelci.org/images/rootfs/debian/trixie-kselftest/20260219.0/
>
> Regards
> Anirudh Srinivasan
>
