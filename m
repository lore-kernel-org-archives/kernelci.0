Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF718B0C
	for <kernelci@lists.linux.dev>; Thu, 21 Sep 2023 20:17:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4051fea48a8so16007625e9.2
        for <kernelci@lists.linux.dev>; Thu, 21 Sep 2023 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695327426; x=1695932226; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6/VvjH+S7lnBgC8u3H6UtqPrae5j6fO/H5XWJi0GmbY=;
        b=Ll9mBQmEGCHn5vD+WlCknAgGv55btFup1iHbj/gxcjcewHEisI1ekDYlcnfOLbgWAo
         gQV5z1/5u7m+/oATS7Jg03eOKgOeYoN05vv6obFs6ZjZpUAAM6IJCf5PBxFpc7d1DOMp
         hjtRx8AdFUCV8jooJjeUn3KtwRqgFzf0KkdiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695327426; x=1695932226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/VvjH+S7lnBgC8u3H6UtqPrae5j6fO/H5XWJi0GmbY=;
        b=Z6hGc+I6o5ANiBgYxyKVNJe6TCnZQdGKaBgRxvlQRu8OpCP6egv+QxKUE2C+bun7Ax
         dJentcBpenixLV4vYb3XYkKTqlzmpBInnSLxA4ooIvTzRZKR3kcj0NEtRVNRRgCKOtnA
         Wfyu2mI2QOZz1QT2mZbApAMsVFpX/7Fix6prxAxYP47Y/emolZSto8gT47ZUEVKQEWmA
         HYGEcXyvRry3Rh9Ry/Im/eZSDk09S2i12RwN7TMMUZX8JAwUYooX5KiQSfUGNWzwkeUF
         uAM/uMfV2J+gDIkd8EM/JeDuokrBG0khMBTdGEmnHNOCPXiXxyCuqsqfESU0a+OCLSBC
         /hxQ==
X-Gm-Message-State: AOJu0YzL6C08KUFJhybdsoTVM9futQjzc8ESU7ikMxOIF3LjaLbVoE3u
	9Dpp3IV9jNJPKNfSV5MIPunXnw==
X-Google-Smtp-Source: AGHT+IEbMtbXONx+W5x3bcabTin3GAvqEafms0b+3bFslj39ePUuxC7KtgP1Z/epeK4IDNX4+6gJJg==
X-Received: by 2002:a05:6000:8a:b0:31f:f829:49aa with SMTP id m10-20020a056000008a00b0031ff82949aamr5471055wrx.23.1695327425904;
        Thu, 21 Sep 2023 13:17:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd? ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id h17-20020a5d5051000000b003197c7d08ddsm2572500wrt.71.2023.09.21.13.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 13:17:05 -0700 (PDT)
Message-ID: <b6743bf5808d43a48e9cc78ea0871fd8f23e1f6f.camel@linuxfoundation.org>
Subject: Re: [Automated-testing] kci command line poll: Click or Typer?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Bird <tim.bird@sony.com>, "guillaume.tucker@collabora.com"
	 <guillaume.tucker@collabora.com>, "kernelci@lists.linux.dev"
	 <kernelci@lists.linux.dev>
Cc: "automated-testing@lists.yoctoproject.org"
	 <automated-testing@lists.yoctoproject.org>
Date: Thu, 21 Sep 2023 21:17:02 +0100
In-Reply-To: <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
References: <9acfa649-4ae0-2e56-16b8-b7c24ab60a30@collabora.com>
	 <BYAPR13MB2503E4A7D66BEFE5B8E95B30FDF8A@BYAPR13MB2503.namprd13.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Tim,

On Thu, 2023-09-21 at 19:41 +0000, Tim Bird wrote:
>=20
> If you do stay with argparse, I would pull a current copy of the
> module into your own repository, so
> you are not dependent on updates or external repositories.
>=20
> For my own projects, I have my own argument parsing functions written
> in native python, so I am reliant
> on as few core python modules as possible. (So my answer, for my own
> projects, to the question of which
> external python  module to use for argument parsing is "none of the
> above".)
> The python community just cannot be trusted not to break the language
> or the core modules in a
> backwards-incompatible way.
>=20
> If the python community cared about backwards (and forwards)
> compatibility, they would not need
> the whole mess that is virtual environments.

I saw this and found it interesting. I've somehow ended up working with
and maintaining a relatively complex python application for over 15
years (Bitbake in case it isn't obvious). Admittedly we've tried to
keep it's dependencies minimal (much to the frustration of some) so
I've not had much exposure to the wider module ecosystem and I've point
blank refused to 'need' virtual environments for our use.

Whilst there certainly have been annoyances and the 2->3 migration had
its moments, in general I've not found it to be that bad. I started out
wanting to use something else but over time have grown to quite like
the language and I'm not sure what we do would have worked in something
else. Where there have been changes, you can see there were clear
improvements they were trying to make.

Most of the feedback I get is that we should be embracing modules and
I'm stuck in the past keeping things minimal but it clearly does have
some advantages! I've forever being pushed to require a higher minimum
python version so we can adopt new language features.

Just a different perspective :)

(we use argparse FWIW)

Cheers,

Richard
