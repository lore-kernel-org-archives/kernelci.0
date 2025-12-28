Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20A424EAB1
	for <kernelci@lists.linux.dev>; Sun, 28 Dec 2025 05:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766900911; cv=none; b=nuAcZ1gY3vj/x+AQcPmCpJdo4+5VjZKrSQ+pdUJ3k3sVbmbZ1SiS/bPkEhUkbZHZYapRBlAiUVwzBXuaYI5wyO4IvOiPxQLCrXPvj2Nntl2LTO21xUVjA+YRqTpfRXjWpSpvzQdwCSh0MtJt/kxiHMLVEiDML4ml3l807Vuw5d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766900911; c=relaxed/simple;
	bh=1pJCobo7skl3IqJjut1/aoDj5JGv6MK8u9FvD8pNb2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xv3y8S+zKS/iC8FLYwR+JkUK+XRX2YyvClE7hq7WD/pVlDpEx7hj9R7pOwHkvyQFrsR9ZclzHhxzUxMU61iDoKlFoaAnbbA+AW0copBAkFOTs/5drCX7uh13cttncv3JVr+rqw5CqI9p5pT1c5I7Ei22cWM5bobmV7LxPlog6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG/WwWnt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG/WwWnt"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso9096213e87.2
        for <kernelci@lists.linux.dev>; Sat, 27 Dec 2025 21:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766900908; x=1767505708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpbqpIsug6MH33BRSdVEMnAsF4zSM1dpRpn6fI+y1V8=;
        b=gG/WwWntj7ekiUCDOjIuRNzgm1OvvLxtfa0cgvii+d44EyGw2876+/+AP2LuwZj402
         e0PLvxM0WpEaxSdskEm7nhG+A04EoeAocrQ39yfBZv0Ue14HyMG/oA697JLhFCvOB89o
         Ege26ObhhbTJl4AfNfeuwYSL5gwsZkPjXAyb5xyVNxM0+MX18OWYnyZguVD7st00jmc0
         NSTqHHHO6N1rYW3dMBV+z2JRPWqSKC6aMpWg3hBAAgHDzsfZEigmBifokfV+p/8cIJBz
         ptbeG8KTi8HXLQqjA14gHHCuBUPq78ohjhT5BHPLKVQhq5IH6GPjPqtGWLUx3Y0V5Pub
         HSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766900908; x=1767505708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gpbqpIsug6MH33BRSdVEMnAsF4zSM1dpRpn6fI+y1V8=;
        b=AvOLZayjTNaVRhvgvDKG7s9GaW+xtMkjuy8cQ0EJGO4EHnMQyv7JdU3VoDNws7KqQ8
         myk0zhD04+RHRuZag1SHUQemiRhrUXiwJFioL+KxKdrFyZFwp0xFfGzafuXImRRDEvy9
         acxaA8DrKYHZU7HILw5AeqCdcePW24sOyJ2M4hvagA5j9NpXwj2JCvl7XEh4Krnb1vh3
         G92YfMUVIrzHlR58eJWrMmgWqQwfi6Pf+rEIC8oceRMc3BC62NuHDimURPIs4D8zJnNK
         Ns0zMgc9vFoYf2aN1HERJ8oS7/2bzGxW00rEp9Y5sLCRkxKHu634pV6pjY27wh4UVZEw
         4VGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQCjWL87/KuWR5i3zceIHbZgUNEpjlhbyTeW1B9m/5KJ3k+56uPw/AmGkDYVhXWhaz3gIGuFUGbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV2APY2kc4o11FAzhiV7tQH2AhmqWC1MFkPBVd3Yqr6draTU5Z
	yJKLy/+acmQ2ZMd2IrR5aXiAmh232x5jbbYhJjCxzYebCG0ArQ1Tq/7C
X-Gm-Gg: AY/fxX7YDGqGObVepncdbGXdpQL8qr0EiHLXSctBERJ+9C8YNor1YQqm5d+qdedTSJa
	OhuBPkyEdeJX2vcy4BkaGDdNidd/7xVtr4E0PBaH2/5qcbLMAoCsXrzBQbLoGS50Sk5DZcb1wZU
	C8Em6zwMe+g6qXlMI9yKxLJD9Vvr5Rx50/Bj+tQMnVaffdT4L88fwsFdxibb4MjrSvJBUZ+THyn
	H1wTD9qfNVhQTG0Eg+4FZMfkJmUfJejie4tjhsm2q/dlEJABROXSG67TuBQ0ofbA8+MwWwvz+Zv
	LWtReBrBFJYpXImtJXHDcdSGQ0ulyY42tyI7FeEutBJmAmxDXhECLEp8Y5JL7088FE+krYuJmf+
	4c1jREvs9edoIXJbaQ8PscE409i9ClvD4rVI1X08Bv3OGydqzQWW54GDLnUc/uoabnEBzH0ISIO
	Zhwsj/gAGBtE3I5ta3kOE=
X-Google-Smtp-Source: AGHT+IHbwDkZ0ZrkYZSKb3xcvqlBhmZdaEoQdezjtjNsk1jz3+5apfKEePyLYdpuFJXN8OT07eFG0Q==
X-Received: by 2002:a05:6512:3b9f:b0:595:7cb9:8e51 with SMTP id 2adb3069b0e04-59a17d1fa1dmr9400930e87.12.1766900907593;
        Sat, 27 Dec 2025 21:48:27 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-59a185d5ee4sm8077427e87.17.2025.12.27.21.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 21:48:27 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: nfraprado@collabora.com
Cc: Tim.Bird@sony.com,
	bhelgaas@google.com,
	dan.carpenter@linaro.org,
	davidgow@google.com,
	devicetree@vger.kernel.org,
	dianders@chromium.org,
	gregkh@linuxfoundation.org,
	groeck@chromium.org,
	kernel@collabora.com,
	kernelci@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	saravanak@google.com,
	shuah@kernel.org
Subject: Re: [PATCH v4 3/3] kselftest: devices: Add sample board file for XPS 13 9300
Date: Sun, 28 Dec 2025 08:47:42 +0300
Message-ID: <20251228054804.2515185-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20240122-discoverable-devs-ksft-v4-3-d602e1df4aa2@collabora.com>
References: <20240122-discoverable-devs-ksft-v4-3-d602e1df4aa2@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"Nícolas F. R. A. Prado" <nfraprado@collabora.com>:
> Add a sample board file describing the file's format and with the list
> of devices expected to be probed on the XPS 13 9300 machine as an
> example x86 platform.

And now "Dell Inc.,XPS 13 9300.yaml" became the only file in the repository,
which has space in its name:

$ find . -name '* *'
./tools/testing/selftests/devices/probe/boards/Dell Inc.,XPS 13 9300.yaml

I kindly ask you to rename file. New name should not contain space or comma
in it.

The file name in its current form breaks tools. For example, it breaks
"xargs".

For example, the following will work in "fs" directory:

stable/fs$ find . | xargs chmod -w

But it will not work in root of source tree because of this
"Dell Inc.,XPS 13 9300.yaml" file:

stable$ find . | xargs chmod -w
chmod: cannot access './tools/testing/selftests/devices/probe/boards/Dell': No such file or directory
chmod: cannot access 'Inc.,XPS': No such file or directory
chmod: cannot access '13': No such file or directory
chmod: cannot access '9300.yaml': No such file or directory

-- 
Askar Safin
