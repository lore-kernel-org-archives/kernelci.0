Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23309D535
	for <kernelci@lists.linux.dev>; Tue,  5 Sep 2023 17:18:22 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-414dff0a8ecso22051cf.0
        for <kernelci@lists.linux.dev>; Tue, 05 Sep 2023 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693934302; x=1694539102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2pWM5ihgOr8NvfvVVWbH06qEhTURHmAEzQsNFmz4kg=;
        b=z3x3VSroVs0Ny7duKZKTL8Yd9RpmPIJGkdoDekx687DgrwEYVsb+FqzUQ/CY/KRZkY
         2q8wKpHWcOxOv3teOBoNQiumbmMgmham1rW5CiL2q7dHoR58m25Bu+xFRqaFF24VQF6z
         byBJ5GbTKtJhUuozgrLm31cCZyPF4QI0vIEs5i4ADMeWjTvLUcVc9DYRuDW5tyX84pJE
         1Gxmv36L3bWulgHTMTeO/WmKhlhIOIBAQLe1T+hhXvRndkQ0runMeHMjEyoGgoaLpx9o
         u85E3oVn+dOiG2psLY/SNWsdyV3fJSuWmt/iXkX7Wjp9gbsPTF5mDP8FEo0IgM5VK7ch
         9MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693934302; x=1694539102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2pWM5ihgOr8NvfvVVWbH06qEhTURHmAEzQsNFmz4kg=;
        b=VtqMOSpm0DLABuQvd/CDlxkGdTbJLZP19cBp13xLOpqGxF4q+K/v2pxlowZNGEY3l+
         bA8sY1zDCcZrVIqk+CfDAT3nA57+7geEwPewXiXx5JuHvQaOYwNu+e9JcasLamvC1WvN
         PUqby7fu0KJ4dGkx+G5U/RqC2r7s5oUEux1i6PSkVaK2EuT5w80kyHriJ1YJwnw47E0l
         M5vokS8qT38cyKn/zb4zyCfkjhA1UsS3OhrzmIApPvKn77gffD8MD7SofY16xpdN53i+
         8pTGI5tbI/n8+5iSH4sivSBnXEXiwXilElPHwDvDu/XeQP7j3h0SKfMHLcVzt7H22GvC
         hvxw==
X-Gm-Message-State: AOJu0YwiXP/3NthvGGOUJpIjmGWLVzkWHxzXTApI3O3l2MBnrM/dO7V6
	F2BcX89wrdlbVi+vMrxZizsWC3whMtpg4H0fvlH+G2BATSeRTI9O49k=
X-Google-Smtp-Source: AGHT+IEh7IlJgcTe6yXj7hbhJY/bWE7EM1+cIBFMKQN4Y+4X9F+s9qHMRHdezg2NsSWJiHnirgYz1R0nrdgoYU4Nmgw=
X-Received: by 2002:ac8:5b87:0:b0:40f:d3db:f328 with SMTP id
 a7-20020ac85b87000000b0040fd3dbf328mr21940qta.2.1693934301723; Tue, 05 Sep
 2023 10:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
In-Reply-To: <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Tue, 5 Sep 2023 10:18:09 -0700
Message-ID: <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 8:56=E2=80=AFAM Todd Kjos <tkjos@google.com> wrote:
>
>
>
> On Tue, Jul 11, 2023 at 4:57=E2=80=AFAM Guillaume Tucker <guillaume.tucke=
r@collabora.com> wrote:
>>
>> Hi Todd,
>>
>> On 11/07/2023 00:41, Todd Kjos wrote:
>> > Please add the following new Android branches to kernelci testing.
>> >
>> > repo: https://android.googlesource.com/kernel/common
>> > branches:
>> > - android15-6.1
>> > - android14-6.1-lts
>> > - android14-5.15-lts
>>
>> I've created this PR accordingly:
>>
>>   https://github.com/kernelci/kernelci-core/pull/2002
>>
>> Please note that we're now operating with reduced build coverage
>> due to some temporary limitations with our Azure subscription.  I
>> know the Android kernel builds should be covered by the GCP
>> clusters but right now the system is designed to distribute
>> kernel builds randomly across all clusters so we can't easily tie
>> Android builds to the Android clusters.  Hopefully we'll find a
>> solution to go back to normal coverage within a week or two.
>
>
> Hi Guillaume, Any ETA for when the full set of builds is restored? We sti=
ll have greatly reduced build coverage and it's been a month.

Ping. We are getting a lot less value out of kernelci with the greatly
reduced set of builds for the Android kernels. When will the full
build coverage be resumed?

If it needs to stay reduced, can we decide precisely which builds are
done for Android kernels?

>
>>
>>
>> Thanks,
>> Guillaume
>>
