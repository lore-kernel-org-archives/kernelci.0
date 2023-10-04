Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101B9D514
	for <kernelci@lists.linux.dev>; Wed,  4 Oct 2023 11:50:53 +0000 (UTC)
Received: from [IPV6:2001:861:4a40:8620:20c4:d926:ae30:f52f] (unknown [IPv6:2001:861:4a40:8620:20c4:d926:ae30:f52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gtucker)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CCECE6607038;
	Wed,  4 Oct 2023 12:50:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696420252;
	bh=y5efuq3Y4n6tspMjzoyyStvP9Yr+7Iruitm5haYnWPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fmUt6/sINkH0r9oqZs7f4Jc8DalOc/HVGJNXvM6xlg8QjpFPE/v9zrRK/7Z+KY+Tv
	 SXjX1DJdMnW24/ktaanzi93I6cn3lWjQqI+dYUhIs6TjPmA9DmhLn8WvJNS/MtF4F8
	 Ga3ZhsvMnSOdfYo3Wi62zTg7Xq1nooo9ijk0LjKWbJXurTiHBxjFqULoCk9HdCqVr4
	 rfuDHOLS9DuLqaAL5RpSeTNUHkSEZPiZX0Z0btAZQxE7UryvSEK4Dg85jbVoVBGXsS
	 O44TDSQeK+1Bce6mDfPIJjKsRyweJVElbjUfXWdB9OAkQDSekzvOvCmBXSmrcl//27
	 O2AONGd34b0tg==
Message-ID: <13d74236-ac7b-4ebe-5bbd-ffd59b76929f@collabora.com>
Date: Wed, 4 Oct 2023 13:51:08 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Request: better kernelCI reporting format [was: Re: tip/master
 baseline: 48 runs, 4 regressions (v6.6-rc4-243-g46219a3ac1db)]
Content-Language: en-US
To: mingo@kernel.org
Cc: x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, kernelci-results@groups.io,
 kernelci@lists.linux.dev
References: <651d30c3.170a0220.b0a5a.85ad@mx.google.com>
 <ZR04v1/jeToNEOzJ@gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <ZR04v1/jeToNEOzJ@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ingo,

On 04/10/2023 12:04, Ingo Molnar wrote:
> 
> * kernelci.org bot <bot@kernelci.org> wrote:
> 
>> tip/master baseline: 48 runs, 4 regressions (v6.6-rc4-243-g46219a3ac1db)
>>
>> Regressions Summary
>> -------------------
>>
>> platform                 | arch  | lab             | compiler | defconfig | regressions
>> -------------------------+-------+-----------------+----------+-----------+------------
>> imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig | 1          
>> imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig | 1          
>> r8a77960-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig | 1          
>> r8a779m1-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig | 1          
> 
> So I'd like to again, gently, request a better reporting format from
> the kernelCI bot.
> 
> The main problem: stale regressions I can do little about keep dominating
> and cluttering the report format, while I'd be primarily interested in *new*
> regressions that I can do something about.

Thanks for the feedback.  We're well aware of the issues with
these email reports and there's already a plan to entirely rework
them with the new KernelCI implementation currently under way.

In particular, there will be improvements around tracking known
issues which will also help enabling bisection email reports
again.  Replying to the original thread with the patch from the
lore archives is the ideal way to report issues, and bisections
as well as "pre-merge" testing of patches allows this.

Regressions that haven't led to a successful bisection will need
to be reported similarly to what we have here but as you
highlighted, repeating known information is not useful.  The
emails could for example just mention new regressions, and
provide a link to the new web dashboard with more details about
all known regressions.

If these current email reports are mostly causing noise on the
x86 list and aren't useful then I would suggest to filter them
out for now or we can just stop sending them until we have a
better reporting system in place, in the coming months.

Thanks,
Guillaume


> Just to outline how hard it is to extract delta information, here's how I'm
> forced to look at these reports right now:
> 
>   - I see a new kernelci report in Mutt. The report is not in a threaded discussion though,
>     so no easy way to group it other than sorting by title.
> 
>   - I enter "l ~f kernelci" and see the following:
> 
> 162732     Oct 03 kernelci.org bo    | tip/master baseline: 42 runs, 2 regressions (v6.6-rc4-213-gdd061a8cde5a)
> 162733     Oct 03 kernelci.org bo    | tip/master baseline-nfs: 7 runs, 2 regressions (v6.6-rc4-213-gdd061a8cde5a)
> 162737     Oct 03 kernelci.org bo    | tip/master build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc4-217-g3cb76f53e2c4)
> 162738     Oct 03 kernelci.org bo    | tip/master baseline: 48 runs, 3 regressions (v6.6-rc4-217-g3cb76f53e2c4)
> 162739     Oct 03 kernelci.org bo    | tip/master build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc4-218-g1a8380da77f1)
> 162740     Oct 03 kernelci.org bo    | tip/master baseline: 47 runs, 3 regressions (v6.6-rc4-218-g1a8380da77f1)
> 162762     Oct 03 kernelci.org bo    | tip/master build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc4-222-g22f8d3ee60082)
> 162764     Oct 03 kernelci.org bo    | tip/master baseline: 48 runs, 3 regressions (v6.6-rc4-222-g22f8d3ee60082)
> 162765     Oct 03 kernelci.org bo    | tip/master build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc4-225-g8b3fe25c48e0c)
> 162767     Oct 03 kernelci.org bo    | tip/master baseline: 48 runs, 3 regressions (v6.6-rc4-225-g8b3fe25c48e0c)
> 162792     Oct 04 kernelci.org bo    | tip/master build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc4-243-g46219a3ac1db)
> 162801     Oct 04 kernelci.org bo    | tip/master baseline: 48 runs, 4 regressions (v6.6-rc4-243-g46219a3ac1db)
> 
>   - Sorting by subject doesn't group the results:
> 
> 160142     Aug 06 kernelci.org bo    | tip/master sleep: 9 runs, 1 regressions (perf-urgent-2022-08-06-62-gf6f499f09cc0)
> 160143     Aug 02 kernelci.org bo    | tip/master sleep: 9 runs, 1 regressions (v5.19-462-gad2afa0c65e24)
> 160144     Aug 02 kernelci.org bo    | tip/master sleep: 9 runs, 1 regressions (v5.19-464-g75fc59ce001cb)
> 160145     Aug 02 kernelci.org bo    | tip/master sleep: 9 runs, 1 regressions (v5.19-471-g38adad802a062)
> 160146     Jan 02 kernelci.org bo    | tip/master sleep: 9 runs, 1 regressions (x86_urgent_for_v5.16_rc8-318-g30fddd0b8484)
> 160147     Jun 25 kernelci.org bo    | tip/master sleep: 9 runs, 2 regressions (objtool-urgent-2021-06-24-422-g947abba8b24e)
> 160148     Jun 01 kernelci.org bo    | tip/master sleep: 9 runs, 2 regressions (v5.13-rc4-246-g8b36e97d62e8)
> 160149     Jun 02 kernelci.org bo    | tip/master sleep: 9 runs, 2 regressions (v5.13-rc4-281-g635df73e7708)
> 160150     Jun 01 kernelci.org bo    | tip/master sleep: 9 runs, 2 regressions (v5.18-1292-gf3c3debf77001)
> 160151     Dec 31 kernelci.org bo    | tip/master sleep: 9 runs, 3 regressions (v5.16-rc7-317-g5f72d76bb7ee)
> 160152     Jul 05 kernelci.org bo    | tip/master sleep: 9 runs, 6 regressions (v5.13-781-gbbf2154fe2597)
> 160153     Nov 15 kernelci.org bo    | tip/master sleep: 9 runs, 6 regressions (v5.16-rc1-3-g8ab774587903)
> 
>   ... because the title is not hierarchically organized, the inconsequential number of
>  how many times the test ran ('9') dominates in the above sorted output.
> 
>   - So I'm forced to filter *again*, this time by title, I enter "l ~f kernelci ~s baseline:"
> 
> 162113     Sep 29 kernelci.org bo    | tip/master baseline: 47 runs, 4 regressions (v6.6-rc3-227-gfc7aa446156e)
> 162118     Sep 29 kernelci.org bo    | tip/master baseline: 42 runs, 5 regressions (v6.6-rc3-231-g66c35073664c)
> 162237     Sep 29 kernelci.org bo    | tip/master baseline: 47 runs, 5 regressions (v6.6-rc3-233-g13785f304dab)
> 162254     Sep 30 kernelci.org bo    | tip/master baseline: 48 runs, 5 regressions (v6.6-rc3-340-g18a1f37f57ff)
> 162405     Oct 02 kernelci.org bo    | tip/master baseline: 42 runs, 5 regressions (v6.6-rc4-183-g01571d84d8b5)
> 162417     Oct 02 kernelci.org bo    | tip/master baseline: 47 runs, 4 regressions (v6.6-rc4-187-g651e6e534250)
> 162465     Oct 02 kernelci.org bo    | tip/master baseline: 45 runs, 4 regressions (v6.6-rc4-186-g3c53e9dfa2c0)
> 162482     Oct 02 kernelci.org bo    | tip/master baseline: 45 runs, 4 regressions (v6.6-rc4-189-g1514cd0e510f)
> 162557     Oct 03 kernelci.org bo    | tip/master baseline: 48 runs, 3 regressions (v6.6-rc4-206-g972739e54e24)
> 162569     Oct 03 kernelci.org bo    | tip/master baseline: 47 runs, 3 regressions (v6.6-rc4-211-gb463762ab51e)
> 162578     Oct 03 kernelci.org bo    | tip/master baseline: 42 runs, 2 regressions (v6.6-rc4-213-gdd061a8cde5a)
> 162604     Oct 03 kernelci.org bo    | tip/master baseline: 48 runs, 3 regressions (v6.6-rc4-217-g3cb76f53e2c4)
> 162609     Oct 03 kernelci.org bo    | tip/master baseline: 47 runs, 3 regressions (v6.6-rc4-218-g1a8380da77f1)
> 162724     Oct 03 kernelci.org bo    | tip/master baseline: 48 runs, 3 regressions (v6.6-rc4-222-g22f8d3ee60082)
> 162728     Oct 03 kernelci.org bo    | tip/master baseline: 48 runs, 3 regressions (v6.6-rc4-225-g8b3fe25c48e0c)
> 162798     Oct 04 kernelci.org bo    | tip/master baseline: 48 runs, 4 regressions (v6.6-rc4-243-g46219a3ac1db)
> 
>   - And I switch back to sort by date and type "sd".
> 
>   - Again the report title starts with a fluctuating number that is not important
>     to me or frankly anyone: how many runs it performed. Why does it dominate
>     the title?
> 
>   - So I ignore the first column and look at the second column: '4 regressions'.
> 
>   - I go: ouch, there's a new regression since yesterday? Crap! Let's look quickly!!
> 
>   - I see:
> 
>  Regressions Summary
>  -------------------
> 
>  platform                 | arch  | lab             | compiler | defconfig | regressions
>  -------------------------+-------+-----------------+----------+-----------+------------
>  imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig | 1
>  imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig | 1
>  r8a77960-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig | 1
>  r8a779m1-ulcb            | arm64 | lab-collabora   | gcc-10   | defconfig | 1
> 
>   - I go: "hm, we changed nothing in -tip that should affect arm64, why is there a new regression"?
> 
>   - Since the mail is too big and the summary not helpful in terms of timing, I export the whole 
>     mail to "/s/1" so I can grep it and look at it in Vim.
> 
>   - I type the following in a shell:
> 
>      kepler:~/tip> grep -iE 'regression|days' /s/1
>      tip/master baseline: 48 runs, 4 regressions (v6.6-rc4-243-g46219a3ac1db)
>      Regressions Summary
>      platform                 | arch  | lab             | compiler | defconfig | regressions
>      Test Regressions
>      platform                 | arch  | lab             | compiler | defconfig | regressions
>      platform                 | arch  | lab             | compiler | defconfig | regressions
>         failing since 33 days (last pass: v6.5-5042-gc4eb0dd0aea32, first fail: v6.5-9149-g0560b156615d7)
>      platform                 | arch  | lab             | compiler | defconfig | regressions
>         failing since 77 days (last pass: x86_urgent_for_6.5_rc2-181-g1399419a8db7, first fail: v6.5-rc2-25-g30489704b2d1)
>      platform                 | arch  | lab             | compiler | defconfig | regressions
>         failing since 77 days (last pass: x86_urgent_for_6.5_rc2-181-g1399419a8db7, first fail: v6.5-rc2-25-g30489704b2d1)
> 
>  - I go: okay, 3 out of the 4 regressions are listed as 33 days old or older,
>    but what is this new regression? It says:
> 
>   platform                 | arch  | lab             | compiler | defconfig | regressions
>   -------------------------+-------+-----------------+----------+-----------+------------
>   imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig | 1          
> 
>   * baseline.login: https://kernelci.org/test/case/id/651d2a3be6361e46d48a0af6
>         new failure (last pass: v6.6-rc4-225-g8b3fe25c48e0c) 
> 
>  - I go: oh, it started failing today, that's bad!
> 
>  - Or rather ... the platform is listed in the October 2 report as well (two days ago).
>    So it's not really a new regression, but some older regression spuriously appearing
>    again?
> 
>  - And I have to repeat something similar for the other stream of reports,
>    by typing "l ~f kernelci ~s build:".
> 
> So I spent ~10 minutes on looking at what is a rather suboptimal reporting format (for me),
> instead of the <30 seconds it should take.
> 
> Thanks,
> 
> 	Ingo
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#47123): https://groups.io/g/kernelci-results/message/47123
> Mute This Topic: https://groups.io/mt/101752906/924702
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [guillaume.tucker@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

