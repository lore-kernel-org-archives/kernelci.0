Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528DA3D34BA
	for <kernelci@lists.linux.dev>; Tue, 10 Mar 2026 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143479; cv=pass; b=VkJv7fHfXt5bUUqsb56HDWd3wGs4oc5gED92BuiBIDlIL5f3UKQk0MG/5Q8n3d5eLP1sErBQsCae1ZtgckHvj46ecPWWaRNKAQYnBL00Mg2q5yoy928+B8scuSQYQa+3nQID6sxLIkHYhcm6e9cAz3BnMy22fVMIDN2JO4d4v9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143479; c=relaxed/simple;
	bh=e7aQrycLZHapikyKqfgwTvygKuyOYBgjJDI78j0V8wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtmH64XAbQN9A2JNp44EICuKomA9uWqDt8ErqwnSF2S2mwtI+Ryy5zpq1B1k2l+6pXiTga8TISx7dRofXndNIp8sUao1TuH5JIrwFTHviI5g8iq1tg0zmIciijSj0q0YZZ5ILPmt2ebyZRxNaVPUIiRp0/gIk5RRjlDXXPKcFDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b28xLN+q; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b28xLN+q"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-506362ac5f7so117152151cf.1
        for <kernelci@lists.linux.dev>; Tue, 10 Mar 2026 04:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773143477; cv=none;
        d=google.com; s=arc-20240605;
        b=buaCStX7LsKrz8N3ZbxOrG4Nj1mhkph0FHGByMI61MSz0l1zhBGaFUAlNQpr3tbaaI
         v4JzHPvbsqBQ7oZkJ4U3CyYbvKgUAxqFFxTs1Xw4GgUd0pqKEwiko9t+vz0VXNw9xg88
         X/Uz2g3B5geIBRPCIEdV7m+paWO8jw3N4JrQr2lki3U1oKheiKVtI/tImajmhnj9dF5n
         QkhjLySV7WZhNSjl2jJW92M15T5Az0AwyV8wozmi3iER36lcIgEmy7az3jtx8mv/T/Q+
         uDIS8cS9a2d/FuFfb14M3HqHHkjxYZ/AHzcVYymkogVzAgXRxBTPzqcwAt52s55MFCHQ
         +3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7aQrycLZHapikyKqfgwTvygKuyOYBgjJDI78j0V8wQ=;
        fh=haC7tfLHuyPQDFPfqeqTr8cNt+W9hjDOsT01DYxjNtQ=;
        b=aQW8cfmbWlYOW/oDqmXktwpL7ihR3sc5AkalgvC0Ty2ar3w62h99KrcQG3hqii/t+1
         kLzXPCz/+ByEs/oPKPTpTx3eNgZOnWSbKCYzHv9GU0jsXP9is0OaD89uYvGMsELM2kT/
         3X2cr9ugHrqVghfXLmtSfBQQB0OFpTjc5UvUnRtEWmKSdPANe7hDFsZY/m/03BzI1i6z
         XfPvCYaaXhWWDC7NpyHFaeIi4j4IVDrf+FisahiismgkJtoCiBZCKpDV7ckXkFEopJC8
         kqUVwSxjGsuon1g0qkyIggucs9M+ubKt+QJwAAHuUROBEufHqN4sFnyson8vqLvA7MgM
         jSrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773143477; x=1773748277; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7aQrycLZHapikyKqfgwTvygKuyOYBgjJDI78j0V8wQ=;
        b=b28xLN+qC6eAO9x0NWV7UlWT05DHZ5W0Mm71keLc3Pr2gvUrjzrRx/n6nO3bwRCInH
         QgENIzSkF3RDCrybdQwTejEqvMReLp/zhhEOzvViMHr2tCIXA5CDE2iIHa4ZC5LAXwNt
         PSTUMBF30EONFXhZSExHU7yLc7euSA6eoKCdIrK0KvwGZWKl3meYYRadFhyHX0SYJqxw
         y/3M1GbKiXdV1vUqicT1A6LyKXqy9GMiay806jBA1ng5lf2cUaLfzuDxY64M5Hs/Abl1
         Bs3HCjApkZ7tgk9+k2UxeQBKIIkIMsZ5Yvi1DfzMxpM/1zVPNOZdT9CvoKs3IXquJwJL
         8G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143477; x=1773748277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7aQrycLZHapikyKqfgwTvygKuyOYBgjJDI78j0V8wQ=;
        b=p4U+t1cFfT7orRTlLBd6pv4cl7+Nmnj/yFkmztcjcJjDtG8nako6AKfHjEF7EOT3Pf
         JSnAYxrvl8zdithkHwBh1VMUMjg8KipcXsdmP+CHG8R2VAYl+9dA3oJNfG4mPII0KAex
         G669lZ/E4hgsEEvZOk8Ns01s54iN92rcrr4P0IYGUHckUFWTQGdMhu6pzUDVWPSxGyJ7
         ihz9XcaVPb2Fxpcz3I1wh88mJw5LudPGnNirWqN7K939ydHWW/NVienjmNOPZ9wWAfOx
         BZrXbjqphYHyf5tKDyJLqjCsdf+OvDGVcCu4p76ecXZfYCl+Rpja1ZJrocXh2LbxRX6M
         23dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHxrzkQDakupP8otwEVfxvY5aZ8ANbW2VnU95LgLCBINr/nXqAVsEorry5CEwHnAnSo/X9raK9Ag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjlx9zzoWUGQHVKNwArma4Dl+9MrmUq4w9e8kxvJ57QSU/r0sQ
	sNCUWHY29epLW17CYPmZlK/hw7DvaQ2kQsJQq7Tou/IcW1F1kt6Rhp+NqlVea8QzbuJ0psadgwM
	pjXPEhVll5P/oMMtMJaBbBSBXFlV1ri0RuMm3ml8+
