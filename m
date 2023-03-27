Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A34622
	for <kernelci@lists.linux.dev>; Mon, 27 Mar 2023 02:41:53 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so649438otd.3
        for <kernelci@lists.linux.dev>; Sun, 26 Mar 2023 19:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679884912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FRauHu1FOjU1xQL/oXl2UNdyYQgBLhmS7p7OrBntk+k=;
        b=JHmkY7tdYZSVVlBNau7p68ncdc1TURD1w8HYA/zw9iLP/+s6VluqD0EtQilHMCpgye
         xjTRtJACHjnjcTq1Ukie0WmG5xgwqEtYBEh/qG3aWgzPmDVv86GpeXu0QWijd3zrrIwl
         o2Psye6PONkyD1QZx3lMTz1njjravMGJqE0b2voJaIsErCDIVbexYINIrSBSIylVMr/t
         bj9CZJJUeFbgXcbcu+XYtc4jWbLrghNXzbrnxsX1JsiXGE7W6p2aT/ovvvj2uWFGNpi5
         M47mUo2tvWVknswz7dRd8xBr9+CR6pkRsyGLZxE4d+gSw+7UcUXjtNC8AUn2XM0ly2gM
         xZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679884912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRauHu1FOjU1xQL/oXl2UNdyYQgBLhmS7p7OrBntk+k=;
        b=v/UmHGXrzNpcji1CWrskoD14u3nmaA2kgHNqhbUkPjVFbezBIeSpEQ5J89aC0NFdg0
         iG1Nj/PwGncT2SM3QX+OqY7bMexW0bgpu2F0E/Tnyvc6J8IuN6+LZKmxosSXuBr7tqjd
         PaufKv6129u1XzI41t52WBPua/hQ3e0bEoZ/nAeKRus+SMRgJpi+3LOSC37siUfiyQSY
         iFfSiX802qGEqkld4dKfK/L0F+qeI4aVLWL7+RRPzjoRAMbriVvQJOqkz759vVAh1Dho
         q5jfyQ6jaj3pKk8loMitxsU3f8wiVyUUI2lIBDuVxfVNxoeRr+T6IPCE2u0riV70+PI4
         ppyg==
X-Gm-Message-State: AAQBX9fGwjBEUXdVGs3osR5nLUOY44FwhktYETQ7lD2Pn64O88v4mmfm
	aDBwLaJTImh7xxVzoTxUzoFqM4TbEoY=
X-Google-Smtp-Source: AKy350YaOvV4wgho3Y8Gqb2SQntKfrIJyqMdE2stCjweiVzT1ZH0s/MJG/fZbfLR/J/4VXW7Nj8goQ==
X-Received: by 2002:a05:6830:1457:b0:6a1:37f1:9863 with SMTP id w23-20020a056830145700b006a137f19863mr1291505otp.11.1679884912460;
        Sun, 26 Mar 2023 19:41:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:2442:6db0:988b:7dda:764e:c744? ([2600:1700:2442:6db0:988b:7dda:764e:c744])
        by smtp.gmail.com with ESMTPSA id r25-20020a9d7519000000b006a11af03732sm2773600otk.67.2023.03.26.19.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 19:41:51 -0700 (PDT)
Message-ID: <197889b6-5773-094c-8699-26843c6519fd@gmail.com>
Date: Sun, 26 Mar 2023 21:41:50 -0500
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [KTAP V2 PATCH] ktap_v2: add recognized test name line
Content-Language: en-US
To: Rae Moar <rmoar@google.com>, davidgow@google.com,
 skhan@linuxfoundation.org, keescook@chromium.org, Tim.Bird@sony.com,
 brendanhiggins@google.com
Cc: corbet@lwn.net, guillaume.tucker@collabora.com, dlatypov@google.com,
 kernelci@lists.linux.dev, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230316225915.494688-1-rmoar@google.com>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <20230316225915.494688-1-rmoar@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/16/23 17:59, Rae Moar wrote:
> Add recognition of the test name line ("# Subtest: <name>") to the KTAP v2
> spec.
> 
> The purpose of this line is to declare the name of a test before its
> results. This functionality is especially useful when trying to parse test
> results incrementally and when interpretting results after a crash.
> 
> This line is already compliant with KTAP v1 as it is interpretted as a
> diagnostic line by parsers. Additionally, the line is currently used by
> KUnit tests and was derived from the TAP 14 spec:
> https://testanything.org/tap-version-14-specification.html.

It is convenient that "# Subtest: <name>" is compatible with v1, but I think
that there is a negative that overrides the convenience.

The "# Subtest: <name>" syntax means that we need to restrict the format of
diagnostic lines, such that "#Subtest:" is an illegal diagnostic, at least
for the line immediately following the Version line.

