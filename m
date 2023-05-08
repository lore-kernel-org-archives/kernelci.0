Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F6168AD
	for <kernelci@lists.linux.dev>; Mon,  8 May 2023 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683541014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmvnlmJGXlxlSG9ykEGsed6HchVBGeu9FKU7kpKy4jI=;
	b=MrSFIdTe3RWckC7RqUHh4bAU2GdRHuP0zRLc1QGMUsdChBKg8xh0r3LqdzgOLPJ0QW9W9W
	GVhEb3UtY9VVQFCuQwnickvSshJS8t6KO2Fcy6IB5yt9LpAhRGW9E+OV9L743EUssbUvgL
	3GUkudq3sKyxE/B4KHfEoj5GOVt+IV8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-3EEpr149P2mO2qA06wkIlA-1; Mon, 08 May 2023 06:16:53 -0400
X-MC-Unique: 3EEpr149P2mO2qA06wkIlA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f16f50aeb5so15989395e9.3
        for <kernelci@lists.linux.dev>; Mon, 08 May 2023 03:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683541012; x=1686133012;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmvnlmJGXlxlSG9ykEGsed6HchVBGeu9FKU7kpKy4jI=;
        b=Hh2pWfJp5ToJlEyxlL8K401mvVByGbjbmtzXCjaJpp5ivPRSknWzyt2jSdKRSyFV2U
         k/3JSxXh0ZgToSZHOCSSyCQAHv8umzyoC+KS7l6HZl02ou0gtsq1Zm9nnyfji7JkuHIt
         suBG7xfdxrKx63XjOXay+UPleyFfxBvlX03Zmz5Cu6RapT4kkyxmfb+iBT7kuStgNcwj
         cvgkzUXKwHloZqnILnvfY/+WZpcUc88K/1b08HesFBfb87N8gQ4al3MRCNFOTUeTzADV
         ICY/9hVE5KVYPTsM9kKLiXjJDrUUGN6AcXaE87Vdib6uUT/n/bho9jaXoy+8KpDrhvyG
         cpyg==
X-Gm-Message-State: AC+VfDyTcdjITKWEzSt5XZRIvzW3NS9Xu9+9/Htngz7Ap6GELt6ZkNuJ
	nxQPlGkrXJumW0naLmI1a6N5prjErqlb1ecDt6FPVvGdosYHATzEdp4+NgSpfh/LDjkcDDkLHsW
	SXvFxdp75bQRGmtEySJc=
X-Received: by 2002:a05:600c:ad8:b0:3f2:54ae:6921 with SMTP id c24-20020a05600c0ad800b003f254ae6921mr6531104wmr.2.1683541012489;
        Mon, 08 May 2023 03:16:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+tHWjz/ZJurBNSgggdxkLutN1+RfZqkeby+lON4q3zYdlkdVY5ANc7ImPpw5KpNTjI8XXaQ==
X-Received: by 2002:a05:600c:ad8:b0:3f2:54ae:6921 with SMTP id c24-20020a05600c0ad800b003f254ae6921mr6531084wmr.2.1683541012160;
        Mon, 08 May 2023 03:16:52 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id z17-20020a1c4c11000000b003ee20b4b2dasm16221212wmf.46.2023.05.08.03.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:16:51 -0700 (PDT)
Message-ID: <802d64a7-6caa-9ec8-3c02-f5be808f3e91@redhat.com>
Date: Mon, 8 May 2023 13:16:49 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Automated-testing] KCIDB: Support one more test status
To: Guillaume Tucker <guillaume.tucker@collabora.com>,
 "Bird, Tim" <Tim.Bird@sony.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Dmitry Vyukov <dvyukov@google.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Alice Ferrazzi <alicef@gentoo.org>, Philip Li <philip.li@intel.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>, CKI <cki-project@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Johnson George <Johnson.George@microsoft.com>,
 Sachin Sant <sachinp@linux.ibm.com>
