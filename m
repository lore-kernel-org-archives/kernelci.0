Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3914F9F7
	for <kernelci@lists.linux.dev>; Mon,  5 Aug 2024 11:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722857310; cv=none; b=uHJs98JZfPcbqp4BKtTQiVWVWoMTsfoLPRKhyiYG5r5CIY8JfaAdDSYiSPcWuBXdVHsVNKQnQ9P/+tF6zTeoICtE1PW+Q6BFg+O3NbmKC5/tArNzqFa9zYsM/LPJgIhIPLqOJ+9852K+pWj6tpHc7+QqYdfWXPBQyKOzbKTNzBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722857310; c=relaxed/simple;
	bh=9XmloRhicD+5gCpI1RVr2EkVAJuoO7Tf9hc0YDd4mu4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=R4dEK6Mqw3BZeB/UDVdXx62Ckkdy4oQ+KBlCpqjdKdJ6Z6/nN8Rq+Uep7Gx0iFGEoCUSbuBaMK+Z5Cqf6XzqRwEQJ7VFf88JBhbGrKUUCcluelN3he+lLuzxKag9CNZrlbHJNR5LCr9PQSXiuv2HOn+sIu9f8WtKLde/58ACdqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXVKCzlt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXVKCzlt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so94275745e9.2
        for <kernelci@lists.linux.dev>; Mon, 05 Aug 2024 04:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722857307; x=1723462107; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEbX6eZc31kFyfPl1JTEkPHCQW/wyxX0Ptb4xxYWlKA=;
        b=mXVKCzltM/Lsm7vYttOAwYv2uSgFsiR8WvfSKEgXTwjVtFxLkiwfAm1+MGadXiqT1C
         jZhJbEVy04HBxjfjmuqYdznjeyOwOnncE6Cs3DvOZUcoX7rC459yvOngGc3DKk1JVXH8
         Ud+5UhsdzUrGcI9wfyRx0NL09KBKVYg8BhK1yrmWW7a8R2TAKYEUXnbtq7v92hPQcMR1
         0vc2ErfLk4AClaaR7It6yLEz5789SN4dT7EPu4n89CECUUorzh1WlwuuKMtGKqC20HuJ
         tb5mRKuwtALvnaKOCxoCwIhyZ8rFkjd87hpf0ZkZwkswlEDlpYzVNZR+ITetsGT6ks5W
         2nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722857307; x=1723462107;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEbX6eZc31kFyfPl1JTEkPHCQW/wyxX0Ptb4xxYWlKA=;
        b=OWgReUdUijn7oR5Nsrh136QZNVBPRGYyWOJmiuuH5FcljPnq0s/OcP/MQJoUOkKpFi
         sEl0issM2qat8uF1Y0Bn5Rhz0hq7sIvMyklatM0TrgjKDd/Fvnd5N8MWwpnn7aCsFJNS
         C/LpXKtcdUS9HfMVF+TW9niIAhuAcCH93Hx3mr2046D8PTDLkfyVpCJsSbNLtdPmcVcz
         lCE/28beGrlThYYTWV1MnP5pD63sSG2cN+g0495gp/cpiunzoinPBAx3aQBJid3Z9K46
         4hFtgfO8wB2hcEymcYkCVGex3U6j3w5FQI87okN7YxWIeQ9LCttkh6s7Cv9hO1jgAeIe
         BRXA==
X-Forwarded-Encrypted: i=1; AJvYcCVE4ToXmItW/Dzwjbibe/QyrSie6tydK30FroxqlyG6H9OwKtFQ4exp3hhFAZlFSKJzLrlRDHPP4/z5dSTMRDLiyw1h44nG2ZA=
X-Gm-Message-State: AOJu0YzlrO6bwImnCh2NOmxYLM0/YMPHK8zAXFDDaaDEuluxohqerx95
	5PYT30fkrRsX6w/TFto7w+CYnl/UFl+43zQsv6515pzTd9XITjAO
X-Google-Smtp-Source: AGHT+IHHkH0JuNMav9nr7vC4a6CEwif+2Wfnzc0D2jiKbWPqFYas2ySx9FKJNW48aFjL34tmbhRiKQ==
X-Received: by 2002:a05:600c:4e0a:b0:426:6f4b:b386 with SMTP id 5b1f17b1804b1-428e6b954c4mr97031785e9.34.1722857307074;
        Mon, 05 Aug 2024 04:28:27 -0700 (PDT)
