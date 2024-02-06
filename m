Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B0A1AB80F
	for <kernelci@lists.linux.dev>; Tue,  6 Feb 2024 04:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707192832; cv=none; b=LD1jBUZt2JqsWQ02Bf4plZUV7j17WhEALbxZz/Dj+NQHq+hjFqW1sC8ideWCxY3AOHFhgF0NxbCMp103M/nX2TK9tcUoiAV511dx30OVwTDVnlUWnRXK4xLVjO7thlmC0zM4A5MZdClehy4sCmmfpEsypDq/FDJLbEDkIVHVcDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707192832; c=relaxed/simple;
	bh=EYpWYhMOaFrNlOzVvjkYESVcffXmMcKcNtjN3dNEo0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALhs+STPIrbrWaijDO22NQ6jgJW0ApTGpeceoKL+9p088kYwYH5OzBK1X9umlmDvA/4LdLaDTFF3hTvMy2v2D8jkF6j6v/AWhxJ7iC3fB+8Aa3PMpCwAXHv5LVGXY5KgyEq8UsObxcDIuQvjcbEhmmtqeNHXFyPXChJDW5Up+Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nJYBuXU4; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nJYBuXU4"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-42a7765511bso121861cf.1
        for <kernelci@lists.linux.dev>; Mon, 05 Feb 2024 20:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707192829; x=1707797629; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWjlypBtyTUxplHTk3D9RBXwXO2gt9OAC5LJGVHbulw=;
        b=nJYBuXU4n14jIU1D8oQZ1BOo/bUP4v6ST4uO/rxoKXY7/ZKI4ZG1tac2DK40U3ghla
         +AeVaQ5wNOwJCh9t5McjcJpGCIg/DQzXxqkRurB197Zztf1h6gU8GbcGy04tX8Z1l5QD
         ViC2UWvEmimH6P/S5zQ5tB2AQlUhzzcUrFRLNfw+BlInB0s8kA692PR1kX9nuLREunrH
         ZQeR+WBD4vntQmTwpG4YDWx7lcCwsdCQ0oDeRTOszCRtHICmFEI3rmsVvSGestkcgs1t
         wQBtEt6pDcoo3CBabwMgTOXxREcJ5ISyRqAg++1i2Ag4Wqa4u+0+Bkk5Z1YuOqd0rsJU
         /KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707192829; x=1707797629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWjlypBtyTUxplHTk3D9RBXwXO2gt9OAC5LJGVHbulw=;
        b=hJEzOXfwYpKJ0b5F0XJnON7Zu4LFgNFI/YU5tILQ77JzAb1Vc84CtBBxGmj4aHqgHK
         pp0ooewKoGH+DJ65JsGNVwzM93kLE93pjkRr5tDgRhT8Tyww4QwbBWSwKMYn8OWq77Tq
         +LiqdfPmI0zkmsTxPMvhlzOgLpqA6c/+7Sh9mYTxgthas4ZQz2PcCJrk85N2aFCjZfCu
         PiVVWBvxL5zaw1FFf68J4jf+kfFDnBn+3Yk/xYXoTeFD1LwISDK3jNxocQD3eEJt0sXm
         Aj1iuCAWC5/OwpquasIpJQQmwHwSEqpATwAHDF/4POj66yrEoyz47mliE0zRsp6ooUW8
         G3OQ==
X-Gm-Message-State: AOJu0YyGBhDq3Cnf95BLurxG/ouBtbyO+AFvZoSatI9vE+GozDdlI5nn
	wo4qN0lC60aBiqixZUuVoYa0MQxeIistrPGAzKtlal+GvEufPXq+kMIM3Wnr5RnKHOVlED1mM/v
	GPs/L4vl8zCk5GklN/i149Tnirb8DTfG8Xnwo
