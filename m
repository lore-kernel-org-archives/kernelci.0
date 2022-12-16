Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81BD8490
	for <kernelci@lists.linux.dev>; Fri, 16 Dec 2022 20:17:58 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id bf43so5117840lfb.6
        for <kernelci@lists.linux.dev>; Fri, 16 Dec 2022 12:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQ2rPpzJN+I3l+HkfM85tQQ7+rWV9jXwGSgM4P3qAC4=;
        b=Cy2bfUBSz7mIlrHggEeH5BU7CiPh1LBqhkF6DyKcGpCtmQy+p/SOGH8QNCItmyYoTv
         tuwiKoSPDFykAAsi1P7odZc4Vw4MvgipROK6UVjRRrDYLmL5jeZyUcZzVxEt1uB0crLZ
         YG+zEm95scprmtg/o1+m72PDY93akrzJR6MI8s1O/St7EJKfA0vuHAJNJxxRmmZ2LEhB
         KhLvK+fMlx5VbY4XHBMb+AGI32Dggzmn/wTwZRyTxEs8CddRPF0XBcJde6wqzyRlpOa5
         yDICQIVaB/WFKMRMMJ+QeqB8+s6ctiZaaFEUKEtEMNZJaOOcqsXi1jkUwK3Gudp5KW8q
         C7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQ2rPpzJN+I3l+HkfM85tQQ7+rWV9jXwGSgM4P3qAC4=;
        b=BbbYY/r43ktA3N9apRSqcPrGAyjHYCyy8kOFlFaSOPL3IXRLGcCHggCoIrqI9d0Arp
         JIV5ALtQBp1UD9vSs3DvgHUw0MII4jAz7NZB9BxzJdk+VBoihsphR7enaLNqvBNcgdtF
         cjGDHxgC0QkgohX1ikNr6XhOp3Zk8WFa2suKE55pM99fZTV+0ujY/T7qQuqpKuhl7FGJ
         1gn/wzW2Ovj/269ZbO9gw4GjuI8RSkglnGh6CzLsj0Kn5O+cQdC2F8hieFx/Km5+Pe/O
         U1P+ZbKoblLNSEm91NLGjuGgCKjpQxaxmYZwYflSJHCvhM96zAKsUxWaCqMCDAvFEi4B
         BJUg==
X-Gm-Message-State: ANoB5pka2d4zq5XLr9vywb7QKYZUZRf/vju1GlL3H1HJdymkHnZSNJQ+
	d35WBGsDwiDq7MQs51+13vjdklpF5W5+LWYLMQNgbBUol6gFffBd
X-Google-Smtp-Source: AA0mqf6164N0o9x6A4GEjiKkUWwuArTz+5ug8+LshPaMCDrgROW+MYdIgDXDF6NVBL3EW3Y9cg/1dAf12VwI0GgmUGs=
X-Received: by 2002:ac2:4e6e:0:b0:4a2:2210:f169 with SMTP id
 y14-20020ac24e6e000000b004a22210f169mr29872083lfs.317.1671221876467; Fri, 16
 Dec 2022 12:17:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzfMO06w8cimnG9W_NnvnupxcF93tVVJOybUWjoQzNY3w@mail.gmail.com>
In-Reply-To: <CAHRSSEzfMO06w8cimnG9W_NnvnupxcF93tVVJOybUWjoQzNY3w@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 16 Dec 2022 12:17:43 -0800
Message-ID: <CAHRSSEw=t+jhbmHjZVL+mZTJii66pJnHfyNSGXFRt99=y7=6WA@mail.gmail.com>
Subject: Re: Please add android14-6.1
To: kernelci@groups.io, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

+kernelci@lists.linux.dev


On Fri, Dec 16, 2022 at 11:45 AM Todd Kjos <tkjos@google.com> wrote:
>
> Please add android14-6.1 branch to kernelci testing.
>
> repo: https://android.googlesource.com/kernel/common
> branches: android14-6.1
>
> Thanks,
>
> -Todd
