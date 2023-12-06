Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B414653A
	for <kernelci@lists.linux.dev>; Wed,  6 Dec 2023 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DoqKhGRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701879367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yV+EAjFiNperhRT8qfQcFC8inivxo54rtgnFwg4w55c=;
	b=DoqKhGRBAh97X6riznhTORyE8RjcMugN4ZfhtM6a5V1a31zAqO7HcsuCIl0a+Y6vBCXgFH
	xST7e926zitS3ZDj1NNhs5i5FLmAKcmA2Aa9Ia9FNb4BYheSxzwoWHJyF2OkfNC88sphO0
	i5fqZwPlZm24RJf3L424c/0X/0xYWhs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-z5rZCdDBPvu0RLGVEQln0A-1; Wed, 06 Dec 2023 11:16:04 -0500
X-MC-Unique: z5rZCdDBPvu0RLGVEQln0A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-332e82bb756so542844f8f.1
        for <kernelci@lists.linux.dev>; Wed, 06 Dec 2023 08:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701879363; x=1702484163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yV+EAjFiNperhRT8qfQcFC8inivxo54rtgnFwg4w55c=;
        b=nN9HY6kpQ4xg7GO5uH1BpAkEqdBQ7eMCgKxSnDx3RTbMoeeqBj7M4pDSuQoMWTsZYh
         qyrzZIxqBq3sKDix6V3IRkxu8h4W10HrpC/cb0qWLfZ+tM9RseHWwpsZrJOxAGarpwdo
         20SkMwtKhZG4xhS+wcmPXjwSkqnD1tX+Ifs/uOKTWACpsNNZAyY+zTyCAd5TrkMv9GAH
         oapp7sx4VG18FxiW0MJ2yod45RNHWmKErQmxmaXZFG8FF+p7gqvwyWPGrBdg+xxb8vUc
         cMh5VQ+/DxqFWMR4w5rqOP2XH53PETQ+WgyO071DOeK88Rxx9P9rtwLKKzbjYBdgpRUV
         AQPg==
X-Gm-Message-State: AOJu0YzrH68jtOuBC2m18qzdFbROkF3w6BuKi1ppCh+bt/zp6xXWkemr
	LaVZHgjfMz4aDT8sUde5S9NFA6XWJt1Xd7Tq4qom0Z3fXQCz9cvQV4rM3xHCmgSOEoVzDz2eDUX
	BvwL5Gqc5jBnB30a3fb8=
X-Received: by 2002:adf:e0d2:0:b0:333:18f6:e1d1 with SMTP id m18-20020adfe0d2000000b0033318f6e1d1mr663767wri.4.1701879363669;
        Wed, 06 Dec 2023 08:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTaUa0QpxcS/ure11HIYA1UTotIBwm18sFisuwlNoxHyxz08KDkgP4xAFLPJmyFS2n0/MTpg==
X-Received: by 2002:adf:e0d2:0:b0:333:18f6:e1d1 with SMTP id m18-20020adfe0d2000000b0033318f6e1d1mr663760wri.4.1701879363301;
        Wed, 06 Dec 2023 08:16:03 -0800 (PST)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id e25-20020adfa459000000b0033338c3ba42sm37676wra.111.2023.12.06.08.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 08:16:02 -0800 (PST)
Message-ID: <7f662f61-330a-4134-b1a4-4bffcc4040d3@redhat.com>
Date: Wed, 6 Dec 2023 18:16:00 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/10] get_maintainer: Survive querying missing
 files
To: Joe Perches <joe@perches.com>, workflows@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, "Darrick J . Wong"
 <djwong@kernel.org>
Cc: kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 Veronika Kabatova <vkabatov@redhat.com>, CKI <cki-project@redhat.com>,
 kernelci@lists.linux.dev
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-1-Nikolai.Kondrashov@redhat.com>
 <20231205184503.79769-2-Nikolai.Kondrashov@redhat.com>
 <9fe310a9d4486ecf57669bf7b44a49c1788452c1.camel@perches.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <9fe310a9d4486ecf57669bf7b44a49c1788452c1.camel@perches.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joe,

On 12/5/23 20:55, Joe Perches wrote:
> On Tue, 2023-12-05 at 20:02 +0200, Nikolai Kondrashov wrote:
>> Do not die, but only warn when scripts/get_maintainer.pl is asked to
>> retrieve information about a missing file.
>>
>> This allows scripts/checkpatch.pl to query MAINTAINERS while processing
>> patches which are removing files.
> 
> Why is this useful?
> 
> Give a for-instance example please.

Sure! Take the ebb0130dad751e88c28ab94c71e46e8ee65427c9 commit for example.

It removes a file (and recreates it in another format, but that's besides the 
point) which belongs to four subsystems.

This will work OK:

scripts/get_maintainer.pl 
0001-dt-bindings-mailbox-convert-bcm2835-mbox-bindings-to.patch

But if we try to give the file being removed to get_maintainer.pl directly:

scripts/get_maintainer.pl -f 
Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt

It will abort with the following message:

scripts/get_maintainer.pl: file 
'Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt' not found

Even though the state of the source tree we're running this on is *exactly* 
the same.

The latter (using the -f option) is the way checkpatch.pl works to fetch the 
maintenance status (in is_maintained_obsolete()), and the way I implemented 
fetching the tests from MAINTAINERS (in get_file_proposed_tests()).

This way seems to work better for checkpatch.pl, I suppose, because it can 
link the error message to a specific file. But in principle, it might be 
possible to just call get_maintainer.pl on every patch, if we really have to.

However, I feel that conceptually it should be possible to query MAINTAINERS 
without actual *source* files being present in the tree (as opposed to patch 
files which it needs to read), or even the tree being there at all.

I saw that we are printing a warning if the queried file is not there in the 
git repo (I guess it's helpful?), and thought perhaps we can do the same 
without the git repo too.

Hope that helps!
Nick

