Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830102AE90
	for <kernelci@lists.linux.dev>; Mon,  7 Apr 2025 19:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052863; cv=none; b=iPbd6EKrChX9hnlHSZGHu2LGqyRQoRryU0jS8qLSVDPIUSuZX4SBS+ozPeELDdxvCl5ifpCUd9L99FP0oVvFHSQekiy77Dngxw0PY99pxkVCDXtdi4+diJaJcIIiLnX76V/sL1hUiEl07U7/3Q0z/sCrI72qJ0ZsPqPQlibilqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052863; c=relaxed/simple;
	bh=Tv1fwomTDkihD3yk+FLZ19bVhPMEsfDJUnLd4jwD3v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tixSFJOVGwI7J5Yu8RPiNObgfqeAjzfdTre5EDBBq1j6VkO2FTS+1L73K309oR2i0YWh07F5R3VBzA8HDmx39m76nOof6/kApd+VIy7ayAVW9v0Stj9seeP2pHHgI4Y3EIkYgQBrApQIa4/gIgj1Ed3VGg74XDq0h6IsrwyrTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8RhOumP; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8RhOumP"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so19769826d6.1
        for <kernelci@lists.linux.dev>; Mon, 07 Apr 2025 12:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744052860; x=1744657660; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXhv4yIIInGDYbQpkzHVUlH0pu858YpdC/sleKM4SDQ=;
        b=f8RhOumPela/uZyP/QYQbmNuUccIuZjZLnRsD2Lfj8lA/s8RwrG5tPoeoF2j4acas0
         Felh01qH6uw8mTsIlRFmIsJQipls+UAp11XPMgegsuQzV+yLfT6KIuLfeyFOLXykj1+l
         kw7QK4fsLVdrYCOk79sLabEnaYQu+YsUeBhtbhJ/1YFok7N7gx7b03nTDBMZS0KZoJLH
         I1mJFEUXC7QQ9mhMqeSOelzWKiJ3ssD617uX50j+2o614I0fYvEYOxLshgadgyciES9i
         VI6KqNpQ2s9JMCPRskIWiIE0/LUNHKjnXS1jh5S1mwNI8YQYfEiLnW6a5ZTTlFmN0XjV
         8Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744052860; x=1744657660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXhv4yIIInGDYbQpkzHVUlH0pu858YpdC/sleKM4SDQ=;
        b=sQM1CV2ve2EA7lgpAJDyBmPrMGTbTt0DcFgcD4ZT7YWAW5Howt8s01oDmyFB2R+XOH
         dO8T8PKqo7Dlcpz2VLhxXEfAQgVhmIXhtJxvKS/snGB+iAnT6VEAmAw0of4y+4UCObGu
         ogXJ7NNxbt4MG5U/+XqVHvJYErcJashvleQftyk9SDDzeAAThyThu7f00h6jWRTIhdCB
         aMXCTKHShqF6EvjRk57oxZ6f7RRP0FzC+ItryAQEkU1zLcWTuJod8VpYdlcZ+rwV4NG7
         Nmg0jcoJZ5peK6viwT3HsFfHhuAxArniawJh+1swpc0s6nd3zNbfr9Ys7d+p+ynwzCl5
         OSBg==
X-Gm-Message-State: AOJu0YxDgyip01O7XJruxKh6F1myNCIhTc0ya4r1m+txW2tQrvVgq3gj
	IeAre7JcXa7SZ3AATEKNLOJ0o/WuxJj3sIcue+a+HYOV0FGX4hUQlvGrcxe3Jr0+124dhmmBrch
	meqXSxBBN074Qi1SXurbUS7DCcfA=
X-Gm-Gg: ASbGnctA0TVZ0NIKNOY2+WUz/9MXk5y3GdEPTw0TRGm8J5hga6C3AUcp2VgbFgBIUiC
	aAo3e+Di8Z9eOQ0ZFk1IoZZe7/oo5dNCNFa/awmLvpTBg5oTZ5aDwhtwmjorCb+ElLjkdHsD16m
	BdpRssk5E6aLKL8IHd4MT0hLSa/7t2gtnPXVGVUKo=
