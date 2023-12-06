Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A72495CB
	for <kernelci@lists.linux.dev>; Wed,  6 Dec 2023 16:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MKj7CSQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701881702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=atxHvBL0eYNcgagFI4r9frbYTqT5z/NDxowpslDH6qQ=;
	b=MKj7CSQzsU2wCmBHBgr+boc5CNETtJZ/rwIRsnUI0XcZfJxV25PV4z3RZn0NXavQWWppJ1
	wyyTX8vdqNNrISlMYXnbrk7ZhWTyZxuzpTe+060HJKARqfrQRxJI3enTqUhhenB3KdC0Iw
	1I1NprXchE5fycGxb6DwSoyRuk2WjDs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-Mgv9xqPPPuiagNjtS4Ib2Q-1; Wed, 06 Dec 2023 11:54:59 -0500
X-MC-Unique: Mgv9xqPPPuiagNjtS4Ib2Q-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40c22bc1ebdso52425e9.1
        for <kernelci@lists.linux.dev>; Wed, 06 Dec 2023 08:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701881698; x=1702486498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atxHvBL0eYNcgagFI4r9frbYTqT5z/NDxowpslDH6qQ=;
        b=VFl3BqD78mvHNcIJlfrYdOAFyOqMAcJclGfzp0a0lPKCmtTrMvOcpiKb7/i1aFPuDo
         qd117zL+os+J2ZNb4fXq+1JLkjh5oZzapdsAFanCqh9BZcrh/RX7ZFtERCq93/1HSO93
         KDzP680hEC5xp6Mn+rnYXa7tQdJh0FMVwBmtdy3hw2CtRluXgMu4I+vWP42mQSlDx6Vh
         Tn7Gn2O1g3uOGhUfiBtTa5ZyqzZWFpRJfpmiyIpy7tf9AZVKkwYl3TPPy/9AbwEhiIQl
         VVJF7AqG/mCX3BRuSD59o3GJl0JIgfqNJzcKd++qDiKj2QjnrLp6+s/+Me1P4An9G1H4
         B6Eg==
X-Gm-Message-State: AOJu0YwsTaf1Swx3JT/0i3+B6GAz0du0EEWkUe1Vjrm2HVg65oLhwn36
	HiU5Oft5+KSApeTyW2hPeYWoVmbnfnfNu1/gcxhJYm5cbECS3LTbxNaEjB8zgF95W/p4SSJMcKd
	g6bSWJVVDxDbnU6tTVy4=
X-Received: by 2002:a05:600c:3b25:b0:40b:29e7:c150 with SMTP id m37-20020a05600c3b2500b0040b29e7c150mr1766000wms.0.1701881697982;
        Wed, 06 Dec 2023 08:54:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGApzDn3gWY0wzR7OuPjSeHht/rxmk49mHdttKkYgnXEeSZCGG+1ECABcB8N2fpPvSO1UG/3Q==
X-Received: by 2002:a05:600c:3b25:b0:40b:29e7:c150 with SMTP id m37-20020a05600c3b2500b0040b29e7c150mr1765993wms.0.1701881697689;
        Wed, 06 Dec 2023 08:54:57 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id ay17-20020a05600c1e1100b004063cd8105csm251204wmb.22.2023.12.06.08.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 08:54:56 -0800 (PST)
Message-ID: <1a3ad44d-cdc5-4dd0-a734-49b197ad1c37@redhat.com>
Date: Wed, 6 Dec 2023 18:54:54 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/10] MAINTAINERS: Support referencing test docs
 in V:
To: David Gow <davidgow@google.com>
Cc: workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>,
 Theodore Ts'o <tytso@mit.edu>, Steven Rostedt <rostedt@goodmis.org>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 "Darrick J . Wong" <djwong@kernel.org>, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, Veronika Kabatova <vkabatov@redhat.com>,
 CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-7-Nikolai.Kondrashov@redhat.com>
 <CABVgOSnW1Yzz-1Zdr-k-qWL25yUDZo+jbhPwNkK7dG-8-WonFg@mail.gmail.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <CABVgOSnW1Yzz-1Zdr-k-qWL25yUDZo+jbhPwNkK7dG-8-WonFg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/6/23 10:03, David Gow wrote:
> On Wed, 6 Dec 2023 at 02:45, Nikolai Kondrashov
> <Nikolai.Kondrashov@redhat.com> wrote:
>>
>> Support referencing test suite documentation in the V: entries of
>> MAINTAINERS file. Use the '*<name>' syntax (like C pointer dereference),
>> where '<name>' is a second-level heading in the new
>> Documentation/process/tests.rst file, with the suite's description.
>> This syntax allows distinguishing the references from test commands.
 >
> I like the idea here, but wonder whether it makes sense to put all of
> these tests into a single 'tests.rst' file. There's already lots of
> existing documentation scattered around the tree, and while keeping
> all of the testing information in one place does have advantages, I
> think there's a lot to be said for keeping subsystem-specific test
> docs alongside the rest of the documentation for the subsystem itself.
> And it'd be less work, as the docs are already there.
> 
> So, could we just make this a path under Documentation/ (possibly with
> an #anchor if we need to reference just one part of a file)?
> 
> e.g., something like these, all of which are existing docs:
> V: *Documentation/dev-tools/kasan.rst#Tests
> or
> V: *Dcoumentation/RCU/torture.rst
> or
> V: *Documentation/gpu/automated_testing.rst
> or
> V: *Documentation/process/maintainer-kvm-x86.rst#Testing
> 
> (We could even get rid of the '*' and just use 'Documentation/' as a
> prefix, or the executable bit on the file, or similar to distinguish
> these from scripts.)
> 
> If we wanted to be very brave, we could extend this further to
> arbitrary webpages, like:
> V: https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/tree/README

Sure, having a filename (in a specific directory) or a just piece of path in 
the source (sub)tree would work too. The idea of single file was mostly to 
make it easier to access a *catalog* of all tests in a single file with small 
bits of introductory documentation, pointing to the more detailed 
documentation (wherever you prefer it to be) from there.

URLs would work as well for pointing to the docs, but they become somewhat 
more cumbersome and error-prone for use in Tested-with: tags (if we would like 
them), just because of their length and complexity. If we won't care for that, 
it's not a problem.

However, overall, I would be cautious multiplying the ways tests can be 
specified in V: entries (and Tested-with: tags), as that could quickly become 
unwieldy and confusing for humans, who are expected to be interpreting and 
writing them. Especially if the syntax could potentially be ambiguous.

Nick

