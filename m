Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081F23A9
	for <kernelci@lists.linux.dev>; Sat,  4 Feb 2023 13:35:53 +0000 (UTC)
Received: from [151.216.142.144] (unknown [151.216.142.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2503266029A5;
	Sat,  4 Feb 2023 13:35:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675517751;
	bh=aazq/Vh7j/hkkupZJNXPInbf51BnuvyG/TWDf8xxa60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J8dDdOCno3fqx7hJxu5iKusckWXFbwz7wcV47HKXG2KxwSXk6X6FrDIzl+EktCBKs
	 gbogHAZPx4eQeoPHDkb6JO8UVw7OAM2zH7WydtwP16L1GpSQ9P8pWpsqn3E/grVbKC
	 2mscPF8P4QufvPRZ4uG22BnEXejckbh+Mr4YUE7eL24AkKVd7nnPAGYgvyXI9hXCWM
	 tiMQYr6NEuKWDzDoXnU+bC3E4OIxSN2IxJq+hHl5NycwikF8LolLEJoxrOB/OrAn9F
	 0Hzywro6+UyBDP8allsO1a7m1ZDhfGrR0v02w00a6Hcmn4OaNMDTCG3OY3hwmhHWSL
	 liViOuU6UELKg==
Message-ID: <51e62348-9e8e-2769-6372-f217f894a917@collabora.com>
Date: Sat, 4 Feb 2023 14:36:39 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] selftests: find echo binary to use -ne options
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>, Shuah Khan <shuah@kernel.org>,
 Gautam <gautammenghani201@gmail.com>
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
References: <20230203152603.11450-1-guillaume.tucker@collabora.com>
 <90ace4f466ee4f79bf2dd94c5830e57a@AcuMS.aculab.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <90ace4f466ee4f79bf2dd94c5830e57a@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2023 14:04, David Laight wrote:
> From: Guillaume Tucker
>> Sent: 03 February 2023 15:26
>>
>> Find the actual echo binary using $(which echo) and use it for
>> formatted output with -ne.  On some systems, the default echo command
>> doesn't handle the -e option and the output looks like this (arm64
>> build):
>>
>> -ne Emit Tests for alsa
>>
>> -ne Emit Tests for amd-pstate
>>
>> -ne Emit Tests for arm64
> 
> Nack.
> There is no reason to suppose that /bin/echo is any different from
> the version of echo builtin to the shell that make uses.
> 
> Not only that 'which' is a horrid shell script that is trying to
> emulate csh builtin.
> The bourne shell equivalent is 'type' and the posix one 'command'.
> 
> In any case the portable way to fix this is to use printf.
> This is a well defined program and is bultin to all modern shells.

Ah great, thanks for the review.  Will send a v2 with printf.

Guillaume

>> This is for example the case with the KernelCI Docker images
>> e.g. kernelci/gcc-10:x86-kselftest-kernelci.  With the actual echo
>> binary (e.g. in /bin/echo), the output is formatted as expected (x86
>> build this time):
>>
>> Emit Tests for alsa
>> Emit Tests for amd-pstate
>> Skipping non-existent dir: arm64
>>
>> Only the install target is using "echo -ne" so keep the $ECHO variable
>> local to it.
>>
>> Reported-by: "kernelci.org bot" <bot@kernelci.org>
>> Fixes: 3297a4df805d ("kselftests: Enable the echo command to print newlines in Makefile")
>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>> ---
>>  tools/testing/selftests/Makefile | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
>> index 41b649452560..9619d0f3b2ff 100644
>> --- a/tools/testing/selftests/Makefile
>> +++ b/tools/testing/selftests/Makefile
>> @@ -234,10 +234,11 @@ ifdef INSTALL_PATH
>>  	@# While building kselftest-list.text skip also non-existent TARGET dirs:
>>  	@# they could be the result of a build failure and should NOT be
>>  	@# included in the generated runlist.
>> +	ECHO=`which echo`; \
>>  	for TARGET in $(TARGETS); do \
>>  		BUILD_TARGET=$$BUILD/$$TARGET;	\
>> -		[ ! -d $(INSTALL_PATH)/$$TARGET ] && echo "Skipping non-existent dir: $$TARGET" &&
>> continue; \
>> -		echo -ne "Emit Tests for $$TARGET\n"; \
>> +		[ ! -d $(INSTALL_PATH)/$$TARGET ] && $$ECHO "Skipping non-existent dir: $$TARGET" &&
>> continue; \
>> +		$$ECHO -ne "Emit Tests for $$TARGET\n"; \
>>  		$(MAKE) -s --no-print-directory OUTPUT=$$BUILD_TARGET COLLECTION=$$TARGET \
>>  			-C $$TARGET emit_tests >> $(TEST_LIST); \
>>  	done;
>> --
>> 2.30.2
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
> 