I think it would be cleaner to modify the Version line syntax to be:

  KTAP version 2 [# <subtest_name>]

I notice that the KTAP Specification version 1 fails to specify the
Version line syntax.  So the Specification would be updated from:

  All KTAP-formatted results begin with a "version line" which specifies which
  version of the (K)TAP standard the result is compliant with.

  For example:
  - "KTAP version 1"
  - "TAP version 13"
  - "TAP version 14"

to:

  The Version line is required and must have the format:

  .. code-block:: none

        KTAP version 2 [# <subtest_name>]

  All KTAP-formatted results begin with a "version line" which specifies which
  version of the (K)TAP standard the result is compliant with.

  For example:
  - "KTAP version 2"
  - "TAP version 13"
  - "TAP version 14"

> 
> Recognition of this line would create an accepted way for different test
> frameworks to declare the name of a test before its results.
> 
> The proposed location for this line is between the version line and the
> test plan line. This location ensures that the line would not be
> accidentally parsed as a subtest's diagnostic lines. Note this proposed
> location would be a slight differentiation from KTAP v1.
> 
> Example of test name line:
> 
>  KTAP version 2
>  # Subtest: main_test
>  1..1
>    KTAP version 2
>    # Subtest: sub_test
>    1..2
>    ok 1 test_1
>    ok 2 test_2
>  ok 1 sub_test
> 
> Here is a link to a version of the KUnit parser that is able to parse the
> test name line for KTAP version 2. Note this includes a test name line for
> the main level of KTAP.
> 
> Link: https://kunit-review.googlesource.com/c/linux/+/5709
> 
> Signed-off-by: Rae Moar <rmoar@google.com>
> ---
> 
> This is a RFC. I would like to know what people think and use this as a
> platform for discussion on KTAP v2.
> 
> Note: this patch is based on Frank's ktap_spec_version_2 branch.
> 
>  Documentation/dev-tools/ktap.rst | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
> index ff77f4aaa6ef..9c7ed66d9f77 100644
> --- a/Documentation/dev-tools/ktap.rst
> +++ b/Documentation/dev-tools/ktap.rst
> @@ -28,8 +28,7 @@ KTAP output is built from four different types of lines:
>  In general, valid KTAP output should also form valid TAP output, but some
>  information, in particular nested test results, may be lost. Also note that
>  there is a stagnant draft specification for TAP14, KTAP diverges from this in
> -a couple of places (notably the "Subtest" header), which are described where
> -relevant later in this document.
> +a couple of places, which are described where relevant later in this document.
>  
>  Version lines
>  -------------
> @@ -44,8 +43,8 @@ For example:
>  - "TAP version 14"
>  
>  Note that, in KTAP, subtests also begin with a version line, which denotes the

> -start of the nested test results. This differs from TAP14, which uses a
> -separate "Subtest" line.

^^^^ This is an error in the KTAP Specification version 1.  TAP14 allows the case
of "Bare Subtests", which would be the equivalent of the KTAP v1 method.

> +start of the nested test results. This differs from TAP14, which uses only a
> +"Subtest" line.
>  
>  While, going forward, "KTAP version 2" should be used by compliant tests, it
>  is expected that most parsers and other tooling will accept the other versions
> @@ -166,6 +165,12 @@ even if they do not start with a "#": this is to capture any other useful
>  kernel output which may help debug the test. It is nevertheless recommended
>  that tests always prefix any diagnostic output they have with a "#" character.
>  
> +One recognized diagnostic line is the "# Subtest: <name>" line. This line
> +is used to declare the name of a test before subtest results are printed. This
> +is helpful for parsing and for providing context during crashes. As a rule,
> +this line is placed after the version line and before the plan line. Note
> +this line can be used for the main test, as well as subtests.
> +
>  Unknown lines
>  -------------
>  
> @@ -206,6 +211,7 @@ An example of a test with two nested subtests:
>  	KTAP version 2
>  	1..1
>  	  KTAP version 2
> +	  # Subtest: example
>  	  1..2
>  	  ok 1 test_1
>  	  not ok 2 test_2
> @@ -219,6 +225,7 @@ An example format with multiple levels of nested testing:
>  	KTAP version 2
>  	1..2
>  	  KTAP version 2
> +	  # Subtest: example_test_1
>  	  1..2
>  	    KTAP version 2
>  	    1..2
> @@ -245,7 +252,7 @@ allows an arbitrary number of tests to be nested     no         yes
>  
>  The TAP14 specification does permit nested tests, but instead of using another
>  nested version line, uses a line of the form
> -"Subtest: <name>" where <name> is the name of the parent test.
> +"Subtest: <name>" where <name> is the name of the parent test as discussed above.
>  
>  Example KTAP output
>  --------------------
> @@ -254,6 +261,7 @@ Example KTAP output
>  	KTAP version 2
>  	1..1
>  	  KTAP version 2
> +	  # Subtest: main_test
>  	  1..3
>  	    KTAP version 2
>  	    1..1
> @@ -266,6 +274,7 @@ Example KTAP output
>  	    ok 2 test_2
>  	  ok 2 example_test_2
>  	    KTAP version 2
> +		# Subtest: example_test_3
>  	    1..3
>  	    ok 1 test_1
>  	    # test_2: FAIL
> 
> base-commit: 906f02e42adfbd5ae70d328ee71656ecb602aaf5