X-Google-Smtp-Source: AGHT+IEqXP6ZjZYk5PO+f3BrpbNM2C/+oDaAkVY6ywnRlpLka/gSG1qnXXiHtsi5KX4DSHvUyutGpFRolMeGu6sgt+o=
X-Received: by 2002:a05:6214:1d04:b0:6e8:fa72:be49 with SMTP id
 6a1803df08f44-6f00de8c79fmr227101416d6.12.1744052860450; Mon, 07 Apr 2025
 12:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMtebm+miDTOR-PcJrJbzfSS=1eNLQJ8CGQf1E3+NpcLh+mYKQ@mail.gmail.com>
 <CAK18DXbHK5BOjEcLSAnMSZ4SejXtwiQ_EhrnzsN9U2stg8XGBQ@mail.gmail.com>
In-Reply-To: <CAK18DXbHK5BOjEcLSAnMSZ4SejXtwiQ_EhrnzsN9U2stg8XGBQ@mail.gmail.com>
From: Adrian Johnston <adrian3@gmail.com>
Date: Mon, 7 Apr 2025 12:07:28 -0700
X-Gm-Features: ATxdqUFb4prthOo-8OF5C9-b41NwbEvG1Fn3bqrLMgNfykSjuZgjAYMAnf3Kml8
Message-ID: <CAMtebm+onFgWnwDjotybQOr5aWZFFZ+3=jhhA_RLgMDWst3rXw@mail.gmail.com>
Subject: Re: ref_tracker
To: Donald Zickus <dzickus@redhat.com>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There was a LWN article that descrives it:
https://lwn.net/Articles/877603/  That article claims that "A simple
call to ref_tracker_dir_print() will cause the stack traces associated
with any leaked references to be printed to the system log."

From looking at the code:
https://codebrowser.dev/linux/linux/lib/ref_tracker.c.html  It seems
that a double free will cause a printk(KERN_ERR...).  If you have that
as part of your debug build the it should just be a matter of checking
the logs.  This probably the most important class of bugs.

Eric Dumazet <eric.dumazet@gmail.com> was the original author.  The
main questions I have about this tool is whether more changes would be
required to capture ref-counts all across the kernel.  I'm happy to
follow up with him if you want me to get him involved.



On Mon, Apr 7, 2025 at 6:27=E2=80=AFAM Donald Zickus <dzickus@redhat.com> w=
rote:
>
> Hi Adrian,
>
> On Fri, Apr 4, 2025 at 5:53=E2=80=AFPM Adrian Johnston <adrian3@gmail.com=
> wrote:
>>
>> Hello kernelci,
>>
>> I have exciting news. We have a reoccurring class of dangerous bugs in
>> the kernel that could be identified during a CI run.
>>
>> The kernel comes with a reference count debugger called ref_tracker.
>> And yet, every minor release of the kernel seems to fix another
>> reference counting bug.  Often kernel releases fix 3 or more.
>> Meanwhile, the folks over on linux-debuggers aren't even sure anyone
>> is using this reference counting debugger that often.
>>
>> Is anyone willing to flip the switch on this debugger on your staging
>> machine?  This seems like the kind of thing Linus should know about 20
>> minutes after merging a patch.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
include/linux/ref_tracker.h
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D4e66934eaadc83b27ada8d42b60894018f3bfabf
>
>
> It appears the Fedora / Red Hat kernels have it enabled in their debug ke=
rnels.  We don't explicitly set it, it appears to be auto enabled by settin=
g the 'DEBUG' config.  Not sure if that is expected.
>
> How can a CI system take advantage of this? Is there a stack trace that s=
hows up?  Do we have to cat the output of a /sys or /proc file?
>
> Cheers,
> Don
>
>>
>>
>> Thanks!
>>