Received: from [192.168.0.118] (h-185-57-5-67.na.cust.bahnhof.fi. [185.57.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428f069bec5sm85263675e9.37.2024.08.05.04.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 04:28:26 -0700 (PDT)
Message-ID: <bf0befaa-e23e-43f0-996b-d095b7390122@gmail.com>
Date: Mon, 5 Aug 2024 14:28:24 +0300
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KCIDB: Support non-binary test outputs
From: Nikolai Kondrashov <spbnick@gmail.com>
To: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Alice Ferrazzi <alicef@gentoo.org>,
 automated-testing@lists.yoctoproject.org,
 Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>,
 Johnson George <Johnson.George@microsoft.com>,
 Veronika Kabatova <vkabatov@redhat.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Don Zickus <dzickus@redhat.com>, Mark Brown <broonie@kernel.org>,
 Philip Li <philip.li@intel.com>, Denys Fedoryshchenko
 <denys.f@collabora.com>, Michael Hofmann <mhofmann@redhat.com>,
 Tales da Aparecida <tdaapare@redhat.com>,
 Aditya Nagesh <adityanagesh@microsoft.com>,
 Jeny Dhruvit Sheth <jeny.sadadia@collabora.com>,
 Sachin Sant <sachinp@linux.ibm.com>, "Hambardzumyan, Minas" <minas@ti.com>
References: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
Content-Language: en-US
In-Reply-To: <5188d6fe-bd01-402b-a6e6-0fe57ef4d336@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi everyone,

On 8/5/24 12:56 PM, Nikolai Kondrashov wrote:
> Meanwhile I'd like to propose two small, but potentially very useful changes
> to the I/O schema for tests:
>
> * Supporting non-binary outputs beyond PASS/FAIL -
>   integers/floats/booleans/strings/etc. - useful for performance tests.
>
> * Supporting recording `compatible` values from the top of the device tree
>   inside the test environment, for machines which use them - useful for
>   correlating test results by hardware.
>
> Here's the corresponding schema PR:
>
>     https://github.com/kernelci/kcidb-io/pull/85
>
> I'll follow up with a separate message for each of the changes, going over the
> details and the rationale.

The support for non-binary test outputs introduces a new field to the "test"
objects called "value", being an "object" itself. It (and its abstract
meaning) are supposed to work together with the "status" field. That is, it
should only be considered when the test has actually executed. I.e. with a
"FAIL", "ERROR", "PASS", or "DONE" status only. Normally "DONE" should be
used, when the value is the test's output, and not an auxiliary value.

Here is the (abbreviated) schema for the new field:

    "value": {
        "type": "object",
        "properties": {
            "integer": {"type": "integer"},
            "number": {"type": "number"},
            "string": {"type": "string"},
            "boolean": {"type": "boolean"},
        },
        "minProperties": 1,
        "additionalProperties": False
    },

The meaning of the value itself depends on the particular test, that is the
"path" field value. Each property inside the value corresponds to a data type.
At least one must be specified, but if more than one type property is set,
each is considered a different representation of the *same* value, and not a
different value. E.g. these can be specified at the same time: "integer": 1,
"number": 1, "boolean": true, "string": "true".

Specifying multiple types at once can be used to assist transitioning
test output to a different type, but in normal use only one of them
should be supplied.

Here's an example test object using the "value" field:

{
    "id": "redhat:2876829c98e9878766a",
    "origin": "redhat",
    "build_id": "redhat:387d3459ef",
    "path":"redhat_ext4fs.performance.iops",
    "comment": "Red Hat Ext4 FS I/O performance, IOPS"
    "status": "DONE",
    "value": {"integer": 57324}
}

If the test in question has multiple values to report, then the submitting CI
system should create (synthetic) subtests under the test node, one for each
value. E.g. if the (imaginary) test above had random-read and random-write
IOPS to report separately, it could've been expressed as such:

"tests": [
    {
        "id": "redhat:2876829c98e9878766a",
        "origin": "redhat",
        "build_id": "redhat:387d3459ef",
        "path":"redhat_ext4fs.performance",
        "comment": "Red Hat Ext4 FS I/O performance"
        "status": "DONE"
    },
    {
        "id": "redhat:2876829c98e9878766a:rriops",
        "origin": "redhat",
        "build_id": "redhat:387d3459ef",
        "path":"redhat_ext4fs.performance.rriops",
        "comment": "Red Hat Ext4 FS I/O performance, random-read IOPS"
        "status": "DONE",
        "value": {"integer": 97524}
    },
    {
        "id": "redhat:2876829c98e9878766a:rwiops",
        "origin": "redhat",
        "build_id": "redhat:387d3459ef",
        "path":"redhat_ext4fs.performance.rwiops",
        "comment": "Red Hat Ext4 FS I/O performance, random-write IOPS"
        "status": "DONE",
        "value": {"integer": 46434}
    }
]

This separation allows us to control complexity, while at the same time
allowing KCIDB to analyze and track results in a more-or-less generic way.

Finally, if you need to monitor both the separate results and a combined
result, you simply add it to the parent test. Like adding back the overall
IOPS value to the parent test above.

Don't hesitate to send your comments/questions/objections here or in the PR!

Nick
