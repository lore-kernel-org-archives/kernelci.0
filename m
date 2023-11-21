Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB5E2209E
	for <kernelci@lists.linux.dev>; Tue, 21 Nov 2023 18:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i8ORVFTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700591068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNYl1PYeJ+yMJVHbVOL4kO+jrMdgUAF5yyCcRUFcids=;
	b=i8ORVFTFqhPbzkaLn7wYuJ1l65sZFhm1W1uDm/xIBjxnGLnaGiabioiasFCGAScfL6y0my
	kSvTtLevnv9gyu6KI4OBtwFxMcJEPvNb0wPlpzHXrk01u3QRv5QnZVTn69tU1jhEFtoNyf
	JT2cbjq1jjLCVsWuN7B3YggL1T803rU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-L60ledrBNPi6GwHIeIrzaw-1; Tue, 21 Nov 2023 13:24:24 -0500
X-MC-Unique: L60ledrBNPi6GwHIeIrzaw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41cb6df5c7bso77742021cf.3
        for <kernelci@lists.linux.dev>; Tue, 21 Nov 2023 10:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700591064; x=1701195864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNYl1PYeJ+yMJVHbVOL4kO+jrMdgUAF5yyCcRUFcids=;
        b=KiDU0WYeyIDckjqDhqnC0PrvXmxBDCrWLjZzWKBBdrQ7sEbKB4TZI4h/SBun58fiXr
         8aAWwYMXLQR6zj/YuwLyQX6d0IKOBlh1BvNyMtl5uU00S0WNClGycH5IqzcXF+/bTqAw
         C0UBEXDZ1nFyO0ov/xyDyBub4BG489BQeOV/32KhYVj88TRI/TxpwTnWxO6G81IK44e8
         oZCWv5qgh4zGqZuxmfexYFQXnNdj6sZpHkt7i4gUbMOk3v5bGEnrOIwLkFiiDMtT7VBw
         RYAZzp/Hmn0PXzM9dSPSuU7WHQi6Nj3qG7C3gLAB4mRibJ75jxt8bh5GbQRRn6Wmx9NI
         zAGg==
X-Gm-Message-State: AOJu0YzfeF66WXUTZFTy7tL0SnqGuUUfM4gcZE3ESTbMXxuWYrVhCHH8
	CUqFMEjZCG4/UwrtpTN5L9/kEqFRKiEhJasHzUaT+yqDw+96gShMZNLJtH40BZRPJlai+W0PybW
	ERye3LV6/a1Mj7H7MJ3g=
X-Received: by 2002:a05:622a:610e:b0:423:7060:3d69 with SMTP id hg14-20020a05622a610e00b0042370603d69mr2561621qtb.41.1700591064282;
        Tue, 21 Nov 2023 10:24:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5ygAFkM23F7z13tnWZ/ReK//8WvWDmtKUoWmGQkQbYTbn9nuN9ibtfiofID6p6+/jnxpRSw==
X-Received: by 2002:a05:622a:610e:b0:423:7060:3d69 with SMTP id hg14-20020a05622a610e00b0042370603d69mr2561597qtb.41.1700591063921;
        Tue, 21 Nov 2023 10:24:23 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id d21-20020ac851d5000000b0041eb13a8195sm3757750qtn.61.2023.11.21.10.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 10:24:23 -0800 (PST)
Message-ID: <6756606e-d441-47a3-9209-58770fdb0a1a@redhat.com>
Date: Tue, 21 Nov 2023 20:24:19 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
To: Theodore Ts'o <tytso@mit.edu>,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc: workflows@vger.kernel.org, joe@perches.com, apw@canonical.com,
 davidgow@google.com, rostedt@goodmis.org, broonie@kernel.org,
 skhan@linuxfoundation.org, djwong@kernel.org, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, vkabatov@redhat.com,
 cki-project@redhat.com, kernelci@lists.linux.dev
References: <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <87sf50imba.fsf@collabora.com> <20231120205131.GA291888@mit.edu>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <20231120205131.GA291888@mit.edu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Theodore,

On 11/20/23 22:51, Theodore Ts'o wrote:
> On Mon, Nov 20, 2023 at 02:30:49PM +0100, Ricardo Cañuelo wrote:
>>
>> This is not trivial because tests vary a lot and we'd first need to
>> define which artifacts to link to, and because whatever is linked (test
>> commands, output log, results summary) would need to be stored
>> forever. But since we're doing that already for basically all kernel
>> mailing lists, I wonder if something like "public-inbox for test
>> results" could be possible some day.
> 
> What we have at work is a way to upload the test results summary
> (e.g., just KTAP result lines, or the xfstests junit XML) along with
> test run metadata (e.g., what was the kernel commit on which the test
> was run, and the test hardware), and this would be stored permanently.
> Test artifacts is also preserved but for a limited amount of time
> (e.g., some number of months or a year).
> 
> The difference in storage lifetimes is because the junit XML file
> might be a few kilobytes to tens of kilobytes. but the test artifacts
> might be a few megabytes to tens of megabytes.
> 
> Of course once you have this data, it becomes possible to detect when
> a test may have regressed, or to detect flaky tests, and perhaps to
> figure out if certain hardware configurations or kernel configurations
> are more likely to trigger a particular test to fail.  So having all
> of this data stored centrally would be really cool.  The only question
> is who might be able to create such an infrastructure, and be able to
> pay for the ongoing development and operational costs....

Yes, I agree, having public result storage would be awesome. I think KCIDB is 
relatively-well positioned to take on some of that work. We have the POC 
dashboard already. Well, *had* until somebody scraped it and exhausted our 
cloud budget, I'm working on making it cheaper before bringing it back.

Meanwhile you can get a glimpse of it in one of my slide decks:
https://static.sched.com/hosted_files/eoss2023/ef/Kernel%20CI%20%E2%80%93%20How%20Far%20Can%20It%20Go%20%E2%80%93%20EOSS%202023.pdf

We also have an artifact-mirroring system (quite basic at the moment), 
expecting the submitter to already have the files hosted somewhere. We would 
need to add a file upload service to that.

Finally, I'm considering opening up submissions to (Google-authenticated) 
public, as opposed to just CI systems, so we could support this. That's still 
more work though.

Regarding analysis, I have plenty of ideas for that too, and even more ideas 
are explored by others lately. I just need to bring back the dashboard and 
find the time for all of it :D

Anyone interested in helping with any of this?

Nick