References: <45be6714-b818-0be7-3e95-9f69af65096c@redhat.com>
 <BYAPR13MB2503FE8D3D92A95B8B331B8DFD629@BYAPR13MB2503.namprd13.prod.outlook.com>
 <76255cf0-170b-a091-e7b7-544ce3d3af50@collabora.com>
 <30ee8d77-3122-75d1-4a5e-c9f4a2d53b7f@redhat.com>
 <2a3a2210-281f-a8b9-5b58-46e6f3d5cf5a@collabora.com>
From: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
In-Reply-To: <2a3a2210-281f-a8b9-5b58-46e6f3d5cf5a@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Guillaume,

Thank you for the response.
I snippet some old stuff, and answered a bit, below.

On 5/5/23 14:39, Guillaume Tucker wrote:
> On 20/04/2023 18:37, Nikolai Kondrashov wrote:
>> Yes, the "ERROR" status is for when we actually got to executing the test (suite), and then it messed up, and e.g. crashed in the middle of execution. This is likely a problem for test maintainers to solve, and not for the CI people (although they would do well to keep an eye on such results too).
> 
> OK I think the documentation could be updated to provide a bit
> more context about what's expected from each status:
> 
>    https://kernelci.org/docs/kcidb/submitter_guide/#status
> 
> At the moment, it just says that ERROR means:
> 
>    "the test is faulty, the status of the tested code is unknown."
> 
> The word "test" here I think means the code written to run a test
> to you, but I can see how this might be interpreted differently
> and things that prevent the test from being run could slip in and
> be reported as errors.  Maybe adding something about who in
> principle is responsible for each error status would help as
> discussed in yesterday's meeting (e.g. ERROR is for the test
> authors, MISS is for the people in charge of the test
> infrastructure).

Yes, we could use better documentation, definitely. Have you taken a look at 
the PR in question? I refined the schema docs there a bit, do they make more 
sense now?

Here's the PR: https://github.com/kernelci/kcidb-io/pull/74

If that looks good, I'll update the Submitter Guide with this and go into a 
bit more detail, adding the table I used here to break down the responsibility.

>> Yes, as I also described above, if you care about which exact tests a test suite executes, and some tests in your previously-submitted plan didn't execute after all, then you would need to set their status to "MISS".
> 
> Right, even though I think that's a grey area between the test
> and the infrastructure.  Maybe no status would also work here.
> 

Yes, often it's hard to determine what's at fault, but when you can it's best 
to avoid alerting people who are not responsible for the problem (such as not 
notifying the test maintainer in case of CI failure).

>> But if you only care that this suite executes, and runs whatever tests it deems important, you could e.g. send an object for the whole test suite with its status missing before starting. Then send its subtests with status filled in with whatever you get as they execute, capping off with the final status of the whole suite after it's done. And if you failed to run the suite for whatever reason, then you could send the "MISS" status for it instead.
> 
> I think my main point was that we could just have ERROR with a
> broader scope and then something else like an error type or
> message to differentiate errors between the test, the
> infrastructure or anything specific to the CI system.  So from a
> user point of view, it's either a valid result i.e. PASS / FAIL /
> SKIP or something went wrong and it's ERROR.

Sure, some CI systems would only be able to report "ERROR", that's OK, and 
even if you try hard to report a "MISS" when you can do it, "ERROR" would also 
keep slipping in by mistake.

While we already have a lot of fields (and need more still), I think "MISS" 
fits the value space of existing test statuses quite well. After all, we 
already try to distinguish "ERROR" from "FAIL", splitting the test maintainer 
responsibility from the developer responsibility (when possible). We're just 
adding a finer gradation here, splitting "ERROR" again, into test maintainer 
and CI maintainer responsibilities.

> On the other hand, having MISS shouldn't really be a problem.  I
> can see why it could be very useful to have it in KCIDB for CKI's
> use-case at least.  So I'm still not personally convinced by this
> but I think it's fine to add it anyway as I don't see any
> blocking reason for not adding it either.

Thank you, Guillaume. I have now merged the PR and will proceed on finishing 
support for it in the notifications and dashboards. Right now the new schema 
version is not accepted by Production yet.

Nick