X-Google-Smtp-Source: AGHT+IF+zwncKIMpfuhRX8d3KjdNcOIMUCb5EKpDL39rd4uTlyenwEJDN39KRailL3Phrr64u3gyORCgl9FVKUVUGt4=
X-Received: by 2002:ac8:5ac8:0:b0:42c:2d41:5f7d with SMTP id
 d8-20020ac85ac8000000b0042c2d415f7dmr132013qtd.17.1707192828650; Mon, 05 Feb
 2024 20:13:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240126221426.4173112-1-rmoar@google.com> <6CCB5F6D-EC6C-452A-9D25-0D7B3F9739AB@kernel.org>
In-Reply-To: <6CCB5F6D-EC6C-452A-9D25-0D7B3F9739AB@kernel.org>
From: Rae Moar <rmoar@google.com>
Date: Mon, 5 Feb 2024 23:13:36 -0500
Message-ID: <CA+GJov5nCLjD1iTUGxQOPMCXjBCci8-VbUje46Qd66szJgGtxQ@mail.gmail.com>
Subject: Re: [KTAP V2 PATCH v2] ktap_v2: add test metadata
To: Kees Cook <kees@kernel.org>
Cc: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	Tim.Bird@sony.com, shuah@kernel.org, brendanhiggins@google.com, 
	dlatypov@google.com, tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, guillaume.tucker@collabora.com, corbet@lwn.net, 
	kernelci@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 8:03=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On January 26, 2024 11:14:26 PM GMT+01:00, Rae Moar <rmoar@google.com> wr=
ote:
> > KTAP version 2
> > # ktap_test: main
> > # ktap_arch: uml
> > 1..1
> >     KTAP version 2
> >     # ktap_test: suite_1
> >     # ktap_subsystem: example
> >     # ktap_test_file: lib/test.c
>
> I think it's a mistake to mix "diagnostics" lines with semantic lines. Si=
nce the diagnostic prefix is [# ] (hash space) how about make the test meta=
data lines be [#:] (hash colon). For example:
>
>
>      1..2
>      ok 1 test_1
>      #:ktap_test: test_2
>      #:ktap_speed: very_slow
>      #:custom_is_flaky: true
>      # format-free stuff goes here
>      ok 2 test_2
> ...

Hello!

I really like this idea. The reason I chose the diagnostic line format
was to make it easier for existing parsers to parse the KTAP Metadata
lines. However, if it won't be too much of an issue for current
parsers, I think this idea would be better. So I am happy to change
this in the next version if there are no complaints.

>
> > ok 1 test_suite
> >
> >The changes to the KTAP specification outline the format, location, and
> >different types of metadata.
> >
> >Here is a link to a version of the KUnit parser that is able to parse te=
st
> >metadata lines for KTAP version 2. Note this includes test metadata
> >lines for the main level of KTAP.
> >
> >Link: https://kunit-review.googlesource.com/c/linux/+/5889
> >
> >Signed-off-by: Rae Moar <rmoar@google.com>
> >---
> > Documentation/dev-tools/ktap.rst | 163 ++++++++++++++++++++++++++++++-
> > 1 file changed, 159 insertions(+), 4 deletions(-)
> >
> >diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/=
ktap.rst
> >index ff77f4aaa6ef..4480eaf5bbc3 100644
> >--- a/Documentation/dev-tools/ktap.rst
> >+++ b/Documentation/dev-tools/ktap.rst
> >@@ -17,19 +17,20 @@ KTAP test results describe a series of tests (which =
may be nested: i.e., test
> > can have subtests), each of which can contain both diagnostic data -- e=
.g., log
> > lines -- and a final result. The test structure and results are
> > machine-readable, whereas the diagnostic data is unstructured and is th=
ere to
>
> We even say it's unstructured... :)
>
>
> >+prefix must not include spaces or the characters ":" or "_".
>
> Why not _?

My thought here was that the first "_" character in the KTAP Metadata
line would indicate the separation between the prefix and metadata
type. So the prefix could not contain "_". This makes it easier to
parse. I'm inclined to keep this but also willing to change it if
there is a proposed prefix that contains "_".

Thanks!
-Rae

>
> --
> Kees Cook
