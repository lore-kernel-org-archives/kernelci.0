Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048FF481A3
	for <kernelci@lists.linux.dev>; Sun, 16 Jun 2024 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718533547; cv=none; b=qVLjogDbEaPXjQXDMsmQCf9AfFNx8OBepbL9jCloDywBmQLqQSZcNjwQ0bOLujlIn3Hxvv+Vuix9k+5YWCAJVC4oA4Bzcb7BFR5psBf1/RJ1U5HcpfcrKEltn4Q52ATsR5ferO1Z8jcWQCyAPA47tS6rh+Xk+5DQZwiaEVESdCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718533547; c=relaxed/simple;
	bh=CCXEiZTqAiJzIcAEsnpI6+hxSxRrI+dP7BDBPafm5B4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AAv+LcTB2Pp6KaGeIljM2QEY+VHsrIXd1K96ppWNWvKPUgh0pV+GsiBWQ3NqTy3ATxAgt9GUyoCMduPzZ26pOopPuLhSXkFcUO86Zm3fq/eAt6N+R439pjVpPydiu5kLWReooZeRnlQJS6wvA/OaDRsV1+OPR2UXi7UQJtnwfqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbkydn0l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbkydn0l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso37240705e9.2
        for <kernelci@lists.linux.dev>; Sun, 16 Jun 2024 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718533544; x=1719138344; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sU0YDq966U6SPCyzzcihN7tq2W9O31unAxyGbPOl7fs=;
        b=bbkydn0lVvkdCj8HgJeV5JoSrzRCbTdLnm8zBSZivP/5j/tes/qHY3KdJf+fyN8PQb
         9NoGdNpJccqKeX5Dzm82jV5NWklzAM673XAhon2kWHacmTfYAuNW0gKBm/VWDiASz7SK
         dUCVYMzEM1CPJZQTK9Hu5BD5AtTvM4ownDmXvov9HPyDal3km3KF4dpjs/GaWDmTD98w
         livu8VOIwZ+U4qDDMfx/EW9I2cqOAJVppJpHnoUkDvES49i/KOVVnHiUrXvmacbcDR+e
         Q+heW6C02ipUqWXzjmg/Eowxp1/5yE/lEx+iYAtbQNodHYJSGi6uoV+/0Wu9bOhiszMR
         /xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718533544; x=1719138344;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sU0YDq966U6SPCyzzcihN7tq2W9O31unAxyGbPOl7fs=;
        b=UtCKvp+b2GdsqUWTvxhx3R8jP9RR40kaT8E/w6IOdDDf+BU+by744TpTsHi7SnzI8A
         Ym7xa3SaOEPWt3p9K/betfHQ1AsVzouLDxLh113EXrEMgq/Q6ZXYkbhi4eFL1rx022lK
         ZW5XU+63ks/puK7TaJvPVel2m1itb87N5a+eWC+n6kdKp0e6xO25QyzPnMUC+RlI7Iog
         y3IqPb2n4kK3b1uNSZYqsAHd3P1jEdeJXNNGGBSAPkfguX8Dn+eyfpOBke1tj1s+48b4
         NyrRkkn3MP13Y3KaDnqHGMIBZoqvC9QIqbT3ihwOjCneniSjASNs92cFfUkWKlRdBUik
         9jnw==
X-Gm-Message-State: AOJu0YzaedMqqb4EKUaf62IL4WVbkMGPJHIgLWYSR1W6O0FDgI/E813Q
	ZltO/0KbQ2Ta98ukomX4WUAAjw2F6VHlZUJ7XyYh6LzcohGgODul
X-Google-Smtp-Source: AGHT+IGC08M+tgzJlJOrvSdilA7YX2VvaUV6/hYaoNHhT9XRTR1ONFzvqkIzQFsv8KEhzDElUPx2gA==
X-Received: by 2002:a05:600c:a01:b0:422:50d7:100b with SMTP id 5b1f17b1804b1-42304820c95mr66709745e9.14.1718533543885;
        Sun, 16 Jun 2024 03:25:43 -0700 (PDT)