X-Gm-Gg: ATEYQzyv/HiH82WRRUMQZfunEUl7NA/C59EfvscaOl8LO9ssXhX4eHrsqG0SuqrhM/P
	/bku3z82v3xT4tdOTNIo6fCzm1EDckBRIvok1X3sryYv+//KYfLkiQcTD3uFWaa7nE/bYgl1MpM
	0wnSVQrN0buTB6UnDkwBtg0JnE5yHrXcloGfFheMX/LCC8ExbhB59556Evd2IHiluxLp70VGOEG
	3CrPg+G3yAtlD9CIp0DO981iQ3Zn+kYsCSSS8aWWLMYX+sPq5+sqBfNk1Ye7AYKoMEXzhqlLqGH
	DCQQY076W/qGaOaG25hhfEnko1aSzdJTJ72J9wuY/qCcjn1K3JIxNeHDkrs7
X-Received: by 2002:a05:622a:1314:b0:509:1c5e:1062 with SMTP id
 d75a77b69052e-5091c5e174amr81750531cf.3.1773143477165; Tue, 10 Mar 2026
 04:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL0q8a67TOQVyDMpdFdgqJmyC9snDoTJaG8Fhf2OqKS1wc=S8g@mail.gmail.com>
 <7a042ff1-4360-4dcb-97df-7b49f3c5f8b1@sirena.org.uk> <CAOUSUDo-uFc88m4LkG=oM42frEpT27F_EYQE=KL-+-yNjyrn0A@mail.gmail.com>
 <6e57a9b1-f54f-0062-af2c-f15d599af9bd@ti.com>
In-Reply-To: <6e57a9b1-f54f-0062-af2c-f15d599af9bd@ti.com>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Tue, 10 Mar 2026 11:51:06 +0000
X-Gm-Features: AaiRm50hq224qB96GxWLDwkl8h3O3jplyUIoxmNYYtnMtFLtcQlQcF55cW_CtyE
Message-ID: <CAL0q8a6txN82H+j285HU5qhXETPuRDUpDRuzD03NVBNtsfwy6g@mail.gmail.com>
Subject: Re: Meeting proposal for KernelCI Bisection
To: Minas Hambardzumyan <minas@ti.com>
Cc: Yogesh Lal <yogesh.lal@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2026 at 15:25, Minas Hambardzumyan <minas@ti.com> wrote:
>
> On 3/5/26 10:56, Yogesh Lal wrote:
> > On Thu, Mar 5, 2026 at 10:19=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> >>
> >> On Wed, Mar 04, 2026 at 05:28:06PM +0000, Ben Copeland wrote:
> >>
> >>> I have a list of people to include on a call. If you are interested,
> >>> please let me know, and I will add you to the meeting.
> >>
> >>> I propose the meeting for Thursday, 19 March, at 15:00 UTC.
> >>
> >> That works for me.
> >
> > I like to join.
> >
>
> I'd like to join too.

Thanks for the responses. The meeting is set up, and everyone on this
list is invited.

I shall see you then :).

Regards,

Ben

>
> Minas.
