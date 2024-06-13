Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86F13D24A
	for <kernelci@lists.linux.dev>; Thu, 13 Jun 2024 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718266318; cv=none; b=oC7Aaoc/6yBTVEG3LUyunR9YLBh9AQXSOgkr0SOyBdZNOtESYFgmr5tsvxjE5LnicWff2M+PoZnSQ77AMR+EX2UzI4+OwnG7G42NJ5snkm+SY20gy3mkiHmlsoug8MpVIJRKAZ3Z4/RPK7EeIFNMJ3ZaLYURlHH3L3CySmoTMoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718266318; c=relaxed/simple;
	bh=kWLuwI4a92tgXNijnowLpBOuaduk15AW+cX4WUfeang=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PmS1dvuW/bh9SGt2gNsGwv8eLJ7WsUFhV4O4GLkHaFiuBtXRhgDP4DzDRzratPbe0oeeyDnT1HB2WKYiu1+l5BOmyRh+weU2FYfiUc0VcBGtqsF0FJVV2Drlmjwr94jjZjxOAdFWvyCjFaQsToTNomw1UZw8GV0R1Dcr23KfzL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XkOjrEUt; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XkOjrEUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718266315;
	bh=kWLuwI4a92tgXNijnowLpBOuaduk15AW+cX4WUfeang=;
	h=From:To:Subject:Date:From;
	b=XkOjrEUtiEDRLbYkLfXYjDKy7Stk0FQpq4WvPtkk8+T30Rr0xzVQrWs/y2HWORRne
	 FAx9nbzQQZ7oJQ3fVzVl5cJ2k6TYIAOe9GYiQID0zauSpivoy/tEAHJdNKxXrgVBOf
	 IPvXhGNF+ri4qaiunK7TcdH2/+QEoRZYUVkvuiFqG4jpdxGA1q0fluz0k0xGZTmh38
	 fOPnlqfJKr9UXFDMV9sH/5Sj/x7yHsaTbiCf61YcOF2vjF2qeFKyqCdRvmD8Jzq+JR
	 rYGStuesGv6el2OLvNg/bsrP+Y2L1+X+fix8r73C+TPoqwnVOpIda71i2SFnuatRq1
	 ksKs7MWtS17og==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 503C9378107C
	for <kernelci@lists.linux.dev>; Thu, 13 Jun 2024 08:11:55 +0000 (UTC)
From: =?utf-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: kernelci@lists.linux.dev
Subject: On error identification, classification and related tooling
Date: Thu, 13 Jun 2024 10:11:53 +0200
Message-ID: <877cet8do6.fsf@collabora.com>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

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
                "_report": "***\n*** The present kernel configuration has modules disabled.\n*** To use the module feature, please run \"make menuconfig\" etc.\n*** to enable CONFIG_MODULES.\n***\n",
                "error_type": "Kbuild/Make",
                "script": "Makefile:1953",
                "target": "modules"
            }
        ]
    }

And detect certain types of errors during linux startup (partial output below):

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
                "error_type": "WARNING: missing return thunk: 0xffffffffb6845838-0xffffffffb684583d: e9 00 00 00 00",
                "hardware": "Google Coral/Coral, BIOS  09/29/2020",
                "location": "arch/x86/kernel/alternative.c:730 apply_returns+0xc0/0x241",
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
                "error_type": "BUG: unable to handle page fault for address: 0000000000200286",
                "hardware": "Google Coral/Coral, BIOS  09/29/2020",
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
[2] https://gitlab.collabora.com/rcn/logspec