Received: from [192.168.58.69] (server.hotelpassage.eu. [88.146.207.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-423b9b5711fsm32586025e9.42.2024.06.16.03.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 03:25:43 -0700 (PDT)
Message-ID: <4342ef2a-3dee-40cb-94db-1d9082a59eee@gmail.com>
Date: Sun, 16 Jun 2024 12:25:42 +0200
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: On error identification, classification and related tooling
To: =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc: kernelci@lists.linux.dev
References: <877cet8do6.fsf@collabora.com>
Content-Language: en-US
In-Reply-To: <877cet8do6.fsf@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(resend due to GMail HTML bounce)

I think this would be a holy grail of result processing, and something that
could benefit the kernel ecosystem greatly.

The absolute solution for everything would of course be very hard to do (or
rather impossible), even if we use ML (btw, I have one acquaintance I plan to
grill over the ML possibilities here). After all it's sometimes hard even for
humans.

I think the best approach could be to try to envision a more-or-less general
schema, as far as we can see from this point, and then apply it to solving the
most impactful, but tractable problems. Like e.g. identifying and correlating
kernel crashes, borrowing perhaps syzbot experience (if not code outright).
Build failure correlation is another thing that could be possible. And I see
you're already extracting good data there.

Once we have something working, we can take another step, expand the schema if
needed, correlate more things, etc.

I'll be happy to help with KCIDB support for this.

Nick

On Thu, Jun 13, 2024 at 10.12 Ricardo Cañuelo <ricardo.canuelo@collabora.com
<mailto:ricardo.canuelo@collabora.com>> wrote:

    Hi all,

    In the past weeks a few discussions were held in multiple meetings and
    online threads[1] about the problem of modeling errors found in test
    runs in a way that they can be then profiled and classified (or tagged).

    Some of us feel like this is a missing piece in the current state of the
    art of many CI systems, with minor exceptions (eg. Syzbot), and that
    introducing some means to operate with errors as "data types" may
    greatly extend the usefulness of the data these systems are collecting.

    IMHO, having massive databases of test results is useful for detecting
    issues, reporting and browsing them, but there's much more that could be
    done with that data if we provided additional layers of processing to
    extract and model higher-level data from them. This has been discussed
    as a long-term plan for KernelCI and CI in general for some time.

    Error modeling and profiling is one of the areas that we'd like to
    explore first.

    Some individual contributors that go through test results and
    regressions already do this kind of work manually by themselves by
    inspecting the test logs, identifying the error causes and classifying
    them, although there's no provisioning in Maestro or KCIDB yet to allow
    users to provide this kind of curated information.

    Personally, I'm exploring the possibility of having an automatic process
    to analyze and profile the errors found in a test log in a standard
    way. The goal I'm aiming for is to have a low-cost and system-agnostic
    way to automatically digest a test log into a schema-based structured
    data that we can store in a DB and can then use as first-class data to
    perform comparisons and classifications. Some of the problems we could
    address with this are:

    - Automatically tell if an error happened in another test run
    - Group test failures together depending on the errors they triggered
    - Automatic classification of errors / test results / regressions
      depending on certain error parameters or contents

    Some of these features are good end goals by themselves, some others are
    important stepping stones towards other goals such as automatic triaging
    of regressions or enhanced reports.

    As a proof of concept and to evaluate the viability of this as an
    automatic process, I started hacking a tool called logspec [2], which is
    basically an extensible context-sensitive parser. It's in a very
    experimental early stage and at this point is little more than a
    springboard for ideas on this area.

    In its current form, it can parse a number of different types of kernel
    build errors (as provided by Maestro):

        ./logspec.py tests/logs/kbuild/kbuild_001.log kbuild

        {
            "errors": [
                {
                    "error_type": "Compiler error",
                    "location": "1266:3",
                    "script": "scripts/Makefile.build:244",
                    "src_file": "drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c",
                    "target": "drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o"
                }
            ]
        }

        ./logspec.py tests/logs/kbuild/kbuild_002.log kbuild
        {
            "errors": [
                {
                    "error_type": "Kbuild/Make",
                    "script": "Makefile:1953",
                    "target": "modules"
                }
            ]
        }

        (full info of the same parsing):

        ./logspec.py tests/logs/kbuild/kbuild_002.log kbuild --json-full
        {
            "_match_end": 369194,
            "errors": [
                {
                    "_report": "***\n*** The present kernel configuration has
    modules disabled.\n*** To use the module feature, please run \"make
    menuconfig\" etc.\n*** to enable CONFIG_MODULES.\n***\n",
                    "error_type": "Kbuild/Make",
                    "script": "Makefile:1953",
                    "target": "modules"
                }
            ]
        }

    And detect certain types of errors during linux startup (partial output
    below):

        ./logspec.py tests/logs/linux_boot/linux_boot_005.log generic_linux_boot
        {
            "bootloader_ok": true,
            "errors": [
                {
                    "call_trace": [
                        "? __warn+0x98/0xda",
                        "? apply_returns+0xc0/0x241",
                        "? report_bug+0x96/0xda",
                        "? handle_bug+0x3c/0x65",
                        "? exc_invalid_op+0x14/0x65",
                        "? asm_exc_invalid_op+0x12/0x20",
                        "? apply_returns+0xc0/0x241",
                        "alternative_instructions+0x7d/0x143",
                        "arch_cpu_finalize_init+0x23/0x42",
                        "start_kernel+0x4da/0x58c",
                        "secondary_startup_64_no_verify+0xac/0xbb"
                    ],
                    "error_type": "WARNING: missing return thunk:
    0xffffffffb6845838-0xffffffffb684583d: e9 00 00 00 00",
                    "hardware": "Google Coral/Coral, BIOS  09/29/2020",
                    "location": "arch/x86/kernel/alternative.c:730
    apply_returns+0xc0/0x241",
                    "modules": []
                },
                {
                    "call_trace": [
                        "? __die_body+0x1b/0x5e",
                        "? no_context+0x36d/0x422",
                        "? mutex_lock+0x1c/0x3b",
                        "? exc_page_fault+0x249/0x3f0",
                        "? asm_exc_page_fault+0x1e/0x30",
                        "? string_nocheck+0x19/0x3d",
                        "string+0x42/0x4b",
                        "vsnprintf+0x21c/0x427",
                        "devm_kvasprintf+0x4a/0x9e",
                        "devm_kasprintf+0x4e/0x69",
                        "? __radix_tree_lookup+0x3a/0xba",
                        "__devm_ioremap_resource+0x7c/0x12d",
                        "intel_pmc_get_resources+0x97/0x29c [intel_pmc_bxt]",
                        "? devres_add+0x2f/0x40",
                        "intel_pmc_probe+0x81/0x176 [intel_pmc_bxt]",
                        "platform_drv_probe+0x2f/0x74",
                        "really_probe+0x15c/0x34e",
                        "driver_probe_device+0x9c/0xd0",
                        "device_driver_attach+0x3c/0x59",
                        "__driver_attach+0xa2/0xaf",
                        "? device_driver_attach+0x59/0x59",
                        "bus_for_each_dev+0x73/0xad",
                        "bus_add_driver+0xd8/0x1d4",
                        "driver_register+0x9e/0xdb",
                        "? 0xffffffffc00b7000",
                        "do_one_initcall+0x90/0x1ae",
                        "? slab_pre_alloc_hook.constprop.0+0x31/0x47",
                        "? kmem_cache_alloc_trace+0xfb/0x111",
                        "do_init_module+0x4b/0x1fd",
                        "__do_sys_finit_module+0x94/0xbf",
                        "__do_fast_syscall_32+0x71/0x86",
                        "do_fast_syscall_32+0x2f/0x6f",
                        "entry_SYSENTER_compat_after_hwframe+0x65/0x77"
                    ],
                    "error_type": "BUG: unable to handle page fault for
    address: 0000000000200286",
                    "hardware": "Google Coral/Coral, BIOS  09/29/2020",
                    "modules": [
                        "acpi_thermal_rel",
                        "chromeos_pstore",
                        "coreboot_table",
                        "ecc",
                        "ecdh_generic",
                        "elan_i2c",
                        "i2c_hid",
                        "int340x_thermal_zone",
                        "intel_pmc_bxt(+)",
                        "pinctrl_broxton"
                    ]
                },
                ...
            ],
            "prompt_ok": true
        }

    I've yet to decide on a schema for this structured data, but first I'd
    prefer to keep on adding parsers to it to catch more conditions and
    results.

    It's possible that this approach isn't viable or realistic, considering
    the lack of consistency even in very restricted types of errors (Linux
    kernel error reports are particularly inconsistent) and the glitches and
    other artifacts inherent to this kind of serial logs (interleaving of
    lines, etc.). Still, maybe some of these problems can be mitigated by
    applying a pre-filtering on the logs and running the parsers on
    narrowed-down segments instead of on whole logs.

    So I want to keep playing with this for now to see if it makes sense to
    continue. Maybe someone else has a better approach to this problem
    (ML-based, maybe?), so any feedback about the general idea and about the
    implementation is welcome.

    Thank you all,
    Ricardo

    ---

    [1] https://github.com/kernelci/kcidb-io/pull/78
    <https://github.com/kernelci/kcidb-io/pull/78>
    [2] https://gitlab.collabora.com/rcn/logspec
    <https://gitlab.collabora.com/rcn/logspec>

